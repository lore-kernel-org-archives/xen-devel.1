From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v2 03/17] libxl: Handle Linux stubdomain
 specific QEMU options.
Date: Fri, 19 Oct 2018 10:32:10 +0100
Message-ID: <20181019093210.vuybugbswtck3glj@mac.bytemobile.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <084e43a6ca74c8cb6ffb7301497f425b413cfc42.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.7417.911789.655502@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g1uh=m7=citrix.com=prvs=8231605b5=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gDR8z-0003k9-E8
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 09:32:33 +0000
Content-Disposition: inline
In-Reply-To: <23494.7417.911789.655502@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDY6MTY6NDFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltSRkMgUEFUQ0ggdjIg
MDMvMTddIGxpYnhsOiBIYW5kbGUgTGludXggc3R1YmRvbWFpbiBzcGVjaWZpYyBRRU1VIG9wdGlv
bnMuIik6Cj4gPiBGcm9tOiBFcmljIFNoZWx0b24gPGVzaGVsdG9uQHBvYm94LmNvbT4KPiA+IAo+
ID4gVGhpcyBwYXRjaCBjcmVhdGVzIGFuIGFwcHJvcHJpYXRlIGNvbW1hbmQgbGluZSBmb3IgdGhl
IFFFTVUgaW5zdGFuY2UKPiA+IHJ1bm5pbmcgaW4gYSBMaW51eC1iYXNlZCBzdHViZG9tYWluLgo+
IC4uLgo+ID4gLXN0YXRpYyBjb25zdCBjaGFyICpsaWJ4bF90YXBpZl9zY3JpcHQobGlieGxfX2dj
ICpnYykKPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqbGlieGxfdGFwaWZfc2NyaXB0KGxpYnhsX19n
YyAqZ2MsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBs
aWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbykKPiA+ICB7Cj4gPiAgI2lmIGRlZmluZWQoX19s
aW51eF9fKSB8fCBkZWZpbmVkKF9fRnJlZUJTRF9fKQo+ID4gKyAgICBpZiAoaW5mby0+c3R1YmRv
bWFpbl92ZXJzaW9uID09IExJQlhMX1NUVUJET01BSU5fVkVSU0lPTl9MSU5VWCkKPiA+ICsgICAg
ICAgIHJldHVybiBsaWJ4bF9fc3ByaW50ZihnYywgIi9ldGMvcWVtdS1pZnVwIik7Cj4gPiArICAg
IHJldHVybiBsaWJ4bF9fc3RyZHVwKGdjLCAibm8iKTsKPiA+ICsjZWxzZQo+ID4gKyAgICByZXR1
cm4gR0NTUFJJTlRGKCIlcy9xZW11LWlmdXAiLCBsaWJ4bF9feGVuX3NjcmlwdF9kaXJfcGF0aCgp
KTsKPiA+ICsjZW5kaWYKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmxpYnhs
X3RhcGlmX2Rvd25zY3JpcHQobGlieGxfX2djICpnYywKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5m
bykKPiA+ICt7Cj4gPiArI2lmIGRlZmluZWQoX19saW51eF9fKSB8fCBkZWZpbmVkKF9fRnJlZUJT
RF9fKQo+ID4gKyAgICBpZiAoaW5mby0+c3R1YmRvbWFpbl92ZXJzaW9uID09IExJQlhMX1NUVUJE
T01BSU5fVkVSU0lPTl9MSU5VWCkKPiA+ICsgICAgICAgIHJldHVybiBsaWJ4bF9fc3ByaW50Zihn
YywgIi9ldGMvcWVtdS1pZmRvd24iKTsKPiAKPiBXZSBzaG91bGQgbmV2ZXIgaGF2ZSBwZXJtaXR0
ZWQgdGhpcyAjaWZkZWZlcnkuICBUaGUgcmVzdWx0aW5nIGRpZmYKPiBoZXJlIGlzIGFsbW9zdCBp
bmNvbXByZWhlbnNpYmxlIGR1ZSB0byB0aGUgMyBsZXZlbHMgb2YgaW1wcm9wZXIKPiBuZXN0aW5n
OiBkaWZmLCBpZmRlZiwgYW5kIGNvZGUuCj4gCj4gQWxzbyB3ZSBkbyBub3QgY3VycmVudGx5IHN1
cHBvcnQgYW55IGRvbTAncyBvdGhlciB0aGFuIExpbnV4IGFuZAo+IEZyZWVCU0QgYW55d2F5IQoK
SSdtIG5vdCBzdXJlIHRoaXMgaXMgZW50aXJlbHkgdHJ1ZSwgSUlSQyBOZXRCU0QgcmVxdWlyZXMg
YSBRRU1VIG5pYwpob3RwbHVnIHNjcmlwdCBhbmQgaXMgc3RpbGwgc3VwcG9ydGVkOgoKaHR0cDov
L2N2c3dlYi5uZXRic2Qub3JnL2JzZHdlYi5jZ2kvcGtnc3JjL3N5c3V0aWxzL3hlbnRvb2xzNDgv
CgpUaGF0J3MgdGhlIHJlYXNvbiB3aHkgd2UgcmVxdWlyZSBzdWNoIGlmZGVmZXJ5LgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
