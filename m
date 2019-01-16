From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 06/21] memblock: memblock_phys_alloc_try_nid():
 don't panic
Date: Wed, 16 Jan 2019 15:44:06 +0200
Message-ID: <1547646261-32535-7-git-send-email-rppt__34003.1240521514$1547646248$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlVX-0006XC-5r
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:45:27 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDed8f031605
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:13 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q25eu0w69-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:13 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:45:09 -0000
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

VGhlIG1lbWJsb2NrX3BoeXNfYWxsb2NfdHJ5X25pZCgpIGZ1bmN0aW9uIHRyaWVzIHRvIGFsbG9j
YXRlIG1lbW9yeSBmcm9tCnRoZSByZXF1ZXN0ZWQgbm9kZSBhbmQgdGhlbiBmYWxscyBiYWNrIHRv
IGFsbG9jYXRpb24gZnJvbSBhbnkgbm9kZSBpbiB0aGUKc3lzdGVtLiBUaGUgbWVtYmxvY2tfYWxs
b2NfYmFzZSgpIGZhbGxiYWNrIHVzZWQgYnkgdGhpcyBmdW5jdGlvbiBwYW5pY3MgaWYKdGhlIGFs
bG9jYXRpb24gZmFpbHMuCgpSZXBsYWNlIHRoZSBtZW1ibG9ja19hbGxvY19iYXNlKCkgZmFsbGJh
Y2sgd2l0aCB0aGUgZGlyZWN0IGNhbGwgdG8KbWVtYmxvY2tfYWxsb2NfcmFuZ2VfbmlkKCkgYW5k
IHVwZGF0ZSB0aGUgbWVtYmxvY2tfcGh5c19hbGxvY190cnlfbmlkKCkKY2FsbGVycyB0byBjaGVj
ayB0aGUgcmV0dXJuZWQgdmFsdWUgYW5kIHBhbmljIGluIGNhc2Ugb2YgZXJyb3IuCgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9hcm02
NC9tbS9udW1hLmMgICB8IDQgKysrKwogYXJjaC9wb3dlcnBjL21tL251bWEuYyB8IDQgKysrKwog
bW0vbWVtYmxvY2suYyAgICAgICAgICB8IDQgKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1h
LmMgYi9hcmNoL2FybTY0L21tL251bWEuYwppbmRleCBhZTM0ZTNhLi4yYzYxZWE0IDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L21tL251bWEuYworKysgYi9hcmNoL2FybTY0L21tL251bWEuYwpAQCAt
MjM3LDYgKzIzNywxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbm9kZV9kYXRhKGludCBu
aWQsIHU2NCBzdGFydF9wZm4sIHU2NCBlbmRfcGZuKQogCQlwcl9pbmZvKCJJbml0bWVtIHNldHVw
IG5vZGUgJWQgWzxtZW1vcnktbGVzcyBub2RlPl1cbiIsIG5pZCk7CiAKIAluZF9wYSA9IG1lbWJs
b2NrX3BoeXNfYWxsb2NfdHJ5X25pZChuZF9zaXplLCBTTVBfQ0FDSEVfQllURVMsIG5pZCk7CisJ
aWYgKCFuZF9wYSkKKwkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUg
JWQgZGF0YVxuIiwKKwkJICAgICAgbmRfc2l6ZSwgbmlkKTsKKwogCW5kID0gX192YShuZF9wYSk7
CiAKIAkvKiByZXBvcnQgYW5kIGluaXRpYWxpemUgKi8KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9tbS9udW1hLmMgYi9hcmNoL3Bvd2VycGMvbW0vbnVtYS5jCmluZGV4IDI3MGNlZmIuLjhmMmJi
ZTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9udW1hLmMKKysrIGIvYXJjaC9wb3dlcnBj
L21tL251bWEuYwpAQCAtNzg4LDYgKzc4OCwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
bm9kZV9kYXRhKGludCBuaWQsIHU2NCBzdGFydF9wZm4sIHU2NCBlbmRfcGZuKQogCWludCB0bmlk
OwogCiAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQobmRfc2l6ZSwgU01QX0NB
Q0hFX0JZVEVTLCBuaWQpOworCWlmICghbmRfcGEpCisJCXBhbmljKCJDYW5ub3QgYWxsb2NhdGUg
JXp1IGJ5dGVzIGZvciBub2RlICVkIGRhdGFcbiIsCisJCSAgICAgIG5kX3NpemUsIG5pZCk7CisK
IAluZCA9IF9fdmEobmRfcGEpOwogCiAJLyogcmVwb3J0IGFuZCBpbml0aWFsaXplICovCmRpZmYg
LS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCBmMDE5YWVlLi44YWFi
YjFiIDEwMDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEz
OTMsNyArMTM5Myw5IEBAIHBoeXNfYWRkcl90IF9faW5pdCBtZW1ibG9ja19waHlzX2FsbG9jX3Ry
eV9uaWQocGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpCiAKIAlpZiAocmVzKQogCQly
ZXR1cm4gcmVzOwotCXJldHVybiBtZW1ibG9ja19hbGxvY19iYXNlKHNpemUsIGFsaWduLCBNRU1C
TE9DS19BTExPQ19BQ0NFU1NJQkxFKTsKKwlyZXR1cm4gbWVtYmxvY2tfYWxsb2NfcmFuZ2Vfbmlk
KHNpemUsIGFsaWduLCAwLAorCQkJCQlNRU1CTE9DS19BTExPQ19BQ0NFU1NJQkxFLAorCQkJCQlO
VU1BX05PX05PREUsIE1FTUJMT0NLX05PTkUpOwogfQogCiAvKioKLS0gCjIuNy40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
