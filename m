From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/15] xen/arm: Introduce helpers to
 clear/flags flags in HCR_EL2
Date: Tue, 14 Aug 2018 16:03:07 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141602510.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141345410.15066@sstabellini-ThinkPad-X260>
 <4c0f6e56-7d17-8e3d-3146-1c043d489eb8@arm.com>
 <alpine.DEB.2.10.1808141448330.15066@sstabellini-ThinkPad-X260>
 <5b58252c-0f49-18ac-49b5-70896d44d3c6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fpiLH-0001PC-5y
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 23:03:11 +0000
In-Reply-To: <5b58252c-0f49-18ac-49b5-70896d44d3c6@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDgvMTQvMjAxOCAxMDo0OSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
T24gVHVlLCAxNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBTdGVmYW5v
LAo+ID4gPiAKPiA+ID4gT24gMDgvMTQvMjAxOCAwOTo0NiBQTSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgMTYgSnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiA+ID4gPiA+IEEgY291cGxlIG9mIHBsYWNlcyBpbiB0aGUgY29kZSB3aWxsIG5lZWQgdG8gY2xl
YXIvc2V0IGZsYWdzIGluIEhDUl9FTDIKPiA+ID4gPiA+IGZvciBhIGdpdmVuIHZDUFUgYW5kIHRo
ZW4gcmVwbGljYXRlIGludG8gdGhlIGhhcmR3YXJlLiBJbnRyb2R1Y2UKPiA+ID4gPiA+IGhlbHBl
cnMgYW5kIHJlcGxhY2Ugb3Blbi1jb2RlZCB2ZXJzaW9uLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+ID4g
PiA+IAo+ID4gPiA+IFRoZSBtYWNyb3MgbG9vayBnb29kLCBidXQgSSBncmVwcGVkIGZvciB0aGVt
IGluIHlvdXIgc2VyaWVzIGFuZCB0aGVyZQo+ID4gPiA+IGFyZSBubyBtb3JlIGNhbGxlcnMuIFdo
YXQgcGxhY2VzIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoYXQgdGhleSB3aWxsCj4gPiA+ID4gbmVl
ZCB0aGVtPwo+ID4gPiAKPiA+ID4gSSBzcGxpdCBzb21lIG9mIG15IHdvcmsgaW4gMiBwYXJ0IHRv
IHJlZHVjZSB0aGUgc2l6ZSBvZiB0aGUgc2VyaWVzLiBUaGlzCj4gPiA+IHdpbGwKPiA+ID4gYmUg
dXNlZCBpbiBhbm90aGVyIHNlcmllcyB3aGVyZSB1cGRhdGluZyBIQ1IgZm9yIHRyYXBwaW5nIFRU
QlIvU0NUTFIqIHdpbGwKPiA+ID4gYmUKPiA+ID4gZHluYW1pYy4KPiA+ID4gCj4gPiA+IEFsdGhv
dWdoIGluIGdlbmVyYWwsIHRoaXMgaXMgYW4gaW1wcm92ZW1lbnQgY29tcGFyZSB0byB0aGUgY3Vy
cmVudCBjb2RlIGFzCj4gPiA+IGl0Cj4gPiA+IG1ha2VzIGNsZWFyIHdoYXQgbmVlZHMgdG8gYmUg
dXBkYXRlZCB3aGVuIG1vZGlmeWluZyBIQ1IuCj4gPiAKPiA+IFllcywgaXQgaXMsIGJ1dCBub3Jt
YWxseSBJIHdvdWxkIG9ubHkgaW50cm9kdWNlIHZjcHVfaGNyX3NldF9mbGFncyBpbgo+ID4gdGhp
cyBzZXJpZXMsIGJlY2F1c2UgdmNwdV9oY3JfY2xlYXJfZmxhZ3MgaXMgbGVmdCBjb21wbGV0ZWx5
IHVudXNlZD8KPiAKPiBXZWxsLCBpdCBtYWtlcyBzZW5zZSB0byBrZWVwIHRoZSBwYWlyIHRvZ2V0
aGVyLiBJIGFtIGhhcHB5IHRvIG1vdmUgdGhhdCBwYXRjaAo+IGluIHRoZSBvdGhlciBpZiB5b3Ug
cHJlZmVyLgoKU291bmRzIGdvb2QuIFdoZW4geW91IGRvIHRoYXQsIHlvdSBjYW4gZGlyZWN0bHkg
YWRkIG15IHJldmlld2VkLWJ5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
