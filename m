From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] pvcalls-front: wait for other operations to
	return when release passive sockets
Date: Mon,  5 Feb 2018 14:51:47 -0800
Message-ID: <1517871107-15349-2-git-send-email-sstabellini__29248.1384742588$1517871061$gmane$org@kernel.org>
References: <alpine.DEB.2.10.1802051448460.10160@sstabellini-ThinkPad-X260>
 <1517871107-15349-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gefk=e7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eipcC-0004TR-Iu
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 22:51:56 +0000
In-Reply-To: <1517871107-15349-1-git-send-email-sstabellini@kernel.org>
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
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29tPgotLS0KIGRyaXZlcnMveGVu
L3B2Y2FsbHMtZnJvbnQuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jIGIvZHJpdmVycy94
ZW4vcHZjYWxscy1mcm9udC5jCmluZGV4IDE2NGQzYWQuLmQzMmNhYzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250
LmMKQEAgLTEwMTcsNiArMTAxNywxMiBAQCBpbnQgcHZjYWxsc19mcm9udF9yZWxlYXNlKHN0cnVj
dCBzb2NrZXQgKnNvY2spCiAKIAkJcHZjYWxsc19mcm9udF9mcmVlX21hcChiZWRhdGEsIG1hcCk7
CiAJfSBlbHNlIHsKKwkJd2FrZV91cCgmYmVkYXRhLT5pbmZsaWdodF9yZXEpOworCQl3YWtlX3Vw
KCZtYXAtPnBhc3NpdmUuaW5mbGlnaHRfYWNjZXB0X3JlcSk7CisKKwkJd2hpbGUgKGF0b21pY19y
ZWFkKCZtYXAtPnJlZmNvdW50KSA+IDEpCisJCQljcHVfcmVsYXgoKTsKKwogCQlzcGluX2xvY2so
JmJlZGF0YS0+c29ja2V0X2xvY2spOwogCQlsaXN0X2RlbCgmbWFwLT5saXN0KTsKIAkJc3Bpbl91
bmxvY2soJmJlZGF0YS0+c29ja2V0X2xvY2spOwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
