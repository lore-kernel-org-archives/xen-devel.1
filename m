From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH v3 1/9] mm: Introduce new vm_insert_range API
Date: Sat, 8 Dec 2018 00:58:26 +0530
Message-ID: <CAFqt6zYCWOK-uS85GqCzcgT=+YKn1nBrRPq+M9y6eJjmXEKH+g__42557.5642301284$1544210619$gmane$org@mail.gmail.com>
References: <20181206183945.GA20932@jordon-HP-15-Notebook-PC>
 <53bbc095-c9f5-5d6a-6e50-6e060d17eb68@arm.com>
 <20181207171116.GA29923@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181207171116.GA29923@bombadil.infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chips.com, xen-devel@li
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgNywgMjAxOCBhdCAxMDo0MSBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwNywgMjAxOCBhdCAwMzozNDo1NlBN
ICswMDAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gPiA+ICtpbnQgdm1faW5zZXJ0X3JhbmdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgbG9uZyBwYWdlX2Nv
dW50KQo+ID4gPiArewo+ID4gPiArICAgdW5zaWduZWQgbG9uZyB1YWRkciA9IGFkZHI7Cj4gPiA+
ICsgICBpbnQgcmV0ID0gMCwgaTsKPiA+Cj4gPiBTb21lIG9mIHRoZSBzaXRlcyBiZWluZyByZXBs
YWNlZCB3ZXJlIGVmZmVjdGl2ZWx5IGVuc3VyaW5nIHRoYXQgdm1hIGFuZAo+ID4gcGFnZXMgd2Vy
ZSBtdXR1YWxseSBjb21wYXRpYmxlIGFzIGFuIGluaXRpYWwgY29uZGl0aW9uIC0gd291bGQgaXQg
YmUgd29ydGgKPiA+IGFkZGluZyBzb21ldGhpbmcgaGVyZSBmb3Igcm9idXN0bmVzcywgZS5nLjoK
PiA+Cj4gPiArICAgICBpZiAocGFnZV9jb3VudCAhPSB2bWFfcGFnZXModm1hKSkKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPgo+IEkgdGhpbmsgd2Ugd2FudCB0byBhbGxvdyB0aGlz
IHRvIGJlIHVzZWQgdG8gcG9wdWxhdGUgcGFydCBvZiBhIFZNQS4KPiBTbyBwZXJoYXBzOgo+Cj4g
ICAgICAgICBpZiAocGFnZV9jb3VudCA+IHZtYV9wYWdlcyh2bWEpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOWElPOwoKT2ssIFRoaXMgY2FuIGJlIGFkZGVkLgoKSSB0aGluayBQYXRjaCBb
Mi85XSBpcyB0aGUgb25seSBsZWZ0b3ZlciBwbGFjZSB3aGVyZSB0aGlzCmNoZWNrIGNvdWxkIGJl
IHJlbW92ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
