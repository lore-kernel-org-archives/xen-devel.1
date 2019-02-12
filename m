From: Julien Grall <julien.grall@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Tue, 12 Feb 2019 20:21:10 +0100
Message-ID: <CAF3u54DiExsh-wPt-oZV-Gh56AvaLLes3PrvZDAHOxpHBLROQg@mail.gmail.com>
References: <alpine.DEB.2.10.1901311345570.22962@sstabellini-ThinkPad-X260>
 <2a651c5d-3f94-378d-baf9-f52cab0cdc62@arm.com>
 <20190201165314.ofuvpddlfpzbc247@mac>
 <56b433e0-645e-997d-1bff-de3c4f7fe250@arm.com>
 <20190204125307.aft4tzkjjrxdd34o@mac>
 <fcd6618d-de13-212f-8afb-e2ef0b37396d@arm.com>
 <f045b9a9-2e1a-4d3e-b2ce-51dca97720a8@gmail.com>
 <6457d3e5-1897-d124-ba49-c6325076b393@gmail.com>
 <alpine.DEB.2.10.1902061300540.2723@sstabellini-ThinkPad-X260>
 <ffe52ce4-2fb6-d730-991e-c48c7fc10c5e@gmail.com>
 <20190207103513.ky7xnftn3pj7r2lf@mac>
 <CAF3u54ANHMf1-3=W=R3w-25JbK3_bR_mDiM888pU5UzSTKTVPg@mail.gmail.com>
 <f5c5bfeb-bca3-9601-7825-3d41d7d5e4af@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0639735871274902361=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f5c5bfeb-bca3-9601-7825-3d41d7d5e4af@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org, "LOPEZ,
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0639735871274902361==
Content-Type: multipart/alternative; boundary="000000000000e093230581b754bc"

--000000000000e093230581b754bc
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Feb 2019, 19:21 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Hello Julien,
>

Hi,

Sorry for the formatting.


> On 07.02.19 12:59, Julien Grall wrote:
> > In that case I would prefer if we don't keep the runstate mapped.
>
> Actually I'm going to see runstate update impact on the context switch
> time. For that I will extend TBM with runstate setup.
> I really do not like a bunch of `copy_to_guest()` done on each context
> switch because of runstate.


Please provide more meaningful arguments other than "I don't like it". I
provided potential drawbacks on my previous e-mails that you haven't yet
addressed.

FWIW, Volodymyr had the same argument on OP-TEE and I requested to avoid
the global mapping. I haven't seen any concern for performance devredation
afterwards. Please feel free to come with numbers here.

If you are against runstate mapping, I'd like to fit runstate into a page,
> than access it directly from the hypervisor.


This is not really a policy in Xen. If the guest cares about it, it can
ensure that the runstate does not cross a page boundary.

Cheers,


> --
> Sincerely,
> Andrii Anisov.
>

--000000000000e093230581b754bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 12 Feb 2019, 19=
:21 Andrii Anisov, &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.an=
isov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello=
 Julien,<br></blockquote></div><div><br></div><div>Hi,</div><div><br></div>=
<div>Sorry for the formatting.</div><div><br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
On 07.02.19 12:59, Julien Grall wrote:<br>
&gt; In that case I would prefer if we don&#39;t keep the runstate mapped.<=
br>
<br>
Actually I&#39;m going to see runstate update impact on the context switch =
time. For that I will extend TBM with runstate setup.<br>
I really do not like a bunch of `copy_to_guest()` done on each context swit=
ch because of runstate.</blockquote></div><div><br></div><div>Please provid=
e more meaningful arguments other than &quot;I don&#39;t like it&quot;. I p=
rovided potential drawbacks on my previous e-mails that you haven&#39;t yet=
 addressed.</div><div><br></div><div>FWIW, Volodymyr had the same argument =
on OP-TEE and I requested to avoid the global mapping. I haven&#39;t seen a=
ny concern for performance devredation afterwards. Please feel free to come=
 with numbers here.</div><div><br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
If you are against runstate mapping, I&#39;d like to fit runstate into a pa=
ge, than access it directly from the hypervisor.</blockquote></div><div cla=
ss=3D"gmail_quote"></div><div><br></div><div>This is not really a policy in=
 Xen. If the guest cares about it, it can ensure that the runstate does not=
 cross a page boundary.</div><div><br></div><div>Cheers,</div><div><br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
</blockquote></div>

--000000000000e093230581b754bc--


--===============0639735871274902361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0639735871274902361==--
