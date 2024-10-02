
sleep 2
wmctrl -a "England Golf"
xdotool search --onlyvisible --class "England Golf" key Ctrl+l






aplayers=(
'Michael Adams',
'Graham Airey',
'Dale Aitkenhead',
'Stephen Alldridge',
'Eddie Allen',
'Keith Belshaw',
'Malcolm Broom',
'Neil Brotherton',
'Craig Caesar',
'Clive Caisley',
'Chris Chelton',
'Ken Clark',
'Robert Connelly',
'Jed Cornhill',
'Alex Coupland',
'Neil Coxon',
'Bryan Craggs',
'And Davison',
'John Dean',
'Peter Dodds',
'Graham Doughty',
'M Dunwoody',
'Martin Edwards',
'G Elsender',
'J Fletcher',
'Norman Ford',
'W French',
'Norman Gilholm',
'David Gilroy',
'Eileen Gow',
'Graeme Gow',
'Chris Green',
'Rob Green',
'David Hall',
'Richard Hedley',
'Barry Henderson',
'Clive Herbert',
'J Herron',
'Sharon Herron',
'D Hersey',
'Ken Heslop',
'Barry Hill',
'Pete Holleran',
'Roger Ireland',
'Dav Jackson',
'John Jackson',
'T Lemin',
'Martin Leonard',
'Derek Longstaff',
'Bryan Maddison',
'Ste Marshall',
'John Matthews'
'T McNally',
'Stephen Murray',
'Dan Norman',
'Trevor Ord',
'J Patterson',
'Dean Phillips',
'Tim Pinkney',
'M Riddell',
'Eric Saddler',
'Sand Sav',
'David Scurfield',
'Brian Simpson',
'John E Smith',
'Tony Smith',
# 'Chris Steel',
'Ray Straker',
'T Straker',
'Neil Tait',
'Ro Thompson',
'Bob Toward',
'Jo Waddle',
'Glen Watson',
'Gordon Willis',
'Ron Woodcock'
)



 list=""        
 lf="\n"   




for player in "${aplayers[@]}"
do
    xdotool sleep 1
    xdotool key Ctrl+f
    xdotool sleep 1
    xdotool type --delay=100 "MEMBER SEARCH"
    xdotool sleep 1
    # 3 tabs to exit search
    xdotool key Tab
    xdotool sleep 1
    xdotool key Tab
    xdotool sleep 1
    xdotool key Tab
    xdotool sleep 1
    xdotool key Return
    xdotool sleep 1
    xdotool key Tab
    xdotool sleep 1
    
    # type name
    xdotool type --delay=100 "$player"
    xdotool sleep 3
    
    
    
    # 3 tabs to exit search
    xdotool key Tab
    xdotool sleep 0.5
    xdotool key Tab
    xdotool sleep 0.5
    xdotool key Tab
    xdotool sleep 0.5
    xdotool key Return
    
    xdotool sleep 4
    
    # ctrl a
    xdotool key Ctrl+a
    xdotool sleep 1
    # ctrl c
    xdotool key Ctrl+c
    xdotool sleep 1
    xdotool key Alt+Left
    xdotool sleep 2
    
    newhcp="none"
        
    while IFS= read line; do
    
      #echo ".........................$line"
    
      if [[ "$newhcp" == *"Handicap Index"* ]] ; then
         if [[ "$player$line" != *"Counting"* ]] ; then
            xx="$player,$line"
            comma=" = "
            xx=${xx/,,/,}
            xx=${xx/,/$comma}
            if [[ "$xx" != *"/"* ]] ; then
               if [[ "$xx" != *"For golfers"* ]] ; then           
                  echo "$xx"
                  # create list of hcps
                  var1=$(echo "$xx" | cut -f2 -d'=')
                  list=$list$lf$var1 
               fi            
            fi
         fi
      fi

        newhcp=$line
        
    done < <(xclip -o -selection clipboard)
   
done
echo -e "${list// /$''}" 
#echo -e $list 



