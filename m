From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH 8/9] xen/gntdev.c: Convert to use vm_insert_range
Date: Thu, 15 Nov 2018 21:21:13 +0530
Message-ID: <20181115155113.GA28021__3603.02958074517$1542296792$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dbea=n2=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gNJry-0001ZU-QE
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:47:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id e22-v6so9877285pfn.8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 07:47:49 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbApt
ZW1vcnkgdG8gdXNlciB2bWEuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRy
LmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZy
YWRlYWQub3JnPgotLS0KIGRyaXZlcnMveGVuL2dudGRldi5jIHwgMTEgKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwppbmRleCBiMGIw
MmE1Li40MzBkNGNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2
ZXJzL3hlbi9nbnRkZXYuYwpAQCAtMTA4NCw3ICsxMDg0LDcgQEAgc3RhdGljIGludCBnbnRkZXZf
bW1hcChzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJaW50
IGluZGV4ID0gdm1hLT52bV9wZ29mZjsKIAlpbnQgY291bnQgPSB2bWFfcGFnZXModm1hKTsKIAlz
dHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqbWFwOwotCWludCBpLCBlcnIgPSAtRUlOVkFMOworCWlu
dCBlcnIgPSAtRUlOVkFMOwogCiAJaWYgKCh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpICYmICEo
dm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTE0NSwx
MiArMTE0NSw5IEBAIHN0YXRpYyBpbnQgZ250ZGV2X21tYXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCQlnb3RvIG91dF9wdXRfbWFwOwogCiAJaWYgKCF1
c2VfcHRlbW9kKSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Ci0JCQllcnIgPSB2
bV9pbnNlcnRfcGFnZSh2bWEsIHZtYS0+dm1fc3RhcnQgKyBpKlBBR0VfU0laRSwKLQkJCQltYXAt
PnBhZ2VzW2ldKTsKLQkJCWlmIChlcnIpCi0JCQkJZ290byBvdXRfcHV0X21hcDsKLQkJfQorCQll
cnIgPSB2bV9pbnNlcnRfcmFuZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0LCBtYXAtPnBhZ2VzLCBjb3Vu
dCk7CisJCWlmIChlcnIpCisJCQlnb3RvIG91dF9wdXRfbWFwOwogCX0gZWxzZSB7CiAjaWZkZWYg
Q09ORklHX1g4NgogCQkvKgotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
