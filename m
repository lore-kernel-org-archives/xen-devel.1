From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Fri, 16 Nov 2018 13:45:48 +0530
Message-ID: <CAFqt6zbL1tu4VWtZ5Wz-BgbOS+M2GJziMj958_h_ri4Th3n9bQ__38762.6983029351$1542356099$gmane$org@mail.gmail.com>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <9655a12e-bd3d-aca2-6155-38924028eb5d@infradead.org>
 <CAFqt6zbLjtDab3Bz67trbnQRQdutvgA=YvAFhoW4bxsg657mGQ@mail.gmail.com>
 <20181116064049.GA5320@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181116064049.GA5320@bombadil.infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, Randy Dunlap <rdunlap@infradead.>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTI6MTEgUE0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTE6MDA6MzBB
TSArMDUzMCwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiA+IE9uIFRodSwgTm92IDE1LCAyMDE4
IGF0IDExOjQ0IFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToK
PiA+ID4gT24gMTEvMTUvMTggNzo0NSBBTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiA+ID4g
V2hhdCBpcyB0aGUgb3Bwb3NpdGUgb2Ygdm1faW5zZXJ0X3JhbmdlKCkgb3IgZXZlbiBvZiB2bV9p
bnNlcnRfcGFnZSgpPwo+ID4gPiBvciBpcyB0aGVyZSBubyBuZWVkIGZvciB0aGF0Pwo+ID4KPiA+
IFRoZXJlIGlzIG5vIG9wcG9zaXRlIGZ1bmN0aW9uIG9mIHZtX2luc2VydF9yYW5nZSgpIC8gdm1f
aW5zZXJ0X3BhZ2UoKS4KPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMsIGluIGNhc2Ugb2YgYW55IGVy
cm9yLCBtbWFwIGhhbmRsZXJzIHdpbGwgcmV0dXJuIHRoZQo+ID4gZXJyIHRvIHVzZXIgcHJvY2Vz
cyBhbmQgdXNlciBzcGFjZSB3aWxsIGRlY2lkZSB0aGUgbmV4dCBhY3Rpb24uIFNvIG5leHQKPiA+
IHRpbWUgd2hlbiBtbWFwIGhhbmRsZXIgaXMgZ2V0dGluZyBpbnZva2VkIGl0IHdpbGwgbWFwIGZy
b20gdGhlIGJlZ2lubmluZy4KPiA+IENvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4KPgo+IFRoZSBv
cHBvc2l0ZSBmdW5jdGlvbiwgSSBzdXBwb3NlLCBpcyB1bm1hcF9yZWdpb24oKS4KPgo+ID4gPiBz
L25vLi9udW1iZXIvCj4gPgo+ID4gSSBkaWRuJ3QgZ2V0IGl0ID8/Cj4KPiBUaGlzIGlzIGEgJ3Nl
ZCcgZXhwcmVzc2lvbi4gICdzJyBpcyB0aGUgJ3N1YnN0aXR1dGUnIGNvbW1hbmQ7IHRoZSAvCj4g
aXMgYSBzZXBhcmF0b3IsICduby4nIGlzIHdoYXQgeW91IHdyb3RlLCBhbmQgJ251bWJlcicgaXMg
d2hhdCBSYW5keQo+IGlzIHJlY29tbWVuZGluZyBpbnN0ZWFkLgoKT2suIFdpbGwgY2hhbmdlIGl0
IGluIHYyLgo+Cj4gPiA+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IHBhZ2VfY291bnQ7IGkrKykg
ewo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0ID0gdm1faW5zZXJ0X3BhZ2Uodm1hLCB1YWRkciwg
cGFnZXNbaV0pOwo+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+Cj4gPiA+IEZvciBhIG5vbi10cml2
aWFsIHZhbHVlIG9mIHBhZ2VfY291bnQ6Cj4gPiA+IElzIGl0IGEgcHJvYmxlbSBpZiB2bV9pbnNl
cnRfcGFnZSgpIHN1Y2NlZWRzIGZvciBzZXZlcmFsIHBhZ2VzCj4gPiA+IGFuZCB0aGVuIGZhaWxz
Pwo+ID4KPiA+IE5vLCBpdCB3aWxsIGJlIGNvbnNpZGVyZWQgYXMgdG90YWwgZmFpbHVyZSBhbmQg
bW1hcCBoYW5kbGVyIHdpbGwgcmV0dXJuCj4gPiB0aGUgZXJyIHRvIHVzZXIgc3BhY2UuCj4KPiBJ
IHRoaW5rIHdoYXQgUmFuZHkgbWVhbnMgaXMgIldoYXQgaGFwcGVucyB0byB0aGUgaW5zZXJ0ZWQg
cGFnZXM/IiBhbmQKPiB0aGUgYW5zd2VyIGlzIHRoYXQgbW1hcF9yZWdpb24oKSBqdW1wcyB0byB0
aGUgJ3VubWFwX2FuZF9mcmVlX3ZtYScKPiBsYWJlbCwgd2hpY2ggaXMgYW4gYWNjdXJhdGUgbmFt
ZS4KClNvcnJ5IGZvciBpbmNvcnJlY3QgdW5kZXJzdGFuZGluZyBvZiB0aGUgcXVlc3Rpb24uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
