From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Wed, 9 Jan 2019 09:18:19 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901090907300.800@sstabellini-ThinkPad-X260>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <20190109155553.72gpxyvwisg4xhag@zion.uk.xensource.com>
 <CACMJ4GbCRYvC9ph8ZCfCX-T=eCk-MO26pzi_6yoqKSoqrZsC8A@mail.gmail.com>
 <CAF3u54DvKpvx8fbL0NSMeEhzieo-fw8v9q6MFe8w+viMeJDF3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-843009826-1547053993=:800"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XLPp=PR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ghHUl-0004TC-MA
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 17:18:23 +0000
In-Reply-To: <CAF3u54DvKpvx8fbL0NSMeEhzieo-fw8v9q6MFe8w+viMeJDF3A@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1901090913220.800@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-843009826-1547053993=:800
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1901090913221.800@sstabellini-ThinkPad-X260>

On Wed, 9 Jan 2019, Julien Grall wrote:
> Hi,
> Sorry for the formatting. Sending it from my phone.
> 
> On Wed, 9 Jan 2019, 11:03 Christopher Clark, <christopher.w.clark@gmail.com> wrote:
>       On Wed, Jan 9, 2019 at 7:56 AM Wei Liu <wei.liu2@citrix.com> wrote:
>       >
>       > On Sun, Jan 06, 2019 at 11:42:40PM -0800, Christopher Clark wrote:
>       > > The register op is used by a domain to register a region of memory for
>       > > receiving messages from either a specified other domain, or, if specifying a
>       > > wildcard, any domain.
>       > >
>       > > This operation creates a mapping within Xen's private address space that
>       > > will remain resident for the lifetime of the ring. In subsequent commits,
>       > > the hypervisor will use this mapping to copy data from a sending domain into
>       > > this registered ring, making it accessible to the domain that registered the
>       > > ring to receive data.
>       > >
>       > > Wildcard any-sender rings are default disabled and registration will be
>       > > refused with EPERM unless they have been specifically enabled with the
>       > > argo-mac boot option introduced here. The reason why the default for
>       > > wildcard rings is 'deny' is that there is currently no means to protect the
>       > > ring from DoS by a noisy domain spamming the ring, affecting other domains
>       > > ability to send to it. This will be addressed with XSM policy controls in
>       > > subsequent work.
>       > >
>       > > Since denying access to any-sender rings is a significant functional
>       > > constraint, a new bootparam is provided to enable overriding this:
>       > >  "argo-mac" variable has allowed values: 'permissive' and 'enforcing'.
>       > > Even though this is a boolean variable, use these descriptive strings in
>       > > order to make it obvious to an administrator that this has potential
>       > > security impact.
>       > >
>       > > The p2m type of the memory supplied by the guest for the ring must be
>       > > p2m_ram_rw and the memory will be pinned as PGT_writable_page while the ring
>       > > is registered.
>       > >
>       > > xen_argo_page_descr_t type is introduced as a page descriptor, to convey
>       > > both the physical address of the start of the page and its granularity. The
>       > > smallest granularity page is assumed to be 4096 bytes and the lower twelve
>       > > bits of the type are used to indicate the size of page of memory supplied.
>       > > The implementation of the hypercall op currently only supports 4K pages.
>       > >
>       >
>       > What is the resolution for the Arm issues mentioned by Julien? I read
>       > the conversation in previous thread. A solution seemed to have been
>       > agreed upon, but the changelog doesn't say anything about it.
> 
>       I made the interface changes that Julien had asked for. The register
>       op now takes arguments that can describe the granularitity of the
>       pages supplied, though only support for 4K pages is accepted in the
>       current implementation. I believe it meets Julien's requirements.
> 
> 
> I still don't think allowing 4K or 64K is the right solution to go. You are adding unnecessary burden in the hypervisor and would
> prevent optimization i the hypervisor and unwanted side effect.
> 
> For instance a 64K hypervisor will always map 64K even when the guest is passing 4K. You also can't map everything contiguously
> in Xen (if you ever wanted to).
> 
> We need to stick on a single chunk size. That could be different between Arm and x86. For Arm it would need to be 64KB.

Hi Julien!

I don't think we should force 64K as the only granularity on ARM. It
causes unnecessary overhead and confusion on 4K-only deployments that
are almost all our use-cases today.

One option is to make the granularity configurable at the guest side,
like Christopher did, letting the guest specifying the granularity. The
hypervisor could return -ENOSYS if the specified granularity is not
supported.

The other option is having the hypervisor export the granularity it
supports for this interface: Xen would say "I support only 4K".
Tomorrow, it could change and Xen could say "I support only 64K". Then,
it would be up to the guest passing a page of the right granularity to
the hypervisor. I think this is probably the best option, but it would
require the addition of one hypercall to retrieve the supported
granularity from Xen.
--8323329-843009826-1547053993=:800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-843009826-1547053993=:800--
