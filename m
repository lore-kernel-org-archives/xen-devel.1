From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 11/11] x86/paravirt: remove unneeded mmu
 related paravirt ops bits
Date: Mon, 13 Aug 2018 09:37:39 +0200
Message-ID: <20180813073739.26108-12-jgross__8367.59658200226$1534145796$gmane$org@suse.com>
References: <20180813073739.26108-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q/fn=k4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fp7QD-0007Ko-2e
 for xen-devel@lists.xenproject.org; Mon, 13 Aug 2018 07:37:49 +0000
In-Reply-To: <20180813073739.26108-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, rusty@rustcorp.com.au, peterz@infradead.org, mingo@redhat.com, hpa@zytor.com, akataria@vmware.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIDMyLWJpdCBjb2RlIGZvciBDT05GSUdfUEdUQUJMRV9M
RVZFTFMgPj0gNC4KUmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggfCAyMCAr
KystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQu
aCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgKaW5kZXggNGNlYjM3MDhmZTA2Li4w
NDk5ZjE3Y2E0ODAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgK
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaApAQCAtNTAxLDI1ICs1MDEsMTQg
QEAgc3RhdGljIGlubGluZSBwdWRfdCBfX3B1ZChwdWR2YWxfdCB2YWwpCiB7CiAJcHVkdmFsX3Qg
cmV0OwogCi0JaWYgKHNpemVvZihwdWR2YWxfdCkgPiBzaXplb2YobG9uZykpCi0JCXJldCA9IFBW
T1BfQ0FMTEVFMihwdWR2YWxfdCwgbW11Lm1ha2VfcHVkLCB2YWwsICh1NjQpdmFsID4+IDMyKTsK
LQllbHNlCi0JCXJldCA9IFBWT1BfQ0FMTEVFMShwdWR2YWxfdCwgbW11Lm1ha2VfcHVkLCB2YWwp
OworCXJldCA9IFBWT1BfQ0FMTEVFMShwdWR2YWxfdCwgbW11Lm1ha2VfcHVkLCB2YWwpOwogCiAJ
cmV0dXJuIChwdWRfdCkgeyByZXQgfTsKIH0KIAogc3RhdGljIGlubGluZSBwdWR2YWxfdCBwdWRf
dmFsKHB1ZF90IHB1ZCkKIHsKLQlwdWR2YWxfdCByZXQ7Ci0KLQlpZiAoc2l6ZW9mKHB1ZHZhbF90
KSA+IHNpemVvZihsb25nKSkKLQkJcmV0ID0gIFBWT1BfQ0FMTEVFMihwdWR2YWxfdCwgbW11LnB1
ZF92YWwsCi0JCQkJICAgIHB1ZC5wdWQsICh1NjQpcHVkLnB1ZCA+PiAzMik7Ci0JZWxzZQotCQly
ZXQgPSAgUFZPUF9DQUxMRUUxKHB1ZHZhbF90LCBtbXUucHVkX3ZhbCwgcHVkLnB1ZCk7Ci0KLQly
ZXR1cm4gcmV0OworCXJldHVybiBQVk9QX0NBTExFRTEocHVkdmFsX3QsIG1tdS5wdWRfdmFsLCBw
dWQucHVkKTsKIH0KIAogc3RhdGljIGlubGluZSB2b2lkIHB1ZF9jbGVhcihwdWRfdCAqcHVkcCkK
QEAgLTUzMSwxMCArNTIwLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wNGQocDRkX3QgKnA0
ZHAsIHA0ZF90IHA0ZCkKIHsKIAlwNGR2YWxfdCB2YWwgPSBuYXRpdmVfcDRkX3ZhbChwNGQpOwog
Ci0JaWYgKHNpemVvZihwNGR2YWxfdCkgPiBzaXplb2YobG9uZykpCi0JCVBWT1BfVkNBTEwzKG1t
dS5zZXRfcDRkLCBwNGRwLCB2YWwsICh1NjQpdmFsID4+IDMyKTsKLQllbHNlCi0JCVBWT1BfVkNB
TEwyKG1tdS5zZXRfcDRkLCBwNGRwLCB2YWwpOworCVBWT1BfVkNBTEwyKG1tdS5zZXRfcDRkLCBw
NGRwLCB2YWwpOwogfQogCiAjaWYgQ09ORklHX1BHVEFCTEVfTEVWRUxTID49IDUKLS0gCjIuMTMu
NwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
