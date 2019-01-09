From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Wed, 9 Jan 2019 13:28:39 -0500
Message-ID: <CAF3u54C-fyLZiJk0asn4W0f2PHusEsscyBUY462PFMd0D5guvg@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <20190109155553.72gpxyvwisg4xhag@zion.uk.xensource.com>
 <CACMJ4GbCRYvC9ph8ZCfCX-T=eCk-MO26pzi_6yoqKSoqrZsC8A@mail.gmail.com>
 <CAF3u54DvKpvx8fbL0NSMeEhzieo-fw8v9q6MFe8w+viMeJDF3A@mail.gmail.com>
 <20190109175433.wwmhv4vlawphwcr6@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6599465251161384795=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eEKV=PR=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghIb0-00022Y-Ko
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 18:28:54 +0000
Received: by mail-vs1-xe44.google.com with SMTP id x28so5340484vsh.12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 10:28:52 -0800 (PST)
In-Reply-To: <20190109175433.wwmhv4vlawphwcr6@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6599465251161384795==
Content-Type: multipart/alternative; boundary="0000000000003eeb8a057f0aa2c1"

--0000000000003eeb8a057f0aa2c1
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jan 2019, 12:54 Wei Liu, <wei.liu2@citrix.com> wrote:

> On Wed, Jan 09, 2019 at 12:02:34PM -0500, Julien Grall wrote:
> > Hi,
> >
> > Sorry for the formatting. Sending it from my phone.
> >
> > On Wed, 9 Jan 2019, 11:03 Christopher Clark, <
> christopher.w.clark@gmail.com>
> > wrote:
> >
> > > On Wed, Jan 9, 2019 at 7:56 AM Wei Liu <wei.liu2@citrix.com> wrote:
> > > >
> > > > On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark wrote:
> > > > > The register op is used by a domain to register a region of memory
> for
> > > > > receiving messages from either a specified other domain, or, if
> > > specifying a
> > > > > wildcard, any domain.
> > > > >
> > > > > This operation creates a mapping within Xen's private address space
> > > that
> > > > > will remain resident for the lifetime of the ring. In subsequent
> > > commits,
> > > > > the hypervisor will use this mapping to copy data from a sending
> > > domain into
> > > > > this registered ring, making it accessible to the domain that
> > > registered the
> > > > > ring to receive data.
> > > > >
> > > > > Wildcard any-sender rings are default disabled and registration
> will be
> > > > > refused with EPERM unless they have been specifically enabled with
> the
> > > > > argo-mac boot option introduced here. The reason why the default
> for
> > > > > wildcard rings is 'deny' is that there is currently no means to
> > > protect the
> > > > > ring from DoS by a noisy domain spamming the ring, affecting other
> > > domains
> > > > > ability to send to it. This will be addressed with XSM policy
> controls
> > > in
> > > > > subsequent work.
> > > > >
> > > > > Since denying access to any-sender rings is a significant
> functional
> > > > > constraint, a new bootparam is provided to enable overriding this:
> > > > >  "argo-mac" variable has allowed values: 'permissive' and
> 'enforcing'.
> > > > > Even though this is a boolean variable, use these descriptive
> strings
> > > in
> > > > > order to make it obvious to an administrator that this has
> potential
> > > > > security impact.
> > > > >
> > > > > The p2m type of the memory supplied by the guest for the ring must
> be
> > > > > p2m_ram_rw and the memory will be pinned as PGT_writable_page while
> > > the ring
> > > > > is registered.
> > > > >
> > > > > xen_argo_page_descr_t type is introduced as a page descriptor, to
> > > convey
> > > > > both the physical address of the start of the page and its
> > > granularity. The
> > > > > smallest granularity page is assumed to be 4096 bytes and the lower
> > > twelve
> > > > > bits of the type are used to indicate the size of page of memory
> > > supplied.
> > > > > The implementation of the hypercall op currently only supports 4K
> > > pages.
> > > > >
> > > >
> > > > What is the resolution for the Arm issues mentioned by Julien? I read
> > > > the conversation in previous thread. A solution seemed to have been
> > > > agreed upon, but the changelog doesn't say anything about it.
> > >
> > > I made the interface changes that Julien had asked for. The register
> > > op now takes arguments that can describe the granularitity of the
> > > pages supplied, though only support for 4K pages is accepted in the
> > > current implementation. I believe it meets Julien's requirements.
> >
> >
> > I still don't think allowing 4K or 64K is the right solution to go. You
> are
> > adding unnecessary burden in the hypervisor and would prevent
> optimization
> > i the hypervisor and unwanted side effect.
> >
> > For instance a 64K hypervisor will always map 64K even when the guest is
> > passing 4K. You also can't map everything contiguously in Xen (if you
> ever
> > wanted to).
> >
> > We need to stick on a single chunk size. That could be different between
> > Arm and x86. For Arm it would need to be 64KB.
>
> Doesn't enforcing 64KB granularity has its own limitation as well?
> According to my understanding of arm (and this could be wrong), you
> would need to have the guest allocate (via memory exchange perhaps) 64KB
> machine contiguous memory even when the hypervisor doesn't need it to be
> 64KB (when hypervisor is running on 4KB granularity).


The 64K is just about the interface with the guest.
The hypervisor could just split the 64K in 16 4K chunk. No need for memory
exchange here.


> I think having a method to return granularity to guest, like Stefano
> suggested, is more sensible. Hypervisor will then reject registration
> request which doesn't conform to the requirement.
>

The problem is not that simple... For instance, 64K is required to support
52-bits PA yet you may still want to run your current Debian on that
platform.

You can do that nicely on KVM but on Xen it is a pain due to the current
interface. If you use 4K you may end up to expose too much to the other
side.

The only viable solution here is a full re-design of the ABI for Arm. We
can do that step by step or at one go.

The discussion here was to start solving it on Argo so that's one less step
to do. Christoffer kindly try to tackle it. Sadly, I don't think the
interface suggested is going to work.

But I don't want Argo to miss 4.12 for that. So maybe the solution is to
stick with the usal Xen interface.

Best regards,


> Wei.
>
> >
> > Cheers,
> >
> >
> > > thanks,
> > >
> > > Christopher
> > >
> > > _______________________________________________
> > > Xen-devel mailing list
> > > Xen-devel@lists.xenproject.org
> > > https://lists.xenproject.org/mailman/listinfo/xen-devel
>

--0000000000003eeb8a057f0aa2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 9 Jan 2019, 12:=
54 Wei Liu, &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2@citrix.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Jan 09, 2019=
 at 12:02:34PM -0500, Julien Grall wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Sorry for the formatting. Sending it from my phone.<br>
&gt; <br>
&gt; On Wed, 9 Jan 2019, 11:03 Christopher Clark, &lt;<a href=3D"mailto:chr=
istopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jan 9, 2019 at 7:56 AM Wei Liu &lt;<a href=3D"mailto:wei.=
liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark =
wrote:<br>
&gt; &gt; &gt; &gt; The register op is used by a domain to register a regio=
n of memory for<br>
&gt; &gt; &gt; &gt; receiving messages from either a specified other domain=
, or, if<br>
&gt; &gt; specifying a<br>
&gt; &gt; &gt; &gt; wildcard, any domain.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This operation creates a mapping within Xen&#39;s priva=
te address space<br>
&gt; &gt; that<br>
&gt; &gt; &gt; &gt; will remain resident for the lifetime of the ring. In s=
ubsequent<br>
&gt; &gt; commits,<br>
&gt; &gt; &gt; &gt; the hypervisor will use this mapping to copy data from =
a sending<br>
&gt; &gt; domain into<br>
&gt; &gt; &gt; &gt; this registered ring, making it accessible to the domai=
n that<br>
&gt; &gt; registered the<br>
&gt; &gt; &gt; &gt; ring to receive data.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Wildcard any-sender rings are default disabled and regi=
stration will be<br>
&gt; &gt; &gt; &gt; refused with EPERM unless they have been specifically e=
nabled with the<br>
&gt; &gt; &gt; &gt; argo-mac boot option introduced here. The reason why th=
e default for<br>
&gt; &gt; &gt; &gt; wildcard rings is &#39;deny&#39; is that there is curre=
ntly no means to<br>
&gt; &gt; protect the<br>
&gt; &gt; &gt; &gt; ring from DoS by a noisy domain spamming the ring, affe=
cting other<br>
&gt; &gt; domains<br>
&gt; &gt; &gt; &gt; ability to send to it. This will be addressed with XSM =
policy controls<br>
&gt; &gt; in<br>
&gt; &gt; &gt; &gt; subsequent work.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Since denying access to any-sender rings is a significa=
nt functional<br>
&gt; &gt; &gt; &gt; constraint, a new bootparam is provided to enable overr=
iding this:<br>
&gt; &gt; &gt; &gt;=C2=A0 &quot;argo-mac&quot; variable has allowed values:=
 &#39;permissive&#39; and &#39;enforcing&#39;.<br>
&gt; &gt; &gt; &gt; Even though this is a boolean variable, use these descr=
iptive strings<br>
&gt; &gt; in<br>
&gt; &gt; &gt; &gt; order to make it obvious to an administrator that this =
has potential<br>
&gt; &gt; &gt; &gt; security impact.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The p2m type of the memory supplied by the guest for th=
e ring must be<br>
&gt; &gt; &gt; &gt; p2m_ram_rw and the memory will be pinned as PGT_writabl=
e_page while<br>
&gt; &gt; the ring<br>
&gt; &gt; &gt; &gt; is registered.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; xen_argo_page_descr_t type is introduced as a page desc=
riptor, to<br>
&gt; &gt; convey<br>
&gt; &gt; &gt; &gt; both the physical address of the start of the page and =
its<br>
&gt; &gt; granularity. The<br>
&gt; &gt; &gt; &gt; smallest granularity page is assumed to be 4096 bytes a=
nd the lower<br>
&gt; &gt; twelve<br>
&gt; &gt; &gt; &gt; bits of the type are used to indicate the size of page =
of memory<br>
&gt; &gt; supplied.<br>
&gt; &gt; &gt; &gt; The implementation of the hypercall op currently only s=
upports 4K<br>
&gt; &gt; pages.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What is the resolution for the Arm issues mentioned by Julie=
n? I read<br>
&gt; &gt; &gt; the conversation in previous thread. A solution seemed to ha=
ve been<br>
&gt; &gt; &gt; agreed upon, but the changelog doesn&#39;t say anything abou=
t it.<br>
&gt; &gt;<br>
&gt; &gt; I made the interface changes that Julien had asked for. The regis=
ter<br>
&gt; &gt; op now takes arguments that can describe the granularitity of the=
<br>
&gt; &gt; pages supplied, though only support for 4K pages is accepted in t=
he<br>
&gt; &gt; current implementation. I believe it meets Julien&#39;s requireme=
nts.<br>
&gt; <br>
&gt; <br>
&gt; I still don&#39;t think allowing 4K or 64K is the right solution to go=
. You are<br>
&gt; adding unnecessary burden in the hypervisor and would prevent optimiza=
tion<br>
&gt; i the hypervisor and unwanted side effect.<br>
&gt; <br>
&gt; For instance a 64K hypervisor will always map 64K even when the guest =
is<br>
&gt; passing 4K. You also can&#39;t map everything contiguously in Xen (if =
you ever<br>
&gt; wanted to).<br>
&gt; <br>
&gt; We need to stick on a single chunk size. That could be different betwe=
en<br>
&gt; Arm and x86. For Arm it would need to be 64KB.<br>
<br>
Doesn&#39;t enforcing 64KB granularity has its own limitation as well?<br>
According to my understanding of arm (and this could be wrong), you<br>
would need to have the guest allocate (via memory exchange perhaps) 64KB<br=
>
machine contiguous memory even when the hypervisor doesn&#39;t need it to b=
e<br>
64KB (when hypervisor is running on 4KB granularity).</blockquote></div><di=
v class=3D"gmail_quote"></div><div class=3D"gmail_quote"></div><div><br>The=
 64K is just about the interface with the guest.<br></div><div class=3D"gma=
il_quote"></div><div>The hypervisor could just split the 64K in 16 4K chunk=
. No need for memory exchange here.=C2=A0</div><div><br></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
I think having a method to return granularity to guest, like Stefano<br>
suggested, is more sensible. Hypervisor will then reject registration<br>
request which doesn&#39;t conform to the requirement.<br></blockquote></div=
><div><br></div><div>The problem is not that simple... For instance, 64K is=
 required to support 52-bits PA yet you may still want to run your current =
Debian on that platform.</div><div><br></div><div>You can do that nicely on=
 KVM but on Xen it is a pain due to the current interface. If you use 4K yo=
u may end up to expose too much to the other side.</div><div><br></div><div=
>The only viable solution here is a full re-design of the ABI for Arm. We c=
an do that step by step or at one go.</div><div><br></div><div>The discussi=
on here was to start solving it on Argo so that&#39;s one less step to do. =
Christoffer kindly try to tackle it. Sadly, I don&#39;t think the interface=
 suggested is going to work.</div><div><br></div><div>But I don&#39;t want =
Argo to miss 4.12 for that. So maybe the solution is to stick with the usal=
 Xen interface.</div><div><br></div><div>Best regards,</div><div><br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Wei.<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; <br>
&gt; &gt; thanks,<br>
&gt; &gt;<br>
&gt; &gt; Christopher<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Xen-devel mailing list<br>
&gt; &gt; <a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blan=
k">Xen-devel@lists.xenproject.org</a><br>
&gt; &gt; <a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-deve=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.org/mailma=
n/listinfo/xen-devel</a><br>
</blockquote></div>

--0000000000003eeb8a057f0aa2c1--


--===============6599465251161384795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6599465251161384795==--
