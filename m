From: Julien Grall <julien.grall@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Fri, 15 Feb 2019 19:36:51 +0100
Message-ID: <CAF3u54DwgQx_DPWEXTGsHf9NOeMG_zjkOhG-NqaV2x-g1z0PWA@mail.gmail.com>
References: <20190201165314.ofuvpddlfpzbc247@mac>
 <56b433e0-645e-997d-1bff-de3c4f7fe250@arm.com>
 <20190204125307.aft4tzkjjrxdd34o@mac>
 <fcd6618d-de13-212f-8afb-e2ef0b37396d@arm.com>
 <f045b9a9-2e1a-4d3e-b2ce-51dca97720a8@gmail.com>
 <6457d3e5-1897-d124-ba49-c6325076b393@gmail.com>
 <alpine.DEB.2.10.1902061300540.2723@sstabellini-ThinkPad-X260>
 <ffe52ce4-2fb6-d730-991e-c48c7fc10c5e@gmail.com>
 <20190207103513.ky7xnftn3pj7r2lf@mac>
 <316d93d5-7b4d-ace3-9bfa-7680057e92bd@gmail.com>
 <20190214162909.ylnjnarbkfkrpwyk@mac>
 <425ca87e-580e-7b9e-f6eb-f231f3b7d3a8@gmail.com>
 <CAF3u54DpYoKXTC5rHf94nPbXtuOLdFDCik9gNAUhQ_AEKufqqA@mail.gmail.com>
 <7bd97574-44cf-f749-00cb-f19c492e0550@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2007636141661337420=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7bd97574-44cf-f749-00cb-f19c492e0550@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, "LOPEZ,
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2007636141661337420==
Content-Type: multipart/alternative; boundary="000000000000f0b6e60581f30f20"

--000000000000f0b6e60581f30f20
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Fri, 15 Feb 2019, 18:30 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Hello Julien,
>
> On 15.02.19 18:31, Julien Grall wrote:
> > Why? Is it because you want to be cache-aligned?  If so, requiring the
> > structure to be 64-bytes is not enough.
>
> I did not mean caches.
>

What is the reason then?

> You also want the address to
> > be 64-bytes aligned.
>
> I would keep it as a hint for static/dynamic allocations in VMs, hoping
> the address would be normally 64 bytes aligned.
> I hope it might be stronger than, only commenting it should not cross a
> page boundary. E.g. like `struct vcpu_register_vcpu_info` is commented.
>
> I've got this idea after looking at runstate definition as per-cpu in
> Linux [1]
>

It is not obvious why it would be 64-bytes alignment from the definition.
Can you please explain the rationale to impose that alignment?

I really appreciate you suggest ideas/patches but  it would be helpful if
you provide rationale at the same time. This would avoid a round of e-mails
just for asking the reasons and delay the interesting bits.


> > If an OS cares about it, then it can aligned itself here.
> I suppose we can hint the OS by structure alignment in the interface
> header, and require it from OS verifying it on hypercall handling

.


> [1]
> https://elixir.bootlin.com/linux/v5.0-rc6/source/drivers/xen/time.c#L22
>
> --
> Sincerely,
> Andrii Anisov.
>

--000000000000f0b6e60581f30f20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Sorry for the formatting.</span><br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Fri, 15 Feb 2019, 18:30 Andrii Anisov, &lt;<a href=3D"mai=
lto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hello Julien,<br>
<br>
On 15.02.19 18:31, Julien Grall wrote:<br>
&gt; Why? Is it because you want to be cache-aligned?=C2=A0 If so, requirin=
g the<br>
&gt; structure to be 64-bytes is not enough.<br>
<br>
I did not mean caches.<br></blockquote></div><div><br></div><div>What is th=
e reason then?</div><div><br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
&gt; You also want the address to<br>
&gt; be 64-bytes aligned.<br>
<br>
I would keep it as a hint for static/dynamic allocations in VMs, hoping the=
 address would be normally 64 bytes aligned.<br>
I hope it might be stronger than, only commenting it should not cross a pag=
e boundary. E.g. like `struct vcpu_register_vcpu_info` is commented.<br>
<br>
I&#39;ve got this idea after looking at runstate definition as per-cpu in L=
inux [1]<br></blockquote></div><div><br></div><div>It is not obvious why it=
 would be 64-bytes alignment from the definition. Can you please explain th=
e rationale to impose that alignment?</div><div><br></div><div>I really app=
reciate you suggest ideas/patches but=C2=A0 it would be helpful if you prov=
ide rationale at the same time. This would avoid a round of e-mails just fo=
r asking the reasons and delay the interesting bits.</div><div><br></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; If an OS cares about it, then it can aligned itself here.<br>
I suppose we can hint the OS by structure alignment in the interface header=
, and require it from OS verifying it on hypercall handling</blockquote></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">.</blockquote>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
[1] <a href=3D"https://elixir.bootlin.com/linux/v5.0-rc6/source/drivers/xen=
/time.c#L22" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.co=
m/linux/v5.0-rc6/source/drivers/xen/time.c#L22</a><br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
</blockquote></div>

--000000000000f0b6e60581f30f20--


--===============2007636141661337420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2007636141661337420==--
