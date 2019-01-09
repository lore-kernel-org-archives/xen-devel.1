From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Wed, 9 Jan 2019 13:13:54 -0500
Message-ID: <CAF3u54DhGuXNLSeO+t0gRe_JXQRjQn5kdP3MXTNsaCuGP7b-4A@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <20190109155553.72gpxyvwisg4xhag@zion.uk.xensource.com>
 <CACMJ4GbCRYvC9ph8ZCfCX-T=eCk-MO26pzi_6yoqKSoqrZsC8A@mail.gmail.com>
 <CAF3u54DvKpvx8fbL0NSMeEhzieo-fw8v9q6MFe8w+viMeJDF3A@mail.gmail.com>
 <alpine.DEB.2.10.1901090907300.800@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3866243341509984462=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eEKV=PR=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghIMk-00013Y-59
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 18:14:10 +0000
Received: by mail-vs1-xe44.google.com with SMTP id y27so5372171vsi.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 10:14:07 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901090907300.800@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3866243341509984462==
Content-Type: multipart/alternative; boundary="0000000000007a95bf057f0a6d0c"

--0000000000007a95bf057f0a6d0c
Content-Type: text/plain; charset="UTF-8"

Ki

On Wed, 9 Jan 2019, 12:18 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 9 Jan 2019, Julien Grall wrote:
> > Hi,
> > Sorry for the formatting. Sending it from my phone.
> >
> > On Wed, 9 Jan 2019, 11:03 Christopher Clark, <
> christopher.w.clark@gmail.com> wrote:
> >       On Wed, Jan 9, 2019 at 7:56 AM Wei Liu <wei.liu2@citrix.com>
> wrote:
> >       >
> >       > On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark
> wrote:
> >       > > The register op is used by a domain to register a region of
> memory for
> >       > > receiving messages from either a specified other domain, or,
> if specifying a
> >       > > wildcard, any domain.
> >       > >
> >       > > This operation creates a mapping within Xen's private address
> space that
> >       > > will remain resident for the lifetime of the ring. In
> subsequent commits,
> >       > > the hypervisor will use this mapping to copy data from a
> sending domain into
> >       > > this registered ring, making it accessible to the domain that
> registered the
> >       > > ring to receive data.
> >       > >
> >       > > Wildcard any-sender rings are default disabled and
> registration will be
> >       > > refused with EPERM unless they have been specifically enabled
> with the
> >       > > argo-mac boot option introduced here. The reason why the
> default for
> >       > > wildcard rings is 'deny' is that there is currently no means
> to protect the
> >       > > ring from DoS by a noisy domain spamming the ring, affecting
> other domains
> >       > > ability to send to it. This will be addressed with XSM policy
> controls in
> >       > > subsequent work.
> >       > >
> >       > > Since denying access to any-sender rings is a significant
> functional
> >       > > constraint, a new bootparam is provided to enable overriding
> this:
> >       > >  "argo-mac" variable has allowed values: 'permissive' and
> 'enforcing'.
> >       > > Even though this is a boolean variable, use these descriptive
> strings in
> >       > > order to make it obvious to an administrator that this has
> potential
> >       > > security impact.
> >       > >
> >       > > The p2m type of the memory supplied by the guest for the ring
> must be
> >       > > p2m_ram_rw and the memory will be pinned as PGT_writable_page
> while the ring
> >       > > is registered.
> >       > >
> >       > > xen_argo_page_descr_t type is introduced as a page descriptor,
> to convey
> >       > > both the physical address of the start of the page and its
> granularity. The
> >       > > smallest granularity page is assumed to be 4096 bytes and the
> lower twelve
> >       > > bits of the type are used to indicate the size of page of
> memory supplied.
> >       > > The implementation of the hypercall op currently only supports
> 4K pages.
> >       > >
> >       >
> >       > What is the resolution for the Arm issues mentioned by Julien? I
> read
> >       > the conversation in previous thread. A solution seemed to have
> been
> >       > agreed upon, but the changelog doesn't say anything about it.
> >
> >       I made the interface changes that Julien had asked for. The
> register
> >       op now takes arguments that can describe the granularitity of the
> >       pages supplied, though only support for 4K pages is accepted in the
> >       current implementation. I believe it meets Julien's requirements.
> >
> >
> > I still don't think allowing 4K or 64K is the right solution to go. You
> are adding unnecessary burden in the hypervisor and would
> > prevent optimization i the hypervisor and unwanted side effect.
> >
> > For instance a 64K hypervisor will always map 64K even when the guest is
> passing 4K. You also can't map everything contiguously
> > in Xen (if you ever wanted to).
> >
> > We need to stick on a single chunk size. That could be different between
> Arm and x86. For Arm it would need to be 64KB.
>
> Hi Julien!
>
> I don't think we should force 64K as the only granularity on ARM. It
> causes unnecessary overhead and confusion on 4K-only deployments that
> are almost all our use-cases today.


Why a confusion? People should read the documentation when writing a
driver...


> One option is to make the granularity configurable at the guest side,
> like Christopher did, letting the guest specifying the granularity. The
> hypervisor could return -ENOSYS if the specified granularity is not
> supported.
>
> The other option is having the hypervisor export the granularity it
> supports for this interface: Xen would say "I support only 4K".
> Tomorrow, it could change and Xen could say "I support only 64K". Then,
> it would be up to the guest passing a page of the right granularity to
> the hypervisor. I think this is probably the best option, but it would
> require the addition of one hypercall to retrieve the supported
> granularity from Xen.


I would recommend to read my initial answers on the first series to
understand why allowing 4K is an issue.

AFAIK virtio and UEFI has restrictions to allow a guest running
agnostically of the hypervisor page-granularity. An example is to mandate
64K chunk or 64KB aligned address.

With your suggestion you are going to break many use-cases if the
hypervisor is moving to 64KB. At worst it could introduce security issues.
At best preventing optimization in the hypervisor or prevent guest running
(bad for backward compatibility).

Actually, this is not going to help moving towards 64K in Argo because you
would still have to modify the kernel. So this does not meet my
requirements.

I don't think requiring 64K chunk is going to be a major issue nor a
concern. Unless you expect small ring... Christoffer, what is the expected
size?

Another solution was to require contiguous guest physical memory. That
would solve quite a few problem on Arm. But Christoffer had some convincing
point to not implement this.

As I said before, I know this is not going to be the only place with that
issue. I merely wanted to start tackling the problem. However, IHMO, this
interface is not more suitable than what we have currently. So this raise
the question on whether we should just use the usual Xen interface if 64K
is not an option...

Cheers,

--0000000000007a95bf057f0a6d0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Ki</span><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, =
9 Jan 2019, 12:18 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@ker=
nel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, 9 Jan 2019, Julien Grall wrote:<br>
&gt; Hi,<br>
&gt; Sorry for the formatting. Sending it from my phone.<br>
&gt; <br>
&gt; On Wed, 9 Jan 2019, 11:03 Christopher Clark, &lt;<a href=3D"mailto:chr=
istopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com=
</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Jan 9, 2019 at 7:56 AM Wei Liu &lt;<=
a href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com=
</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Sun, Jan 06, 2019 at 11:42:40PM -080=
0, Christopher Clark wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; The register op is used by a domai=
n to register a region of memory for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; receiving messages from either a s=
pecified other domain, or, if specifying a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; wildcard, any domain.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; This operation creates a mapping w=
ithin Xen&#39;s private address space that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; will remain resident for the lifet=
ime of the ring. In subsequent commits,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; the hypervisor will use this mappi=
ng to copy data from a sending domain into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; this registered ring, making it ac=
cessible to the domain that registered the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; ring to receive data.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; Wildcard any-sender rings are defa=
ult disabled and registration will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; refused with EPERM unless they hav=
e been specifically enabled with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; argo-mac boot option introduced he=
re. The reason why the default for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; wildcard rings is &#39;deny&#39; i=
s that there is currently no means to protect the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; ring from DoS by a noisy domain sp=
amming the ring, affecting other domains<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; ability to send to it. This will b=
e addressed with XSM policy controls in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; subsequent work.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; Since denying access to any-sender=
 rings is a significant functional<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; constraint, a new bootparam is pro=
vided to enable overriding this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 &quot;argo-mac&quot; variabl=
e has allowed values: &#39;permissive&#39; and &#39;enforcing&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; Even though this is a boolean vari=
able, use these descriptive strings in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; order to make it obvious to an adm=
inistrator that this has potential<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; security impact.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; The p2m type of the memory supplie=
d by the guest for the ring must be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; p2m_ram_rw and the memory will be =
pinned as PGT_writable_page while the ring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; is registered.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; xen_argo_page_descr_t type is intr=
oduced as a page descriptor, to convey<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; both the physical address of the s=
tart of the page and its granularity. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; smallest granularity page is assum=
ed to be 4096 bytes and the lower twelve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; bits of the type are used to indic=
ate the size of page of memory supplied.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; The implementation of the hypercal=
l op currently only supports 4K pages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; What is the resolution for the Arm issu=
es mentioned by Julien? I read<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the conversation in previous thread. A =
solution seemed to have been<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; agreed upon, but the changelog doesn&#3=
9;t say anything about it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I made the interface changes that Julien had=
 asked for. The register<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0op now takes arguments that can describe the=
 granularitity of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pages supplied, though only support for 4K p=
ages is accepted in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0current implementation. I believe it meets J=
ulien&#39;s requirements.<br>
&gt; <br>
&gt; <br>
&gt; I still don&#39;t think allowing 4K or 64K is the right solution to go=
. You are adding unnecessary burden in the hypervisor and would<br>
&gt; prevent optimization i the hypervisor and unwanted side effect.<br>
&gt; <br>
&gt; For instance a 64K hypervisor will always map 64K even when the guest =
is passing 4K. You also can&#39;t map everything contiguously<br>
&gt; in Xen (if you ever wanted to).<br>
&gt; <br>
&gt; We need to stick on a single chunk size. That could be different betwe=
en Arm and x86. For Arm it would need to be 64KB.<br>
<br>
Hi Julien!<br>
<br>
I don&#39;t think we should force 64K as the only granularity on ARM. It<br=
>
causes unnecessary overhead and confusion on 4K-only deployments that<br>
are almost all our use-cases today.</blockquote></div><div><br></div><div>W=
hy a confusion? People should read the documentation when writing a driver.=
..</div><div><br></div><div class=3D"gmail_quote"></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
One option is to make the granularity configurable at the guest side,<br>
like Christopher did, letting the guest specifying the granularity. The<br>
hypervisor could return -ENOSYS if the specified granularity is not<br>
supported.<br>
<br>
The other option is having the hypervisor export the granularity it<br>
supports for this interface: Xen would say &quot;I support only 4K&quot;.<b=
r>
Tomorrow, it could change and Xen could say &quot;I support only 64K&quot;.=
 Then,<br>
it would be up to the guest passing a page of the right granularity to<br>
the hypervisor. I think this is probably the best option, but it would<br>
require the addition of one hypercall to retrieve the supported<br>
granularity from Xen.</blockquote></div><div><br></div><div>I would recomme=
nd to read my initial answers on the first series to understand why allowin=
g 4K is an issue.<br></div><div><br></div><div>AFAIK virtio and UEFI has re=
strictions to allow a guest running agnostically of the hypervisor page-gra=
nularity. An example is to mandate 64K chunk or 64KB aligned address.</div>=
<div><br></div><div>With your suggestion you are going to break many use-ca=
ses if the hypervisor is moving to 64KB. At worst it could introduce securi=
ty issues. At best preventing optimization in the hypervisor or prevent gue=
st running (bad for backward compatibility).</div><div><br></div><div>Actua=
lly, this is not going to help moving towards 64K in Argo because you would=
 still have to modify the kernel. So this does not meet my requirements.<br=
><br>I don&#39;t think requiring 64K chunk is going to be a major issue nor=
 a concern. Unless you expect small ring... Christoffer, what is the expect=
ed size?<br><br>Another solution was to require contiguous guest physical m=
emory. That would solve quite a few problem on Arm. But Christoffer had som=
e convincing point to not implement this.<br></div><div><br></div><div>As I=
 said before, I know this is not going to be the only place with that issue=
. I merely wanted to start tackling the problem. However, IHMO, this interf=
ace is not more suitable than what we have currently. So this raise the que=
stion on whether we should just use the usual Xen interface if 64K is not a=
n option...</div><div><br></div><div>Cheers,</div><div><br></div><div><br><=
/div><div class=3D"gmail_quote"></div>

--0000000000007a95bf057f0a6d0c--


--===============3866243341509984462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3866243341509984462==--
