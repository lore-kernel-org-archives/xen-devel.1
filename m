From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 3/6] xen/pvshim: identity pin shim vCPUs to
	pCPUs
Date: Wed, 17 Jan 2018 16:29:07 +0000
Message-ID: <20180117162907.37974-1-roger.pau@citrix.com>
References: <20180117111609.hlur2q5r34ld6ujf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebqae-0007WF-Lv
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:29:28 +0000
In-Reply-To: <20180117111609.hlur2q5r34ld6ujf@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgVkNQVU9QX3t1cC9kb3dufSBhbHJlYWR5IGlkZW50aXR5IG1hcHMgdkNQVSBob3RwbHVn
IHRvIHBDUFUKaG90cGx1ZyBhbHNvIGlkZW50aXR5IHBpbiB0aGUgdkNQVXMgdG8gdGhlIHBDUFVz
IGluIHRoZSBzY2hlZHVsZXIuClRoaXMgcHJldmVudHMgdkNQVSBtaWdyYXRpb24gYW5kIHNob3Vs
ZCBpbXByb3ZlIHBlcmZvcm1hbmNlLgoKV2hpbGUgdGhlcmUgYWxzbyB1c2UgX19jcHVtYXNrX3Nl
dF9jcHUgaW5zdGVhZCBvZiBjcHVtYXNrX3NldF9jcHUsCnRoZXJlJ3Mgbm8gbmVlZCB0byB1c2Ug
dGhlIGxvY2tlZCB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBDbGFyaWZ5IGNvbW1pdCBtZXNzYWdlLgotLS0KU2hvdWxk
IGJlIGJhY2twb3J0ZWQgdG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0IGJyYW5jaC4KLS0tCiB4ZW4v
YXJjaC94ODYvZG9tMF9idWlsZC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tMF9i
dWlsZC5jIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCAxN2NiMTI3MmMxLi41NTU2
NjBiODUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9kb20wX2J1aWxkLmMKQEAgLTE0MCw5ICsxNDAsOCBAQCBzdHJ1Y3QgdmNwdSAqX19p
bml0IGRvbTBfc2V0dXBfdmNwdShzdHJ1Y3QgZG9tYWluICpkLAogICAgIHsKICAgICAgICAgaWYg
KCBwdl9zaGltICkKICAgICAgICAgewotCi0gICAgICAgICAgICBjcHVtYXNrX3NldGFsbCh2LT5j
cHVfaGFyZF9hZmZpbml0eSk7Ci0gICAgICAgICAgICBjcHVtYXNrX3NldGFsbCh2LT5jcHVfc29m
dF9hZmZpbml0eSk7CisgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdSh2Y3B1X2lkLCB2LT5j
cHVfaGFyZF9hZmZpbml0eSk7CisgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdSh2Y3B1X2lk
LCB2LT5jcHVfc29mdF9hZmZpbml0eSk7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAg
ICB7Ci0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
