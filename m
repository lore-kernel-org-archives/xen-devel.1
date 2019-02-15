From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_map_pages()
Date: Fri, 15 Feb 2019 08:18:31 +0530
Message-ID: <20190215024830.GA26477__38815.9326904983$1550198705$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Kn9=QW=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1guTU4-0006cZ-Vn
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 02:44:13 +0000
Received: by mail-pf1-x444.google.com with SMTP id h1so4095557pfo.7
 for <xen-devel@lists.xenproject.org>; Thu, 14 Feb 2019 18:44:11 -0800 (PST)
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

Q29udmVydCB0byB1c2Ugdm1fbWFwX3BhZ2VzKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbAptZW1v
cnkgdG8gdXNlciB2bWEuCgptYXAtPmNvdW50IGlzIHBhc3NlZCB0byB2bV9tYXBfcGFnZXMoKSBh
bmQgaW50ZXJuYWwgQVBJCnZlcmlmeSBtYXAtPmNvdW50IGFnYWluc3QgY291bnQgKCBjb3VudCA9
IHZtYV9wYWdlcyh2bWEpKQpmb3IgcGFnZSBhcnJheSBib3VuZGFyeSBvdmVycnVuIGNvbmRpdGlv
bi4KClNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29t
PgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8IDExICsrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKaW5kZXggNWVmYzVlZS4uNWQ2
NDI2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LmMKKysrIGIvZHJpdmVycy94ZW4v
Z250ZGV2LmMKQEAgLTEwODQsNyArMTA4NCw3IEBAIHN0YXRpYyBpbnQgZ250ZGV2X21tYXAoc3Ry
dWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCWludCBpbmRleCA9
IHZtYS0+dm1fcGdvZmY7CiAJaW50IGNvdW50ID0gdm1hX3BhZ2VzKHZtYSk7CiAJc3RydWN0IGdu
dGRldl9ncmFudF9tYXAgKm1hcDsKLQlpbnQgaSwgZXJyID0gLUVJTlZBTDsKKwlpbnQgZXJyID0g
LUVJTlZBTDsKIAogCWlmICgodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKSAmJiAhKHZtYS0+dm1f
ZmxhZ3MgJiBWTV9TSEFSRUQpKQogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTExNDUsMTIgKzExNDUs
OSBAQCBzdGF0aWMgaW50IGdudGRldl9tbWFwKHN0cnVjdCBmaWxlICpmbGlwLCBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkKIAkJZ290byBvdXRfcHV0X21hcDsKIAogCWlmICghdXNlX3B0ZW1v
ZCkgewotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewotCQkJZXJyID0gdm1faW5zZXJ0
X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0ICsgaSpQQUdFX1NJWkUsCi0JCQkJbWFwLT5wYWdlc1tp
XSk7Ci0JCQlpZiAoZXJyKQotCQkJCWdvdG8gb3V0X3B1dF9tYXA7Ci0JCX0KKwkJZXJyID0gdm1f
bWFwX3BhZ2VzKHZtYSwgbWFwLT5wYWdlcywgbWFwLT5jb3VudCk7CisJCWlmIChlcnIpCisJCQln
b3RvIG91dF9wdXRfbWFwOwogCX0gZWxzZSB7CiAjaWZkZWYgQ09ORklHX1g4NgogCQkvKgotLSAK
MS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
