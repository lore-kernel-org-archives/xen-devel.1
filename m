From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: [PATCH] xen: Fix {set,
	clear}_foreign_p2m_mapping on autotranslating guests
Date: Wed,  7 Feb 2018 21:47:40 +0100
Message-ID: <20180207204740.518-1-simon__5973.47520892999$1518036957$gmane$org@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wy8g=fb=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1ejWlk-0003eE-HD
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 20:56:40 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Simon Gaiser <simon@invisiblethingslab.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDgyNjE2Zjk1OTlhNyAoInhlbjogcmVtb3ZlIHRlc3RzIGZvciBwdmggbW9kZSBpbiBw
dXJlIHB2IHBhdGhzIikKcmVtb3ZlZCB0aGUgY2hlY2sgZm9yIGF1dG90cmFuc2xhdGlvbiBmcm9t
IHtzZXQsY2xlYXJ9X2ZvcmVpZ25fcDJtX21hcHBpbmcKYnV0IHRob3NlIGFyZSBjYWxsZWQgYnkg
Z3JhbnQtdGFibGUuYyBhbHNvIG9uIFBWSC9IVk0gZ3Vlc3RzLgoKQ2M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPiAjIDQuMTQKRml4ZXM6IDgyNjE2Zjk1OTlhNyAoInhlbjogcmVtb3ZlIHRlc3Rz
IGZvciBwdmggbW9kZSBpbiBwdXJlIHB2IHBhdGhzIikKU2lnbmVkLW9mZi1ieTogU2ltb24gR2Fp
c2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGFyY2gveDg2L3hlbi9wMm0uYyB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
eGVuL3AybS5jIGIvYXJjaC94ODYveGVuL3AybS5jCmluZGV4IDEzYjRmMTliOTEzMS4uMTU5YTg5
NzE1MWQ2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vcDJtLmMKKysrIGIvYXJjaC94ODYveGVu
L3AybS5jCkBAIC02OTQsNiArNjk0LDkgQEAgaW50IHNldF9mb3JlaWduX3AybV9tYXBwaW5nKHN0
cnVjdCBnbnR0YWJfbWFwX2dyYW50X3JlZiAqbWFwX29wcywKIAlpbnQgaSwgcmV0ID0gMDsKIAlw
dGVfdCAqcHRlOwogCisJaWYgKHhlbl9mZWF0dXJlKFhFTkZFQVRfYXV0b190cmFuc2xhdGVkX3Bo
eXNtYXApKQorCQlyZXR1cm4gMDsKKwogCWlmIChrbWFwX29wcykgewogCQlyZXQgPSBIWVBFUlZJ
U09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX21hcF9ncmFudF9yZWYsCiAJCQkJCQlrbWFwX29w
cywgY291bnQpOwpAQCAtNzM2LDYgKzczOSw5IEBAIGludCBjbGVhcl9mb3JlaWduX3AybV9tYXBw
aW5nKHN0cnVjdCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmICp1bm1hcF9vcHMsCiB7CiAJaW50IGks
IHJldCA9IDA7CiAKKwlpZiAoeGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5
c21hcCkpCisJCXJldHVybiAwOworCiAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKIAkJ
dW5zaWduZWQgbG9uZyBtZm4gPSBfX3Bmbl90b19tZm4ocGFnZV90b19wZm4ocGFnZXNbaV0pKTsK
IAkJdW5zaWduZWQgbG9uZyBwZm4gPSBwYWdlX3RvX3BmbihwYWdlc1tpXSk7Ci0tIAoyLjE1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
