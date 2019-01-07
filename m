From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/dom0: change align type to int
Date: Mon, 7 Jan 2019 17:33:14 +0100
Message-ID: <20190107163314.eocddymuqggrukmf@mac>
References: <20190104151422.38797-1-roger.pau@citrix.com>
 <5C2F7D4A020000780020A470@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D5so=PP=citrix.com=prvs=9034de270=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ggXqx-0004RA-Fg
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 16:34:15 +0000
Content-Disposition: inline
In-Reply-To: <5C2F7D4A020000780020A470@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMDg6MzU6MzhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE5IGF0IDE2OjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVGhlcmUncyBubyByZWFzb24gdG8gdXNlIGxvbmcgdG8gc3RvcmUgdGhlIGFsaWdu
bWVudCwgc2luY2UgdGhlIGJpZ2dlcgo+IAo+IGJpZ2dlc3Q/Cj4gCj4gPiBwYWdlIHNpemUgaXMg
MUdCLCBhbmQgdGhlIGFsaWdubWVudCBpcyBzdG9yZWQgYXMgYSBmcmFtZSBudW1iZXIuCj4gPiAK
PiA+IFJlcG9ydGVkLWJ5OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0t
LQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQu
YyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+ID4gaW5kZXggNWFlM2EzMjA2MC4uYjY5
NjEwMDA0MyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4g
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+ID4gQEAgLTkyLDggKzkyLDcg
QEAgc3RhdGljIGludCBfX2luaXQgcHZoX3BvcHVsYXRlX21lbW9yeV9yYW5nZShzdHJ1Y3QgZG9t
YWluICpkLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBucl9wYWdlcykKPiA+ICB7Cj4gPiAgICAgIHN0cnVjdCB7Cj4gPiAtICAg
ICAgICB1bnNpZ25lZCBsb25nIGFsaWduOwo+ID4gLSAgICAgICAgdW5zaWduZWQgaW50IG9yZGVy
Owo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGFsaWduLCBvcmRlcjsKPiA+ICAgICAgfSBzdGF0
aWMgY29uc3QgX19pbml0Y29uc3Qgb3JkZXJzW10gPSB7Cj4gPiAgICAgICAgICAvKiBOQjogbXVz
dCBiZSBzb3J0ZWQgYnkgZGVjcmVhc2luZyBzaXplLiAqLwo+ID4gICAgICAgICAgeyAuYWxpZ24g
PSBQRk5fRE9XTihHQigxKSksIC5vcmRlciA9IFBBR0VfT1JERVJfMUcgfSwKPiAKPiBUaGF0J3Mg
bm90IGVub3VnaCBhZmFpY3QsIHlvdSBhbHNvIG5lZWQgdG8gdXNlIDFVTCBpbgo+IAo+ICAgICAg
ICAgICAgIGVuZCA9IChzdGFydCArIG5yX3BhZ2VzKSAmIH4ob3JkZXJzWzBdLmFsaWduIC0gMSk7
CgpSaWdodCwgSSdtIGFmcmFpZCBJIHByZWZlciB0byBrZWVwIGFsaWduIGFzIHVuc2lnbmVkIGxv
bmcgaW4gb3JkZXIgdG8KYXZvaWQgc3VjaCBtaXN0YWtlcy4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
