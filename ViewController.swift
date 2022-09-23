//
//  ViewController.swift
//  Random Hero Picker
//
//  Created by SN on 22.9.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Pick Random Dota 2 Hero", for: .normal)
        button.setTitleColor(.black, for:.normal )
        return button
    }()
    
    @objc func didTapButton(){
         getRandomHero()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Background COlor
        view.backgroundColor = .systemGray5
        
        //ImageView
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y:0,width: 300,height: 300)
        imageView.center = view.center
        //Button
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
 
    
    
// to fix the overlap issue on the bottom bar we override the view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x:30,y:view.frame.size.height-150-view.safeAreaInsets.bottom
                              ,width:view.frame.size.width - 60, height: 55)
        
    }
    
    func getRandomHero(){
        //array of all dota 2 hero urls here we go:
        let arrayOfDotaUrl = [
            "https://cdn.stratz.com/images/dota2/heroes/alchemist_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/ancient_apparition_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/antimage_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/arc_warden_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/axe_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/bane_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/batrider_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/beastmaster_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/bloodseeker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/bounty_hunter_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/brewmaster_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/bristleback_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/broodmother_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/centaur_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/chaos_knight_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/chen_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/clinkz_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/rattletrap_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/crystal_maiden_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/dark_seer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/dark_willow_vert.png",
            "ttps://cdn.stratz.com/images/dota2/heroes/dawnbreaker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/dazzle_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/death_prophet_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/disruptor_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/doom_bringer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/dragon_knight_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/drow_ranger_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/earth_spirit_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/earthshaker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/elder_titan_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/ember_spirit_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/enchantress_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/enigma_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/faceless_void_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/grimstroke_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/gyrocopter_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/hoodwink_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/huskar_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/invoker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/wisp_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/jakiro_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/juggernaut_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/keeper_of_the_light_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/kunkka_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/legion_commander_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/leshrac_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/lich_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/life_stealer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/lina_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/lion_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/lone_druid_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/luna_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/lycan_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/magnataur_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/marci_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/mars_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/medusa_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/meepo_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/mirana_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/monkey_king_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/morphling_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/naga_siren_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/furion_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/necrolyte_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/night_stalker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/nyx_assassin_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/ogre_magi_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/omniknight_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/oracle_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/obsidian_destroyer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/pangolier_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/phantom_assassin_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/phantom_lancer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/phoenix_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/primal_beast_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/puck_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/pudge_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/pugna_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/queenofpain_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/razor_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/riki_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/rubick_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/sand_king_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/shadow_demon_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/nevermore_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/shadow_shaman_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/silencer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/skywrath_mage_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/slardar_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/slark_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/snapfire_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/sniper_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/spectre_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/spirit_breaker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/storm_spirit_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/sven_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/techies_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/templar_assassin_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/terrorblade_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/tidehunter_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/shredder_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/tinker_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/tiny_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/treant_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/troll_warlord_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/tusk_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/abyssal_underlord_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/undying_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/ursa_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/vengefulspirit_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/venomancer_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/viper_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/visage_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/void_spirit_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/warlock_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/weaver_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/windrunner_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/winter_wyvern_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/witch_doctor_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/skeleton_king_vert.png",
            "https://cdn.stratz.com/images/dota2/heroes/zuus_vert.png"]
        
        
        let randomDotaHeroURL = NSURL(string:arrayOfDotaUrl.randomElement()!)
        guard let data = try? Data(contentsOf: randomDotaHeroURL! as URL)else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

