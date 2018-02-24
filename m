From: KANIKA SAINI <kanika16047@iiitd.ac.in>
Subject: Re: [Minios-devel] Excited for Xen Project in Outreachy
Date: Sun, 25 Feb 2018 01:10:27 +0530
Message-ID: <CAFSf9ho7cA04Uey+6y_3DRA6D054QiGQwK22yCHvF6wwuo3A3w@mail.gmail.com>
References: <4C7AE15B-6A38-4D0B-8E31-2A13DAD04D71@citrix.com>
 <alpine.DEB.2.10.1802141036260.5392@sstabellini-ThinkPad-X260>
 <CAFSf9ho6SwiPw8jDzzy3O+MhjY23MdwWvSNQDwJcr5Y56rjTTA@mail.gmail.com>
 <CAFSf9hqHcZ=9KEb2R=psTy5ou1L6Kh_AE-Tr2HZNWW-qtuw_9g@mail.gmail.com>
 <723A9DC0-1134-4637-9B80-E15ADF026EC3@xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7825096319659749708=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=les6=fs=iiitd.ac.in=kanika16047@srs-us1.protection.inumbo.net>)
 id 1epfgS-0002oZ-0a
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2018 19:40:37 +0000
Received: by mail-lf0-x232.google.com with SMTP id o145so13686828lff.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Feb 2018 11:40:28 -0800 (PST)
In-Reply-To: <723A9DC0-1134-4637-9B80-E15ADF026EC3@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Simon Kuenzer <simon.kuenzer@neclab.eu>
List-Id: xen-devel@lists.xenproject.org

--===============7825096319659749708==
Content-Type: multipart/alternative; boundary="001a113c4962e758ee0565fa726e"

--001a113c4962e758ee0565fa726e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Lars.
The links you have provided have managed to make things clearer to me now.

I understand how a flag in the makefile can be changed by passing a
parameter to the make command in the command line and how
"origin" checks where the variable comes from.
I did realize creating the dependency of the Makefile itself would indeed
not be a good idea at the finer level of granularity.
I went through the documentation at
http://unikraft.neclab.eu/developers-app.html and can now understand the
structure of makefiles of libraries better.

I spent some time studying the problem and came across this solution at
https://www.cmcrossroads.com/article/rebuilding-when-cppflags-changes which
uses the concept of signatures.
I also understood how rules are dynamically being set by the Makefiles in
support/build/ directory.

To be able to draft a solution there's one more thing lacking my
understanding, which is the order of the execution of the makefiles.
What calls the dynamic makefiles and when is the main makefile called and
how do the dynamic makefiles pass those parameters to the main one?

According to what I understood, the flags for the addition of new libraries
or new configurations through the menu config are already being taken care
of by the dynamic checking if that's right. We only have to handle the
additional flags passed through the command line.

I appreciate your time and guidance.

Thank you.




=E2=80=8C

On Fri, Feb 23, 2018 at 2:31 PM, Lars Kurth <lars.kurth.xen@gmail.com>
wrote:

> Hi Kanika,
>
> On 22 Feb 2018, at 20:34, KANIKA SAINI <kanika16047@iiitd.ac.in> wrote:
>
> *Issue suggested by Simon*
> In Unikraft - whenever compiler flags are changed due to an addition of a
> library or something else according to the build rules, the make command
> doesn't force recompilation of those files affected by the flag change
> unless the files are altered too. The only way out is to "make clean" and
> "make" again all the files which can be redundantly time-consuming.
>
>
> *Solution*One way is to create flag files for objects and add those as
> their dependency in the Makefile.
>
>
>
> Apart from this, I'm wondering if rules are passed on to the Makefile and
> changes are depicted in the Makefile itself, can we add Makefile as the
> dependency of objects to solve this issue?
>
>
> I think the answer is in the documentation, which explains the UI (if you
> to call it that way) for the build system (see http://unikraft.neclab.
> eu/developers-app.html)
>
> You can also usually figure out which parameters are passed to make via
> the command line by searching for the origin function, in particular for
> "command line" return values (https://www.gnu.org/software/
> make/manual/html_node/Origin-Function.html). This will give you a sense
> of the values that can be passed to the build system from outside of a
> makefile.
>
> Now, you do need to make sure that you don't change the UI interface, as
> this would break everyone who uses Unikraft.
>
> Assuming that all the flags we care about are already encoded in a
> Makefile (and don't come through the command line or through any other
> means), then adding a dependency may be sufficient. There is the question
> how granular you want this to be:
> a) Is it OK for everything to be rebuilt when say you change a -Dfoo
> b) Do you want this to be more fine grained
>
> Have a google for something like "rebuilding when makefile flags change"
> and you will find a few example patterns with different trade-offs to sol=
ve
> this problem in general
>
> The second challenge is that most substantial build rules get created
> dynamically via* [unikraft/unikraft.git]
> <http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;hb=3DH=
EAD> / support
> <http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;f=3Dsu=
pport;hb=3DHEAD> / build
> <http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;f=3Dsu=
pport/build;hb=3DHEAD> /
> * *
> Thus, adding a dependency on a makefile may not be as simple as it sounds
>
> Lars
>



--=20
Yours sincerely,
Kanika Saini
CSE, IIITD Class of 2020

--001a113c4962e758ee0565fa726e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=
=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/e0547bf=
16b9227ec7e088fe59676c17f256bcccc.png?u=3D1498883">Thank you, Lars.=C2=A0<b=
r>The links you have provided have managed to make things clearer to me now=
.<br><br>I understand how a flag in the makefile can be changed by passing =
a parameter to the make command in the command line and how <br>&quot;origi=
n&quot; checks where the variable comes from.<br>I did realize creating the=
 dependency of the Makefile itself would indeed not be a good idea at the f=
iner level of granularity.=C2=A0<br>I went through the documentation at=C2=
=A0<span id=3D"gmail-docs-internal-guid-1ee4b8dd-c947-9b59-ad09-0d74946c349=
6"><span style=3D"text-decoration-line:underline;font-size:9.5pt;font-famil=
y:Arial;vertical-align:baseline;white-space:pre-wrap"><a href=3D"http://uni=
kraft.neclab.eu/developers-app.html" style=3D"text-decoration-line:none">ht=
tp://unikraft.neclab.eu/developers-app.html</a> </span></span>and can now u=
nderstand the structure of makefiles of libraries better.=C2=A0<br><br>I sp=
ent some time studying the problem and came across this solution at=C2=A0<a=
 href=3D"https://www.cmcrossroads.com/article/rebuilding-when-cppflags-chan=
ges">https://www.cmcrossroads.com/article/rebuilding-when-cppflags-changes<=
/a>=C2=A0which uses the concept of signatures.=C2=A0<br>I also understood h=
ow rules are dynamically being set by the Makefiles in support/build/ direc=
tory.=C2=A0<br><br>To be able to draft a solution=C2=A0there&#39;s one more=
 thing lacking my understanding, which is the order of the execution of the=
 makefiles.=C2=A0<br>What calls the dynamic makefiles and when is the main =
makefile called and how do the dynamic makefiles pass those parameters to t=
he main one?<br><br>According to what I understood, the flags for the addit=
ion of new libraries or new configurations through the menu config are alre=
ady being taken care of by the dynamic checking if that&#39;s right. We onl=
y have to handle the additional flags passed through the command line.=C2=
=A0<br><br>I appreciate your time and guidance.<br><br>Thank you.<br><br><b=
r><br><br>=E2=80=8C</div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Fri, Feb 23, 2018 at 2:31 PM, Lars Kurth <span dir=3D"ltr">&lt;<=
a href=3D"mailto:lars.kurth.xen@gmail.com" target=3D"_blank">lars.kurth.xen=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div sty=
le=3D"word-wrap:break-word;line-break:after-white-space">Hi Kanika,<br><div=
><br><blockquote type=3D"cite"><span class=3D""><div>On 22 Feb 2018, at 20:=
34, KANIKA SAINI &lt;<a href=3D"mailto:kanika16047@iiitd.ac.in" target=3D"_=
blank">kanika16047@iiitd.ac.in</a>&gt; wrote:</div><br class=3D"m_386647243=
6702958773Apple-interchange-newline"></span><div><div dir=3D"ltr" style=3D"=
font-family:Helvetica;font-size:12px;font-style:normal;font-variant-caps:no=
rmal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px"><img width=3D"=
0" height=3D"0" class=3D"m_3866472436702958773mailtrack-img" alt=3D"" src=
=3D"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAA=
AIBRAA7" style=3D"display:flex"><span class=3D""><div></div><div></div><div=
></div><b>Issue suggested by Simon</b><div>In Unikraft - whenever compiler =
flags are changed due to an addition of a library or something else accordi=
ng to the build rules, the make command doesn&#39;t force recompilation of =
those files affected by the flag change unless the files are altered too. T=
he only way out is to &quot;make clean&quot; and &quot;make&quot; again all=
 the files which can be redundantly time-consuming.<br><br><b>Solution<br><=
/b>One way is to create flag files for objects and add those as their depen=
dency in the Makefile.<br></div></span></div></div></blockquote><div><br></=
div></div><span class=3D""><div><br><blockquote type=3D"cite"><div><div dir=
=3D"ltr" style=3D"font-family:Helvetica;font-size:12px;font-style:normal;fo=
nt-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px"><div>Apart from this, I&#39;m wondering if rules are passed on to the M=
akefile and changes are depicted in the Makefile itself, can we add Makefil=
e as the dependency of objects to solve this issue?<br></div></div></div></=
blockquote><div><br></div></div></span>I think the answer is in the documen=
tation, which explains the UI (if you to call it that way) for the build sy=
stem (see=C2=A0<a href=3D"http://unikraft.neclab.eu/developers-app.html" ta=
rget=3D"_blank">http://unikraft.neclab.<wbr>eu/developers-app.html</a>)<div=
><br><div>You can also usually figure out which parameters are passed to ma=
ke via the command line by searching for the origin function, in particular=
 for &quot;command line&quot; return values (<a href=3D"https://www.gnu.org=
/software/make/manual/html_node/Origin-Function.html" target=3D"_blank">htt=
ps://www.gnu.org/software/<wbr>make/manual/html_node/Origin-<wbr>Function.h=
tml</a>). This will give you a sense of the values that can be passed to th=
e build system from outside of a makefile.</div><div><br></div><div>Now, yo=
u do need to make sure that you don&#39;t change the UI interface, as this =
would break everyone who uses Unikraft.</div></div><div><br></div><div>Assu=
ming that all the flags we care about are already encoded in a Makefile (an=
d don&#39;t come through the command line or through any other means), then=
 adding a dependency may be sufficient. There is the question how granular =
you want this to be:=C2=A0</div><div>a) Is it OK for everything to be rebui=
lt when say you change a -Dfoo=C2=A0</div><div>b) Do you want this to be mo=
re fine grained</div><div><br></div><div>Have a google for something like &=
quot;rebuilding when makefile flags change&quot; and you will find a few ex=
ample patterns with different trade-offs to solve this problem in general</=
div><div><br></div><div>The second challenge is that most substantial build=
 rules get created dynamically via<b>=C2=A0<a href=3D"http://xenbits.xen.or=
g/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;hb=3DHEAD" title=3D"tree root"=
 style=3D"color:rgb(136,0,0);font-family:sans-serif;font-variant-ligatures:=
normal;background-color:rgb(255,255,255)" target=3D"_blank">[unikraft/unikr=
aft.git]</a><span style=3D"font-family:sans-serif;font-variant-ligatures:no=
rmal;background-color:rgb(255,255,255)">=C2=A0/=C2=A0</span><a href=3D"http=
://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;f=3Dsupport;h=
b=3DHEAD" title=3D"support" style=3D"color:rgb(136,0,0);font-family:sans-se=
rif;font-variant-ligatures:normal;background-color:rgb(255,255,255)" target=
=3D"_blank"><wbr>support</a><span style=3D"font-family:sans-serif;font-vari=
ant-ligatures:normal;background-color:rgb(255,255,255)">=C2=A0/=C2=A0</span=
><a href=3D"http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtr=
ee;f=3Dsupport/build;hb=3DHEAD" title=3D"support/build" style=3D"color:rgb(=
136,0,0);font-family:sans-serif;font-variant-ligatures:normal;background-co=
lor:rgb(255,255,255)" target=3D"_blank">build</a><span style=3D"font-family=
:sans-serif;font-variant-ligatures:normal;background-color:rgb(255,255,255)=
">=C2=A0/ *=C2=A0</span></b></div><div><span style=3D"font-family:sans-seri=
f;font-variant-ligatures:normal;background-color:rgb(255,255,255)">Thus, ad=
ding a dependency on a makefile may not be as simple as it sounds</span></d=
iv><span class=3D"HOEnZb"><font color=3D"#888888"><div><span style=3D"font-=
family:sans-serif;font-variant-ligatures:normal;background-color:rgb(255,25=
5,255)"><br></span></div><div><span style=3D"font-family:sans-serif;font-va=
riant-ligatures:normal;background-color:rgb(255,255,255)">Lars=C2=A0</span>=
</div></font></span></div></blockquote></div><br><br clear=3D"all"><div><br=
></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Yours sincerely,<br></div>=
Kanika Saini<br></div><div>CSE, IIITD Class of 2020</div></div></div></div>
</div>

--001a113c4962e758ee0565fa726e--


--===============7825096319659749708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7825096319659749708==--
