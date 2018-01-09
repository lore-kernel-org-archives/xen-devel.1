From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
	4.10.1
Date: Tue, 9 Jan 2018 06:08:53 -0800
Message-ID: <CA+aC4kuKa_iuknh6K4DULQwFZwktDXV8=r+tJn_wphn8h_PKJQ@mail.gmail.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <08bdc18d-7d05-9e56-5a7a-513603698576@citrix.com>
 <23124.40763.849975.202465@mariner.uk.xensource.com>
 <154f92d0-13c6-0fb4-f48d-93e9e83aaa4f@citrix.com>
 <23124.41063.724419.527371@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6233921238947620876=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=n3h8=ee=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYuaJ-0006sn-7V
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 14:08:59 +0000
Received: by mail-lf0-x231.google.com with SMTP id e203so1289391lfg.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 06:08:56 -0800 (PST)
In-Reply-To: <23124.41063.724419.527371@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6233921238947620876==
Content-Type: multipart/alternative; boundary="001a113fb1348454c30562587414"

--001a113fb1348454c30562587414
Content-Type: text/plain; charset="UTF-8"

On Jan 9, 2018 2:59 AM, "Ian Jackson" <ian.jackson@eu.citrix.com> wrote:

George Dunlap writes ("Re: Radical proposal: ship not-fully-tidied shim as
4.10.1"):
> On 01/09/2018 10:53 AM, Ian Jackson wrote:
> > And as my other mail suggests, I don't think we should allow this work
> > to be blocked by outstanding reviewed.  IMO we should ship what we
> > have ASAP.
>
> Well "what we have" boot under HVM?

No, so that does need to be fixed.  We could ship Amazon's series but
that has no migration and no ballooning.


Why do we think migration doesn't work?  I haven't tested but I cannot
imagine why it wouldn't.

Ballooning is trivial.  I can send a V3 this morning with ballooning.

Regards,

Anthony Liguori


I was hoping someone would have an opinion about how hard it would be
to take Amazon's early boot approach and stuff it into Citrix's
more-comprehensive shim series.

Ian.

_______________________________________________
Xen-devel mailing list
Xen-devel@lists.xenproject.org
https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a113fb1348454c30562587414
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Jan 9, 2018 2:59 AM, &quot;Ian Jackson&quot; &lt;<a href=3D"ma=
ilto:ian.jackson@eu.citrix.com">ian.jackson@eu.citrix.com</a>&gt; wrote:<br=
 type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">George Dunlap writes (&quot;=
Re: Radical proposal: ship not-fully-tidied shim as 4.10.1&quot;):<br>
<div class=3D"quoted-text">&gt; On 01/09/2018 10:53 AM, Ian Jackson wrote:<=
br>
</div><div class=3D"quoted-text">&gt; &gt; And as my other mail suggests, I=
 don&#39;t think we should allow this work<br>
&gt; &gt; to be blocked by outstanding reviewed.=C2=A0 IMO we should ship w=
hat we<br>
&gt; &gt; have ASAP.<br>
&gt;<br>
&gt; Well &quot;what we have&quot; boot under HVM?<br>
<br>
</div>No, so that does need to be fixed.=C2=A0 We could ship Amazon&#39;s s=
eries but<br>
that has no migration and no ballooning.<br></blockquote></div></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Why do we think migration doe=
sn&#39;t work?=C2=A0 I haven&#39;t tested but I cannot imagine why it would=
n&#39;t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ballooning is t=
rivial.=C2=A0 I can send a V3 this morning with ballooning.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Anthony Liguori</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
I was hoping someone would have an opinion about how hard it would be<br>
to take Amazon&#39;s early boot approach and stuff it into Citrix&#39;s<br>
more-comprehensive shim series.<br>
<font color=3D"#888888"><br>
Ian.<br>
</font><div class=3D"elided-text"><br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></div></blockquote></div><br></div></div></div>

--001a113fb1348454c30562587414--


--===============6233921238947620876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6233921238947620876==--
