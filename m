From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 28/57] ARM: new VGIC: Add acccessor to new
 struct vgic_irq instance
Date: Tue, 20 Mar 2018 11:07:03 +0000
Message-ID: <CAEC2Cxq3T642jBkDQozKfN2u45mwdbXfcEeNXnSzYF+b8GoNeg@mail.gmail.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-29-andre.przywara@linaro.org>
 <54b15802-2f72-7e7c-ada2-a3b77f81b2f4@arm.com>
 <f0f3b85e-2eea-6632-e2c6-824ab099837b@linaro.org>
 <f18d38c1-44ab-9d8b-1c9c-3481b922b698@arm.com>
 <03679127-9314-9190-80c3-628ffdff08af@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1695349015000494100=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nvt7=gk=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyF6g-0004Hp-0C
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 11:07:06 +0000
Received: by mail-qt0-x22c.google.com with SMTP id l25so1079299qtj.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 04:07:04 -0700 (PDT)
In-Reply-To: <03679127-9314-9190-80c3-628ffdff08af@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============1695349015000494100==
Content-Type: multipart/alternative; boundary="001a113fc51610a8400567d6139c"

--001a113fc51610a8400567d6139c
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On 20 Mar 2018 19:01, "Andre Przywara" <andre.przywara@linaro.org> wrote:


I am happy to add a comment saying that a list is not the right data
structure.


Fair enough. I won't argue more, let's keep the list and add a comment. I
do want to see that series merged in Xen 4.11.

Cheers,


Cheers,
Andre.

_______________________________________________
Xen-devel mailing list
Xen-devel@lists.xenproject.org
https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a113fc51610a8400567d6139c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra">Hi,</div><div class=
=3D"gmail_extra" dir=3D"auto"><br></div><div class=3D"gmail_extra" dir=3D"a=
uto">Sorry for the formatting.</div><div class=3D"gmail_extra" dir=3D"auto"=
><br></div><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"gmail_quot=
e" dir=3D"auto">On 20 Mar 2018 19:01, &quot;Andre Przywara&quot; &lt;<a hre=
f=3D"mailto:andre.przywara@linaro.org">andre.przywara@linaro.org</a>&gt; wr=
ote:<blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
I am happy to add a comment saying that a list is not the right data<br>
structure.<br></blockquote></div></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Fair enough. I won&#39;t argue more, let&#39;s keep the lis=
t and add a comment. I do want to see that series merged in Xen 4.11.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
Andre.<br>
<div class=3D"elided-text"><br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></div></blockquote></div><br></div></div></div>

--001a113fc51610a8400567d6139c--


--===============1695349015000494100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1695349015000494100==--
