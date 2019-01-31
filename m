From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCHv2 1/9] mm: Introduce new vm_insert_range and
 vm_insert_range_buggy API
Date: Thu, 31 Jan 2019 18:01:52 +0530
Message-ID: <CAFqt6zbxyMB3VCzbWo1rPdfKXLVTNx+RY0=guD5CRxD37gJzsA__48355.7243760274$1548937991$gmane$org@mail.gmail.com>
References: <20190131030812.GA2174@jordon-HP-15-Notebook-PC>
 <1701923.z6LKAITQJA@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1701923.z6LKAITQJA@phil>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, iommu@lists.linux-foundation.org, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chips.com, xen-devel
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgNTozNyBQTSBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIERvbm5lcnN0YWcsIDMxLiBKYW51YXIgMjAxOSwgMDQ6MDg6
MTIgQ0VUIHNjaHJpZWIgU291cHRpY2sgSm9hcmRlcjoKPiA+IFByZXZpb3VseSBkcml2ZXJzIGhh
dmUgdGhlaXIgb3duIHdheSBvZiBtYXBwaW5nIHJhbmdlIG9mCj4gPiBrZXJuZWwgcGFnZXMvbWVt
b3J5IGludG8gdXNlciB2bWEgYW5kIHRoaXMgd2FzIGRvbmUgYnkKPiA+IGludm9raW5nIHZtX2lu
c2VydF9wYWdlKCkgd2l0aGluIGEgbG9vcC4KPiA+Cj4gPiBBcyB0aGlzIHBhdHRlcm4gaXMgY29t
bW9uIGFjcm9zcyBkaWZmZXJlbnQgZHJpdmVycywgaXQgY2FuCj4gPiBiZSBnZW5lcmFsaXplZCBi
eSBjcmVhdGluZyBuZXcgZnVuY3Rpb25zIGFuZCB1c2UgaXQgYWNyb3NzCj4gPiB0aGUgZHJpdmVy
cy4KPiA+Cj4gPiB2bV9pbnNlcnRfcmFuZ2UoKSBpcyB0aGUgQVBJIHdoaWNoIGNvdWxkIGJlIHVz
ZWQgdG8gbWFwcGVkCj4gPiBrZXJuZWwgbWVtb3J5L3BhZ2VzIGluIGRyaXZlcnMgd2hpY2ggaGFz
IGNvbnNpZGVyZWQgdm1fcGdvZmYKPiA+Cj4gPiB2bV9pbnNlcnRfcmFuZ2VfYnVnZ3koKSBpcyB0
aGUgQVBJIHdoaWNoIGNvdWxkIGJlIHVzZWQgdG8gbWFwCj4gPiByYW5nZSBvZiBrZXJuZWwgbWVt
b3J5L3BhZ2VzIGluIGRyaXZlcnMgd2hpY2ggaGFzIG5vdCBjb25zaWRlcmVkCj4gPiB2bV9wZ29m
Zi4gdm1fcGdvZmYgaXMgcGFzc2VkIGRlZmF1bHQgYXMgMCBmb3IgdGhvc2UgZHJpdmVycy4KPiA+
Cj4gPiBXZSBfY291bGRfIHRoZW4gYXQgYSBsYXRlciAiZml4IiB0aGVzZSBkcml2ZXJzIHdoaWNo
IGFyZSB1c2luZwo+ID4gdm1faW5zZXJ0X3JhbmdlX2J1Z2d5KCkgdG8gYmVoYXZlIGFjY29yZGlu
ZyB0byB0aGUgbm9ybWFsIHZtX3Bnb2ZmCj4gPiBvZmZzZXR0aW5nIHNpbXBseSBieSByZW1vdmlu
ZyB0aGUgX2J1Z2d5IHN1ZmZpeCBvbiB0aGUgZnVuY3Rpb24KPiA+IG5hbWUgYW5kIGlmIHRoYXQg
Y2F1c2VzIHJlZ3Jlc3Npb25zLCBpdCBnaXZlcyB1cyBhbiBlYXN5IHdheSB0byByZXZlcnQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5j
b20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVr
Pgo+ID4gU3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4K
Pgo+IGhtbSwgSSdtIG1pc3NpbmcgYSBjaGFuZ2Vsb2cgaGVyZSBiZXR3ZWVuIHYxIGFuZCB2Mi4K
PiBOZXZlcnRoZWxlc3MgSSBtYW5hZ2VkIHRvIHRlc3QgdjEgb24gUm9ja2NoaXAgaGFyZHdhcmUK
PiBhbmQgZGlzcGxheSBpcyBzdGlsbCB3b3JraW5nLCBpbmNsdWRpbmcgdGFsa2luZyB0byBMaW1h
IHZpYSBwcmltZS4KPgo+IFNvIGlmIHRoZXJlIGFyZW4ndCBhbnkgYmlnIGNoYW5nZXMgZm9yIHYy
LCBvbiBSb2NrY2hpcAo+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5k
ZT4KCkNoYW5nZSBsb2cgaXMgYXZhaWxhYmxlIGluIFswLzldLgpQYXRjaCBbMS85XSAmIFs0Lzld
IGhhdmUgbm8gY2hhbmdlcyBiZXR3ZWVuIHYxIC0+IHYyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
