From: Alexandru Isaila <aisaila@bitdefender.com>
Subject: [PATCH v1] x86/hvm: Change return error for offline
 vcpus
Date: Thu, 20 Sep 2018 15:54:34 +0300
Message-ID: <20180920125434.20569-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q4r9=mc=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g2yU7-0004Np-MF
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:55:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGF2ZSBhIGRpZmZlcmVudCByZXR1cm4g
ZXJyb3IgZm9yIGludmFsaWQgdmNwdQphbmQgb2ZmbGluZSB2Y3B1LgoKU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L2h2bS9zYXZlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYyBiL3hlbi9h
cmNoL3g4Ni9odm0vc2F2ZS5jCmluZGV4IGQ1MjA4OTg4NDMuLjQ2NWViODJiYzYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5j
CkBAIC0xNjUsNyArMTY1LDcgQEAgaW50IGh2bV9zYXZlX29uZShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgdHlwZWNvZGUsIHVuc2lnbmVkIGludCBpbnN0YW5jZSwKICAgICBpZiAoIChy
diA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQogICAg
ICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJIVk0lZCBzYXZlOiBmYWlsZWQgdG8gc2F2ZSB0eXBl
ICUiUFJJdTE2IiAoJWQpXG4iLAogICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCB0eXBlY29k
ZSwgcnYpOwotICAgIGVsc2UgaWYgKCBydiA9IC1FTk9FTlQsIGN0eHQuY3VyID49IHNpemVvZigq
ZGVzYykgKQorICAgIGVsc2UgaWYgKCBydiA9IC1FTk9EQVRBLCBjdHh0LmN1ciA+PSBzaXplb2Yo
KmRlc2MpICkKICAgICB7CiAgICAgICAgIHVpbnQzMl90IG9mZjsKIAotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
