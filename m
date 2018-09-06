From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: specify -j$(nproc) in build script
Date: Thu, 6 Sep 2018 15:55:59 +0100
Message-ID: <20180906145559.30364-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxvhU-0007lt-0F
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 14:56:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQgYi9h
dXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKaW5kZXggMDU0MjI2YmQ3My4uYzQ2M2IwNjBkNCAxMDA3
NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCisrKyBiL2F1dG9tYXRpb24vc2NyaXB0
cy9idWlsZApAQCAtMzAsNCArMzAsNCBAQCBmaQogCiAuL2NvbmZpZ3VyZSAiJHtjZmdhcmdzW0Bd
fSIKIAotbWFrZSBkaXN0CittYWtlIC1qJChucHJvYykgZGlzdAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
