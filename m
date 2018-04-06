From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.11 2/2] x86: remove unused parameter from
 smp_prepare_cpus
Date: Fri, 6 Apr 2018 10:36:45 +0100
Message-ID: <20180406093645.6444-3-wei.liu2@citrix.com>
References: <20180406093645.6444-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v2h2=g3=citrix.com=prvs=627d9795c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f4Nnf-0002gh-JO
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 09:36:51 +0000
In-Reply-To: <20180406093645.6444-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyAgIHwgMiArLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDIgKy0KIHhl
bi9pbmNsdWRlL3hlbi9zbXAuaCAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBi
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGMwYjk3YTc0OGEuLjQ5Y2Y5NjNkN2EgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBA
IC0xNTc2LDcgKzE1NzYsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIG1iaV9wKQogCiAgICAgaW9tbXVfc2V0dXAoKTsgICAgLyogc2V0dXAgaW9tbXUg
aWYgYXZhaWxhYmxlICovCiAKLSAgICBzbXBfcHJlcGFyZV9jcHVzKG1heF9jcHVzKTsKKyAgICBz
bXBfcHJlcGFyZV9jcHVzKCk7CiAKICAgICBzcGluX2RlYnVnX2VuYWJsZSgpOwogCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRl
eCA5ODg3M2RmNDI5Li41ZGFhNzkzNmFhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTEwMzAsNyArMTAzMCw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgY3B1X3NtcGJvb3RfbmZiID0gewogICAgIC5ub3Rp
Zmllcl9jYWxsID0gY3B1X3NtcGJvb3RfY2FsbGJhY2sKIH07CiAKLXZvaWQgX19pbml0IHNtcF9w
cmVwYXJlX2NwdXModW5zaWduZWQgaW50IG1heF9jcHVzKQordm9pZCBfX2luaXQgc21wX3ByZXBh
cmVfY3B1cyh2b2lkKQogewogICAgIGludCByYzsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3NtcC5oIGIveGVuL2luY2x1ZGUveGVuL3NtcC5oCmluZGV4IGM1NWY1N2YwOWUuLmE2NGM5
YjM4ODIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zbXAuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc21wLmgKQEAgLTE3LDcgKzE3LDcgQEAgZXh0ZXJuIHZvaWQgc21wX3NlbmRfc3RhdGVf
ZHVtcCh1bnNpZ25lZCBpbnQgY3B1KTsKIC8qCiAgKiBQcmVwYXJlIG1hY2hpbmUgZm9yIGJvb3Rp
bmcgb3RoZXIgQ1BVcy4KICAqLwotZXh0ZXJuIHZvaWQgc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25l
ZCBpbnQgbWF4X2NwdXMpOworZXh0ZXJuIHZvaWQgc21wX3ByZXBhcmVfY3B1cyh2b2lkKTsKIAog
LyoKICAqIEZpbmFsIHBvbGlzaGluZyBvZiBDUFVzCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
