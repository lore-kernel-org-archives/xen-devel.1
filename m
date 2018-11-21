From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Wed, 21 Nov 2018 04:19:11 -0700
Message-ID: <833B5050-DEF6-44A0-9832-276F86671212__9030.11083505607$1542799935$gmane$org@oracle.com>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <20181116182836.GB17088@rapoport-lnx>
 <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
 <20181117143742.GB7861@bombadil.infradead.org>
 <CAFqt6zbOWX5LUTWwoGDJsGdf+pTR6N1yTPVxyr1W3-6Fte39ww@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFqt6zbOWX5LUTWwoGDJsGdf+pTR6N1yTPVxyr1W3-6Fte39ww@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, iommu@lists.linux-foundation.org, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen
List-Id: xen-devel@lists.xenproject.org

Q291bGQgeW91IGFkZCBhIGxpbmUgdG8gdGhlIGRlc2NyaXB0aW9uIGV4cGxpY2l0bHkgc3RhdGlu
ZyB0aGF0IGEgZmFpbHVyZQp0byBpbnNlcnQgYW55IHBhZ2UgaW4gdGhlIHJhbmdlIHdpbGwgZmFp
bCB0aGUgZW50aXJlIHJvdXRpbmUsIHNvbWV0aGluZwpsaWtlOgoKPiAqIFRoaXMgYWxsb3dzIGRy
aXZlcnMgdG8gaW5zZXJ0IHJhbmdlIG9mIGtlcm5lbCBwYWdlcyB0aGV5J3ZlIGFsbG9jYXRlZAo+
ICogaW50byBhIHVzZXIgdm1hLiBUaGlzIGlzIGEgZ2VuZXJpYyBmdW5jdGlvbiB3aGljaCBkcml2
ZXJzIGNhbiB1c2UKPiAqIHJhdGhlciB0aGFuIHVzaW5nIHRoZWlyIG93biB3YXkgb2YgbWFwcGlu
ZyByYW5nZSBvZiBrZXJuZWwgcGFnZXMgaW50bwo+ICogdXNlciB2bWEuCj4gKgo+ICogQSBmYWls
dXJlIHRvIGluc2VydCBhbnkgcGFnZSBpbiB0aGUgcmFuZ2Ugd2lsbCBmYWlsIHRoZSBjYWxsIGFz
IGEgd2hvbGUuCgpJdCdzIG9idmlvdXMgd2hlbiByZWFkaW5nIHRoZSBjb2RlLCBidXQgaXQgd291
bGQgYmUgc2VsZi1kb2N1bWVudGluZyB0bwpzdGF0ZSBpdCBvdXRyaWdodC4KClRoYW5rcyEKICAg
IC0tIEJpbGwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
