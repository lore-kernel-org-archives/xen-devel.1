From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/2] pvcalls-front: wait for other operations
	to return when release passive sockets
Date: Wed, 14 Feb 2018 10:28:24 -0800
Message-ID: <1518632904-20267-2-git-send-email-sstabellini__23247.968479018$1518632867$gmane$org@kernel.org>
References: <alpine.DEB.2.10.1802141023400.5392@sstabellini-ThinkPad-X260>
 <1518632904-20267-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gnfp=fi=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1em1nE-0002Qh-Fd
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 18:28:32 +0000
In-Reply-To: <1518632904-20267-1-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: Stefano Stabellini <stefano@aporeto.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

UGFzc2l2ZSBzb2NrZXRzIGNhbiBoYXZlIG9uZ29pbmcgb3BlcmF0aW9ucyBvbiB0aGVtLCBzcGVj
aWZpY2FsbHksIHdlCmhhdmUgdHdvIHdhaXRfZXZlbnRfaW50ZXJydXB0YWJsZSBjYWxscyBpbiBw
dmNhbGxzX2Zyb250X2FjY2VwdC4KCkFkZCB0d28gd2FrZV91cCBjYWxscyBpbiBwdmNhbGxzX2Zy
b250X3JlbGVhc2UsIHRoZW4gd2FpdCBmb3IgdGhlCnBvdGVudGlhbCB3YWl0ZXJzIHRvIHJldHVy
biBhbmQgcmVsZWFzZSB0aGUgc29ja19tYXBwaW5nIHJlZmNvdW50LgoKU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29tPgpBY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQu
YyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9u
dC5jCmluZGV4IDE4ZDFiYWMuLmNhNWI3NzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3B2Y2Fs
bHMtZnJvbnQuYworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKQEAgLTEwMTgsNiAr
MTAxOCwxMiBAQCBpbnQgcHZjYWxsc19mcm9udF9yZWxlYXNlKHN0cnVjdCBzb2NrZXQgKnNvY2sp
CiAKIAkJcHZjYWxsc19mcm9udF9mcmVlX21hcChiZWRhdGEsIG1hcCk7CiAJfSBlbHNlIHsKKwkJ
d2FrZV91cCgmYmVkYXRhLT5pbmZsaWdodF9yZXEpOworCQl3YWtlX3VwKCZtYXAtPnBhc3NpdmUu
aW5mbGlnaHRfYWNjZXB0X3JlcSk7CisKKwkJd2hpbGUgKGF0b21pY19yZWFkKCZtYXAtPnJlZmNv
dW50KSA+IDEpCisJCQljcHVfcmVsYXgoKTsKKwogCQlzcGluX2xvY2soJmJlZGF0YS0+c29ja2V0
X2xvY2spOwogCQlsaXN0X2RlbCgmbWFwLT5saXN0KTsKIAkJc3Bpbl91bmxvY2soJmJlZGF0YS0+
c29ja2V0X2xvY2spOwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
