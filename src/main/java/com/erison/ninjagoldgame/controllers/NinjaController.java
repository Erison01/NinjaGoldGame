package com.erison.ninjagoldgame.controllers;


import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

@Controller
public class NinjaController {

    @RequestMapping("/")
    public String index(HttpSession session, Model model){
        if (session.getAttribute("gold") == null){
            session.setAttribute("gold", 0);
            session.setAttribute("activity", new ArrayList<>());
        }
        model.addAttribute("gold",session.getAttribute("gold"));
        model.addAttribute("activity", session.getAttribute("activity"));

        return "index";
    }
    @RequestMapping(value = "/game", method = RequestMethod.POST)
    public String game(HttpSession session, @RequestParam("place") String place){
        Random random = new Random();
        SimpleDateFormat date = new SimpleDateFormat("MMMM d yyyy h:mm a");
        int i = (int) session.getAttribute("gold");
        ArrayList<String> activity = (ArrayList<String>) session.getAttribute("activity");

        if (place.equals("farm")){
            int farm = random.nextInt(11)+10;
            session.setAttribute("gold", i+farm);
            activity.add("You entered a farm and earned "+ farm + " gold. " + date.format(new Date()));
        }
        else if (place.equals("cave")){
            int cave = random.nextInt(6)+5;
            session.setAttribute("gold", i+cave);
            activity.add("You entered a cave and earned "+ cave + " gold. " + date.format(new Date()));
        }
        else if (place.equals("house")){
            int house = random.nextInt(4)+2;
            session.setAttribute("gold", i+house);
            activity.add("You entered a house and earned "+ house + " gold. " + date.format(new Date()));
        }
        else if (place.equals("spa")){
            int spa = random.nextInt(16)+5;
            session.setAttribute("gold", i-spa);
            activity.add("You entered a house and lost "+ spa + " gold. " + date.format(new Date()));
        }
        else {
            int quest = random.nextInt(51);
            boolean addRemove= random.nextBoolean();
            if(addRemove){
                session.setAttribute("gold", i+ quest);
                activity.add("You entered a quest and earned "+ quest + " gold. " + date.format(new Date()));
            }
            else{
                session.setAttribute("gold",i-quest);
                activity.add("You entered a quest and lost "+ quest + " gold. " + date.format(new Date()));
            }
        }
        session.setAttribute("activity", activity);

        if((int)session.getAttribute("gold")<=-50){
            return "redirect:/prison";
        }
        return "redirect:/";
    }

    @RequestMapping("/reset")
    public String reset(HttpSession session){
        session.setAttribute("gold",0);
        session.setAttribute("activity",new ArrayList<>());

        return "redirect:/";
    }

    @RequestMapping("/prison")
    public String prison(){
        return "prison";
    }

}
