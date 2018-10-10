From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] iommu: fix arm build after e9be34be5
Date: Wed, 10 Oct 2018 11:12:50 +0200
Message-ID: <20181010091250.7w5ixmori4gge57i@mac.bytemobile.com>
References: <20181009185812.9597-1-wei.liu2@citrix.com>
 <bf56e8b6aa8945f694f0f8e8619b498f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5i9g=mw=citrix.com=prvs=81484c792=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gAAYC-0003Kl-Ge
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 09:13:04 +0000
Content-Disposition: inline
In-Reply-To: <bf56e8b6aa8945f694f0f8e8619b498f@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMTAsIDIwMTggYXQgMDk6NTk6MjFBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCBb
bWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYK
PiA+IE9mIFdlaSBMaXUKPiA+IFNlbnQ6IDA5IE9jdG9iZXIgMjAxOCAxOTo1OAo+ID4gVG86IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlcgo+ID4gUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQ
QVRDSF0gaW9tbXU6IGZpeCBhcm0gYnVpbGQgYWZ0ZXIgZTliZTM0YmU1Cj4gPiAKPiA+IFRoZSBm
dW5jdGlvbiBpb21tdV9zaGFyZV9wMm1fdGFibGUgaXMgdXNlZCBieSBib3RoIEFSTSBhbmQgeDg2
IGJ1dAo+ID4gaGFwX2VuYWJsZWQgbWFjcm8gaXMgeDg2IG9ubHkuIFB1dCB0aGUgQVNTRVJUIHVu
ZGVyIENPTkZJR19YODYuCj4gCj4gV291bGQgaXQgYmUgdW5yZWFzb25hYmxlIHRvIG1ha2UgaGFw
X2VuYWJsZWQoKSBjb21tb24gYW5kIGRlZmluZSBpdCB0byB0cnVlIGZvciBBUk0/CgpJIGFzc3Vt
ZWQgaGFwX2VuYWJsZWQgd2FzIGhhcmRjb2RlZCB0byB0cnVlIGZvciBBUk0sIGJ1dCBpdCdzIG9u
bHkKdXNlZCBpbiB4ODYgY29kZSBhbmQgdm1fZXZlbnQgc28gZmFyIChhbmQgaGVyZSBub3cpLCBz
byBJJ20gbm90IHN1cmUKaWYgaXQncyB3b3J0aCBpdC4KCkluIGFueSBjYXNlLCBJIHRoaW5rIHRo
aXMgc2hvdWxkIGdvIGluIGFzIGl0IGZpeGVzIHRoZSBidWlsZCwgYW5kCmFkZGluZyBoYXBfZW5h
YmxlZCBmb3IgQVJNIGNhbiBiZSBkb25lIGxhdGVyLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
