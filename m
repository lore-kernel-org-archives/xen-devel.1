From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: fix efi.lds dependency generation
Date: Sun, 18 Nov 2018 13:14:05 +0000
Message-ID: <20181118131405.14122-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MNtj=N5=citrix.com=prvs=85374d1b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOMtw-0004Tx-KO
 for xen-devel@lists.xenproject.org; Sun, 18 Nov 2018 13:14:12 +0000
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

UkFORENPTkZJRyBidWlsZHMgZGlzY292ZXIgZWZpLmxkcyBpcyBub3QgdXBkYXRlZCB3aGVuIGF1
dG9nZW5lcmF0ZWQKaGVhZGVycyBhcmUgdXBkYXRlZC4KClVwb24gaW5zcGVjdGlvbiwgdGhlIGdl
bmVyYXRlZCAuZCBmaWxlIGNvbnRhaW5zIHhlbi5sZHMubyBhcyB0YXJnZXQsCm5vdCB0aGUgb25j
ZSB0aG91Z2h0IGVmaS5sZHMuby4gVGhhdCdzIGJlY2F1c2UgZ2NjIGRpc3JlZ2FyZHMgdGhlCm91
dHB1dCBvYmplY3QgbmFtZSBzcGVjaWZpZWQgYnkgLW8gd2hlbiBnZW5lcmF0aW5nIGRlcGVuZGVu
Y3ksIHNvIHRoZQpzZWQgaW52b2NhdGlvbiBoYXMgbm8gZWZmZWN0LgoKRml4IHRoZSBzZWQgcnVu
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVu
L2FyY2gveDg2L01ha2VmaWxlCmluZGV4IDE2MmIwYjk0YzAuLjc0M2MxMmNiZmEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAg
LTIzOSw3ICsyMzksNyBAQCB4ZW4ubGRzOiB4ZW4ubGRzLlMKIAogZWZpLmxkczogeGVuLmxkcy5T
CiAJJChDQykgLVAgLUUgLVVpMzg2IC1ERUZJICQoZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUsJChB
RkxBR1MpKSAtbyAkQCAkPAotCXNlZCAtZSAncy9lZmlcLmxkc1wubzovZWZpXC5sZHM6L2cnIDwu
JChARikuZCA+LiQoQEYpLmQubmV3CisJc2VkIC1lICdzL3hlblwubGRzXC5vOi9lZmlcLmxkczov
ZycgPC4kKEBGKS5kID4uJChARikuZC5uZXcKIAltdiAtZiAuJChARikuZC5uZXcgLiQoQEYpLmQK
IAogYm9vdC9ta2VsZjMyOiBib290L21rZWxmMzIuYwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
