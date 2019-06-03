From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 08/10] xen/arm: optee: add support for
 RPC commands
Date: Mon, 3 Jun 2019 13:33:07 +0100
Message-ID: <18931d6c-ccf7-871a-b75e-c284d2434770@arm.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-9-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXm9G-0004ES-BW
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:33:10 +0000
In-Reply-To: <20190521212530.12706-9-volodymyr_babchuk@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gT1AtVEVFIGNhbiBpc3N1ZSBtdWx0aXBsZSBSUEMgcmVxdWVzdHMuIFdlIGFyZSBpbnRl
cmVzdGVkIG1vc3RseSBpbgo+IHJlcXVlc3QgdGhhdCBhc2tzIE5XIHRvIGFsbG9jYXRlL2ZyZWUg
c2hhcmVkIG1lbW9yeSBmb3IgT1AtVEVFCj4gbmVlZHMsIGJlY2F1c2UgbWVkaWF0b3IgbmVlZHMg
dG8gZG8gYWRkcmVzcyB0cmFuc2xhdGlvbiBpbiB0aGUgc2FtZQo+IHdheSBhcyBpdCB3YXMgZG9u
ZSBmb3Igc2hhcmVkIGJ1ZmZlcnMgcmVnaXN0ZXJlZCBieSBOVy4KPiAKPiBPUC1URUUgY2FuIGFz
ayBOVyB0byBhbGxvY2F0ZSBtdWx0aXBsZSBidWZmZXJzIGR1cmluZyB0aGUgY2FsbC4gIFdlCj4g
a25vdyB0aGF0IGlmIE9QLVRFRSBhc2tzIGZvciBhbm90aGVyIGJ1ZmZlciwgd2UgY2FuIGZyZWUg
cGdsaXN0IGZvcgo+IHRoZSBwcmV2aW91cyBvbmUuCj4gCj4gQXMgbWVkaWF0b3Igbm93IGFjY2Vz
c2VzIHNoYXJlZCBjb21tYW5kIGJ1ZmZlciwgd2UgbmVlZCB0byBzaGFkb3cKPiBpdCBpbiB0aGUg
c2FtZSB3YXksIGFzIHdlIHNoYWRvdyByZXF1ZXN0IGJ1ZmZlcnMgZm9yIFNURCBjYWxscy4KPiBF
YXJsaWVyLCB3ZSBqdXN0IHBhc3NlZCBhZGRyZXNzIG9mIHRoaXMgYnVmZmVyIHRvIE9QLVRFRSwg
YnV0Cj4gbm93IHdlIG5lZWQgdG8gcmVhZCBhbmQgd3JpdGUgdG8gaXQsIHNvIGl0IHNob3VsZCBi
ZSBzaGFkb3dlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5
bXlyX2JhYmNodWtAZXBhbS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
