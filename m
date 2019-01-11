From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH 8/9] xen/gntdev.c: Convert to use vm_insert_range
Date: Fri, 11 Jan 2019 20:42:35 +0530
Message-ID: <20190111151235.GA2836__2682.52555183626$1547219238$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v1ph=PT=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1ghyQG-00088J-5I
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 15:08:36 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so6878716plb.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 07:08:35 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, boris.ostrovsky@oracle.com, jgross@suse.com, linux@armlinux.org.uk, robin.murphy@arm.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbApt
ZW1vcnkgdG8gdXNlciB2bWEuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRy
LmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8IDE2ICsrKysrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2
LmMKaW5kZXggYjBiMDJhNS4uY2E0YWNlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2
LmMKKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKQEAgLTEwODIsMTggKzEwODIsMTcgQEAgc3Rh
dGljIGludCBnbnRkZXZfbW1hcChzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCiB7CiAJc3RydWN0IGdudGRldl9wcml2ICpwcml2ID0gZmxpcC0+cHJpdmF0ZV9k
YXRhOwogCWludCBpbmRleCA9IHZtYS0+dm1fcGdvZmY7Ci0JaW50IGNvdW50ID0gdm1hX3BhZ2Vz
KHZtYSk7CiAJc3RydWN0IGdudGRldl9ncmFudF9tYXAgKm1hcDsKLQlpbnQgaSwgZXJyID0gLUVJ
TlZBTDsKKwlpbnQgZXJyID0gLUVJTlZBTDsKIAogCWlmICgodm1hLT52bV9mbGFncyAmIFZNX1dS
SVRFKSAmJiAhKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpKQogCQlyZXR1cm4gLUVJTlZBTDsK
IAogCXByX2RlYnVnKCJtYXAgJWQrJWQgYXQgJWx4IChwZ29mZiAlbHgpXG4iLAotCQkJaW5kZXgs
IGNvdW50LCB2bWEtPnZtX3N0YXJ0LCB2bWEtPnZtX3Bnb2ZmKTsKKwkJCWluZGV4LCB2bWFfcGFn
ZXModm1hKSwgdm1hLT52bV9zdGFydCwgdm1hLT52bV9wZ29mZik7CiAKIAltdXRleF9sb2NrKCZw
cml2LT5sb2NrKTsKLQltYXAgPSBnbnRkZXZfZmluZF9tYXBfaW5kZXgocHJpdiwgaW5kZXgsIGNv
dW50KTsKKwltYXAgPSBnbnRkZXZfZmluZF9tYXBfaW5kZXgocHJpdiwgaW5kZXgsIHZtYV9wYWdl
cyh2bWEpKTsKIAlpZiAoIW1hcCkKIAkJZ290byB1bmxvY2tfb3V0OwogCWlmICh1c2VfcHRlbW9k
ICYmIG1hcC0+dm1hKQpAQCAtMTE0NSwxMiArMTE0NCw5IEBAIHN0YXRpYyBpbnQgZ250ZGV2X21t
YXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCQlnb3Rv
IG91dF9wdXRfbWFwOwogCiAJaWYgKCF1c2VfcHRlbW9kKSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBj
b3VudDsgaSsrKSB7Ci0JCQllcnIgPSB2bV9pbnNlcnRfcGFnZSh2bWEsIHZtYS0+dm1fc3RhcnQg
KyBpKlBBR0VfU0laRSwKLQkJCQltYXAtPnBhZ2VzW2ldKTsKLQkJCWlmIChlcnIpCi0JCQkJZ290
byBvdXRfcHV0X21hcDsKLQkJfQorCQllcnIgPSB2bV9pbnNlcnRfcmFuZ2Uodm1hLCBtYXAtPnBh
Z2VzLCBtYXAtPmNvdW50KTsKKwkJaWYgKGVycikKKwkJCWdvdG8gb3V0X3B1dF9tYXA7CiAJfSBl
bHNlIHsKICNpZmRlZiBDT05GSUdfWDg2CiAJCS8qCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
