From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 18/23] x86/domctl: XEN_DOMCTL_debug_op is HVM
 only
Date: Sun, 26 Aug 2018 13:19:51 +0100
Message-ID: <1d6dd975943d14a77bd09c434ad7f5503226968d.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9u-0000bb-Fb
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:46 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZG9tY3RsLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5j
CmluZGV4IGFiODU0ODkuLjZmMWM0M2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwu
YworKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKQEAgLTk3NSw2ICs5NzUsNyBAQCBsb25nIGFy
Y2hfZG9fZG9tY3RsKAogICAgICAgICBkLT5hcmNoLnN1cHByZXNzX3NwdXJpb3VzX3BhZ2VfZmF1
bHRzID0gMTsKICAgICAgICAgYnJlYWs7CiAKKyNpZmRlZiBDT05GSUdfSFZNCiAgICAgY2FzZSBY
RU5fRE9NQ1RMX2RlYnVnX29wOgogICAgIHsKICAgICAgICAgc3RydWN0IHZjcHUgKnY7CkBAIC05
OTIsNiArOTkzLDcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0bCgKICAgICAgICAgcmV0ID0gaHZtX2Rl
YnVnX29wKHYsIGRvbWN0bC0+dS5kZWJ1Z19vcC5vcCk7CiAgICAgICAgIGJyZWFrOwogICAgIH0K
KyNlbmRpZgogCiAgICAgY2FzZSBYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0bWVtaW86CiAgICAgICAg
IGRvbWN0bC0+dS5nZGJzeF9ndWVzdF9tZW1pby5yZW1haW4gPSBkb21jdGwtPnUuZ2Ric3hfZ3Vl
c3RfbWVtaW8ubGVuOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
