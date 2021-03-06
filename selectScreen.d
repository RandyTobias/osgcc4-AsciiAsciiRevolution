module selectScreen;

import tango.io.Stdout;
import tango.io.stream.TextFile;
import tango.util.Convert;
import tango.stdc.stringz;
import ncurses;

import level;
import asciiSprite;

class SelectScreen {
	Level[] _levels;
	int _selectedLevel = 0;
	AsciiSprite _cron;
	AsciiSprite _title;
	AsciiSprite _selector;
	bool _levelSelected = false;

	this(char[] levelsPath) {
		auto levelsFile = new TextFileInput(levelsPath);
		
		char[] audio;
		char[] name;
		char[] arrowChart;
		int difficulty = -1;

		int i = 0;
		foreach(line; levelsFile) {
			if(i == 0) {
				audio = line;
				i++;
			} else if(i == 1) {
				name = line;
				i++;
			} else if(i == 2) {
				difficulty = to!(int)(line);
				i++;
			} else if(i == 3) {
				arrowChart = line;
				i = 0;
				Level l = new Level(audio, name, difficulty, arrowChart);
				_levels ~= l;	
			} else {
				// boo!
			}
			
		}

		_cron = new AsciiSprite("graphics/cron-mini.txt");
		_title = new AsciiSprite("graphics/level-select.txt");
		_selector = new AsciiSprite("graphics/cron-selector.txt");
	}

	void down() {
		_selectedLevel++;
		
		if(_selectedLevel > _levels.length-1){
			_selectedLevel = 0;
		}
	}

	void up() {
		_selectedLevel--;

		if(_selectedLevel < 0){
			_selectedLevel = _levels.length-1;
		}
	}

	void selectLevel() {
		_levelSelected = true;
		
	}

	void drawScreen() {
		int y = 10;
		int x = 0;

		_title.drawSprite();

		foreach(i,level; _levels){
			move(y,x);

			if(i == _selectedLevel){
				_selector.setXY(0,y-1);
				_selector.drawSprite();
			}

			x = 8;
			
			move(y,x);
			addstr(toStringz(level._name));
			y++;
			
			for(int j=0; j < level._difficulty; j++){
				_cron.setXY(x+(j*4),y);
				_cron.drawSprite();
			}

			y+=5;
		}	
	}
}
