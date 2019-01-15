From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Tue, 15 Jan 2019 20:49:46 +0800
Message-ID: <b7a0d3ee-aefd-2917-bcd3-a8fac9c773c5@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
 <5C3CB2EC020000780020D68E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N85w=PX=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gjOGP-000179-H9
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 12:56:17 +0000
In-Reply-To: <5C3CB2EC020000780020D68E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8xLzE1IDA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjEyLjE4IGF0
IDE0OjEyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1
L3ZwbXUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYwo+PiBAQCAtNDczLDYgKzQ3
Myw3IEBAIHN0YXRpYyBpbnQgdnBtdV9hcmNoX2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4+
ICAgCj4+ICAgICAgIHN3aXRjaCAoIHZlbmRvciApCj4+ICAgICAgIHsKPj4gKyAgICBjYXNlIFg4
Nl9WRU5ET1JfSFlHT046Cj4+ICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6Cj4+ICAgICAgICAg
ICByZXQgPSBzdm1fdnBtdV9pbml0aWFsaXNlKHYpOwo+PiAgICAgICAgICAgYnJlYWs7Cj4+IEBA
IC04OTAsNiArODkxLDcgQEAgc3RhdGljIGludCBfX2luaXQgdnBtdV9pbml0KHZvaWQpCj4+ICAg
Cj4+ICAgICAgIHN3aXRjaCAoIHZlbmRvciApCj4+ICAgICAgIHsKPj4gKyAgICBjYXNlIFg4Nl9W
RU5ET1JfSFlHT046Cj4+ICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6Cj4+ICAgICAgICAgICBp
ZiAoIGFtZF92cG11X2luaXQoKSApCj4+ICAgICAgICAgICAgICB2cG11X21vZGUgPSBYRU5QTVVf
TU9ERV9PRkY7Cj4gCj4gSGVyZSBhbmQgZXZlcnl3aGVyZSBlbHNlLCBtYXkgSSBhc2sgdGhhdCB5
b3UgZG8geW91ciBpbnNlcnRpb25zCj4gYmVsb3cgdGhlIHJlc3BlY3RpdmUgQU1EIG9uZXMgaW5z
dGVhZCBvZiBhYm92ZT8KCkluIGFsbCB0aGUgc3dpdGNoIGNhc2VzLCBpZiBIeWdvbiBkaXJlY3Rs
eSBmb2xsb3dlZCBBTUQncyBjYXNlcywgdGhlCmluc2VydGlvbnMgYXJlIHBsYWNlZCBhYm92ZSB0
aGUgcmVzcGVjdGl2ZSBBTUQgb25lcy4KCklmIEh5Z29uIHVzZWQgaXRzIG93biBjYXNlcywgc3Vj
aCBhcyBpbiBjYWxjX2xlcl9tc3IsIHRoZSBuZXcgY2FzZXMKYXJlIHBsYWNlZCBiZWxvdyB0aGUg
QU1EIG9uZXMuCgotLSAKUmVnYXJkcywKUHUgV2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
