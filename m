From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH RFC v1 57/74] x86/pv-shim: shadow PV
 console's page for L2 DomU
Date: Tue, 9 Jan 2018 15:43:43 +0000
Message-ID: <1515512623.4118.3.camel@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-58-wei.liu2@citrix.com>
 <5A5495BD020000780019C96B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jntn=ee=citrix.com=prvs=5401c877c=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1eYw47-0007U5-Nt
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 15:43:51 +0000
In-Reply-To: <5A5495BD020000780019C96B@prv-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <1D0363218D0CA14A8D04D78BE978C535@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "JBeulich@suse.com" <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMDE4LTAxLTA5IGF0IDAyOjEzIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiA+ID4gT24gMDQuMDEuMTggYXQgMTQ6MDYsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToN
Cj4gPiArc2l6ZV90IGNvbnNvbGVkX2d1ZXN0X3J4KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHNp
emVfdCByZWN2ID0gMCwgaWR4ID0gMDsNCj4gPiArICAgIFhFTkNPTlNfUklOR19JRFggY29ucywg
cHJvZDsNCj4gPiArDQo+ID4gKyAgICBpZiAoICFjb25zX3JpbmcgKQ0KPiA+ICsgICAgICAgIHJl
dHVybiAwOw0KPiA+ICsNCj4gPiArICAgIHNwaW5fbG9jaygmcnhfbG9jayk7DQo+ID4gKw0KPiA+
ICsgICAgY29ucyA9IGNvbnNfcmluZy0+b3V0X2NvbnM7DQo+ID4gKyAgICBwcm9kID0gQUNDRVNT
X09OQ0UoY29uc19yaW5nLT5vdXRfcHJvZCk7DQo+ID4gKyAgICBBU1NFUlQoKHByb2QgLSBjb25z
KSA8PSBzaXplb2YoY29uc19yaW5nLT5vdXQpKTsNCj4gPiArDQo+ID4gKyAgICAvKiBJcyB0aGUg
cmluZyBlbXB0eT8gKi8NCj4gPiArICAgIGlmICggY29ucyA9PSBwcm9kICkNCj4gPiArICAgICAg
ICBnb3RvIG91dDsNCj4gPiArDQo+ID4gKyAgICAvKiBVcGRhdGUgcG9pbnRlcnMgYmVmb3JlIGFj
Y2Vzc2luZyB0aGUgcmluZyAqLw0KPiA+ICsgICAgc21wX3JtYigpOw0KPiANCj4gSSB0aGluayB0
aGlzIG5lZWQgdG8gbW92ZSB1cCBhaGVhZCBvZiB0aGUgaWYoKS4gSW4gdGhlIGNvbW1lbnQNCj4g
cGVyaGFwcyBzL1VwZGF0ZS9MYXRjaC8/DQoNClRoZSByZWFkL3dyaXRlIG1lbW9yeSBiYXJyaWVy
cyBoZXJlIGFyZSBiZXR3ZWVuIHJlYWQvd3JpdGUgYWNjZXNzZXMgdG8NCnJpbmctPm91dF9wcm9k
IGFuZCByaW5nLT5vdXQgYXJyYXkuIFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gbW92ZSB0aGVtLg0K
KHRoZSBzYW1lIGdvZXMgZm9yIHRoZSBpbnB1dCByaW5nKQ0KDQotLSANClRoYW5rcywNClNlcmdl
eQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
