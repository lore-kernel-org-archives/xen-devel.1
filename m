From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v2 8/9] xen/gntdev.c: Convert to use
 vm_insert_range
Date: Sun, 2 Dec 2018 11:57:37 +0530
Message-ID: <20181202062736.GA3240__48945.7636875615$1543731755$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ve27=ol=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gTLAZ-0001zW-K4
 for xen-devel@lists.xenproject.org; Sun, 02 Dec 2018 06:23:55 +0000
Received: by mail-pl1-x644.google.com with SMTP id 101so4826547pld.6
 for <xen-devel@lists.xenproject.org>; Sat, 01 Dec 2018 22:23:53 -0800 (PST)
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
YWRlYWQub3JnPgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8IDExICsrKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKaW5kZXggYjBi
MDJhNS4uNDMwZDRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LmMKKysrIGIvZHJp
dmVycy94ZW4vZ250ZGV2LmMKQEAgLTEwODQsNyArMTA4NCw3IEBAIHN0YXRpYyBpbnQgZ250ZGV2
X21tYXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCWlu
dCBpbmRleCA9IHZtYS0+dm1fcGdvZmY7CiAJaW50IGNvdW50ID0gdm1hX3BhZ2VzKHZtYSk7CiAJ
c3RydWN0IGdudGRldl9ncmFudF9tYXAgKm1hcDsKLQlpbnQgaSwgZXJyID0gLUVJTlZBTDsKKwlp
bnQgZXJyID0gLUVJTlZBTDsKIAogCWlmICgodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKSAmJiAh
KHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpKQogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTExNDUs
MTIgKzExNDUsOSBAQCBzdGF0aWMgaW50IGdudGRldl9tbWFwKHN0cnVjdCBmaWxlICpmbGlwLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAkJZ290byBvdXRfcHV0X21hcDsKIAogCWlmICgh
dXNlX3B0ZW1vZCkgewotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewotCQkJZXJyID0g
dm1faW5zZXJ0X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0ICsgaSpQQUdFX1NJWkUsCi0JCQkJbWFw
LT5wYWdlc1tpXSk7Ci0JCQlpZiAoZXJyKQotCQkJCWdvdG8gb3V0X3B1dF9tYXA7Ci0JCX0KKwkJ
ZXJyID0gdm1faW5zZXJ0X3JhbmdlKHZtYSwgdm1hLT52bV9zdGFydCwgbWFwLT5wYWdlcywgY291
bnQpOworCQlpZiAoZXJyKQorCQkJZ290byBvdXRfcHV0X21hcDsKIAl9IGVsc2UgewogI2lmZGVm
IENPTkZJR19YODYKIAkJLyoKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
