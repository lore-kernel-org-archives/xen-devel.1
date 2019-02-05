From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Tue, 5 Feb 2019 20:35:17 +0100
Message-ID: <CAF3u54BZKRcTWTJkKyUb+wZqTwAcAn=GWDDOHKu37BJyvWR6=g@mail.gmail.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
 <5C5945F70200007800213D6E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902050911350.22962@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2755335010855351572=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pm2m=QM=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gr6VJ-0008EA-8W
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 19:35:33 +0000
Received: by mail-vs1-xe42.google.com with SMTP id s16so867289vsk.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 Feb 2019 11:35:31 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1902050911350.22962@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2755335010855351572==
Content-Type: multipart/alternative; boundary="0000000000005344d605812ab624"

--0000000000005344d605812ab624
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Tue, 5 Feb 2019, 20:04 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 5 Feb 2019, Jan Beulich wrote:
> > >>> On 05.02.19 at 01:39, <sstabellini@kernel.org> wrote:
> > > On Wed, 30 Jan 2019, Christopher Clark wrote:
> > >> +#include <xen/errno.h>
> > >> +#include <xen/guest_access.h>
> > >> +
> > >> +long
> > >> +do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> > >> +           XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
> > >> +           unsigned long arg4)
> > >> +{
> > >> +    return -ENOSYS;
> > >> +}
> > >> +
> > >> +#ifdef CONFIG_COMPAT
> > >> +long
> > >> +compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> > >> +               XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
> > >> +               unsigned long arg4)
> > >> +{
> > >> +    return -ENOSYS;
> > >> +}
> > >> +#endif
> > >
> > > From an ARM perspective, it is not a good idea to use unsigned long as
> > > hypercall parameters because they are going to be of different size on
> > > arm32 and arm64. On ARM, there is no COMPAT code, and we try to keep a
> > > single stable ABI across 32bit and 64bit hypervisors (pointers size
> > > being the only exception and we deal with that using
> > > XEN_GUEST_HANDLE_PARAM).
> > >
> > > For this reason, given that we don't need arg3 and arg4 to actually be
> > > 64bit, it would be best to use explicitly sized integers instead. I
> > > would use uint32_t or unsigned int for arg3 and arg4. That way, there
> > > are not going to be any ABI compatibility issues between arm32 and
> arm64
> > > and we could run, and even migrate, 32bit guests to a 64bit hypervisor
> > > without problems.
> > >
> > > I know that Andrew expressed concerns about using unsigned int before,
> > > but don't we just need to make sure we are properly ignoring the top
> > > 32bit of arg3 and arg4 when the hypervisor is compiled 64bit?
> >
> > Are you saying that hypercall arguments made by a 32-bit guest on a
> > 64-bit hypervisor do not get zero-extended before reaching the C layer
> > (or more specifically the individual handlers, since on x86 we deal with
> > the necessary zero-extension in C nowadays)? What about
> > do_memory_op()'s first parameter then?
>
> If I remember right, there is no zero-extension, however, they should
> still be zero because they have always been zero -- nothing should
> change them in the VM lifetime. However, it is not great to rely on
> that, that is why I suggested to clear them on entry as an alternative,
> and also to have a single ABI between 32bit and 64bit.


I can't find the wording again on the Arm Arm (the pdf reader on the phone
is not great).

But I am afraid this is not correct. Upper 32-bit of the register will be
zeroed when writing a 32-bit value. So we never rely on the register to be
zeroed on boot.


> FYI do_memory_op is declared as follows on the Linux side for arm32 and
> arm64:
>
>   int HYPERVISOR_memory_op(unsigned int cmd, void *arg);
>
> When I went through all existing hypercalls to introduce them on arm32,
> I checked that we didn't actually need 64bit parameters, especially for
> cmd. I introduced them as int instead of long on the Linux side when
> possible (see include/xen/arm/hypercall.h), but I didn't attempt to
> modify all the existing Xen headers.
>

I don't understand your concern with unsigned long. We use them in
__DEFINE_XEN_GUEST_HANDLE that are in turn to describe guest pointer.

The problem with explicitly sized (i.e 32-bit) is you ignore the top
32-bit. This means you can't check the upper bits are always 0 and would
prevent extension.

Cheers,



> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000005344d605812ab624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the formatting.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Tue, 5 Feb 2019, 20:04 Stefano Stabellini, &lt;<a href=3D"mailto:sstab=
ellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Tue, 5 Feb 2019, Jan Beulich wrote:<br>
&gt; &gt;&gt;&gt; On 05.02.19 at 01:39, &lt;<a href=3D"mailto:sstabellini@k=
ernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt; &gt; On Wed, 30 Jan 2019, Christopher Clark wrote:<br>
&gt; &gt;&gt; +#include &lt;xen/errno.h&gt;<br>
&gt; &gt;&gt; +#include &lt;xen/guest_access.h&gt;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +long<br>
&gt; &gt;&gt; +do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) ar=
g1,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_GUEST_HANDLE_PA=
RAM(void) arg2, unsigned long arg3,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long arg4)=
<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +#ifdef CONFIG_COMPAT<br>
&gt; &gt;&gt; +long<br>
&gt; &gt;&gt; +compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg1,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_G=
UEST_HANDLE_PARAM(void) arg2, unsigned long arg3,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsig=
ned long arg4)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +#endif<br>
&gt; &gt; <br>
&gt; &gt; From an ARM perspective, it is not a good idea to use unsigned lo=
ng as<br>
&gt; &gt; hypercall parameters because they are going to be of different si=
ze on<br>
&gt; &gt; arm32 and arm64. On ARM, there is no COMPAT code, and we try to k=
eep a<br>
&gt; &gt; single stable ABI across 32bit and 64bit hypervisors (pointers si=
ze<br>
&gt; &gt; being the only exception and we deal with that using<br>
&gt; &gt; XEN_GUEST_HANDLE_PARAM).<br>
&gt; &gt; <br>
&gt; &gt; For this reason, given that we don&#39;t need arg3 and arg4 to ac=
tually be<br>
&gt; &gt; 64bit, it would be best to use explicitly sized integers instead.=
 I<br>
&gt; &gt; would use uint32_t or unsigned int for arg3 and arg4. That way, t=
here<br>
&gt; &gt; are not going to be any ABI compatibility issues between arm32 an=
d arm64<br>
&gt; &gt; and we could run, and even migrate, 32bit guests to a 64bit hyper=
visor<br>
&gt; &gt; without problems.<br>
&gt; &gt; <br>
&gt; &gt; I know that Andrew expressed concerns about using unsigned int be=
fore,<br>
&gt; &gt; but don&#39;t we just need to make sure we are properly ignoring =
the top<br>
&gt; &gt; 32bit of arg3 and arg4 when the hypervisor is compiled 64bit?<br>
&gt; <br>
&gt; Are you saying that hypercall arguments made by a 32-bit guest on a<br=
>
&gt; 64-bit hypervisor do not get zero-extended before reaching the C layer=
<br>
&gt; (or more specifically the individual handlers, since on x86 we deal wi=
th<br>
&gt; the necessary zero-extension in C nowadays)? What about<br>
&gt; do_memory_op()&#39;s first parameter then?<br>
<br>
If I remember right, there is no zero-extension, however, they should<br>
still be zero because they have always been zero -- nothing should<br>
change them in the VM lifetime. However, it is not great to rely on<br>
that, that is why I suggested to clear them on entry as an alternative,<br>
and also to have a single ABI between 32bit and 64bit.</blockquote></div><d=
iv class=3D"gmail_quote"></div><div><br></div><div>I can&#39;t find the wor=
ding again on the Arm Arm (the pdf reader on the phone is not great).<br></=
div><div><br></div><div>But I am afraid this is not correct. Upper 32-bit o=
f the register will be zeroed when writing a 32-bit value. So we never rely=
 on the register to be zeroed on boot.</div><div><br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<br>
FYI do_memory_op is declared as follows on the Linux side for arm32 and<br>
arm64:<br>
<br>
=C2=A0 int HYPERVISOR_memory_op(unsigned int cmd, void *arg);<br>
<br>
When I went through all existing hypercalls to introduce them on arm32,<br>
I checked that we didn&#39;t actually need 64bit parameters, especially for=
<br>
cmd. I introduced them as int instead of long on the Linux side when<br>
possible (see include/xen/arm/hypercall.h), but I didn&#39;t attempt to<br>
modify all the existing Xen headers.<br></blockquote></div><div><br></div><=
div>I don&#39;t understand your concern with unsigned long. We use them in =
__DEFINE_XEN_GUEST_HANDLE that are in turn to describe guest pointer.</div>=
<div><br></div><div>The problem with explicitly sized (i.e 32-bit) is you i=
gnore the top 32-bit. This means you can&#39;t check the upper bits are alw=
ays 0 and would prevent extension.</div><div><br></div><div>Cheers,</div><d=
iv><br></div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--0000000000005344d605812ab624--


--===============2755335010855351572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2755335010855351572==--
