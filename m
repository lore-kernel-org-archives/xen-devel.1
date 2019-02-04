From: Julien Grall <julien.grall@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Mon, 4 Feb 2019 16:05:48 +0100
Message-ID: <CAF3u54CXM3vLDvetG-0XS+TZE7cSsiNdkgki9Q57KBd9KdHH5g@mail.gmail.com>
References: <CACrvCsbhjtN6gr9-qqUZ2m1WYM3ZexDhngXM3G0rYcyp3BPJrw@mail.gmail.com>
 <d1cd35de-b278-aad8-49ec-8d77666cbdd5@gmail.com>
 <CACrvCsaYBv2p2Fsu9+Y8Ewu=qrOY6erOdBBRo+JHvuzqA0f7Zg@mail.gmail.com>
 <15f42687-9aa6-e9ed-c306-b6b267a16292@arm.com>
 <78963b40-e8e8-db41-ee16-d4ca64baa37a@gmail.com>
 <201eb8d4-aa51-9ad3-e655-3f4fa0cee348@arm.com>
 <c5f1b8c6-df0a-d30a-4ca6-3d9372c7913c@gmail.com>
 <4e777fcf-6630-5aff-a8d2-781d3f705123@arm.com>
 <alpine.DEB.2.10.1901311345570.22962@sstabellini-ThinkPad-X260>
 <2a651c5d-3f94-378d-baf9-f52cab0cdc62@arm.com>
 <20190201165314.ofuvpddlfpzbc247@mac>
 <56b433e0-645e-997d-1bff-de3c4f7fe250@arm.com>
 <80fd1e04-6984-5b59-42cc-3b486fd218fa@gmail.com>
 <015ee6f9-3ce0-d579-78e0-7f8502e0f447@arm.com>
 <d6a0a44c-4d82-4e3f-b70c-8909e7941f06@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0299942736409611197=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d6a0a44c-4d82-4e3f-b70c-8909e7941f06@gmail.com>
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
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0299942736409611197==
Content-Type: multipart/alternative; boundary="000000000000c4b3b3058112d493"

--000000000000c4b3b3058112d493
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Mon, 4 Feb 2019, 15:52 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

>
>
> On 04.02.19 13:21, Julien Grall wrote:
> > What I meant is the virtual address stays the same but the guest
> physical address may change. I don't see how this could be broken today,
> can you explain it?
>
> I suppose guest's mapping change is not quite atomic from the hypervisor
> point of view, so domain could be caught in the middle.
>

Well that's an issue with any hypercall using virtual address. You are not
even protected because of shatterring.

Thanksfully that does not seem to happen on Linux. Although, I have seen
error some times on osstest...

Virtual address has other issues if you can't access page-tables. So
ideally, we want to switch all hypercalls to use guest physical address.


> >
> >> Moreover, having that buffer mapped to XEN will reduce context switch
> time as a side effect.
> >
> > I am still unsure whether we really want to keep that always mapped.
> >
> > Each guest can support up to 128 vCPUs. So we would have 128 runstates
> mapped. Each runstate would take up to 2 pages. This means that each guest
> would require up to 1MB of vmap.
>
> Here buffer allocation on XEN side might benefit, even aligning/fitting
> the runstate into one page might work. But I understand it is undesirable
> and requires lot of changes
>

For a new interface,  the way to go is using guest physical address. Any
hypercall using virtual address should be killed.


> > I thought more about it during the week-end. I would actually not
> implement get_gfn but implement a function similar to get_page_from_gva on
> x86. The reason behind this is the function on Arm is quite complex as it
> caters many different use case.
>
> I'll look into this. But I have to massage my yocto first.
>

Thank you!



> --
> Sincerely,
> Andrii Anisov.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000c4b3b3058112d493
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Mon, 4 Feb 2019, 15:52 Andrii Anisov, &lt;<a hr=
ef=3D"mailto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 04.02.19 13:21, Julien Grall wrote:<br>
&gt; What I meant is the virtual address stays the same but the guest physi=
cal address may change. I don&#39;t see how this could be broken today, can=
 you explain it?<br>
<br>
I suppose guest&#39;s mapping change is not quite atomic from the hyperviso=
r point of view, so domain could be caught in the middle.<br></blockquote><=
/div></div><div><br></div><div>Well that&#39;s an issue with any hypercall =
using virtual address. You are not even protected because of shatterring.</=
div><div><br></div><div>Thanksfully that does not seem to happen on Linux. =
Although, I have seen error some times on osstest...</div><div><br></div><d=
iv>Virtual address has other issues if you can&#39;t access page-tables. So=
 ideally, we want to switch all hypercalls to use guest physical address.</=
div><div><br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
&gt; <br>
&gt;&gt; Moreover, having that buffer mapped to XEN will reduce context swi=
tch time as a side effect.<br>
&gt; <br>
&gt; I am still unsure whether we really want to keep that always mapped.<b=
r>
&gt; <br>
&gt; Each guest can support up to 128 vCPUs. So we would have 128 runstates=
 mapped. Each runstate would take up to 2 pages. This means that each guest=
 would require up to 1MB of vmap.<br>
<br>
Here buffer allocation on XEN side might benefit, even aligning/fitting the=
 runstate into one page might work. But I understand it is undesirable and =
requires lot of changes<br></blockquote></div></div><div><br></div><div>For=
 a new interface,=C2=A0 the way to go is using guest physical address. Any =
hypercall using virtual address should be killed.</div><div><br></div><div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; I thought more about it during the week-end. I would actually not impl=
ement get_gfn but implement a function similar to get_page_from_gva on x86.=
 The reason behind this is the function on Arm is quite complex as it cater=
s many different use case.<br>
<br>
I&#39;ll look into this. But I have to massage my yocto first.<br></blockqu=
ote></div></div><div><br></div><div>Thank you!</div><div><br></div><div><br=
></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--000000000000c4b3b3058112d493--


--===============0299942736409611197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0299942736409611197==--
