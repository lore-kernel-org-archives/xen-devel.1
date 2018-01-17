From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/6] xen/pvshim: map vcpu_info earlier for APs
Date: Wed, 17 Jan 2018 09:48:09 +0000
Message-ID: <20180117094814.32772-2-roger.pau@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebkKr-0004Nr-G7
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 09:48:45 +0000
In-Reply-To: <20180117094814.32772-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSBpbml0X3BlcmNwdV90aW1lIGlzIGdvaW5nIHRvIGRlcmVmZXJlbmNlIGEgTlVMTCBw
b2ludGVyIHdoZW4KdHJ5aW5nIHRvIGFjY2VzcyB2Y3B1X2luZm8uCgpTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNj
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KU2hvdWxkIGJlIGJhY2twb3J0ZWQg
dG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0IGJyYW5jaC4KLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9v
dC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4
Ni9zbXBib290LmMKaW5kZXggNjNjYTA1M2IzNS4uMmNkZDQzMWI1ZiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC0zNDks
NiArMzQ5LDkgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCAqdW51c2VkKQogICAgIGVsc2UK
ICAgICAgICAgbWljcm9jb2RlX3Jlc3VtZV9jcHUoY3B1KTsKIAorICAgIGlmICggeGVuX2d1ZXN0
ICkKKyAgICAgICAgaHlwZXJ2aXNvcl9hcF9zZXR1cCgpOworCiAgICAgc21wX2NhbGxpbigpOwog
CiAgICAgaW5pdF9wZXJjcHVfdGltZSgpOwpAQCAtMzc2LDkgKzM3OSw2IEBAIHZvaWQgc3RhcnRf
c2Vjb25kYXJ5KHZvaWQgKnVudXNlZCkKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X29u
bGluZV9tYXApOwogICAgIHVubG9ja192ZWN0b3JfbG9jaygpOwogCi0gICAgaWYgKCB4ZW5fZ3Vl
c3QgKQotICAgICAgICBoeXBlcnZpc29yX2FwX3NldHVwKCk7Ci0KICAgICAvKiBXZSBjYW4gdGFr
ZSBpbnRlcnJ1cHRzIG5vdzogd2UncmUgb2ZmaWNpYWxseSAidXAiLiAqLwogICAgIGxvY2FsX2ly
cV9lbmFibGUoKTsKICAgICBtdHJyX2FwX2luaXQoKTsKLS0gCjIuMTUuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
