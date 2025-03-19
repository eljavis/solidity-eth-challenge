// SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
 
 struct Ability {
        string name;
        string description;
    }
    
struct Pokemon {
        uint256 id;
        string name;
        uint256 level;
        string[] types;
        Ability[] abilities;
        string[] weaknesses;
    }

    Pokemon[] private pokemons;
    uint256 public pokemonCounter;
    event eventNewPokemon(string _name, uint256 _id, uint256 _level, string[] _types, Ability[] _abilities, string[] _weaknesses);

    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;

     function createPokemon(string memory _name, uint256 _level, string[] memory _types, Ability[] memory _abilities, string[] memory _weaknesses) public {
        require(bytes(_name).length > 2, "Name must be greater than 2 characters!");
        require(bytes(_name).length != 0, "Name must be not empty!");

        pokemonCounter++;
        Pokemon memory newPokemon = Pokemon(pokemonCounter, _name, _level, _types, new Ability[](_abilities.length), _weaknesses);

        
        for (uint256 i = 0; i < _abilities.length; ++i) {
            newPokemon.abilities[i] = _abilities[i];
        }
        pokemons.push(newPokemon);
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name, pokemonCounter, _level, _types, _abilities, _weaknesses);
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        require(pokemons.length > 0, "No pokemons created yet");
        return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
   }

}
