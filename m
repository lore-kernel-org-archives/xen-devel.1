From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Re: Mapping HVM guest memory from Dom0
Date: Wed, 10 Oct 2018 10:45:54 -0400
Message-ID: <CAAd-cWMrRUrS7VzGN=3B9ekm9Gqx5aYZgayWdemV=-do1F8O9w@mail.gmail.com>
References: <CAAd-cWOSqZN9LYCRxEYjgCyHq24PFsZqOFE1T_PPnq3HjDGpaA@mail.gmail.com>
 <857c04f2-345f-b9ea-44ce-6e9d0aeb8248@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2792845811195882167=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oawu=mw=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1gAFkV-0000Ks-5U
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 14:46:07 +0000
Received: by mail-it1-x12b.google.com with SMTP id i76-v6so8335853ita.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Oct 2018 07:46:05 -0700 (PDT)
In-Reply-To: <857c04f2-345f-b9ea-44ce-6e9d0aeb8248@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2792845811195882167==
Content-Type: multipart/alternative; boundary="000000000000f889b70577e0e9c6"

--000000000000f889b70577e0e9c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have, but libvmi doesn't fit my use case =E2=80=94 it only works with Win=
dows and
Linux HVM guests. I will need my application to work with PV and HVM guests
that are neither Windows nor Linux.

libvmi's implementation of this, `xen_get_memory()` in
`libvmi/driver/xen/xen.c`, seems to assume that MFN =3D (addr >> page shift=
),
which I've seen in a few places, but based on my testing as well as what's
in `debug.c`, this appears not to be correct. I certainly don't end up
mapping the correct pages using that formula, at least.

On Wed, Oct 10, 2018 at 5:39 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 09/10/18 20:34, Spencer Michaels wrote:
> > Hello,
> >
> > I'm developing an application that runs in Dom0 and needs to read
> > memory from a guest given a guest address (for instance, reading RIP
> > from the guest CPU context and then reading the current instruction).
> > I'm using xenforeignmemory_map() to map the guest memory, but this
> > function takes the MFN of the guest address to read, not the address
> > itself. Xen does not seem to have an API for doing the virtual address
> > --> MFN conversion.
> >
> > I've figured out how to do this for PV guests: map the domain's
> > meminfo struct and use the PFN for the guest address (i.e. address >>
> > XC_PAGE_SHIFT) as an index into the P2M table.
> >
> > However, I am having trouble doing the same for HVM guests. Right now
> > I am trying to follow the implementation of bg_hvm_va2mfn in
> > xen/arch/x86/debug.c, but this function uses so many internal Xen
> > functions it seems I would have to copy tons of code out from Xen, and
> > I'm wondering if there's a better way. Is there some API I'm missing
> > that lets me to do the vaddr --> MFN conversion for HVM guests? If
> > not, what is the simplest way to do this conversion?
>
> Have you come across libvmi?  It seems to be exactly what you are trying
> to make here.
>
> ~Andrew
>

--000000000000f889b70577e0e9c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have, but libvmi doesn&#39;t fit my use case =E2=80=94 i=
t only works with Windows and Linux HVM guests. I will need my application =
to work with PV and HVM guests that are neither Windows nor Linux.<div><br>=
</div><div>libvmi&#39;s implementation of this, `xen_get_memory()` in `libv=
mi/driver/xen/xen.c`, seems to assume that MFN =3D (addr &gt;&gt; page shif=
t), which I&#39;ve seen in a few places, but based on my testing as well as=
 what&#39;s in `debug.c`, this appears not to be correct. I certainly don&#=
39;t end up mapping the correct pages using that formula, at least.</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 10, 2018 at=
 5:39 AM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">and=
rew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 09/10/18 20:34, Spencer Michaels wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m developing an application that runs in Dom0 and needs to read<=
br>
&gt; memory from a guest given a guest address (for instance, reading RIP<b=
r>
&gt; from the guest CPU context and then reading the current instruction).<=
br>
&gt; I&#39;m using xenforeignmemory_map() to map the guest memory, but this=
<br>
&gt; function takes the MFN of the guest address to read, not the address<b=
r>
&gt; itself. Xen does not seem to have an API for doing the virtual address=
<br>
&gt; --&gt; MFN conversion.<br>
&gt;<br>
&gt; I&#39;ve figured out how to do this for PV guests: map the domain&#39;=
s<br>
&gt; meminfo struct and use the PFN for the guest address (i.e. address &gt=
;&gt;<br>
&gt; XC_PAGE_SHIFT) as an index into the P2M table.<br>
&gt;<br>
&gt; However, I am having trouble doing the same for HVM guests. Right now<=
br>
&gt; I am trying to follow the implementation of bg_hvm_va2mfn in<br>
&gt; xen/arch/x86/debug.c, but this function uses so many internal Xen<br>
&gt; functions it seems I would have to copy tons of code out from Xen, and=
<br>
&gt; I&#39;m wondering if there&#39;s a better way. Is there some API I&#39=
;m missing<br>
&gt; that lets me to do the vaddr --&gt; MFN conversion for HVM guests? If<=
br>
&gt; not, what is the simplest way to do this conversion?<br>
<br>
Have you come across libvmi?=C2=A0 It seems to be exactly what you are tryi=
ng<br>
to make here.<br>
<br>
~Andrew<br>
</blockquote></div>

--000000000000f889b70577e0e9c6--


--===============2792845811195882167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2792845811195882167==--
