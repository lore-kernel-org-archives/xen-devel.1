From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/9] libxl: Remove redundant pidpath setting
Date: Fri, 23 Nov 2018 17:14:54 +0000
Message-ID: <20181123171502.29519-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jBSD=OC=citrix.com=prvs=8581f9993=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gQF2w-0001Ce-Rl
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 17:15:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBleGFjdCBzYW1lIGxpbmUgaXMgZHVwbGljYXRlZCBmdXJ0aGVyIG9uIHdpdGhvdXQgYmVp
bmcgdXNlZCBvcgptb2RpZmllZCBpbiBiZXR3ZWVuLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCmluZGV4IDljNDcwNjA0NzMuLjU2OThmZThhZjMgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwpAQCAtMjM0OCw3
ICsyMzQ4LDYgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fbG9jYWxfZG0obGlieGxfX2VnYyAqZWdjLCBs
aWJ4bF9fZG1fc3Bhd25fc3RhdGUgKmRtc3MpCiAgICAgfQogCiAgICAgY29uc3QgY2hhciAqZG9t
X3BhdGggPSBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2MsIGRvbWlkKTsKLSAgICBzcGF3bi0+cGlk
cGF0aCA9IEdDU1BSSU5URigiJXMvJXMiLCBkb21fcGF0aCwgImltYWdlL2RldmljZS1tb2RlbC1w
aWQiKTsKIAogICAgIGlmICh2bmMgJiYgdm5jLT5wYXNzd2QpIHsKICAgICAgICAgLyogVGhpcyB4
ZW5zdG9yZSBrZXkgd2lsbCBvbmx5IGJlIHVzZWQgYnkgcWVtdS14ZW4tdHJhZGl0aW9ubmFsLgot
LSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
