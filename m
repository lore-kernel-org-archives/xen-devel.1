From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12 5/8] pvh/dom0: warn when dom0_mem is
 not set to a fixed value
Date: Wed, 30 Jan 2019 11:36:43 +0100
Message-ID: <20190130103646.53649-6-roger.pau@citrix.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CawQ=QG=citrix.com=prvs=9267fa6dd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gonF2-0001ON-RT
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 10:37:12 +0000
In-Reply-To: <20190130103646.53649-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaGF2ZSBiZWVuIHNldmVyYWwgcmVwb3J0cyBvZiB0aGUgZG9tMCBidWlsZGVyIHJ1bm5p
bmcgb3V0IG9mCm1lbW9yeSB3aGVuIGJ1aWxkaWduIGEgUFZIIGRvbTAgd2l0aG91dCBoYXZpbmdm
IHNwZWNpZmllZCBhIGRvbTBfbWVtCnZhbHVlLiBQcmludCBhIHdhcm5pbmcgbWVzc2FnZSBpZiBk
b20wX21lbSBpcyBub3Qgc2V0IHRvIGEgZml4ZWQgdmFsdWUKd2hlbiBib290aW5nIGluIFBWSCBt
b2RlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpXaXRob3V0
IHRoaXMgcGF0Y2ggY3JlYXRpbmcgYSBQVkggZG9tMCB3aXRob3V0IGEgZG9tMF9tZW0gcGFyYW1l
dGVyCmNhbiByZXN1bHQgaW4gdGhlIGRvbTAgYnVpbGRlciBydW5uaW5nIG91dCBvZiBtZW1vcnkg
dGh1cyBsZWFkaW5nIHRvIGEKWGVuIGNyYXNoLiBUaGUgYWRkZWQgbWVzc2FnZSBnaXZlcyBhIGhp
dCB0byB0aGUgdXNlciBhYm91dCBhIHBvc3NpYmxlCmZpeC4KLS0tCiB4ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1
aWxkLmMKaW5kZXggMmI0ZDllOWVhNi4uNDI3YTY2NWRkYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCkBAIC0zNDQs
NiArMzQ0LDEwIEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRvbTBfY29tcHV0ZV9ucl9wYWdlcygK
ICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkKICAgICAgICAg
cGFyc2VfZG9tMF9tZW0oQ09ORklHX0RPTTBfTUVNKTsKIAorICAgIGlmICggaXNfaHZtX2RvbWFp
bihkKSAmJiAhZG9tMF9zaXplLm5yX3BhZ2VzICkKKyAgICAgICAgcHJpbnRrKAorIldBUk5JTkc6
IGNvbnNpZGVyIHNldHRpbmcgZG9tMF9tZW0gdG8gYSBmaXhlZCB2YWx1ZSB3aGVuIHVzaW5nIFBW
SCBtb2RlXG4iKTsKKwogICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGRvbTBfbm9kZXMg
KQogICAgICAgICBhdmFpbCArPSBhdmFpbF9kb21oZWFwX3BhZ2VzX3JlZ2lvbihub2RlLCAwLCAw
KSArCiAgICAgICAgICAgICAgICAgIGluaXRpYWxfaW1hZ2VzX25ycGFnZXMobm9kZSk7Ci0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
