From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 20/21] hostalloc_maxwait_max: Use
 starvation most_optimistic
Date: Thu, 18 Apr 2019 17:31:57 +0100
Message-ID: <20190418163158.11408-21-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xN-000268-UX
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:13 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgd2UgaGF2ZSBhIG1vcmUgc29waGlzdGljYXRlZCBlc3RpbWF0ZSBvZiBvdXIgbGlr
ZWx5IHNjaGVkdWxlZAp0aW1lLCB1c2UgaXQgaGVyZSB0b28uCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0cy1hbGxvY2F0
ZS1FeGVjdXRpdmUgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4
ZWN1dGl2ZSBiL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQppbmRleCA3ZWEzYzRhZi4uYjc1
OTI3YzEgMTAwNzU1Ci0tLSBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQorKysgYi90cy1o
b3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUKQEAgLTg2NSwxMCArODY1LDE1IEBAIHN1YiBhdHRlbXB0
X2FsbG9jYXRpb24gewogCSAgICAjIFdlIHF1aXQgaWY6CiAJICAgICMgICogd2UgaGF2ZSBiZWVu
IHdhaXRpbmcgYXQgbGVhc3QgJG1heHdhaXQvMgogCSAgICAjICAqIHdlIGVzdGltYXRlIGl0IHdp
bGwgdGFrZSBhdCBsZWFzdCAkbWF4d2FpdCBvdmVyYWxsCi0JICAgIG15ICR3YWl0X3NvZmFyID0g
JG5vdyAtICRhbGxvY19zdGFydF90aW1lOwotCSAgICBpZiAoJHdhaXRfc29mYXIgPiAkbWF4d2Fp
dC8yCi0JCSYmICR3YWl0X3NvZmFyICsgJGJlc3QtPntTdGFydH0gPiAkbWF4d2FpdCkgewotCQls
b2dtICJ0aW1lZCBvdXQ6ICR3YWl0X3NvZmFyLCAkYmVzdC0+e1N0YXJ0fSwgJG1heHdhaXQiOwor
CSAgICBteSAkZXN0X2FicyA9IG1vc3Rfb3B0aW1pc3RpYygkYmVzdCwgJG5vdywgJG1heHdhaXQv
Mik7CisJICAgIGlmIChkZWZpbmVkICRlc3RfYWJzKSB7CisJCW15ICR3YWl0X3NvZmFyID0gJG5v
dyAtICRhbGxvY19zdGFydF90aW1lOworCQlteSAkd2FpdF9leHAgPSAkZXN0X2FicyAtICRhbGxv
Y19zdGFydF90aW1lOworCQlpZiAoJHdhaXRfZXhwID4gJG1heHdhaXQpIHsKKwkJICAgIGxvZ20g
InRpbWVkIG91dDogJHdhaXRfZXhwID4gJG1heHdhaXQgKCR3YWl0X3NvZmFyKSIsCisJCSAgICBy
ZXR1cm4gMjsKKwkJfQorCSAgICB9CiAJfSBlbHNpZiAoJSRzdGFydmF0aW9uX3ApIHsKIAkgICAg
bXkgJGVzdF9hYnMgPSBtb3N0X29wdGltaXN0aWMoJGJlc3QsICRub3csICRzdGFydmF0aW9uX3At
PntJfSk7CiAJICAgIG15ICgkc3RhcnZpbmcsICRtKSA9IHN0YXJ2aW5nKCRlc3RfYWJzKTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
