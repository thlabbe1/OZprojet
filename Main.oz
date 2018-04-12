functor
import
   GUI
   Input
   PlayerManager
   Browser
define
   WindowPort
   Pacmans
   Ghost
   InitPortPacman
   InitPortGhost
   LaunchGame 
in
   
   fun{InitPortPacnan NbPacman Pacman Colors Name}
      fun {Loop NbPacman Pacman Colors Name}
	 case Pacman#Colors#Name
	 of nil#nil#nil then nil
	 [] (H|T)#(H1|T1)#(H2|T2) then
	    {PlayerManager.playerGenerator H pacman(id:NbPacman color:H1 name:H2)}|{Loop NbPacman-1 T T1 T2}
	 end
      end
   in
      {Loop NbPacman Pacman Colors Name}
   end

   fun{InitPortGhost NbGhost Ghost Colors Name}
      fun {Loop NbGhost Ghost Colors Name}
	 case Ghost#Colors#Name
	 of nil#nil#nil then nil
	 [] (H|T)#(H1|T1)#(H2|T2) then
	    {PlayerManager.playerGenerator H ghost(id:NbGhost color:H1 name:H2)}|{Loop NbGhost-1 T T1 T2}
	 end
      end
   in
      {Loop NbGhost Ghost Colors Name}
   end
   

    proc{LaunchGame IsTurnByTurn LS }
        case IsTurnByTurn
        of true then
           {TurnByTurn LS}
        [] false then
           {Simultaneous LS}
        end
      end

  thread
      % Create port for window
      WindowPort = {GUI.portWindow}

      % Open window
      {Send WindowPort buildWindow}

      % TODO complete
      Pacmans = {InitPortPacMan Input.NbPacman Input.Pacman Input.ColorPacman Input.PacmanName}
      Ghost={InitPortGhost Input.NbGhost Input.Ghost Input.ColorGhost Input.GhostName}

      ListStates={InitAllPlayers Pacmans Ghost WindowPort}

   end

end
