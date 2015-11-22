"
Qualitative schemes do not imply magnitude differences between legend classes, and hues are used to create the primary visual differences between classes. Qualitative schemes are best suited to representing nominal or categorical data.

Check it out by executing:
ColorPalette qualitative show

More info: 
http://colorbrewer2.org/learnmore/schemes_full.html#qualitative

---Copyright:
All colors, palettes and schemes are from www.ColorBrewer.org by Cynthia A. Brewer, Geography, Pennsylvania State University.

FalutUI1 color scheme come from: http://flatuicolors.com/
"
Class {
	#name : #RTCPQualitative,
	#superclass : #RTColorPalette,
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #default }
RTCPQualitative class >> info [

	^ 'Qualitative schemes do not imply magnitude differences;between legend classes, and hues are used to create the;primary visual differences between classes. Qualitative schemes;are best suited to representing nominal or categorical data.'
]

{ #category : #default }
RTCPQualitative class >> rawPalette [

	^ ((Array new: 9) at: 1 put: ('Set2'->((Array new: 6) at: 1 put: (3->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) )); at: 2 put: (4->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) #(231 138 195 ) )); at: 3 put: (5->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) #(231 138 195 ) #(166 216 84 ) )); at: 4 put: (6->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) #(231 138 195 ) #(166 216 84 ) #(255 217 47 ) )); at: 5 put: (7->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) #(231 138 195 ) #(166 216 84 ) #(255 217 47 ) #(229 196 148 ) )); at: 6 put: (8->#(#(102 194 165 ) #(252 141 98 ) #(141 160 203 ) #(231 138 195 ) #(166 216 84 ) #(255 217 47 ) #(229 196 148 ) #(179 179 179 ) )); yourself)); at: 2 put: ('Accent'->((Array new: 6) at: 1 put: (3->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) )); at: 2 put: (4->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) #(255 255 153 ) )); at: 3 put: (5->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) #(255 255 153 ) #(56 108 176 ) )); at: 4 put: (6->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) #(255 255 153 ) #(56 108 176 ) #(240 2 127 ) )); at: 5 put: (7->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) #(255 255 153 ) #(56 108 176 ) #(240 2 127 ) #(191 91 23 ) )); at: 6 put: (8->#(#(127 201 127 ) #(190 174 212 ) #(253 192 134 ) #(255 255 153 ) #(56 108 176 ) #(240 2 127 ) #(191 91 23 ) #(102 102 102 ) )); yourself)); at: 3 put: ('Set1'->((Array new: 7) at: 1 put: (3->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) )); at: 2 put: (4->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) )); at: 3 put: (5->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) #(255 127 0 ) )); at: 4 put: (6->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) #(255 127 0 ) #(255 255 51 ) )); at: 5 put: (7->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) #(255 127 0 ) #(255 255 51 ) #(166 86 40 ) )); at: 6 put: (8->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) #(255 127 0 ) #(255 255 51 ) #(166 86 40 ) #(247 129 191 ) )); at: 7 put: (9->#(#(228 26 28 ) #(55 126 184 ) #(77 175 74 ) #(152 78 163 ) #(255 127 0 ) #(255 255 51 ) #(166 86 40 ) #(247 129 191 ) #(153 153 153 ) )); yourself)); at: 4 put: ('Set3'->((Array new: 10) at: 1 put: (3->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) )); at: 2 put: (4->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) )); at: 3 put: (5->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) )); at: 4 put: (6->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) )); at: 5 put: (7->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) )); at: 6 put: (8->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) #(252 205 229 ) )); at: 7 put: (9->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) #(252 205 229 ) #(217 217 217 ) )); at: 8 put: (10->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) #(252 205 229 ) #(217 217 217 ) #(188 128 189 ) )); at: 9 put: (11->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) #(252 205 229 ) #(217 217 217 ) #(188 128 189 ) #(204 235 197 ) )); at: 10 put: (12->#(#(141 211 199 ) #(255 255 179 ) #(190 186 218 ) #(251 128 114 ) #(128 177 211 ) #(253 180 98 ) #(179 222 105 ) #(252 205 229 ) #(217 217 217 ) #(188 128 189 ) #(204 235 197 ) #(255 237 111 ) )); yourself)); at: 5 put: ('Dark2'->((Array new: 6) at: 1 put: (3->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) )); at: 2 put: (4->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) #(231 41 138 ) )); at: 3 put: (5->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) #(231 41 138 ) #(102 166 30 ) )); at: 4 put: (6->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) #(231 41 138 ) #(102 166 30 ) #(230 171 2 ) )); at: 5 put: (7->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) #(231 41 138 ) #(102 166 30 ) #(230 171 2 ) #(166 118 29 ) )); at: 6 put: (8->#(#(27 158 119 ) #(217 95 2 ) #(117 112 179 ) #(231 41 138 ) #(102 166 30 ) #(230 171 2 ) #(166 118 29 ) #(102 102 102 ) )); yourself)); at: 6 put: ('Paired'->((Array new: 10) at: 1 put: (3->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) )); at: 2 put: (4->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) )); at: 3 put: (5->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) )); at: 4 put: (6->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) )); at: 5 put: (7->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) )); at: 6 put: (8->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) #(255 127 0 ) )); at: 7 put: (9->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) #(255 127 0 ) #(202 178 214 ) )); at: 8 put: (10->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) #(255 127 0 ) #(202 178 214 ) #(106 61 154 ) )); at: 9 put: (11->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) #(255 127 0 ) #(202 178 214 ) #(106 61 154 ) #(255 255 153 ) )); at: 10 put: (12->#(#(166 206 227 ) #(31 120 180 ) #(178 223 138 ) #(51 160 44 ) #(251 154 153 ) #(227 26 28 ) #(253 191 111 ) #(255 127 0 ) #(202 178 214 ) #(106 61 154 ) #(255 255 153 ) #(177 89 40 ) )); yourself)); at: 7 put: ('Pastel2'->((Array new: 6) at: 1 put: (3->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) )); at: 2 put: (4->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) #(244 202 228 ) )); at: 3 put: (5->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) #(244 202 228 ) #(230 245 201 ) )); at: 4 put: (6->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) #(244 202 228 ) #(230 245 201 ) #(255 242 174 ) )); at: 5 put: (7->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) #(244 202 228 ) #(230 245 201 ) #(255 242 174 ) #(241 226 204 ) )); at: 6 put: (8->#(#(179 226 205 ) #(253 205 172 ) #(203 213 232 ) #(244 202 228 ) #(230 245 201 ) #(255 242 174 ) #(241 226 204 ) #(204 204 204 ) )); yourself)); at: 8 put: ('Pastel1'->((Array new: 7) at: 1 put: (3->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) )); at: 2 put: (4->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) )); at: 3 put: (5->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) #(254 217 166 ) )); at: 4 put: (6->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) #(254 217 166 ) #(255 255 204 ) )); at: 5 put: (7->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) #(254 217 166 ) #(255 255 204 ) #(229 216 189 ) )); at: 6 put: (8->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) #(254 217 166 ) #(255 255 204 ) #(229 216 189 ) #(253 218 236 ) )); at: 7 put: (9->#(#(251 180 174 ) #(179 205 227 ) #(204 235 197 ) #(222 203 228 ) #(254 217 166 ) #(255 255 204 ) #(229 216 189 ) #(253 218 236 ) #(242 242 242 ) )); yourself)); at: 9 put: ('FlatUI1'->((Array new: 18) at: 1 put: (3->#( #(26 188 156) #(46 204 113) #(52 152 219) )); at: 2 put: (4->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) )); at: 3 put: (5->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) )); at: 4 put: (6->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) )); at: 5 put: (7->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) )); at: 6 put: (8->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) )); at: 7 put: (9->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) )); at: 8 put: (10->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) )); at: 9 put: (11->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) )); at: 10 put: (12->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) )); at: 11 put: (13->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) )); at: 12 put: (14->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) )); at: 13 put: (15->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) )); at: 14 put: (16->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) #(243 156 18) )); at: 15 put: (17->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) #(243 156 18) #(211 84 0) )); at: 16 put: (18->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) #(243 156 18) #(211 84 0) #(192 57 43) )); at: 17 put: (19->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) #(243 156 18) #(211 84 0) #(192 57 43) #(189 195 199) )); at: 18 put: (20->#(#(26 188 156) #(46 204 113) #(52 152 219) #(155 89 182) #(52 73 94) #(22 160 133) #(39 174 96) #(41 128 185) #(142 68 173) #(44 62 80) #(241 196 15) #(230 126 34) #(231 76 60) #(236 240 241) #(149 165 166) #(243 156 18) #(211 84 0) #(192 57 43) #(189 195 199) #(127 140 141) )); yourself)); yourself) 
]