package com.andrewkim.dojoninja.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.andrewkim.dojoninja.models.Dojo;
import com.andrewkim.dojoninja.models.Ninja;
import com.andrewkim.dojoninja.repositories.DojoRepository;
import com.andrewkim.dojoninja.repositories.NinjaRepository;

@Service
public class DojoNinjaService {
	private final DojoRepository dojoRepository;
	private final NinjaRepository ninjaRepository;
	
	public DojoNinjaService (DojoRepository dojoRepository, NinjaRepository ninjaRepository) {
		this.dojoRepository = dojoRepository;
		this.ninjaRepository = ninjaRepository;
	}
	
	public List<Dojo> allDojos() {
		return dojoRepository.findAll();
	}
	
	public List<Ninja> allNinjas() {
		return ninjaRepository.findAll();
	}
	
	public Dojo createDojo(Dojo dojo) {
		return dojoRepository.save(dojo);
	}
	
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepository.save(ninja);
	}
	
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
        if(optionalDojo.isPresent()) {
            return optionalDojo.get();
        }
        else {
            return null;
        }
	}
}
