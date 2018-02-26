From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Minios-devel] Excited for Xen Project in Outreachy
Date: Mon, 26 Feb 2018 17:21:51 +0100
Message-ID: <B3203C11-6B69-49FB-8654-9656122D8677@gmail.com>
References: <4C7AE15B-6A38-4D0B-8E31-2A13DAD04D71@citrix.com>
 <alpine.DEB.2.10.1802141036260.5392@sstabellini-ThinkPad-X260>
 <CAFSf9ho6SwiPw8jDzzy3O+MhjY23MdwWvSNQDwJcr5Y56rjTTA@mail.gmail.com>
 <CAFSf9hqHcZ=9KEb2R=psTy5ou1L6Kh_AE-Tr2HZNWW-qtuw_9g@mail.gmail.com>
 <723A9DC0-1134-4637-9B80-E15ADF026EC3@xenproject.org>
 <CAFSf9ho7cA04Uey+6y_3DRA6D054QiGQwK22yCHvF6wwuo3A3w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============7798694638300854147=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fynv=fu=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eqLXI-0000tr-H8
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 16:21:56 +0000
In-Reply-To: <CAFSf9ho7cA04Uey+6y_3DRA6D054QiGQwK22yCHvF6wwuo3A3w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: KANIKA SAINI <kanika16047@iiitd.ac.in>, Simon Kuenzer <simon.kuenzer@neclab.eu>
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7798694638300854147==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2EFE6165-4C5F-430D-8586-A32A8C15CF4B"


--Apple-Mail=_2EFE6165-4C5F-430D-8586-A32A8C15CF4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Kanika,

> On 24 Feb 2018, at 20:40, KANIKA SAINI <kanika16047@iiitd.ac.in> =
wrote:
>=20
> Thank you, Lars.=20
> The links you have provided have managed to make things clearer to me =
now.
>=20
> I understand how a flag in the makefile can be changed by passing a =
parameter to the make command in the command line and how=20
> "origin" checks where the variable comes from.
> I did realize creating the dependency of the Makefile itself would =
indeed not be a good idea at the finer level of granularity.=20
> I went through the documentation at =
http://unikraft.neclab.eu/developers-app.html =
<http://unikraft.neclab.eu/developers-app.html> and can now understand =
the structure of makefiles of libraries better.=20
>=20
> I spent some time studying the problem and came across this solution =
at https://www.cmcrossroads.com/article/rebuilding-when-cppflags-changes =
<https://www.cmcrossroads.com/article/rebuilding-when-cppflags-changes> =
which uses the concept of signatures.=20
> I also understood how rules are dynamically being set by the Makefiles =
in support/build/ directory.=20
>=20
> To be able to draft a solution there's one more thing lacking my =
understanding, which is the order of the execution of the makefiles.=20
> What calls the dynamic makefiles and when is the main makefile called =
and how do the dynamic makefiles pass those parameters to the main one?

I am not sure I understand your question.

Generally, you can debug makefiles which can help you understand what is =
going on: e.g. see http://www.oreilly.com/openbook/make3/book/ch12.pdf =
<http://www.oreilly.com/openbook/make3/book/ch12.pdf>

But in a nutshell: you call make ... in your directory and the Makefile =
is invoked
* Other rules, e.g. in support / build are included via include =
statements
* All the other *.uk makefiles are also included=20
=3D> The makefile in unikraft / unikraft.git drives everything related =
to building and configuration (including menuconfig)

In some cases you have nested makefile execution, where another makefile =
is invoked via "@make" as in the Hello World app

Lars


--Apple-Mail=_2EFE6165-4C5F-430D-8586-A32A8C15CF4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Kanika,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 24 Feb 2018, at 20:40, KANIKA SAINI &lt;<a =
href=3D"mailto:kanika16047@iiitd.ac.in" =
class=3D"">kanika16047@iiitd.ac.in</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=3D"" =
src=3D"https://mailtrack.io/trace/mail/e0547bf16b9227ec7e088fe59676c17f256=
bcccc.png?u=3D1498883" style=3D"display: flex;">Thank you, =
Lars.&nbsp;<br class=3D"">The links you have provided have managed to =
make things clearer to me now.<br class=3D""><br class=3D"">I understand =
how a flag in the makefile can be changed by passing a parameter to the =
make command in the command line and how<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">"origin" =
checks where the variable comes from.<br class=3D"">I did realize =
creating the dependency of the Makefile itself would indeed not be a =
good idea at the finer level of granularity.&nbsp;<br class=3D"">I went =
through the documentation at&nbsp;<span =
id=3D"gmail-docs-internal-guid-1ee4b8dd-c947-9b59-ad09-0d74946c3496" =
class=3D""><span style=3D"font-size: 9.5pt; font-family: Arial; =
vertical-align: baseline; white-space: pre-wrap;" class=3D""><a =
href=3D"http://unikraft.neclab.eu/developers-app.html" =
class=3D"">http://unikraft.neclab.eu/developers-app.html</a> =
</span></span>and can now understand the structure of makefiles of =
libraries better.&nbsp;<br class=3D""><br class=3D"">I spent some time =
studying the problem and came across this solution at&nbsp;<a =
href=3D"https://www.cmcrossroads.com/article/rebuilding-when-cppflags-chan=
ges" =
class=3D"">https://www.cmcrossroads.com/article/rebuilding-when-cppflags-c=
hanges</a>&nbsp;which uses the concept of signatures.&nbsp;<br =
class=3D"">I also understood how rules are dynamically being set by the =
Makefiles in support/build/ directory.&nbsp;<br class=3D""><br =
class=3D"">To be able to draft a solution&nbsp;there's one more thing =
lacking my understanding, which is the order of the execution of the =
makefiles.&nbsp;<br class=3D"">What calls the dynamic makefiles and when =
is the main makefile called and how do the dynamic makefiles pass those =
parameters to the main one?<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>I am =
not sure I understand your question.</div><div><br =
class=3D""></div><div>Generally, you can debug makefiles which can help =
you understand what is going on: e.g. see <a =
href=3D"http://www.oreilly.com/openbook/make3/book/ch12.pdf" =
class=3D"">http://www.oreilly.com/openbook/make3/book/ch12.pdf</a></div><d=
iv><br class=3D""></div><div>But in a nutshell: you call make ... in =
your directory and the Makefile is invoked</div><div>* Other rules, e.g. =
in support / build are included via include statements</div><div>* All =
the other *.uk makefiles are also included&nbsp;</div><div>=3D&gt; The =
makefile in&nbsp;unikraft / unikraft.git drives everything related to =
building and configuration (including<span style=3D"color: rgb(64, 64, =
64); font-family: Consolas, &quot;Andale Mono WT&quot;, &quot;Andale =
Mono&quot;, &quot;Lucida Console&quot;, &quot;Lucida Sans =
Typewriter&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera =
Sans Mono&quot;, &quot;Liberation Mono&quot;, &quot;Nimbus Mono L&quot;, =
Monaco, &quot;Courier New&quot;, Courier, monospace; orphans: 2; widows: =
2; background-color: rgb(255, 255, 255);" =
class=3D"">&nbsp;menuconfig)</span></div><div><br class=3D""></div><div>In=
 some cases you have nested makefile execution, where another makefile =
is invoked via "<span style=3D"font-family: monospace; orphans: 2; =
white-space: pre; widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">@make</span>" as in the Hello World =
app</div></div><div></div><div class=3D""><br class=3D""></div>Lars<br =
class=3D""><br class=3D""></body></html>=

--Apple-Mail=_2EFE6165-4C5F-430D-8586-A32A8C15CF4B--


--===============7798694638300854147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7798694638300854147==--
