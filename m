From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 18/21] swiotlb: add checks for the return value
 of memblock_alloc*()
Date: Wed, 16 Jan 2019 15:44:18 +0200
Message-ID: <1547646261-32535-19-git-send-email-rppt__8734.78602520681$1547646307$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlWT-0007Ao-Oc
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:46:25 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDeYwJ019339
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:12 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q23t1dqcq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:11 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:46:07 -0000
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
LmlibS5jb20+Ci0tLQoga2VybmVsL2RtYS9zd2lvdGxiLmMgfCAxOSArKysrKysrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9rZXJuZWwvZG1hL3N3aW90bGIuYyBiL2tlcm5lbC9kbWEvc3dpb3RsYi5jCmlu
ZGV4IGQ2MzYxNzcuLmU3ODgzNWM4IDEwMDY0NAotLS0gYS9rZXJuZWwvZG1hL3N3aW90bGIuYwor
KysgYi9rZXJuZWwvZG1hL3N3aW90bGIuYwpAQCAtMTkxLDYgKzE5MSw3IEBAIHZvaWQgX19pbml0
IHN3aW90bGJfdXBkYXRlX21lbV9hdHRyaWJ1dGVzKHZvaWQpCiBpbnQgX19pbml0IHN3aW90bGJf
aW5pdF93aXRoX3RibChjaGFyICp0bGIsIHVuc2lnbmVkIGxvbmcgbnNsYWJzLCBpbnQgdmVyYm9z
ZSkKIHsKIAl1bnNpZ25lZCBsb25nIGksIGJ5dGVzOworCXNpemVfdCBhbGxvY19zaXplOwogCiAJ
Ynl0ZXMgPSBuc2xhYnMgPDwgSU9fVExCX1NISUZUOwogCkBAIC0yMDMsMTIgKzIwNCwxOCBAQCBp
bnQgX19pbml0IHN3aW90bGJfaW5pdF93aXRoX3RibChjaGFyICp0bGIsIHVuc2lnbmVkIGxvbmcg
bnNsYWJzLCBpbnQgdmVyYm9zZSkKIAkgKiB0byBmaW5kIGNvbnRpZ3VvdXMgZnJlZSBtZW1vcnkg
cmVnaW9ucyBvZiBzaXplIHVwIHRvIElPX1RMQl9TRUdTSVpFCiAJICogYmV0d2VlbiBpb190bGJf
c3RhcnQgYW5kIGlvX3RsYl9lbmQuCiAJICovCi0JaW9fdGxiX2xpc3QgPSBtZW1ibG9ja19hbGxv
YygKLQkJCQlQQUdFX0FMSUdOKGlvX3RsYl9uc2xhYnMgKiBzaXplb2YoaW50KSksCi0JCQkJUEFH
RV9TSVpFKTsKLQlpb190bGJfb3JpZ19hZGRyID0gbWVtYmxvY2tfYWxsb2MoCi0JCQkJUEFHRV9B
TElHTihpb190bGJfbnNsYWJzICogc2l6ZW9mKHBoeXNfYWRkcl90KSksCi0JCQkJUEFHRV9TSVpF
KTsKKwlhbGxvY19zaXplID0gUEFHRV9BTElHTihpb190bGJfbnNsYWJzICogc2l6ZW9mKGludCkp
OworCWlvX3RsYl9saXN0ID0gbWVtYmxvY2tfYWxsb2MoYWxsb2Nfc2l6ZSwgUEFHRV9TSVpFKTsK
KwlpZiAoIWlvX3RsYl9saXN0KQorCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUg
Ynl0ZXMgYWxpZ249MHglbHhcbiIsCisJCSAgICAgIF9fZnVuY19fLCBhbGxvY19zaXplLCBQQUdF
X1NJWkUpOworCisJYWxsb2Nfc2l6ZSA9IFBBR0VfQUxJR04oaW9fdGxiX25zbGFicyAqIHNpemVv
ZihwaHlzX2FkZHJfdCkpOworCWlvX3RsYl9vcmlnX2FkZHIgPSBtZW1ibG9ja19hbGxvYyhhbGxv
Y19zaXplLCBQQUdFX1NJWkUpOworCWlmICghaW9fdGxiX29yaWdfYWRkcikKKwkJcGFuaWMoIiVz
OiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLAorCQkgICAgICBf
X2Z1bmNfXywgYWxsb2Nfc2l6ZSwgUEFHRV9TSVpFKTsKKwogCWZvciAoaSA9IDA7IGkgPCBpb190
bGJfbnNsYWJzOyBpKyspIHsKIAkJaW9fdGxiX2xpc3RbaV0gPSBJT19UTEJfU0VHU0laRSAtIE9G
RlNFVChpLCBJT19UTEJfU0VHU0laRSk7CiAJCWlvX3RsYl9vcmlnX2FkZHJbaV0gPSBJTlZBTElE
X1BIWVNfQUREUjsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
