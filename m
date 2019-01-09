From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Wed, 9 Jan 2019 12:02:34 -0500
Message-ID: <CAF3u54DvKpvx8fbL0NSMeEhzieo-fw8v9q6MFe8w+viMeJDF3A@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <20190109155553.72gpxyvwisg4xhag@zion.uk.xensource.com>
 <CACMJ4GbCRYvC9ph8ZCfCX-T=eCk-MO26pzi_6yoqKSoqrZsC8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1216001526230547438=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eEKV=PR=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghHFh-0003Gl-3O
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 17:02:49 +0000
Received: by mail-vk1-xa41.google.com with SMTP id v70so1819555vkv.7
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 09:02:47 -0800 (PST)
In-Reply-To: <CACMJ4GbCRYvC9ph8ZCfCX-T=eCk-MO26pzi_6yoqKSoqrZsC8A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1216001526230547438==
Content-Type: multipart/alternative; boundary="0000000000005c322a057f096e6b"

--0000000000005c322a057f096e6b
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting. Sending it from my phone.

On Wed, 9 Jan 2019, 11:03 Christopher Clark, <christopher.w.clark@gmail.com>
wrote:

> On Wed, Jan 9, 2019 at 7:56 AM Wei Liu <wei.liu2@citrix.com> wrote:
> >
> > On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark wrote:
> > > The register op is used by a domain to register a region of memory for
> > > receiving messages from either a specified other domain, or, if
> specifying a
> > > wildcard, any domain.
> > >
> > > This operation creates a mapping within Xen's private address space
> that
> > > will remain resident for the lifetime of the ring. In subsequent
> commits,
> > > the hypervisor will use this mapping to copy data from a sending
> domain into
> > > this registered ring, making it accessible to the domain that
> registered the
> > > ring to receive data.
> > >
> > > Wildcard any-sender rings are default disabled and registration will be
> > > refused with EPERM unless they have been specifically enabled with the
> > > argo-mac boot option introduced here. The reason why the default for
> > > wildcard rings is 'deny' is that there is currently no means to
> protect the
> > > ring from DoS by a noisy domain spamming the ring, affecting other
> domains
> > > ability to send to it. This will be addressed with XSM policy controls
> in
> > > subsequent work.
> > >
> > > Since denying access to any-sender rings is a significant functional
> > > constraint, a new bootparam is provided to enable overriding this:
> > >  "argo-mac" variable has allowed values: 'permissive' and 'enforcing'.
> > > Even though this is a boolean variable, use these descriptive strings
> in
> > > order to make it obvious to an administrator that this has potential
> > > security impact.
> > >
> > > The p2m type of the memory supplied by the guest for the ring must be
> > > p2m_ram_rw and the memory will be pinned as PGT_writable_page while
> the ring
> > > is registered.
> > >
> > > xen_argo_page_descr_t type is introduced as a page descriptor, to
> convey
> > > both the physical address of the start of the page and its
> granularity. The
> > > smallest granularity page is assumed to be 4096 bytes and the lower
> twelve
> > > bits of the type are used to indicate the size of page of memory
> supplied.
> > > The implementation of the hypercall op currently only supports 4K
> pages.
> > >
> >
> > What is the resolution for the Arm issues mentioned by Julien? I read
> > the conversation in previous thread. A solution seemed to have been
> > agreed upon, but the changelog doesn't say anything about it.
>
> I made the interface changes that Julien had asked for. The register
> op now takes arguments that can describe the granularitity of the
> pages supplied, though only support for 4K pages is accepted in the
> current implementation. I believe it meets Julien's requirements.


I still don't think allowing 4K or 64K is the right solution to go. You are
adding unnecessary burden in the hypervisor and would prevent optimization
i the hypervisor and unwanted side effect.

For instance a 64K hypervisor will always map 64K even when the guest is
passing 4K. You also can't map everything contiguously in Xen (if you ever
wanted to).

We need to stick on a single chunk size. That could be different between
Arm and x86. For Arm it would need to be 64KB.

Cheers,


> thanks,
>
> Christopher
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000005c322a057f096e6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Hi,</span><div><br></div><div>Sorry for the formatting. Sending it fr=
om my phone.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On W=
ed, 9 Jan 2019, 11:03 Christopher Clark, &lt;<a href=3D"mailto:christopher.=
w.clark@gmail.com">christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Wed, Jan 9, 2019 at 7:56 AM Wei Liu &lt;<a =
href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark wrote:<br>
&gt; &gt; The register op is used by a domain to register a region of memor=
y for<br>
&gt; &gt; receiving messages from either a specified other domain, or, if s=
pecifying a<br>
&gt; &gt; wildcard, any domain.<br>
&gt; &gt;<br>
&gt; &gt; This operation creates a mapping within Xen&#39;s private address=
 space that<br>
&gt; &gt; will remain resident for the lifetime of the ring. In subsequent =
commits,<br>
&gt; &gt; the hypervisor will use this mapping to copy data from a sending =
domain into<br>
&gt; &gt; this registered ring, making it accessible to the domain that reg=
istered the<br>
&gt; &gt; ring to receive data.<br>
&gt; &gt;<br>
&gt; &gt; Wildcard any-sender rings are default disabled and registration w=
ill be<br>
&gt; &gt; refused with EPERM unless they have been specifically enabled wit=
h the<br>
&gt; &gt; argo-mac boot option introduced here. The reason why the default =
for<br>
&gt; &gt; wildcard rings is &#39;deny&#39; is that there is currently no me=
ans to protect the<br>
&gt; &gt; ring from DoS by a noisy domain spamming the ring, affecting othe=
r domains<br>
&gt; &gt; ability to send to it. This will be addressed with XSM policy con=
trols in<br>
&gt; &gt; subsequent work.<br>
&gt; &gt;<br>
&gt; &gt; Since denying access to any-sender rings is a significant functio=
nal<br>
&gt; &gt; constraint, a new bootparam is provided to enable overriding this=
:<br>
&gt; &gt;=C2=A0 &quot;argo-mac&quot; variable has allowed values: &#39;perm=
issive&#39; and &#39;enforcing&#39;.<br>
&gt; &gt; Even though this is a boolean variable, use these descriptive str=
ings in<br>
&gt; &gt; order to make it obvious to an administrator that this has potent=
ial<br>
&gt; &gt; security impact.<br>
&gt; &gt;<br>
&gt; &gt; The p2m type of the memory supplied by the guest for the ring mus=
t be<br>
&gt; &gt; p2m_ram_rw and the memory will be pinned as PGT_writable_page whi=
le the ring<br>
&gt; &gt; is registered.<br>
&gt; &gt;<br>
&gt; &gt; xen_argo_page_descr_t type is introduced as a page descriptor, to=
 convey<br>
&gt; &gt; both the physical address of the start of the page and its granul=
arity. The<br>
&gt; &gt; smallest granularity page is assumed to be 4096 bytes and the low=
er twelve<br>
&gt; &gt; bits of the type are used to indicate the size of page of memory =
supplied.<br>
&gt; &gt; The implementation of the hypercall op currently only supports 4K=
 pages.<br>
&gt; &gt;<br>
&gt;<br>
&gt; What is the resolution for the Arm issues mentioned by Julien? I read<=
br>
&gt; the conversation in previous thread. A solution seemed to have been<br=
>
&gt; agreed upon, but the changelog doesn&#39;t say anything about it.<br>
<br>
I made the interface changes that Julien had asked for. The register<br>
op now takes arguments that can describe the granularitity of the<br>
pages supplied, though only support for 4K pages is accepted in the<br>
current implementation. I believe it meets Julien&#39;s requirements.</bloc=
kquote></div></div><div></div><div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"></blockquote></div></div><div><br></div><div>I still don&=
#39;t think allowing 4K or 64K is the right solution to go. You are adding =
unnecessary burden in the hypervisor and would prevent optimization i the h=
ypervisor and unwanted side effect.</div><div><br></div><div>For instance a=
 64K hypervisor will always map 64K even when the guest is passing 4K. You =
also can&#39;t map everything contiguously in Xen (if you ever wanted to).<=
/div><div><br></div><div>We need to stick on a single chunk size. That coul=
d be different between Arm and x86. For Arm it would need to be 64KB.</div>=
<div><br></div><div>Cheers,</div><div><br></div><div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
thanks,<br>
<br>
Christopher<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--0000000000005c322a057f096e6b--


--===============1216001526230547438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1216001526230547438==--
