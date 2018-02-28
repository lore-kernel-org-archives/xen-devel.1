From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 4/5] tools: xenpm: continue to support
 {set, get}-vcpu-migration-delay
Date: Wed, 28 Feb 2018 18:28:33 +0100
Message-ID: <CAAWQecvzgsGNpv05+BYdfMbvDL_u+dS-AZB6N-u16oqVN0_qKA@mail.gmail.com>
References: <151940399656.10991.13321858263862527366.stgit@Palanthas.fritz.box>
 <151940411577.10991.534361130254778056.stgit@Palanthas.fritz.box>
 <1bcdf046-581e-d055-c954-80ddcb45451f@citrix.com>
 <1519831062.9145.10.camel@suse.com>
 <0b48eed9-fdd0-af36-9799-f20c09ea352f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209039935364973697=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fmfk=fw=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1er5XO-0005H4-Qo
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 17:29:06 +0000
Received: by mail-ot0-f169.google.com with SMTP id t2so2949715otj.4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2018 09:28:36 -0800 (PST)
In-Reply-To: <0b48eed9-fdd0-af36-9799-f20c09ea352f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0209039935364973697==
Content-Type: multipart/alternative; boundary="001a113e20e898470c05664912c4"

--001a113e20e898470c05664912c4
Content-Type: text/plain; charset="UTF-8"

Il 28 Feb 2018 17:03, "George Dunlap" <george.dunlap@citrix.com> ha scritto:


> Again, I considered this, for that same reason. The reason why I
> decided for stdout is for maximizing the chances that anyone actually
> using this will see the warning (even if, e.g., they're redirecting
> stderr).

If they're redirecting stderr then they have explicitly decided to
ignore warnings and errors -- if they want to miss messages like this
they should be allowed to.  I would think it much more likely that
stdout would be redirected somewhere than stderr.


This last one is a good point. IAC, as I said, I had doubts myself already,
so I'm fine turning this into stderr.

Thanks and Regards,
Dario

--001a113e20e898470c05664912c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Il 28 Feb 2018 17:03, &quot;George Dunlap&quot; &lt;=
<a href=3D"mailto:george.dunlap@citrix.com">george.dunlap@citrix.com</a>&gt=
; ha scritto:<div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockqu=
ote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div class=3D"elided-text"><br>
&gt; Again, I considered this, for that same reason. The reason why I<br>
&gt; decided for stdout is for maximizing the chances that anyone actually<=
br>
&gt; using this will see the warning (even if, e.g., they&#39;re redirectin=
g<br>
&gt; stderr).<br>
<br>
</div>If they&#39;re redirecting stderr then they have explicitly decided t=
o<br>
ignore warnings and errors -- if they want to miss messages like this<br>
they should be allowed to.=C2=A0 I would think it much more likely that<br>
stdout would be redirected somewhere than stderr.<br>
<div class=3D"elided-text"></div></blockquote></div></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">This last one is a good point. IAC, as I=
 said, I had doubts myself already, so I&#39;m fine turning this into stder=
r.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks and Regards,</=
div><div dir=3D"auto">Dario</div><div dir=3D"auto"><div class=3D"gmail_extr=
a"><br></div></div></div>

--001a113e20e898470c05664912c4--


--===============0209039935364973697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0209039935364973697==--
