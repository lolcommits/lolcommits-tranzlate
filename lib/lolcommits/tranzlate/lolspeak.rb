# frozen_string_literal: true

module Lolcommits
  module Tranzlate
    module Lolspeak
      # Adapted and expanded from https://github.com/rwtnorton/moar-lolspeak
      LOL_DICTIONARY = {
        /what/             => %w[wut whut],
        /you\b/            => %w[yu yous yoo u yooz],
        /cture/            => %w[kshur],
        /ss\b/             => %w[s zz z],
        /the\b/            => %w[teh],
        /more/             => %w[moar],
        /my/               => %w[mah mai],
        /are/              => %w[is ar],
        /eese/             => %w[eez],
        /ph/               => %w[f],
        /as\b/             => %w[az],
        /seriously/        => %w[srsly],
        /sion/             => %w[shun],
        /just/             => %w[jus],
        /ose\b/            => %w[oze],
        /eady/             => %w[eddy],
        /ome?\b/           => %w[um],
        /of\b/             => %w[of ov of],
        /uestion/          => %w[wesjun],
        /want/             => %w[wants],
        /ead\b/            => %w[edd],
        /ck/               => %w[kk kkk],
        /cat|kitten|kitty/ => %w[kitteh kittehz cat fuzzeh fuzzyrumpus foozles fuzzbut fluffernutter beast mew],
        /eak/              => %w[ekk],
        /age/              => %w[uj],
        /like/             => %w[likez liek licks],
        /love/             => %w[lovez lub lubs luv lurve lurves],
        /\bis\b/           => [ "ar teh", "ar" ],
        /nd\b/             => %w[n n'],
        /who/              => %w[hoo],
        /'/                => [ "" ],
        /ese\b/            => %w[eez],
        /outh/             => %w[owf],
        /scio/             => %w[shu],
        /esque/            => %w[esk],
        /ture/             => %w[chur],
        /\btoo?\b/         => %w[to t 2 to t],
        /tious/            => %w[shus],
        /sure\b/           => %w[shur],
        /tty\b/            => %w[tteh],
        /were/             => %w[was],
        /ok\b|okay/        => %w[kthxbye!],
        /\ba\b/            => %w[uh],
        /ym/               => %w[im],
        /fish/             => %w[ghoti],
        /thy\b/            => %w[fee],
        /\wly\w/           => %w[li],
        /que\w/            => %w[kwe],
        /\both/            => %w[udd],
        /though\b/         => %w[tho],
        /(t|r|en)ough/     => %w[\1uff],
        /ought/            => %w[awt],
        /ease/             => %w[eez],
        /ing\b/            => %w[in ins ng ing in'],
        /have/             => [ "haz", "hav", "haz a" ],
        /has/              => %w[haz gots],
        /your/             => %w[yur ur yore yoar],
        /ove\b/            => %w[oov ove uuv uv oove],
        /for/              => %w[for 4 fr fur for foar],
        /thank/            => %w[fank tank thx thnx],
        /good/             => %w[gud goed guud gude gewd goot gut],
        /really/           => %w[rly rily rilly rilleh],
        /world/            => %w[wurrld whirld wurld wrld woorld],
        /i'?m\b/           => [ "im", "i yam", "i iz" ],
        /(?!e)ight/        => %w[ite],
        /(?!ues)tion/      => %w[shun],
        /you'?re/          => %w[yore yr],
        /er\b|are|ere/     => %w[r],
        /y\b|ey\b/         => %w[eh],
        /ea/               => %w[ee],
        /can\si\s(?:ple(?:a|e)(?:s|z)e?)?\s?have\sa/ => [ "i can haz" ],
        /(?:hello|\bhi\b|\bhey\b|howdy|\byo\b),?/    => [ "oh hai," ],
        /(?:god\b|allah|buddah?|diety|lord)/         => [ "ceiling cat" ]
      }.freeze

      def tranzlate(str)
        lolstr = str.dup
        LOL_DICTIONARY.each do |english, lolspeak|
          lolstr.gsub!(english, lolspeak.sample)
        end

        lolstr << "!  kthxbye!" if rand(10) == 2
        lolstr.gsub!(/(\?|!|,|\.)+/, "!")

        lolstr.upcase
      end
    end
  end
end
