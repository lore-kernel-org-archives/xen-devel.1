From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Sat, 17 Nov 2018 06:37:42 -0800
Message-ID: <20181117143742.GB7861__21183.0708817162$1542465465$gmane$org@bombadil.infradead.org>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <20181116182836.GB17088@rapoport-lnx>
 <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, rppt@linux.ibm.com, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chi
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBOb3YgMTcsIDIwMTggYXQgMTI6MjY6MzhQTSArMDUzMCwgU291cHRpY2sgSm9hcmRl
ciB3cm90ZToKPiBPbiBGcmksIE5vdiAxNiwgMjAxOCBhdCAxMTo1OSBQTSBNaWtlIFJhcG9wb3J0
IDxycHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gPiArICogdm1faW5zZXJ0X3JhbmdlIC0g
aW5zZXJ0IHJhbmdlIG9mIGtlcm5lbCBwYWdlcyBpbnRvIHVzZXIgdm1hCj4gPiA+ICsgKiBAdm1h
OiB1c2VyIHZtYSB0byBtYXAgdG8KPiA+ID4gKyAqIEBhZGRyOiB0YXJnZXQgdXNlciBhZGRyZXNz
IG9mIHRoaXMgcGFnZQo+ID4gPiArICogQHBhZ2VzOiBwb2ludGVyIHRvIGFycmF5IG9mIHNvdXJj
ZSBrZXJuZWwgcGFnZXMKPiA+ID4gKyAqIEBwYWdlX2NvdW50OiBuby4gb2YgcGFnZXMgbmVlZCB0
byBpbnNlcnQgaW50byB1c2VyIHZtYQo+ID4gPiArICoKPiA+ID4gKyAqIFRoaXMgYWxsb3dzIGRy
aXZlcnMgdG8gaW5zZXJ0IHJhbmdlIG9mIGtlcm5lbCBwYWdlcyB0aGV5J3ZlIGFsbG9jYXRlZAo+
ID4gPiArICogaW50byBhIHVzZXIgdm1hLiBUaGlzIGlzIGEgZ2VuZXJpYyBmdW5jdGlvbiB3aGlj
aCBkcml2ZXJzIGNhbiB1c2UKPiA+ID4gKyAqIHJhdGhlciB0aGFuIHVzaW5nIHRoZWlyIG93biB3
YXkgb2YgbWFwcGluZyByYW5nZSBvZiBrZXJuZWwgcGFnZXMgaW50bwo+ID4gPiArICogdXNlciB2
bWEuCj4gPgo+ID4gUGxlYXNlIGFkZCB0aGUgcmV0dXJuIHZhbHVlIGFuZCBjb250ZXh0IGRlc2Ny
aXB0aW9ucy4KPiA+Cj4gCj4gU3VyZSBJIHdpbGwgd2FpdCBmb3Igc29tZSB0aW1lIHRvIGdldCBh
ZGRpdGlvbmFsIHJldmlldyBjb21tZW50cyBhbmQKPiBhZGQgYWxsIG9mIHRob3NlIHJlcXVlc3Rl
ZCBjaGFuZ2VzIGluIHYyLgoKWW91IGNvdWxkIHNlbmQgeW91ciBwcm9wb3NlZCB3b3JkaW5nIG5v
dyB3aGljaCBtaWdodCByZW1vdmUgdGhlIG5lZWQKZm9yIGEgdjMgaWYgd2UgZW5kIHVwIGFyZ3Vp
bmcgYWJvdXQgdGhlIHdvcmRpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
