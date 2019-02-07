From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 24/55] x86_64/mm.c: remove code that serves
 no purpose in setup_m2p_table
Date: Thu, 7 Feb 2019 16:44:25 +0000
Message-ID: <20190207164456.9260-25-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1k-0001PY-98
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:52 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJjaC94ODYveDg2
XzY0L21tLmMKaW5kZXggMDk0YzYwOWM4Yy4uNTVmYTMzOGQ3MSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAtNDgw
LDggKzQ4MCw2IEBAIHN0YXRpYyBpbnQgc2V0dXBfbTJwX3RhYmxlKHN0cnVjdCBtZW1faG90YWRk
X2luZm8gKmluZm8pCiAgICAgICAgICAgICBsMmVfd3JpdGUobDJfcm9fbXB0LCBsMmVfZnJvbV9t
Zm4obWZuLAogICAgICAgICAgICAgICAgICAgIC8qX1BBR0VfR0xPQkFMfCovX1BBR0VfUFNFfF9Q
QUdFX1VTRVJ8X1BBR0VfUFJFU0VOVCkpOwogICAgICAgICB9Ci0gICAgICAgIGlmICggISgodW5z
aWduZWQgbG9uZylsMl9yb19tcHQgJiB+UEFHRV9NQVNLKSApCi0gICAgICAgICAgICBsMl9yb19t
cHQgPSBOVUxMOwogICAgICAgICBpICs9ICggMVVMIDw8IChMMl9QQUdFVEFCTEVfU0hJRlQgLSAz
KSk7CiAgICAgfQogI3VuZGVmIENOVAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
