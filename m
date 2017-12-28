From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] xen/pvcalls: use GFP_ATOMIC under spin
	lock
Date: Thu, 28 Dec 2017 03:46:48 +0000
Message-ID: <1514432808-129158-1-git-send-email-weiyongjun1__33254.0178941146$1514441308$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdrq=dy=huawei.com=weiyongjun1@srs-us1.protection.inumbo.net>)
 id 1eUP45-0004gh-CY
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2017 03:41:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefano@aporeto.com>
Cc: xen-devel@lists.xenproject.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBzcGluIGxvY2sgaXMgdGFrZW4gaGVyZSBzbyB3ZSBzaG91bGQgdXNlIEdGUF9BVE9NSUMuCgpG
aXhlczogOTc3NGM2Y2NhMjY2ICgieGVuL3B2Y2FsbHM6IGltcGxlbWVudCBhY2NlcHQgY29tbWFu
ZCIpClNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgot
LS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2
Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwppbmRleCAwYzFlYzY4
Li5kZmQwMGQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKKysrIGIv
ZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCkBAIC04MDcsNyArODA3LDcgQEAgaW50IHB2Y2Fs
bHNfZnJvbnRfYWNjZXB0KHN0cnVjdCBzb2NrZXQgKnNvY2ssIHN0cnVjdCBzb2NrZXQgKm5ld3Nv
Y2ssIGludCBmbGFncykKIAkJcHZjYWxsc19leGl0KCk7CiAJCXJldHVybiByZXQ7CiAJfQotCW1h
cDIgPSBremFsbG9jKHNpemVvZigqbWFwMiksIEdGUF9LRVJORUwpOworCW1hcDIgPSBremFsbG9j
KHNpemVvZigqbWFwMiksIEdGUF9BVE9NSUMpOwogCWlmIChtYXAyID09IE5VTEwpIHsKIAkJY2xl
YXJfYml0KFBWQ0FMTFNfRkxBR19BQ0NFUFRfSU5GTElHSFQsCiAJCQkgICh2b2lkICopJm1hcC0+
cGFzc2l2ZS5mbGFncyk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
