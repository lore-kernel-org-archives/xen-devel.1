From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 1/7] xen/pvshim: map vcpu_info earlier for APs
Date: Thu, 18 Jan 2018 11:02:46 +0000
Message-ID: <20180118110252.41504-2-roger.pau@citrix.com>
References: <20180118110252.41504-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec7z9-0005nJ-UN
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:03:55 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSBpbml0X3BlcmNwdV90aW1lIGlzIGdvaW5nIHRvIGRlcmVmZXJlbmNlIGEgTlVMTCBw
b2ludGVyIHdoZW4KdHJ5aW5nIHRvIGFjY2VzcyB2Y3B1X2luZm8uCgpTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KLS0tClNob3VsZCBiZSBiYWNrcG9ydGVkIHRvIHRoZSA0LjEwLjAtc2hpbS1jb21ldCBicmFu
Y2guCi0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4IDYzY2EwNTNiMzUu
LjJjZGQ0MzFiNWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVu
L2FyY2gveDg2L3NtcGJvb3QuYwpAQCAtMzQ5LDYgKzM0OSw5IEBAIHZvaWQgc3RhcnRfc2Vjb25k
YXJ5KHZvaWQgKnVudXNlZCkKICAgICBlbHNlCiAgICAgICAgIG1pY3JvY29kZV9yZXN1bWVfY3B1
KGNwdSk7CiAKKyAgICBpZiAoIHhlbl9ndWVzdCApCisgICAgICAgIGh5cGVydmlzb3JfYXBfc2V0
dXAoKTsKKwogICAgIHNtcF9jYWxsaW4oKTsKIAogICAgIGluaXRfcGVyY3B1X3RpbWUoKTsKQEAg
LTM3Niw5ICszNzksNiBAQCB2b2lkIHN0YXJ0X3NlY29uZGFyeSh2b2lkICp1bnVzZWQpCiAgICAg
Y3B1bWFza19zZXRfY3B1KGNwdSwgJmNwdV9vbmxpbmVfbWFwKTsKICAgICB1bmxvY2tfdmVjdG9y
X2xvY2soKTsKIAotICAgIGlmICggeGVuX2d1ZXN0ICkKLSAgICAgICAgaHlwZXJ2aXNvcl9hcF9z
ZXR1cCgpOwotCiAgICAgLyogV2UgY2FuIHRha2UgaW50ZXJydXB0cyBub3c6IHdlJ3JlIG9mZmlj
aWFsbHkgInVwIi4gKi8KICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiAgICAgbXRycl9hcF9pbml0
KCk7Ci0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
