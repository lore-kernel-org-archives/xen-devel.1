From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] xen/gntdev: Fix partial gntdev_mmap()
	cleanup
Date: Tue, 9 Jan 2018 12:10:22 +0000
Message-ID: <20180109121022.11467-2-ross.lagerwall@citrix.com>
References: <20180109121022.11467-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s//u=ee=citrix.com=prvs=540754ccc=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1eYsjx-0006Hw-Ll
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 12:10:49 +0000
In-Reply-To: <20180109121022.11467-1-ross.lagerwall@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBjbGVhbmluZyB1cCBhZnRlciBhIHBhcnRpYWxseSBzdWNjZXNzZnVsIGdudGRldl9tbWFw
KCksIHVubWFwIHRoZQpzdWNjZXNzZnVsbHkgbWFwcGVkIGdyYW50IHBhZ2VzIG90aGVyd2lzZSBY
ZW4gd2lsbCBraWxsIHRoZSBkb21haW4gaWYKaW4gZGVidWcgbW9kZSAoQXR0ZW1wdCB0byBpbXBs
aWNpdGx5IHVubWFwIGEgZ3JhbnRlZCBQVEUpIG9yIExpbnV4IHdpbGwKa2lsbCB0aGUgcHJvY2Vz
cyBhbmQgZW1pdCAiQlVHOiBCYWQgcGFnZSBtYXAgaW4gcHJvY2VzcyIgaWYgWGVuIGlzIGluCnJl
bGVhc2UgbW9kZS4KClRoaXMgaXMgb25seSBuZWVkZWQgd2hlbiB1c2VfcHRlbW9kIGlzIHRydWUg
YmVjYXVzZSBnbnRkZXZfcHV0X21hcCgpCndpbGwgdW5tYXAgZ3JhbnQgcGFnZXMgaXRzZWxmIHdo
ZW4gdXNlX3B0ZW1vZCBpcyBmYWxzZS4KClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMveGVuL2dudGRldi5jIHwgNCAr
KystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwppbmRl
eCBkMzM5MWExLi5iZDU2NjUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysg
Yi9kcml2ZXJzL3hlbi9nbnRkZXYuYwpAQCAtMTA3MSw4ICsxMDcxLDEwIEBAIHN0YXRpYyBpbnQg
Z250ZGV2X21tYXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQogb3V0X3VubG9ja19wdXQ6CiAJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsKIG91dF9wdXRf
bWFwOgotCWlmICh1c2VfcHRlbW9kKQorCWlmICh1c2VfcHRlbW9kKSB7CiAJCW1hcC0+dm1hID0g
TlVMTDsKKwkJdW5tYXBfZ3JhbnRfcGFnZXMobWFwLCAwLCBtYXAtPmNvdW50KTsKKwl9CiAJZ250
ZGV2X3B1dF9tYXAocHJpdiwgbWFwKTsKIAlyZXR1cm4gZXJyOwogfQotLSAKMi45LjUKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
