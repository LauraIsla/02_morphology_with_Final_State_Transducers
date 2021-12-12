%ETT Übung 2: Entwicklung einer Computermorphologie
%WiSe 21/2022
%Ludwig-Maximilians-Universität
%Michael Anzer - Viktoria Heck - Laura Isla Navarro


$verb-pre-1conj-infl$ = <Verb>:<> (\
{<inf><1-conj>}:{ar} |\
{<pre><1><sg><ind>}:{o} |\
{<pre><2><sg><ind>}:{as} |\
{<pre><3><sg><ind>}:{a} |\
{<pre><1><pl><ind>}:{amos} |\
{<pre><2><pl><ind>}:{áis} |\
{<pre><3><pl><ind>}:{an}|\
{<pre><1><sg><subj>}:{e} |\
{<pre><2><sg><subj>}:{es} |\
{<pre><3><sg><subj>}:{e} |\
{<pre><1><pl><subj>}:{emos} |\
{<pre><2><pl><subj>}:{éis} |\
{<pre><3><pl><subj>}:{en})

$verb-pre-2conj-infl$ = <Verb>:<> (\
{<inf><2-conj>}:{er} |\
{<pre><1><sg><ind>}:{o} |\
{<pre><2><sg><ind>}:{es} |\
{<pre><3><sg><ind>}:{e} |\
{<pre><1><pl><ind>}:{emos} |\
{<pre><2><pl><ind>}:{éis} |\
{<pre><3><pl><ind>}:{en}|\
{<pre><1><sg><subj>}:{a} |\
{<pre><2><sg><subj>}:{as} |\
{<pre><3><sg><subj>}:{a} |\
{<pre><1><pl><subj>}:{amos} |\
{<pre><2><pl><subj>}:{áis} |\
{<pre><3><pl><subj>}:{an})

$verb-pre-3conj-infl$ = <Verb>:<> (\
{<inf><3-conj>}:{ir} |\
{<pre><1><sg><ind>}:{o} |\
{<pre><2><sg><ind>}:{es} |\
{<pre><3><sg><ind>}:{e} |\
{<pre><1><pl><ind>}:{imos} |\
{<pre><2><pl><ind>}:{is} |\
{<pre><3><pl><ind>}:{en}|\
{<pre><1><sg><subj>}:{a} |\
{<pre><2><sg><subj>}:{as} |\
{<pre><3><sg><subj>}:{a} |\
{<pre><1><pl><subj>}:{amos} |\
{<pre><2><pl><subj>}:{áis} |\
{<pre><3><pl><subj>}:{an})

$morph$ = "verb-pre-1conj.lex" $verb-pre-1conj-infl$ |\
"verb-pre-2conj.lex" $verb-pre-2conj-infl$ |\
"verb-pre-3conj.lex" $verb-pre-3conj-infl$

ALPHABET = [A-ZÁÉa-záé]
#letter# = aeioubcdfghjklmnpqrstvxáé
$letter$ = [#letter#]

%"o" is to be replaced by "ue" whenever the tense is either "o", "as", "an", "es", "en", "e"
%e.g. "dormo" would not be the right form for the <pre><1><sg><ind>. The correct form would be "duermo".
%The same applies for verbs of the first and second conjugations such as "volar" or "volver"

$o-to-ue$ = (o:{ue}) ^-> ($letter$__$letter$*(o | a | as | an | es | en | e))

%We want to keep "o" in case that the tense is either "ir", "ar", "er", "imos", "is", "amos", "emos", "áis", "éis"
%e.g. "dormir" should not become "duermir", "volar" should not be "vuelar" and "volver" should not be "vuelver"

$ue-to-o$ = ({ue}:o) ^-> ($letter$__$letter$*(ir | ar | er | imos | is | amos | emos | áis | éis))

%In some instances in the third conjugation, namely in the <pre><1><pl><subj> and <pre><2><pl><subj>,
%"o" is to be substituted with "u"
%e.g. The <pre><1><pl><subj> and <pre><2><pl><subj> of "dormir" are "durmamos" and "durmáis", respectively

$o-to-u$ = (o:u) ^-> ([dm]__[rm]*(amos | áis))

%If there is an "e" in a second conjugation verb, this should be changed with "ie" whenever the tense is either "o",
%"es", "e" or "en". This rule is not applicable to tenses containing "e"
%e.g. The <pre><1><sg><ind> of the verb "entender" corresponds to "entiendo"

$e-to-ie$ = (e:{ie}) ^-> ([tpc]__[rdn]*(o | a | es | e | en))

%However, "e" should be kept in a second conjugation verb whenever the tense is either "er", "emos", "amos", "áis" or
%"éis".
%e.g. The <pre><1><pl><ind> of the verb "entender" corresponds to "entendemos"

$ie-to-e$ = ({ie}:e) ^-> ([tpc]__[rdn]*(er | emos | amos | éis | áis))

$morph$ || $o-to-ue$ || $ue-to-o$ || $o-to-u$ || $e-to-ie$ || $ie-to-e$