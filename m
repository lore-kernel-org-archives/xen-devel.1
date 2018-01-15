From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] fix potential null dereference
Date: Mon, 15 Jan 2018 10:51:06 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
 <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
 <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bmko=ek=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eb9qf-0007wA-LN
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 18:51:09 +0000
In-Reply-To: <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNSBKYW4gMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDEzLjAxLjE4
IGF0IDA3OjIxLCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gMDEvMTIv
MjAxOCAxMTo0MCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4+IGhhbmRsZXMgY2Fu
IHRoZW9yZXRpY2FsbHkgYmUgTlVMTCwgY2hlY2sgZm9yIGl0IGV4cGxpY2l0bHkgYmVmb3JlCj4g
Pj4gZGVyZWZlcmVuY2luZyBpdC4KPiA+IAo+ID4gSSBkb3VidCBoYW5kbGVzIGNvdWxkIGJlIE5V
TEwgaWYgTG9jYXRlSGFuZGxlIHN1Y2NlZWQuIFRoaXMgc2VlbXMgdG8gYmUgCj4gPiBjb25maXJt
ZWQgYnkgdGhlIHNwZWMgKFBhZ2UgMjA4IGluIFVFRkkgc3BlYyAyLjcpLgo+ID4gCj4gPiBTbyBJ
IGFtIG5vdCBlbnRpcmVseSBjb252aW5jZSB3ZSBzaG91bGQgYWRkIHlldCBhbm90aGVyIGNoZWNr
IGluIHRoZSAKPiA+IGNvZGUuIEFuIEFTU0VSVCBtaWdodCBiZSBiZXR0ZXIuCj4gCj4gSW5kZWVk
IGlmIHRoZXJlIGlzIGEgcGxhdGZvcm0gd2hlcmUgTlVMTCBpcyBjb21pbmcgYmFjayBpbiB0aGUK
PiBzdWNjZXNzIGNhc2UsIHRoYXQgcGxhdGZvcm0gc2hvdWxkIGJlIG5hbWVkIGFzIGEganVzdGlm
aWNhdGlvbgo+IGluIHRoZSBjb21taXQgbWVzc2FnZS4gT3RoZXJ3aXNlIEkgZG9uJ3Qgc2VlIHRo
ZSB2YWx1ZSBvZiB0aGlzCj4gY2hhbmdlLgoKVHJ1dGhmdWxseSwgaXQgaXMgbW9zdGx5IHRvIHNp
bGVuY2UgQ292ZXJpdHkuIFdlIGNhbiBhbGwgYXBwcmVjaWF0ZSB3aGVuCnN0YXRpYyBhbmFseXN0
cyBjYW5ub3QgZmluZCBkZWZlY3RzIGluIHRoZSBjb2RlLgoKQW4gQVNTRVJUIHNob3VsZCBzYXRp
c2Z5IGl0IGFzIHdlbGwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
