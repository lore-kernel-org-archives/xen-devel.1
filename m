From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 20/21] memblock: memblock_alloc_try_nid: don't
 panic
Date: Wed, 16 Jan 2019 15:44:20 +0200
Message-ID: <1547646261-32535-21-git-send-email-rppt__43519.6573999294$1547646317$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlWc-0007Gp-T6
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:46:34 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDeZb4019412
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:21 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q23t1dqkp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:46:21 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:46:16 -0000
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

QXMgYWxsIHRoZSBtZW1ibG9ja19hbGxvYyooKSB1c2VycyBhcmUgbm93IGNoZWNraW5nIHRoZSBy
ZXR1cm4gdmFsdWUgYW5kCnBhbmljKCkgaW4gY2FzZSBvZiBlcnJvciwgdGhlIHBhbmljKCkgY2Fs
bCBjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBjb3JlCm1lbWJsb2NrIGFsbG9jYXRvciwgbmFtZWx5
IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQoKS4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBtbS9tZW1ibG9jay5jIHwgMTUgKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCAwM2IzOTI5Li43
MTY0Mjc1IDEwMDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAg
LTE1MjYsNyArMTUyNiw3IEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfdHJ5X25pZF9u
b3BhbmljKAogfQogCiAvKioKLSAqIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQgLSBhbGxvY2F0ZSBi
b290IG1lbW9yeSBibG9jayB3aXRoIHBhbmlja2luZworICogbWVtYmxvY2tfYWxsb2NfdHJ5X25p
ZCAtIGFsbG9jYXRlIGJvb3QgbWVtb3J5IGJsb2NrCiAgKiBAc2l6ZTogc2l6ZSBvZiBtZW1vcnkg
YmxvY2sgdG8gYmUgYWxsb2NhdGVkIGluIGJ5dGVzCiAgKiBAYWxpZ246IGFsaWdubWVudCBvZiB0
aGUgcmVnaW9uIGFuZCBibG9jaydzIHNpemUKICAqIEBtaW5fYWRkcjogdGhlIGxvd2VyIGJvdW5k
IG9mIHRoZSBtZW1vcnkgcmVnaW9uIGZyb20gd2hlcmUgdGhlIGFsbG9jYXRpb24KQEAgLTE1MzYs
OSArMTUzNiw4IEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfdHJ5X25pZF9ub3Bhbmlj
KAogICoJICAgICAgYWxsb2NhdGUgb25seSBmcm9tIG1lbW9yeSBsaW1pdGVkIGJ5IG1lbWJsb2Nr
LmN1cnJlbnRfbGltaXQgdmFsdWUKICAqIEBuaWQ6IG5pZCBvZiB0aGUgZnJlZSBhcmVhIHRvIGZp
bmQsICVOVU1BX05PX05PREUgZm9yIGFueSBub2RlCiAgKgotICogUHVibGljIHBhbmlja2luZyB2
ZXJzaW9uIG9mIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfbm9wYW5pYygpCi0gKiB3aGljaCBwcm92
aWRlcyBkZWJ1ZyBpbmZvcm1hdGlvbiAoaW5jbHVkaW5nIGNhbGxlciBpbmZvKSwgaWYgZW5hYmxl
ZCwKLSAqIGFuZCBwYW5pY3MgaWYgdGhlIHJlcXVlc3QgY2FuIG5vdCBiZSBzYXRpc2ZpZWQuCisg
KiBQdWJsaWMgZnVuY3Rpb24sIHByb3ZpZGVzIGFkZGl0aW9uYWwgZGVidWcgaW5mb3JtYXRpb24g
KGluY2x1ZGluZyBjYWxsZXIKKyAqIGluZm8pLCBpZiBlbmFibGVkLiBUaGlzIGZ1bmN0aW9uIHpl
cm9lcyB0aGUgYWxsb2NhdGVkIG1lbW9yeS4KICAqCiAgKiBSZXR1cm46CiAgKiBWaXJ0dWFsIGFk
ZHJlc3Mgb2YgYWxsb2NhdGVkIG1lbW9yeSBibG9jayBvbiBzdWNjZXNzLCBOVUxMIG9uIGZhaWx1
cmUuCkBAIC0xNTU1LDE0ICsxNTU0LDEwIEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2Nf
dHJ5X25pZCgKIAkJICAgICAmbWF4X2FkZHIsICh2b2lkICopX1JFVF9JUF8pOwogCXB0ciA9IG1l
bWJsb2NrX2FsbG9jX2ludGVybmFsKHNpemUsIGFsaWduLAogCQkJCQkgICBtaW5fYWRkciwgbWF4
X2FkZHIsIG5pZCk7Ci0JaWYgKHB0cikgeworCWlmIChwdHIpCiAJCW1lbXNldChwdHIsIDAsIHNp
emUpOwotCQlyZXR1cm4gcHRyOwotCX0KIAotCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRl
ICVsbHUgYnl0ZXMgYWxpZ249MHglbGx4IG5pZD0lZCBmcm9tPSVwYSBtYXhfYWRkcj0lcGFcbiIs
Ci0JICAgICAgX19mdW5jX18sICh1NjQpc2l6ZSwgKHU2NClhbGlnbiwgbmlkLCAmbWluX2FkZHIs
ICZtYXhfYWRkcik7Ci0JcmV0dXJuIE5VTEw7CisJcmV0dXJuIHB0cjsKIH0KIAogLyoqCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
