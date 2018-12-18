From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] x86/xen: Fix read buffer overflow
Date: Tue, 18 Dec 2018 16:19:10 +0800
Message-ID: <20181218081910.18080-1-yuehaibing__32182.0350167856$1545121256$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKq0=O3=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1gZAdp-0006qL-UJ
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 08:22:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Rml4IHNtYXRjaCB3YXJuaW5nOgoKYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jOjY0OSBnZXRf
dHJhcF9hZGRyKCkgZXJyb3I6CiBidWZmZXIgb3ZlcmZsb3cgJ2Vhcmx5X2lkdF9oYW5kbGVyX2Fy
cmF5JyAzMiA8PSAzMgoKRml4ZXM6IDQyYjNhNGNiNTYwOSAoIng4Ni94ZW46IFN1cHBvcnQgZWFy
bHkgaW50ZXJydXB0cyBpbiB4ZW4gcHYgZ3Vlc3RzIikKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmlu
ZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYwppbmRleCAyZjY3ODdmLi44MWYyMDBkIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBA
IC02NDYsNyArNjQ2LDcgQEAgc3RhdGljIGJvb2wgX19yZWYgZ2V0X3RyYXBfYWRkcih2b2lkICoq
YWRkciwgdW5zaWduZWQgaW50IGlzdCkKIAogCWlmIChuciA9PSBBUlJBWV9TSVpFKHRyYXBfYXJy
YXkpICYmCiAJICAgICphZGRyID49ICh2b2lkICopZWFybHlfaWR0X2hhbmRsZXJfYXJyYXlbMF0g
JiYKLQkgICAgKmFkZHIgPCAodm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVyX2FycmF5W05VTV9FWENF
UFRJT05fVkVDVE9SU10pIHsKKwkgICAgKmFkZHIgPCAodm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVy
X2FycmF5W05VTV9FWENFUFRJT05fVkVDVE9SUyAtIDFdKSB7CiAJCW5yID0gKCphZGRyIC0gKHZv
aWQgKillYXJseV9pZHRfaGFuZGxlcl9hcnJheVswXSkgLwogCQkgICAgIEVBUkxZX0lEVF9IQU5E
TEVSX1NJWkU7CiAJCSphZGRyID0gKHZvaWQgKil4ZW5fZWFybHlfaWR0X2hhbmRsZXJfYXJyYXlb
bnJdOwotLSAKMi43LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
