From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 17/21] init/main: add checks for the return
 value of memblock_alloc*()
Date: Wed, 16 Jan 2019 15:44:17 +0200
Message-ID: <1547646261-32535-18-git-send-email-rppt__20637.7696631991$1547646350$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlX8-0007gL-KD
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:47:06 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDfUJ7113608
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:05 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q23br76b6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:05 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:46:01 -0000
In-Reply-To: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xten
List-Id: xen-devel@lists.xenproject.org

QWRkIHBhbmljKCkgY2FsbHMgaWYgbWVtYmxvY2tfYWxsb2MoKSByZXR1cm5zIE5VTEwuCgpUaGUg
cGFuaWMoKSBmb3JtYXQgZHVwbGljYXRlcyB0aGUgb25lIHVzZWQgYnkgbWVtYmxvY2sgaXRzZWxm
IGFuZCBpbiBvcmRlcgp0byBhdm9pZCBleHBsb3Npb24gd2l0aCBsb25nIHBhcmFtZXRlcnMgbGlz
dCByZXBsYWNlIG9wZW4gY29kZWQgYWxsb2NhdGlvbgpzaXplIGNhbGN1bGF0aW9ucyB3aXRoIGEg
bG9jYWwgdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+Ci0tLQogaW5pdC9tYWluLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5pdC9tYWluLmMgYi9pbml0L21haW4uYwppbmRleCBhNTZmNjVhLi5kNThhMzY1
IDEwMDY0NAotLS0gYS9pbml0L21haW4uYworKysgYi9pbml0L21haW4uYwpAQCAtMzczLDEyICsz
NzMsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHNtcF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50
IG1heGNwdXMpIHsgfQogICovCiBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfY29tbWFuZF9saW5l
KGNoYXIgKmNvbW1hbmRfbGluZSkKIHsKLQlzYXZlZF9jb21tYW5kX2xpbmUgPQotCQltZW1ibG9j
a19hbGxvYyhzdHJsZW4oYm9vdF9jb21tYW5kX2xpbmUpICsgMSwgU01QX0NBQ0hFX0JZVEVTKTsK
LQlpbml0Y2FsbF9jb21tYW5kX2xpbmUgPQotCQltZW1ibG9ja19hbGxvYyhzdHJsZW4oYm9vdF9j
b21tYW5kX2xpbmUpICsgMSwgU01QX0NBQ0hFX0JZVEVTKTsKLQlzdGF0aWNfY29tbWFuZF9saW5l
ID0gbWVtYmxvY2tfYWxsb2Moc3RybGVuKGNvbW1hbmRfbGluZSkgKyAxLAotCQkJCQkgICAgIFNN
UF9DQUNIRV9CWVRFUyk7CisJc2l6ZV90IGxlbiA9IHN0cmxlbihib290X2NvbW1hbmRfbGluZSkg
KyAxOworCisJc2F2ZWRfY29tbWFuZF9saW5lID0gbWVtYmxvY2tfYWxsb2MobGVuLCBTTVBfQ0FD
SEVfQllURVMpOworCWlmICghc2F2ZWRfY29tbWFuZF9saW5lKQorCQlwYW5pYygiJXM6IEZhaWxl
ZCB0byBhbGxvY2F0ZSAlenUgYnl0ZXNcbiIsIF9fZnVuY19fLCBsZW4pOworCisJaW5pdGNhbGxf
Y29tbWFuZF9saW5lID0JbWVtYmxvY2tfYWxsb2MobGVuLCBTTVBfQ0FDSEVfQllURVMpOworCWlm
ICghaW5pdGNhbGxfY29tbWFuZF9saW5lKQorCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0
ZSAlenUgYnl0ZXNcbiIsIF9fZnVuY19fLCBsZW4pOworCisJc3RhdGljX2NvbW1hbmRfbGluZSA9
IG1lbWJsb2NrX2FsbG9jKGxlbiwgU01QX0NBQ0hFX0JZVEVTKTsKKwlpZiAoIXN0YXRpY19jb21t
YW5kX2xpbmUpCisJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwg
X19mdW5jX18sIGxlbik7CisKIAlzdHJjcHkoc2F2ZWRfY29tbWFuZF9saW5lLCBib290X2NvbW1h
bmRfbGluZSk7CiAJc3RyY3B5KHN0YXRpY19jb21tYW5kX2xpbmUsIGNvbW1hbmRfbGluZSk7CiB9
CkBAIC03NzMsOCArNzgxLDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRjYWxsX2JsYWNrbGlz
dChjaGFyICpzdHIpCiAJCQlwcl9kZWJ1ZygiYmxhY2tsaXN0aW5nIGluaXRjYWxsICVzXG4iLCBz
dHJfZW50cnkpOwogCQkJZW50cnkgPSBtZW1ibG9ja19hbGxvYyhzaXplb2YoKmVudHJ5KSwKIAkJ
CQkJICAgICAgIFNNUF9DQUNIRV9CWVRFUyk7CisJCQlpZiAoIWVudHJ5KQorCQkJCXBhbmljKCIl
czogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwKKwkJCQkgICAgICBfX2Z1bmNfXywg
c2l6ZW9mKCplbnRyeSkpOwogCQkJZW50cnktPmJ1ZiA9IG1lbWJsb2NrX2FsbG9jKHN0cmxlbihz
dHJfZW50cnkpICsgMSwKIAkJCQkJCSAgICBTTVBfQ0FDSEVfQllURVMpOworCQkJaWYgKCFlbnRy
eS0+YnVmKQorCQkJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwK
KwkJCQkgICAgICBfX2Z1bmNfXywgc3RybGVuKHN0cl9lbnRyeSkgKyAxKTsKIAkJCXN0cmNweShl
bnRyeS0+YnVmLCBzdHJfZW50cnkpOwogCQkJbGlzdF9hZGQoJmVudHJ5LT5uZXh0LCAmYmxhY2ts
aXN0ZWRfaW5pdGNhbGxzKTsKIAkJfQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
