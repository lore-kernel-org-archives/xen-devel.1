From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 13/21] arch: don't memset(0) memory returned by
 memblock_alloc()
Date: Wed, 16 Jan 2019 15:44:13 +0200
Message-ID: <1547646261-32535-14-git-send-email-rppt__46198.1845707216$1547646268$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlVs-0006mQ-Kb
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:45:48 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDekgJ083503
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:46 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q25k88hrn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:46 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:45:42 -0000
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

bWVtYmxvY2tfYWxsb2MoKSBhbHJlYWR5IGNsZWFycyB0aGUgYWxsb2NhdGVkIG1lbW9yeSwgbm8g
cG9pbnQgaW4gZG9pbmcgaXQKdHdpY2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9jNngvbW0vaW5pdC5jICAgICAgICAgIHwgMSAt
CiBhcmNoL2g4MzAwL21tL2luaXQuYyAgICAgICAgfCAxIC0KIGFyY2gvaWE2NC9rZXJuZWwvbWNh
LmMgICAgICB8IDIgLS0KIGFyY2gvbTY4ay9tbS9tY2ZtbXUuYyAgICAgICB8IDEgLQogYXJjaC9t
aWNyb2JsYXplL21tL2luaXQuYyAgIHwgNiArKy0tLS0KIGFyY2gvc3BhcmMva2VybmVsL3Byb21f
MzIuYyB8IDIgLS0KIDYgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2M2eC9tbS9pbml0LmMgYi9hcmNoL2M2eC9tbS9pbml0
LmMKaW5kZXggYWY1YWRhMC4uZTgzYzA0NiAxMDA2NDQKLS0tIGEvYXJjaC9jNngvbW0vaW5pdC5j
CisrKyBiL2FyY2gvYzZ4L21tL2luaXQuYwpAQCAtNDAsNyArNDAsNiBAQCB2b2lkIF9faW5pdCBw
YWdpbmdfaW5pdCh2b2lkKQogCiAJZW1wdHlfemVyb19wYWdlICAgICAgPSAodW5zaWduZWQgbG9u
ZykgbWVtYmxvY2tfYWxsb2MoUEFHRV9TSVpFLAogCQkJCQkJCSAgICAgIFBBR0VfU0laRSk7Ci0J
bWVtc2V0KCh2b2lkICopZW1wdHlfemVyb19wYWdlLCAwLCBQQUdFX1NJWkUpOwogCiAJLyoKIAkg
KiBTZXQgdXAgdXNlciBkYXRhIHNwYWNlCmRpZmYgLS1naXQgYS9hcmNoL2g4MzAwL21tL2luaXQu
YyBiL2FyY2gvaDgzMDAvbW0vaW5pdC5jCmluZGV4IDY1MTkyNTIuLmExNTc4OTAgMTAwNjQ0Ci0t
LSBhL2FyY2gvaDgzMDAvbW0vaW5pdC5jCisrKyBiL2FyY2gvaDgzMDAvbW0vaW5pdC5jCkBAIC02
OCw3ICs2OCw2IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAJICogdG8gYSBjb3Vw
bGUgb2YgYWxsb2NhdGVkIHBhZ2VzLgogCSAqLwogCWVtcHR5X3plcm9fcGFnZSA9ICh1bnNpZ25l
ZCBsb25nKW1lbWJsb2NrX2FsbG9jKFBBR0VfU0laRSwgUEFHRV9TSVpFKTsKLQltZW1zZXQoKHZv
aWQgKillbXB0eV96ZXJvX3BhZ2UsIDAsIFBBR0VfU0laRSk7CiAKIAkvKgogCSAqIFNldCB1cCBT
RkMvREZDIHJlZ2lzdGVycyAodXNlciBkYXRhIHNwYWNlKS4KZGlmZiAtLWdpdCBhL2FyY2gvaWE2
NC9rZXJuZWwvbWNhLmMgYi9hcmNoL2lhNjQva2VybmVsL21jYS5jCmluZGV4IDc0ZDE0OGIuLjM3
MGJjMzQgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9rZXJuZWwvbWNhLmMKKysrIGIvYXJjaC9pYTY0
L2tlcm5lbC9tY2EuYwpAQCAtNDAwLDggKzQwMCw2IEBAIGlhNjRfbG9nX2luaXQoaW50IHNhbF9p
bmZvX3R5cGUpCiAKIAkvLyBzZXQgdXAgT1MgZGF0YSBzdHJ1Y3R1cmVzIHRvIGhvbGQgZXJyb3Ig
aW5mbwogCUlBNjRfTE9HX0FMTE9DQVRFKHNhbF9pbmZvX3R5cGUsIG1heF9zaXplKTsKLQltZW1z
ZXQoSUE2NF9MT0dfQ1VSUl9CVUZGRVIoc2FsX2luZm9fdHlwZSksIDAsIG1heF9zaXplKTsKLQlt
ZW1zZXQoSUE2NF9MT0dfTkVYVF9CVUZGRVIoc2FsX2luZm9fdHlwZSksIDAsIG1heF9zaXplKTsK
IH0KIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9tY2ZtbXUuYyBiL2FyY2gvbTY4ay9t
bS9tY2ZtbXUuYwppbmRleCAwZGU0OTk5Li40OTJmOTUzIDEwMDY0NAotLS0gYS9hcmNoL202OGsv
bW0vbWNmbW11LmMKKysrIGIvYXJjaC9tNjhrL21tL21jZm1tdS5jCkBAIC00NCw3ICs0NCw2IEBA
IHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAJaW50IGk7CiAKIAllbXB0eV96ZXJvX3Bh
Z2UgPSAodm9pZCAqKSBtZW1ibG9ja19hbGxvYyhQQUdFX1NJWkUsIFBBR0VfU0laRSk7Ci0JbWVt
c2V0KCh2b2lkICopIGVtcHR5X3plcm9fcGFnZSwgMCwgUEFHRV9TSVpFKTsKIAogCXBnX2RpciA9
IHN3YXBwZXJfcGdfZGlyOwogCW1lbXNldChzd2FwcGVyX3BnX2RpciwgMCwgc2l6ZW9mKHN3YXBw
ZXJfcGdfZGlyKSk7CmRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jIGIvYXJj
aC9taWNyb2JsYXplL21tL2luaXQuYwppbmRleCA0NGY0Yjg5Li5iZDFjZDRiIDEwMDY0NAotLS0g
YS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jCisrKyBiL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0
LmMKQEAgLTM3NiwxMCArMzc2LDggQEAgdm9pZCAqIF9fcmVmIHphbGxvY19tYXliZV9ib290bWVt
KHNpemVfdCBzaXplLCBnZnBfdCBtYXNrKQogCiAJaWYgKG1lbV9pbml0X2RvbmUpCiAJCXAgPSBr
emFsbG9jKHNpemUsIG1hc2spOwotCWVsc2UgeworCWVsc2UKIAkJcCA9IG1lbWJsb2NrX2FsbG9j
KHNpemUsIFNNUF9DQUNIRV9CWVRFUyk7Ci0JCWlmIChwKQotCQkJbWVtc2V0KHAsIDAsIHNpemUp
OwotCX0KKwogCXJldHVybiBwOwogfQpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9rZXJuZWwvcHJv
bV8zMi5jIGIvYXJjaC9zcGFyYy9rZXJuZWwvcHJvbV8zMi5jCmluZGV4IDM4OTQwYWYuLmU3MTI2
Y2EgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMva2VybmVsL3Byb21fMzIuYworKysgYi9hcmNoL3Nw
YXJjL2tlcm5lbC9wcm9tXzMyLmMKQEAgLTMzLDggKzMzLDYgQEAgdm9pZCAqIF9faW5pdCBwcm9t
X2Vhcmx5X2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkKIAl2b2lkICpyZXQ7CiAKIAlyZXQgPSBt
ZW1ibG9ja19hbGxvYyhzaXplLCBTTVBfQ0FDSEVfQllURVMpOwotCWlmIChyZXQgIT0gTlVMTCkK
LQkJbWVtc2V0KHJldCwgMCwgc2l6ZSk7CiAKIAlwcm9tX2Vhcmx5X2FsbG9jYXRlZCArPSBzaXpl
OwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
