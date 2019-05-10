From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Guest Testing in OSSTEST - What distros and
 versions should we test against
Date: Fri, 10 May 2019 06:41:13 -0600
Message-ID: <BADFED47-270A-4F72-BB50-AE9BD6D77A76@gmail.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
 <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============1584144193327860742=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0ItA=TK=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hP4q0-0007pF-Fs
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 12:41:20 +0000
Received: by mail-ua1-x92d.google.com with SMTP id e9so1598698uar.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2019 05:41:19 -0700 (PDT)
In-Reply-To: <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Committers <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============1584144193327860742==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B"


--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 10 May 2019, at 01:48, Jan Beulich <JBeulich@suse.com> wrote:
>>=20
>> With regards to Windows testing we have some restrictions. We have =
tried=20
>> several times to buy additional test licenses, but this never went =
anywhere=20
>> (some of the VM licenses are not available for our environment, =
unless you=20
>> bulk buy, which is very expensive). The only approach that would =
allow us to=20
>> test against different windows versions would be to require everyone =
who may=20
>> touch OSSTEST which is not doable.
>>=20
>> I can bring this up with the MS open source office, if there are =
strong=20
>> feelings about this and try again
>=20
> If there's at least a (not overly) small chance of succeeding, I think =
this
> may be worth it, unless Rich's suggestion already helps.
>=20

I will try again. Let's work on the basis that this is possible and see =
where it goes
Lars=

--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 10 May 2019, at 01:48, Jan Beulich &lt;<a =
href=3D"mailto:JBeulich@suse.com" class=3D"">JBeulich@suse.com</a>&gt; =
wrote:</div><div class=3D""><div style=3D"" class=3D""><blockquote =
type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">With regards to Windows testing we have some restrictions. We =
have tried<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">several times to buy additional test licenses, but this never =
went anywhere<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">(some of the VM licenses are not available for our =
environment, unless you<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">bulk buy, =
which is very expensive). The only approach that would allow us to<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">test against =
different windows versions would be to require everyone who may<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">touch =
OSSTEST which is not doable.<br class=3D""><br class=3D"">I can bring =
this up with the MS open source office, if there are strong<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">feelings =
about this and try again<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">If there's at =
least a (not overly) small chance of succeeding, I think this</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">may be worth =
it, unless Rich's suggestion already helps.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br class=3D""></div></div></blockquote><br =
class=3D""></div>I will try again. Let's work on the basis that this is =
possible and see where it goes<div class=3D""><div =
class=3D"">Lars</div></div></body></html>=

--Apple-Mail=_989C9DD9-FA26-45A3-9BEF-EC79DF18AD3B--


--===============1584144193327860742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1584144193327860742==--
