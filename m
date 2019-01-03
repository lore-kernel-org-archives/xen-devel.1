From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/5] xen/arm: use the physical number of gic
 lines for boot domains
Date: Thu, 3 Jan 2019 11:07:18 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901031104000.800@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-4-git-send-email-sstabellini@kernel.org>
 <8519371e-894b-88a3-ac71-b8367d93d9d3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8519371e-894b-88a3-ac71-b8367d93d9d3@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEy
LzUvMTggNToyOCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gV2UgZG9uJ3QgaGF2
ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3ZSBuZWVkIGZvciB0
aGUKPiA+IGJvb3QgZG9tYWlucy4gRm9yIHNpbXBsaWNpdHksIGFsbG9jYXRlIGFzIG1hbnkgYXMg
bmF0aXZlbHkgc3VwcG9ydGVkLAo+ID4ganVzdCBsaWtlIGZvciBkb20wLgo+IAo+IFRoaXMgd2ls
bCBwb3RlbnRpYWxseSBhbGxvY2F0ZSBhIGxvdCBvZiB1bnVzZWQgaW50ZXJydXB0cyBhbmQgYSB3
YXN0ZSBvZgo+IG1lbW9yeS4gU28gaXMgaXQgdGhlIGNvcnJlY3Qgc29sdXRpb24/Cj4gCj4gRm9y
IGluc3RhbmNlLCB3ZSB3b3VsZCByZXF1ZXN0IHRoZSB1c2VyIHRvIHByb3ZpZGUgdGhlIG51bWJl
ciBvZiBpbnRlcnJ1cHRzLgoKVW5mb3J0dW5hdGVseSwgdGhpcyBoYXMgdG8gaGFwcGVuIG11Y2gg
ZWFybGllciB0aGFuIHdoZW4gd2UgcGFyc2UgdXNlcgpzdXBwbGllZCBkZXZpY2UgdHJlZSBvcHRp
b25zLiBXZSBjb3VsZCBtYWtlIGl0IGFuIGh5cGVydmlzb3IgY29tbWFuZApsaW5lIHBhcmFtZXRl
ciBidXQgaXQgd291bGQgYmUgbmFzdHkuCgpHaXZlbiB0aGF0IHRoaXMgZmVhdHVyZSBpcyBhaW1l
ZCBhdCBwYXJ0aXRpb25pbmcgc2NlbmFyaW9zIHdoZXJlIHRoZQpudW1iZXIgb2YgVk1zIGlzIGxv
dywgdGhlIGluY3JlYXNlZCBtZW1vcnkgb3ZlcmhlYWQgaXMgbm90IGEgYmlnIGlzc3VlLgoKKElm
IHlvdSByZWNhbGwgd2UgYnJpZWZseSBkaXNjdXNzZWQgdGhpcyB0b3BpYyBhdCB0aGUgbGFzdCBM
aW5hcm8KQ29ubmVjdCwgdGhpcyB3YXMgdGhlIGNvbmNsdXNpb24uKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
