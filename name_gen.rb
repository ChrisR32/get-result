require 'tty/cursor'
require 'rainbow'
require 'io/console'

$hit_counter = ['', '']
$all_the_humans = [" ", " "]
$exit = 'nocando'
$cursor_row = 15
$length = nil
$resulut = nil
$final_result = ''
cursor = TTY::Cursor

system ("clear")




print cursor.move_to(106, 0)
print Rainbow("8").white.blink
print cursor.move_to(3, 1)
print Rainbow("                    dP                             ").purple + Rainbow("                                          dP   dP   ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(3, 2)
print Rainbow("                    88                             ").purple + Rainbow("                                          88   88   ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(3, 3)
print Rainbow("88d888b. .d8888b. d8888P dP    dP 88d888b. 88d888b.").purple + Rainbow("      88d888b. .d8888b. .d8888b. dP    dP 88 d8888P ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(3, 4)
print Rainbow("88'  `88 88ooood8   88   88    88 88'  `88 88'  `88").purple + Rainbow("      88'  `88 88ooood8 Y8ooooo. 88    88 88   88   ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(3, 5)
print Rainbow("88       88.  ...   88   88.  .88 88       88    88").purple + Rainbow("      88       88.  ...       88 88.  .88 88   88   ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(3, 6)
print Rainbow("dP       `88888P'   dP   `88888P' dP       dP    dP").purple + Rainbow("      dP       `88888P' `88888P' `88888P' dP   dP   ").cadetblue + Rainbow("8").white.blink
print cursor.move_to(106, 7)
print Rainbow("8").white.blink



def build_tally_menu(cursor)
    print cursor.move_to(0, 9)  
    print Rainbow("  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┓").gold
    print cursor.move_to(0, 10)
    print  Rainbow("  ┃").gold + Rainbow("   🤷‍♂️  Player Name  🤷‍♀️    ").white + Rainbow("┃").gold + Rainbow("   🔫  Hits   ").white + Rainbow(" ┃").gold
    print cursor.move_to(0, 11)
    print Rainbow("  ┣━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━┫").gold
    last_row = 47
    start_row = 12
    until start_row == last_row
        print cursor.move_to(0, start_row)
        print Rainbow("  ┃                          ┃               ┃").gold 
        start_row += 1
    end
    print cursor.move_to(0, 47)
    print Rainbow("  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┛").gold
    print cursor.move_to(51, 46)
    print Rainbow("Arrow Keys ⬆ ⬇ to navagate and the Enter Key to select!").purple
end                


    
def get_file_update(cursor)
line_num = -1
text=File.open('hit_log.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
    $hit_counter[line_num += 1] = line.to_i
end

line_num = -1
text=File.open('player_list.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
    $all_the_humans[line_num += 1] = line
end
display_counter(cursor)
end

def display_counter(cursor)
physical_start_line = 12
start_line = 0
end_line = 40
until start_line == end_line
print cursor.move_to(4, (physical_start_line + start_line))
print Rainbow("#{$all_the_humans[start_line]}").royalblue
print cursor.move_to(31, (physical_start_line + start_line))
print Rainbow("#{$hit_counter[start_line]}").silver

if $hit_counter[start_line].to_i >= 100 
    print cursor.move_to(50, (physical_start_line + start_line))
    print "👻"
    start_line += 1
elsif $hit_counter[start_line].to_i >= 50 
    print cursor.move_to(47, (physical_start_line + start_line))
    print "🚑"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 25 
    print cursor.move_to(41, (physical_start_line + start_line))
    print "💣"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 10 
    print cursor.move_to(38, (physical_start_line + start_line))
    print "🧨"
    start_line += 1
   
elsif $hit_counter[start_line].to_i >= 5 
    print cursor.move_to(35, (physical_start_line + start_line))
    print "🎯"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 5
    print cursor.move_to(23, (physical_start_line + start_line))
    print "🤬❗"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 4 
    print cursor.move_to(23, (physical_start_line + start_line))
    print "😡❗"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 3
    print cursor.move_to(23, (physical_start_line + start_line))
    print "😠❗"
    start_line += 1

elsif $hit_counter[start_line].to_i >= 2 
    print cursor.move_to(23, (physical_start_line + start_line))
    print "😤"
    start_line += 1

elsif $hit_counter[start_line].to_i == 1 
    print cursor.move_to(23, (physical_start_line + start_line))
    print "😎"
    start_line += 1
else
   start_line += 1     
end
end
end

print cursor.move_to(50, 11)
print Rainbow("  .-----------------------===------------------------.  ").lightslategray
print cursor.move_to(50, 12)
print Rainbow(" :o  ______________________________________________  o: ").lightslategray
print cursor.move_to(50, 13)
print Rainbow(" ;   :                                            :   ; ").lightslategray
print cursor.move_to(50, 14)
print Rainbow(" `.  `.                                          .'  .' ").lightslategray
print cursor.move_to(50, 15)
print Rainbow("  :   :                                          :   :  ").lightslategray
print cursor.move_to(50, 16)
print Rainbow("  `.  `.                                        .'  .'  ").lightslategray
print cursor.move_to(50, 17)
print Rainbow("   :   :                                        :   :   ").lightslategray
print cursor.move_to(50, 18)
print Rainbow("   `.  `.                                      .'  .'   ").lightslategray
print cursor.move_to(50, 19)
print Rainbow("    :   :                                      :   :    ").lightslategray
print cursor.move_to(50, 20)
print Rainbow("    `.  `.                                    .'  .'    ").lightslategray
print cursor.move_to(50, 21)
print Rainbow("     :   :                                    :   :     ").lightslategray
print cursor.move_to(50, 22)
print Rainbow("     `.  `.                                  .'  .'     ").lightslategray
print cursor.move_to(50, 23)
print Rainbow("      :   :__________________________________:   :      ").lightslategray
print cursor.move_to(50, 24)
print Rainbow("      `.                 iBook                  .'      ").lightslategray
print cursor.move_to(50, 25)
print Rainbow("       '-------------|  |-----|  |--------------'       ").lightslategray
print cursor.move_to(50, 26)
print Rainbow("       .'''''''''''''|  |'''''|  |''''''''''''''.       ").lightslategray
print cursor.move_to(50, 27)
print Rainbow("       |             '-----------'          (O) |      ").lightslategray
print cursor.move_to(50, 28)
print Rainbow("       |   ___________________________________  |      ").lightslategray
print cursor.move_to(50, 29)
print Rainbow("       |  :__|__|__|__|__|__|__|__|__|__|__|__: |      ").lightslategray
print cursor.move_to(50, 30)
print Rainbow("       |  |___|__|__|__|__|__|__|__|__|__|__|_| |      ").lightslategray
print cursor.move_to(50, 31)
print Rainbow("       |  |__|_|__|__|__|__|__|__|__|__|__|___| |      ").lightslategray
print cursor.move_to(50, 32)
print Rainbow("       |  |___|__|__|__|__|__|__|__|__|__|____| |      ").lightslategray
print cursor.move_to(50, 33)
print Rainbow("       |  |____|__|__|__|__|__|__|___|__|__|__| |      ").lightslategray
print cursor.move_to(50, 34)
print Rainbow("       |  :___|__|___________________|__|__|__: |      ").lightslategray
print cursor.move_to(50, 35)
print Rainbow("       |                                        |      ").lightslategray
print cursor.move_to(50, 36)
print Rainbow("       |             .-------------.            |      ").lightslategray
print cursor.move_to(50, 37)
print Rainbow("       |             |             |            |      ").lightslategray
print cursor.move_to(50, 38)
print Rainbow("       |             |             |            |      ").lightslategray
print cursor.move_to(50, 39)
print Rainbow("       |             |_____________|            |      ").lightslategray
print cursor.move_to(50, 40)
print Rainbow("       |             |             |            |      ").lightslategray
print cursor.move_to(50, 41)
print Rainbow("       |             |             |            |      ").lightslategray
print cursor.move_to(50, 42)
print Rainbow("       |             '.___________.'            |      ").lightslategray
print cursor.move_to(50, 43)
print Rainbow("       |                   ___                  |      ").lightslategray
print cursor.move_to(50, 44)
print Rainbow("       '----------------------------------------'      ").lightslategray

print cursor.move_to(59, 14)
print Rainbow("user@iBook main % ").white + Rainbow("_").white.blink

def choice(cursor)
start_line = 26
        until start_line == 32
            print cursor.move_to(97, start_line)
            print cursor.clear_line_after
        start_line = start_line + 1
        end

if $cursor_row == 11
    print cursor.move_to(50, 27)
    print Rainbow("       |             '-----------'          (").lightslategray + Rainbow("O").red + Rainbow(") |").lightslategray + Rainbow("  👈 exit ?").white
    print cursor.move_to(50, 29)
    print Rainbow("       |  :__|__|__|__|__|__|__|__|__|__|__|__: |      ").lightslategray
    print cursor.move_to(50, 31)
    print Rainbow("       |  |__|_|__|__|__|__|__|__|__|__|__|___| |      ").lightslategray
elsif $cursor_row == 13
    print cursor.move_to(50, 27)
    print Rainbow("       |             '-----------'          (O) |      ").lightslategray
    print cursor.move_to(50, 29)
    print Rainbow("       |  :__|__|__|__|__|__|__|__|__|__|__").lightslategray + Rainbow("|__:").yellow + Rainbow(" |").lightslategray + Rainbow("  👈 clear screen ?").white
    print cursor.move_to(50, 31)
    print Rainbow("       |  |__|_|__|__|__|__|__|__|__|__|__|___| |      ").lightslategray
elsif $cursor_row == 15
    print cursor.move_to(50, 27)
    print Rainbow("       |             '-----------'          (O) |      ").lightslategray
    print cursor.move_to(50, 29)
    print Rainbow("       |  :__|__|__|__|__|__|__|__|__|__|__|__: |      ").lightslategray
    print cursor.move_to(50, 31)
    print Rainbow("       |  |__|_|__|__|__|__|__|__|__|__|__").lightslategray + Rainbow("|___|").green + Rainbow(" |").lightslategray + Rainbow("  👈 get result ?").white

end
end

def get_result(cursor)

mini_lotto = 0
total = 0
    $length = $all_the_humans.length
    $result = rand(1..$length)
    $result = $result - 1


total = $hit_counter[$result.to_i]


total += 1

i = $result.to_i
$hit_counter.delete_at(i)
$hit_counter.insert(i, total)

    file_name = ("hit_log.txt")
File.open file_name, 'w' do |f| # SAVES IT, OVERRIDES OLD IF IT EXISTS
    f.puts($hit_counter)
end
top_line = "user@iBook main % ruby u_unlucky.rb"
bot_line = "user@iBook main % "
tool_used1 = ''
tool_used2 = ''
tool_used3 = "Did you mean? "
mini_lotto = rand(1..5)

if mini_lotto == 1
    tool_used1 = "NameError: undefined local variable"
    tool_used2 = "or method `!creator' for main:Object"
    
elsif mini_lotto == 2
    tool_used1 = "NoMethodError: undefined method"
    tool_used2 = "`exclude_creator’ for main:Object"

elsif mini_lotto == 3
    tool_used1 = "SyntaxError: unexpected keyword_end,"
    tool_used2 = "expecting ' )' for main:Object"

elsif mini_lotto == 4
    tool_used1 = "TypeError: no implicit conversion"
    tool_used2 = "of String into Integer"

else
    tool_used1 = "ArgumentError: wrong number of"
    tool_used2 = "arguments (given 1, expected 0)"

end

end_string = "from u_unlucky.rb:#{mini_lotto}:in `<main>’"
clearboard(cursor)
print cursor.move_to(59, 14)
print Rainbow("#{top_line}").white
print cursor.move_to(60, 16)
print Rainbow("#{tool_used1}").white.bold
print cursor.move_to(60, 17)
print Rainbow("#{tool_used2}").white.bold
print cursor.move_to(61, 18)
print Rainbow("#{tool_used3}").white + Rainbow("#{$all_the_humans[$result.to_i]}").webgreen.bold
print cursor.move_to(61, 19)
print Rainbow("#{end_string}").white
print cursor.move_to(62, 21)
print Rainbow("#{bot_line}").white + Rainbow("_").white.blink





get_file_update(cursor)
print cursor.move_to(5, 15)

end

def clearboard(cursor)

    print cursor.move_to(59, 14)
    print cursor.clear_char(36)
    print cursor.move_to(60, 16)
    print cursor.clear_char(38)
    print cursor.move_to(60, 17)
    print cursor.clear_char(38)
    print cursor.move_to(61, 18)
    print cursor.clear_char(36)
    print cursor.move_to(61, 19)
    print cursor.clear_char(36)
    print cursor.move_to(62, 21)
    print cursor.clear_char(36)
end 

    def read_char # Reads keypresses from the user including 2 and 3 escape character sequences.
        STDIN.echo = false
        STDIN.raw!
        input = STDIN.getc.chr
        if input == "\e" then
        input << STDIN.read_nonblock(3) rescue nil
        input << STDIN.read_nonblock(2) rescue nil
        end
        ensure
        STDIN.echo = true
        STDIN.cooked!
        return input
        end

       
        def show_single_key(cursor)
            print cursor.hide
            c = read_char
            if $exit == 'nocando'
                case c
                when "\e[B" # down arrow
                $cursor_row = ($cursor_row + 2)
                if $cursor_row == 17
                    $cursor_row = 11
                end
                                choice(cursor)
                
                
                when "\e[A" #up arrow
                $cursor_row = ($cursor_row - 2)
                if $cursor_row == 9
                    $cursor_row = 15
                end
                    choice(cursor)
                when "\r" # enter
                if $cursor_row == 11
                print cursor.move_to(0, 8)
                    print Rainbow("   |c|h|r|i|s|R|3|2|").limegreen + Rainbow(" visit me at:").white  + Rainbow(" https://github.com/ChrisR32").royalblue 
                    print cursor.move_to(0, 9)
                    print " "
                    exit(true)
                elsif $cursor_row == 13
                    clearboard(cursor)
                    print cursor.move_to(59, 14)
                    print Rainbow("user@iBook main % ").white + Rainbow("_").white.blink
                elsif $cursor_row == 15
                    get_result(cursor)
                end
                # when " "
                # exit(true)
            end
        end
    end

build_tally_menu(cursor)
get_file_update(cursor)
display_counter(cursor)
choice(cursor)

until $exit == "yes"
show_single_key(cursor)
    end

 
  exit(true)





