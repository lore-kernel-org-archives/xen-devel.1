From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 03/14] x86emul: abstract out XCRn accesses
Date: Thu, 15 Mar 2018 07:44:09 -0600
Message-ID: <5AAA86B902000078001B234A@prv-mh.provo.novell.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
 <ccc22bbf-3ccd-5ee0-7904-0ed1d725702b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewTB4-0007pI-He
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 13:44:18 +0000
In-Reply-To: <ccc22bbf-3ccd-5ee0-7904-0ed1d725702b@citrix.com>
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

Pj4+IE9uIDE1LjAzLjE4IGF0IDE0OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAgc3RhdGljIGlu
bGluZSB2b2lkIHg4Nl9lbXVsX2h3X2V4Y2VwdGlvbigKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKPj4gQEAgLTQy
LDMgKzQyLDUwIEBACj4+ICB9KQo+PiAgCj4+ICAjaW5jbHVkZSAieDg2X2VtdWxhdGUveDg2X2Vt
dWxhdGUuYyIKPj4gKwo+PiAraW50IHg4NmVtdWxfcmVhZF94Y3IodW5zaWduZWQgaW50IHJlZywg
dWludDY0X3QgKnZhbCwKPj4gKyAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ODZfZW11bGF0
ZV9jdHh0ICpjdHh0KQo+PiArewo+PiArICAgIHN3aXRjaCAoIHJlZyApCj4+ICsgICAgewo+PiAr
ICAgIGNhc2UgMDoKPj4gKyAgICAgICAgKnZhbCA9IGN1cnJlbnQtPmFyY2gueGNyMDsKPj4gKyAg
ICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPj4gKwo+PiArICAgIGNhc2UgMToKPj4gKyAgICAg
ICAgaWYgKCBjcHVfaGFzX3hnZXRidjEgJiYgY3VycmVudC0+ZG9tYWluLT5hcmNoLmNwdWlkLT54
c3RhdGUueGdldGJ2MSApCj4gCj4gWW91IGNhbiBkcm9wIHRoZSBjcHVfaGFzX3hnZXRidjEgcGFy
dCBvZiB0aGlzIHRlc3QuICBUaGUgQ1BVSUQgcG9saWN5Cj4gZGVyaXZhdGlvbiBsb2dpYyB3b24n
dCBhbGxvdyB4c3RhdGUueGdldGJ2MSB0byBiZSBzZXQgd2l0aG91dAo+IGNwdV9oYXNfeGdldGJ2
MQoKSG1tLCBJIHdhc24ndCBzdXJlOiBJcyB0aGF0IGFscmVhZHkgdGhlIGNhc2U/IEkgdGhvdWdo
dAphdWRpdGluZyBvZiB3aGF0IHRoZSB0b29sIHN0YWNrIHByb3ZpZGVzIGlzIG9ubHkgcGxhbm5l
ZC4KCj4gT3RoZXJ3aXNlLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClRoYW5rcywgYnV0IHBsZWFzZSBjbGFyaWZ5IHRoZSBhYm92ZS4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
