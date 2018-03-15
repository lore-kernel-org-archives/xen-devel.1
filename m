From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 03/14] x86emul: abstract out XCRn accesses
Date: Thu, 15 Mar 2018 10:08:12 -0600
Message-ID: <5AAAA87C02000078001B24BF@prv-mh.provo.novell.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
 <f3208b0b-b7cb-92bb-c75b-577aa10a8e07@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewVQU-0000dh-7q
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:08:22 +0000
In-Reply-To: <f3208b0b-b7cb-92bb-c75b-577aa10a8e07@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE2OjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUu
Ywo+PiBAQCAtNDIsMyArNDIsNTAgQEAKPj4gIH0pCj4+ICAKPj4gICNpbmNsdWRlICJ4ODZfZW11
bGF0ZS94ODZfZW11bGF0ZS5jIgo+PiArCj4+ICtpbnQgeDg2ZW11bF9yZWFkX3hjcih1bnNpZ25l
ZCBpbnQgcmVnLCB1aW50NjRfdCAqdmFsLAo+PiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCj4+ICt7Cj4+ICsgICAgc3dpdGNoICggcmVnICkKPj4g
KyAgICB7Cj4+ICsgICAgY2FzZSAwOgo+PiArICAgICAgICAqdmFsID0gY3VycmVudC0+YXJjaC54
Y3IwOwo+PiArICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+PiArCj4+ICsgICAgY2FzZSAx
Ogo+PiArICAgICAgICBpZiAoIGNwdV9oYXNfeGdldGJ2MSAmJiBjdXJyZW50LT5kb21haW4tPmFy
Y2guY3B1aWQtPnhzdGF0ZS54Z2V0YnYxICkKPj4gKyAgICAgICAgICAgIGJyZWFrOwo+PiArICAg
ICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPj4gKyAgICBkZWZhdWx0Ogo+PiArICAgICAgICB4ODZf
ZW11bF9od19leGNlcHRpb24oVFJBUF9ncF9mYXVsdCwgMCwgY3R4dCk7Cj4+ICsgICAgICAgIHJl
dHVybiBYODZFTVVMX0VYQ0VQVElPTjsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICAqdmFsID0geGdl
dGJ2KHJlZyk7Cj4+ICsKPj4gKyAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+PiArfQo+PiArCj4+
ICtpbnQgeDg2ZW11bF93cml0ZV94Y3IodW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgdmFsLAo+
PiArICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0KQo+
PiArewo+PiArICAgIHN3aXRjaCAoIHJlZyApCj4+ICsgICAgewo+PiArICAgIGNhc2UgMDoKPj4g
KyAgICAgICAgYnJlYWs7Cj4+ICsKPj4gKyAgICBjYXNlIDE6Cj4+ICsgICAgICAgIGlmICggY3B1
X2hhc194Z2V0YnYxICYmIGN1cnJlbnQtPmRvbWFpbi0+YXJjaC5jcHVpZC0+eHN0YXRlLnhnZXRi
djEgKQo+PiArICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAq
Lwo+IAo+IEFjdHVhbGx5LCB0aGlzIGlzIHdyb25nLiAgY3B1X2hhc194Z2V0YnYxIGFwcGxpZXMg
b25seSB0byB0aGUgcmVhZAo+IHNpZGUuICB4c2V0YnZbMV0gaXMgc3RpbGwgc3RyaWN0bHkgcmVz
ZXJ2ZWQgYW5kIHlpZWxkcyAjR1AuICAoR2l2ZW4gdGhlCj4gd2F5IG90aGVyIGJpdHMgaW4geGNy
MCB3b3JrLCBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB4c2V0YnZbMV0gaXMKPiByZXNlcnZl
ZCBmb3JldmVyIG1vcmUuKQo+IAo+IEknZCBqdXN0IGRyb3AgdGhpcyBjYXNlIGJsb2NrIGFuZCBs
ZXQgMSBmYWxsIGludG8gdGhlIGRlZmF1bHQgY2FzZSwKPiByYXRoZXIgdGhhbiByZWx5aW5nIG9u
IHRoZSBzYW5pdHkgY2hlY2sgaW4gaGFuZGxlX3hzZXRidigpCgpPaCwgaW5kZWVkLCB0aGlzIHdh
cyByYXRoZXIgc2lsbHkgb2YgbWUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
