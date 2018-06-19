From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [PATCH 1/1] build: remove stray .*.d2 files during
 clean/distclean
Date: Tue, 19 Jun 2018 15:51:03 +0200
Message-ID: <1529416263-28788-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2pff=jf=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fVH2a-0003jR-O9
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 13:51:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T3RoZXJ3aXNlIGUuZy4geGVuLy4ueGVuLXN5bXMuMC5vLmQyIGFuZCB4ZW4vLi54ZW4tc3ltcy4x
Lm8uZDIgZmlsZXMKc3RheSB1bnRvdWNoZWQgYmVjYXVzZSB0aGV5IGFyZSBub3QgbGlzdGVkIGlu
IERFUFNfUk0gdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5r
aXBlckBvcmFjbGUuY29tPgotLS0KIHhlbi9NYWtlZmlsZSB8ICAgIDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9NYWtl
ZmlsZSBiL3hlbi9NYWtlZmlsZQppbmRleCA2MDg2N2UzLi5mYWIzMzY3IDEwMDY0NAotLS0gYS94
ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0xMTksNyArMTE5LDcgQEAgX2NsZWFu
OiBkZWxldGUtdW5mcmVzaC1maWxlcwogCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAt
QyBhcmNoL3g4NiBjbGVhbgogCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyB0ZXN0
IGNsZWFuCiAJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2Nv
bmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIGNsZWFuCi0JZmluZCAuIFwoIC1u
YW1lICIqLm8iIC1vIC1uYW1lICIuKi5kIiAtbyAtbmFtZSAiKi5nY25vIiBcKSAtZXhlYyBybSAt
ZiB7fSBcOworCWZpbmQgLiBcKCAtbmFtZSAiKi5vIiAtbyAtbmFtZSAiLiouZCIgLW8gLW5hbWUg
Ii4qLmQyIiAtbyAtbmFtZSAiKi5nY25vIiBcKSAtZXhlYyBybSAtZiB7fSBcOwogCXJtIC1mIGlu
Y2x1ZGUvYXNtICQoVEFSR0VUKSAkKFRBUkdFVCkuZ3ogJChUQVJHRVQpLmVmaSAkKFRBUkdFVCku
ZWZpLm1hcCAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCktc3ltcy5tYXAgKn4gY29yZQogCXJtIC1m
IGluY2x1ZGUvYXNtLSovYXNtLW9mZnNldHMuaAogCXJtIC1mIC5iYW5uZXIKLS0gCjEuNy4xMC40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
