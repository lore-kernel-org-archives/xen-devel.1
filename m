From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Wed, 21 Nov 2018 07:29:37 -0700
Message-ID: <D13F3DA0-1CD3-43AF-BAF6-5103FE7C4B5A__40303.0824069448$1542963151$gmane$org@oracle.com>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <20181116182836.GB17088@rapoport-lnx>
 <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
 <20181117143742.GB7861@bombadil.infradead.org>
 <CAFqt6zbOWX5LUTWwoGDJsGdf+pTR6N1yTPVxyr1W3-6Fte39ww@mail.gmail.com>
 <833B5050-DEF6-44A0-9832-276F86671212@oracle.com>
 <20181121123513.GF3065@bombadil.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181121123513.GF3065@bombadil.infradead.org>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, Russell King - ARM Linux <linux@armlinux.org.uk>, rppt@linux.ibm.com, Kyungmin Park <kyungmin.park@samsung.com>, airlied@linux.ie, vbabka@suse.cz, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xen.org, iommu@list
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIE5vdiAyMSwgMjAxOCwgYXQgNTozNSBBTSwgTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+IAo+IEl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGJlIG1vcmUg
ZXhwbGljaXQgYW5kIGFuc3dlciBSYW5keSdzIHF1ZXN0aW9uOgo+IAo+ICogSWYgd2UgZmFpbCB0
byBpbnNlcnQgYW55IHBhZ2UgaW50byB0aGUgdm1hLCB0aGUgZnVuY3Rpb24gd2lsbCByZXR1cm4K
PiAqIGltbWVkaWF0ZWx5IGxlYXZpbmcgYW55IHByZXZpb3VzbHktaW5zZXJ0ZWQgcGFnZXMgcHJl
c2VudC4gIENhbGxlcnMKPiAqIGZyb20gdGhlIG1tYXAgaGFuZGxlciBtYXkgaW1tZWRpYXRlbHkg
cmV0dXJuIHRoZSBlcnJvciBhcyB0aGVpcgo+ICogY2FsbGVyIHdpbGwgZGVzdHJveSB0aGUgdm1h
LCByZW1vdmluZyBhbnkgc3VjY2Vzc2Z1bGx5LWluc2VydGVkIHBhZ2VzLgo+ICogT3RoZXIgY2Fs
bGVycyBzaG91bGQgbWFrZSB0aGVpciBvd24gYXJyYW5nZW1lbnRzIGZvciBjYWxsaW5nIHVubWFw
X3JlZ2lvbigpLgoKVGhhdCB3b3JrcyBmb3IgbWUgYXMgd2VsbC4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
