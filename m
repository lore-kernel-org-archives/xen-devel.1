From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_insert_range
Date: Tue, 18 Dec 2018 01:56:11 +0530
Message-ID: <20181217202611.GA18060__36855.4488792599$1545078065$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dAvq=O2=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gYzPB-0000zv-Dp
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 20:22:21 +0000
Received: by mail-pf1-x444.google.com with SMTP id h3so6933625pfg.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Dec 2018 12:22:19 -0800 (PST)
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
