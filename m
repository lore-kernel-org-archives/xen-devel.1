From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 1/8] viridian: add init hooks
Date: Tue, 29 Jan 2019 11:56:36 +0000
Message-ID: <aeaecee78c664dfa8b83cccce910622f@AMSPEX02CL03.citrite.net>
References: <20190108151811.19510-1-paul.durrant@citrix.com>
 <20190108151811.19510-2-paul.durrant@citrix.com>
 <5C503D67020000780014B898@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wKt=QF=citrix.com=prvs=925d89a54=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1goS0N-0000k2-Rf
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 11:56:39 +0000
In-Reply-To: <5C503D67020000780014B898@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
amJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjkgSmFudWFyeSAyMDE5IDExOjQ4Cj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgeGVuLQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzhdIHZpcmlk
aWFuOiBhZGQgaW5pdCBob29rcwo+IAo+ID4+PiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPiAwMS8wOC8xOSA0OjE4IFBNID4+Pgo+ID4tLS0gYS94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gPisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+QEAgLTY2NSwxMiArNjY1
LDE4IEBAIGludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCkKPiA+aWYg
KCBodm1fdHNjX3NjYWxpbmdfc3VwcG9ydGVkICkKPiA+ZC0+YXJjaC5odm0udHNjX3NjYWxpbmdf
cmF0aW8gPSBodm1fZGVmYXVsdF90c2Nfc2NhbGluZ19yYXRpbzsKPiAgPgo+ID4rICAgIHJjID0g
dmlyaWRpYW5fZG9tYWluX2luaXQoZCk7Cj4gPisgICAgaWYgKCByYyApCj4gPisgICAgICAgIGdv
dG8gZmFpbDI7Cj4gPisKPiA+cmMgPSBodm1fZnVuY3MuZG9tYWluX2luaXRpYWxpc2UoZCk7Cj4g
PmlmICggcmMgIT0gMCApCj4gPi0gICAgICAgIGdvdG8gZmFpbDI7Cj4gPisgICAgICAgIGdvdG8g
ZmFpbDM7Cj4gID4KPiA+cmV0dXJuIDA7Cj4gID4KPiA+KyBmYWlsMzoKPiA+KyAgICB2aXJpZGlh
bl9kb21haW5fZGVpbml0KGQpOwo+ID5mYWlsMjoKPiA+cnRjX2RlaW5pdChkKTsKPiA+c3Rkdmdh
X2RlaW5pdChkKTsKPiAKPiBJbiBvcmRlciB0byBhdm9pZCB0aGUgYWRkaXRpb24gb2Ygc3VjaCBl
eHRyYSBuZXcgbGFiZWxzLCBhbmQgaW4gbGluZSB3aXRoCj4gQW5kcmV3J3MgcmVxdWVzdCBmb3Ig
ZGUtaW5pdCBmdW5jdGlvbnMgdG8gYmUgaWRlbXBvdGVudCwgY291bGRuJ3QgeW91Cj4gYXJyYW5n
ZSBmb3IgdGhlIHR3byBkZS1pbml0IGZ1bmN0aW9ucyBoZXJlIHRvIHJlbWFpbiBpZGVtcG90ZW50
ICh0aGV5Cj4gbG9vayB0byBiZSBhdCBwcmVzZW50KSwgaW4gd2hpY2ggY2FzZSB5b3UgY291bGQg
bW92ZSB0aGVyZSBpbnZvY2F0aW9ucwo+IGZyb20gdGhlIGluaXQgcGF0aHMgaGVyZSBkb3duIHBh
c3QgYWxsIHRoZSBvdGhlciBjbGVhbnVwIGZ1bmN0aW9ucyB3aGljaAo+IGNhbiBvbmx5IGJlIGNh
bGxlZCB3aGVuIHRoZWlyIHJlc3BlY3RpdmUgaW5pdCBjb2RlIGhhcyBydW4/CgpZZXMsIHN1cmUu
IEknbGwgZG8gdGhhdC4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
