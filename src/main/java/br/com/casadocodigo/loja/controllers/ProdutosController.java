package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import br.com.casadocodigo.loja.validation.ProdutoValidation;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutoDAO produtoDao;
	@Autowired
	private FileSaver filesaver;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProdutoValidation());
	}

	@RequestMapping("/novo")
	public ModelAndView create(Produto produto) {
		ModelAndView mv = new ModelAndView("produtos/form");

		mv.addObject("tipos", TipoPreco.values());

		return mv;
	}


	@RequestMapping(method = RequestMethod.POST)
	@CacheEvict(value = "produtosHome",allEntries = true)
	public ModelAndView store(MultipartFile sumario,@Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return create(produto);
		}

		String path = filesaver.write("sumarios", sumario);
		produto.setSumarioPath(path);
		produtoDao.create(produto);

		redirectAttributes.addFlashAttribute("message", "Produto cadastrado com sucesso!");
		ModelAndView mv = new ModelAndView("redirect:produtos");

		return mv;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index() {
		List<Produto> produtos = produtoDao.findAll();
		ModelAndView mv = new ModelAndView("produtos/lista");
		mv.addObject("produtos", produtos);

		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value="/{id}")
	public ModelAndView show(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView("/produtos/detalhe");
		Produto produto = produtoDao.find(id);
		mv.addObject("produto",produto);
		return mv;
	}

}
