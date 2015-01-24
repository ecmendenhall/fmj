#!/usr/bin/env zsh

test() {
  output="`echo $2 | ./fmj`"
  if [[ `od <(echo $output)` != `od <(echo $3)` ]]; then
    echo "FAILURE: $1"
    echo "Expected: $3"
    echo "Actual:   $output"
    diff <(echo $output) <(echo  $3)
    exit 1
  else
   echo "PASS: $1"
  fi
}

test "handles one emoji" \
     ":crying_cat_face:" \
     "\xf0\x9f\x98\xbf "

test "handles two emoji on one line"       \
     ":crying_cat_face: :crying_cat_face:" \
     "\xf0\x9f\x98\xbf  \xf0\x9f\x98\xbf "

test "handles different emoji on one line" \
     ":crying_cat_face: :joy_cat:"         \
     "\xf0\x9f\x98\xbf  \xf0\x9f\x98\xb9 "

test "handles non-emoji characters" \
     ":not_an_emoji:"               \
     ":not_an_emoji:"

test "handles shortcodes containing symbols" \
     ":+1: :-1:"                             \
     "\xf0\x9f\x91\x8d  \xf0\x9f\x91\x8e "

test "handles shortcodes containing numbers" \
     ":pencil2: :8ball:"                     \
     "\xe2\x9c\x8f\xef\xb8\x8f  \xf0\x9f\x8e\xb1 "

test "they see me rollin" \
     "`cat they_hatin`"    \
"`cat <<EOF
☁️    ☁️  ☀️      ☁️ ☁️\x20

 ☁️   ☁️  ✈️  ☁️  ☁️\x20

__🌳 🌳 ____🌳 __🌲 _
       / \\\\
      / 🚔 \\\\
     /  |  \\\\
    /    🚔  \\\\
   / 🚔  |    \\\\
  /🚔    |🚔    \\\\
 /      |      \\\\
/       🚘       \\\\
THEY SEE ME ROLLIN
   THEY HATIN'
EOF`"
