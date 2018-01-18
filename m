From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 3/7] xen/pvshim: identity pin shim vCPUs to
	pCPUs
Date: Thu, 18 Jan 2018 11:02:48 +0000
Message-ID: <20180118110252.41504-4-roger.pau@citrix.com>
References: <20180118110252.41504-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec81Q-0006Kn-6E
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:06:16 +0000
In-Reply-To: <20180118110252.41504-1-roger.pau@citrix.com>
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
Y29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KQ2M6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDYzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNl
IHYxOgogLSBDbGFyaWZ5IGNvbW1pdCBtZXNzYWdlLgotLS0KU2hvdWxkIGJlIGJhY2twb3J0ZWQg
dG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0IGJyYW5jaC4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tMF9i
dWlsZC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIGIveGVuL2Fy
Y2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCAxN2NiMTI3MmMxLi41NTU2NjBiODUzIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1
aWxkLmMKQEAgLTE0MCw5ICsxNDAsOCBAQCBzdHJ1Y3QgdmNwdSAqX19pbml0IGRvbTBfc2V0dXBf
dmNwdShzdHJ1Y3QgZG9tYWluICpkLAogICAgIHsKICAgICAgICAgaWYgKCBwdl9zaGltICkKICAg
ICAgICAgewotCi0gICAgICAgICAgICBjcHVtYXNrX3NldGFsbCh2LT5jcHVfaGFyZF9hZmZpbml0
eSk7Ci0gICAgICAgICAgICBjcHVtYXNrX3NldGFsbCh2LT5jcHVfc29mdF9hZmZpbml0eSk7Cisg
ICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdSh2Y3B1X2lkLCB2LT5jcHVfaGFyZF9hZmZpbml0
eSk7CisgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdSh2Y3B1X2lkLCB2LT5jcHVfc29mdF9h
ZmZpbml0eSk7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICB7Ci0tIAoyLjE1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
