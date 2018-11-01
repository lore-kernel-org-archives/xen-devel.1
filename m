From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl/arm: fix guest type conversion
Date: Thu, 1 Nov 2018 10:38:47 +0000
Message-ID: <20181101103847.o2p7z6uz52tevysf@zion.uk.xensource.com>
References: <20181031142545.11142-1-wei.liu2@citrix.com>
 <500d3e00-e6d0-7bbe-2d43-f96b1b503c95@arm.com>
 <20181101085925.2v3zp5ucl2lahhun@zion.uk.xensource.com>
 <a764e9dd-e0a8-eb0d-af78-a1380f03178d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5wub=nm=citrix.com=prvs=836feaa16=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIANf-0005nq-J2
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 10:39:15 +0000
Content-Disposition: inline
In-Reply-To: <a764e9dd-e0a8-eb0d-af78-a1380f03178d@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMTA6MjY6MTZBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFdlaSwKPiAKPiBPbiAwMS8xMS8yMDE4IDA4OjU5LCBXZWkgTGl1IHdyb3RlOgo+
ID4gT24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDg6MTY6NTJQTSArMDAwMCwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+ID4gPiBIaSBXZWksCj4gPiA+IAo+ID4gPiBPbiAxMC8zMS8xOCAyOjI1IFBNLCBX
ZWkgTGl1IHdyb3RlOgo+ID4gPiA+IENvbW1pdCAzNTk5NzBmZDhiICgidG9vbHMvbGlieGw6IFN3
aXRjaCBBcm0gZ3Vlc3QgdHlwZSB0byBQVkgiKSBtaXNzZWQKPiA+ID4gPiBjaGFuZ2luZyB0aGUg
dHlwZSBmaWVsZCBpbiBjX2luZm8uIFRoaXMgaXNzdWUgZGlkbid0IHN1cmZhY2UgdW50aWwKPiA+
ID4gPiBlZjcyYzkzZGY5IHdoaWNoIG1hZGUgY3JlYXRpbmcgUFYgZ3Vlc3Qgb24gQXJtIHVudXNh
YmxlLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+ID4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBKdWxpZW4sIGNhbiB5b3UgZ2l2ZSB0aGlzIGEg
cXVpY2sgdGVzdD8gUHV0IHR5cGU9J3B2JyBpbiB5b3VyIEFybQo+ID4gPiA+IGd1ZXN0IHhsIGNm
ZyBhbmQgbm90ZSB0aGUgZGlmZmVyZW5jZSBiZWZvcmUgYW5kIGFmdGVyIHRoaXMgcGF0Y2guCj4g
PiA+IAo+ID4gPiBJIHRlc3RlZCBvbiBhcm02NCB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaDoK
PiA+ID4gCj4gPiA+IFRlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBzaG91bGQgZml4IGxpYnZpcnQgYnJlYWth
Z2UuCj4gPiA+ID4gLS0tCj4gPiA+ID4gICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAx
MCArKysrKysrKysrCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykK
PiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiA+IGluZGV4IDRiYjc1MGU5NTEuLjMx
MTk1N2Y4N2MgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
PiA+ID4gPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiA+IEBAIC0zNSw2
ICszNSwxNiBAQCBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhs
X19nYyAqZ2MsCj4gPiA+ID4gICAgICAgICAgICByZXR1cm4gRVJST1JfSU5WQUw7Cj4gPiA+ID4g
ICAgICAgIH0KPiA+ID4gPiArI2lmIGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX2FhcmNo
NjRfXykKPiA+ID4gPiArICAgIGlmIChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVf
UFYpIHsKPiA+ID4gPiArICAgICAgICBMT0coV0FSTiwgIkNvbnZlcnRpbmcgUFYgZ3Vlc3QgdG8g
UFZILiIpOwo+ID4gPiA+ICsgICAgICAgIExPRyhXQVJOLCAiQXJtIGd1ZXN0IGFyZSBub3cgUFZI
LiIpOwo+ID4gPiA+ICsgICAgICAgIExPRyhXQVJOLCAiUGxlYXNlIGZpeCB5b3VyIGNvbmZpZ3Vy
YXRpb24gZmlsZS90b29sc3RhY2suIik7Cj4gPiA+IAo+ID4gPiBXZSBub3cgZW5kIHVwIHRvIGhh
dmUgdGhpcyBtZXNzYWdlIHByaW50ZWQgdHdpY2UuCj4gPiAKPiA+IEkgdGhvdWdodCB3ZSBuZWVk
IHNvbWUgbG9nZ2luZyBzbyBJIGNvcGllZCB0aGVtIGhlcmUuCj4gCj4gSSB0aGluayB3ZSBjYW4g
cmVtb3ZlIHRoaXMgbG9nZ2luZyBpZiB3ZSByZWx5IG9uIGNfaW5mby0+dHlwZSA9PSBiX2luZm8t
PnR5cGUuCgpJIHdpbGwgY2hhbmdlIHRoZSBsb2dnaW5nIGluIGxpYnhsX2FybS5jLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
