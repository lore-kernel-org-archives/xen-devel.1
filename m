From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] pvcalls-front: 64-bit align flags
Date: Tue, 27 Feb 2018 16:19:33 -0500
Message-ID: <b7ec592a-bbd1-48d3-1a1f-92a8ed4a1e48__48687.9204902381$1519766273$gmane$org@oracle.com>
References: <alpine.DEB.2.10.1802271150020.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=thka=fv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eqmeP-0000pF-VJ
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 21:19:05 +0000
In-Reply-To: <alpine.DEB.2.10.1802271150020.4239@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjcvMjAxOCAwMjo1NCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IFdlIGFy
ZSB1c2luZyB0ZXN0X2FuZF8qIG9wZXJhdGlvbnMgb24gdGhlIHN0YXR1cyBhbmQgZmxhZyBmaWVs
ZHMgb2YKPiBzdHJ1Y3Qgc29ja19tYXBwaW5nLiBIb3dldmVyLCB0aGVzZSBmdW5jdGlvbnMgcmVx
dWlyZSB0aGUgb3BlcmFuZCB0byBiZQo+IDY0LWJpdCBhbGlnbmVkIG9uIGFybTY0LiBDdXJyZW50
bHksIG9ubHkgc3RhdHVzIGlzIDY0LWJpdCBhbGlnbmVkLgo+Cj4gTWFrZSBmbGFncyA2NC1iaXQg
YWxpZ25lZCBieSBpbnRyb2R1Y2luZyBhbiBleHBsaWNpdCBwYWRkaW5nIGZpZWxkLgo+Cj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29tPgo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2
Y2FsbHMtZnJvbnQuYwo+IGluZGV4IGNhNWI3NzMuLmFhMDdiMmEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy94ZW4vcHZjYWxscy1mcm9udC5jCj4gKysrIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9u
dC5jCj4gQEAgLTc4LDYgKzc4LDcgQEAgc3RydWN0IHNvY2tfbWFwcGluZyB7Cj4gICNkZWZpbmUg
UFZDQUxMU19TVEFUVVNfQklORCAgICAgICAgICAxCj4gICNkZWZpbmUgUFZDQUxMU19TVEFUVVNf
TElTVEVOICAgICAgICAyCj4gIAkJCXVpbnQ4X3Qgc3RhdHVzOwo+ICsJCQl1aW50OF90IHBhZFs3
XTsKCkRvZXMgdGhpcyBndWFyYW50ZWUgYWxpZ25tZW50IChmb3IgZWl0aGVyIHN0YXR1cyBvciBm
bGFnKT8KCi1ib3JpcwoKPiAgCQkvKgo+ICAJCSAqIEludGVybmFsIHN0YXRlLW1hY2hpbmUgZmxh
Z3MuCj4gIAkJICogT25seSBvbmUgYWNjZXB0IG9wZXJhdGlvbiBjYW4gYmUgaW5mbGlnaHQgZm9y
IGEgc29ja2V0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
