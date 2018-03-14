From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] libxc/arm: remove useless conditional in
	meminit
Date: Wed, 14 Mar 2018 11:01:45 +0000
Message-ID: <a56e67f3-428e-ffce-293b-92575584997c@arm.com>
References: <20180314105811.23809-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ty01=ge=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ew4AN-0008Ij-6j
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:01:55 +0000
In-Reply-To: <20180314105811.23809-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8xNC8yMDE4IDEwOjU4IEFNLCBXZWkgTGl1IHdyb3RlOgo+IFRoZSB2YXJpYWJsZSBu
YW1lZCByYW1zaXplIGlzIGFsd2F5cyBub24temVybyBhdCB0aGF0IHBvaW50IGJlY2F1c2UKPiB0
aGVyZSBpcyBhIGNoZWNrIGZvciB6ZXJvIGEgZmV3IGxpbmVzIGJlZm9yZS4KClRoZSBib2R5IG9m
IHRoZSBsb29wIGhhczoKCnJhbXNpemUgLT0gLi4uCgpXZSB3YW50IHRvIGV4aXQgdGhlIGxvb3Ag
ZWl0aGVyIHdoZW4gd2UgaGF2ZSBubyBtb3JlIGJhbmtzIGxlZnQgb3Igd2UgCmZ1bGZpbGxlZCBh
bGwgdGhlIFJBTSByZXF1ZXN0ZWQuCgpDaGVlcnMsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gICB0b29scy9saWJ4Yy94Y19kb21fYXJt
LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jIGIvdG9vbHMvbGli
eGMveGNfZG9tX2FybS5jCj4gaW5kZXggNWI5ZWNhNjA4Ny4uNWFjYjMyMTQ4ZSAxMDA2NDQKPiAt
LS0gYS90b29scy9saWJ4Yy94Y19kb21fYXJtLmMKPiArKysgYi90b29scy9saWJ4Yy94Y19kb21f
YXJtLmMKPiBAQCAtNDI1LDcgKzQyNSw3IEBAIHN0YXRpYyBpbnQgbWVtaW5pdChzdHJ1Y3QgeGNf
ZG9tX2ltYWdlICpkb20pCj4gICAgICAgaWYgKCByYyApCj4gICAgICAgICAgIHJldHVybiByYzsK
PiAgIAo+IC0gICAgZm9yICggaSA9IDA7IHJhbXNpemUgJiYgaSA8IEdVRVNUX1JBTV9CQU5LUzsg
aSsrICkKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgR1VFU1RfUkFNX0JBTktTOyBpKysgKQo+ICAg
ICAgIHsKPiAgICAgICAgICAgdWludDY0X3QgYmFua3NpemUgPSByYW1zaXplID4gYmFua21heFtp
XSA/IGJhbmttYXhbaV0gOiByYW1zaXplOwo+ICAgCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
