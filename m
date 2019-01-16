From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 05/21] memblock: emphasize that
 memblock_alloc_range() returns a physical address
Date: Wed, 16 Jan 2019 15:44:05 +0200
Message-ID: <1547646261-32535-6-git-send-email-rppt__12253.6462302834$1547646242$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlVR-0006SV-Gw
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:45:21 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDeYoN019345
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:07 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q23t1dnqt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:45:07 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:45:03 -0000
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

UmVuYW1lIG1lbWJsb2NrX2FsbG9jX3JhbmdlKCkgdG8gbWVtYmxvY2tfcGh5c19hbGxvY19yYW5n
ZSgpIHRvIGVtcGhhc2l6ZQp0aGF0IGl0IHJldHVybnMgYSBwaHlzaWNhbCBhZGRyZXNzLgpXaGls
ZSBvbiBpdCwgcmVtb3ZlIHRoZSAnZW51bSBtZW1ibG9ja19mbGFncycgcGFyYW1ldGVyIGZyb20g
dGhpcyBmdW5jdGlvbgphcyBpdHMgb25seSB1c2VyIGFueXdheSBzZXRzIGl0IHRvIE1FTUJMT0NL
X05PTkUsIHdoaWNoIGlzIHRoZSBkZWZhdWx0IGZvcgp0aGUgbW9zdCBvZiBtZW1ibG9jayBhbGxv
Y2F0aW9ucy4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNv
bT4KLS0tCiBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggfCAgNSArKy0tLQogbW0vY21hLmMgICAg
ICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQogbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwg
IDkgKysrKystLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaCBiL2luY2x1ZGUv
bGludXgvbWVtYmxvY2suaAppbmRleCBmN2VmMzEzLi42NmRmZGIzIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L21lbWJsb2NrLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCkBAIC0z
NjksNiArMzY5LDggQEAgc3RhdGljIGlubGluZSBpbnQgbWVtYmxvY2tfZ2V0X3JlZ2lvbl9ub2Rl
KGNvbnN0IHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnIpCiAjZGVmaW5lIEFSQ0hfTE9XX0FERFJF
U1NfTElNSVQgIDB4ZmZmZmZmZmZVTAogI2VuZGlmCiAKK3BoeXNfYWRkcl90IG1lbWJsb2NrX3Bo
eXNfYWxsb2NfcmFuZ2UocGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpZ24sCisJCQkJ
ICAgICAgcGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCk7CiBwaHlzX2FkZHJfdCBt
ZW1ibG9ja19waHlzX2FsbG9jX25pZChwaHlzX2FkZHJfdCBzaXplLCBwaHlzX2FkZHJfdCBhbGln
biwgaW50IG5pZCk7CiBwaHlzX2FkZHJfdCBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQocGh5
c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpZ24sIGludCBuaWQpOwogCkBAIC00ODcsOSAr
NDg5LDYgQEAgc3RhdGljIGlubGluZSBib29sIG1lbWJsb2NrX2JvdHRvbV91cCh2b2lkKQogCXJl
dHVybiBtZW1ibG9jay5ib3R0b21fdXA7CiB9CiAKLXBoeXNfYWRkcl90IF9faW5pdCBtZW1ibG9j
a19hbGxvY19yYW5nZShwaHlzX2FkZHJfdCBzaXplLCBwaHlzX2FkZHJfdCBhbGlnbiwKLQkJCQkJ
cGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKLQkJCQkJZW51bSBtZW1ibG9ja19m
bGFncyBmbGFncyk7CiBwaHlzX2FkZHJfdCBtZW1ibG9ja19hbGxvY19iYXNlKHBoeXNfYWRkcl90
IHNpemUsIHBoeXNfYWRkcl90IGFsaWduLAogCQkJCXBoeXNfYWRkcl90IG1heF9hZGRyKTsKIHBo
eXNfYWRkcl90IF9fbWVtYmxvY2tfYWxsb2NfYmFzZShwaHlzX2FkZHJfdCBzaXplLCBwaHlzX2Fk
ZHJfdCBhbGlnbiwKZGlmZiAtLWdpdCBhL21tL2NtYS5jIGIvbW0vY21hLmMKaW5kZXggYzdiMzlk
ZC4uZTQ1MzBhZSAxMDA2NDQKLS0tIGEvbW0vY21hLmMKKysrIGIvbW0vY21hLmMKQEAgLTMyNywx
NiArMzI3LDE0IEBAIGludCBfX2luaXQgY21hX2RlY2xhcmVfY29udGlndW91cyhwaHlzX2FkZHJf
dCBiYXNlLAogCQkgKiBtZW1vcnkgaW4gY2FzZSBvZiBmYWlsdXJlLgogCQkgKi8KIAkJaWYgKGJh
c2UgPCBoaWdobWVtX3N0YXJ0ICYmIGxpbWl0ID4gaGlnaG1lbV9zdGFydCkgewotCQkJYWRkciA9
IG1lbWJsb2NrX2FsbG9jX3JhbmdlKHNpemUsIGFsaWdubWVudCwKLQkJCQkJCSAgICBoaWdobWVt
X3N0YXJ0LCBsaW1pdCwKLQkJCQkJCSAgICBNRU1CTE9DS19OT05FKTsKKwkJCWFkZHIgPSBtZW1i
bG9ja19waHlzX2FsbG9jX3JhbmdlKHNpemUsIGFsaWdubWVudCwKKwkJCQkJCQkgaGlnaG1lbV9z
dGFydCwgbGltaXQpOwogCQkJbGltaXQgPSBoaWdobWVtX3N0YXJ0OwogCQl9CiAKIAkJaWYgKCFh
ZGRyKSB7Ci0JCQlhZGRyID0gbWVtYmxvY2tfYWxsb2NfcmFuZ2Uoc2l6ZSwgYWxpZ25tZW50LCBi
YXNlLAotCQkJCQkJICAgIGxpbWl0LAotCQkJCQkJICAgIE1FTUJMT0NLX05PTkUpOworCQkJYWRk
ciA9IG1lbWJsb2NrX3BoeXNfYWxsb2NfcmFuZ2Uoc2l6ZSwgYWxpZ25tZW50LCBiYXNlLAorCQkJ
CQkJCSBsaW1pdCk7CiAJCQlpZiAoIWFkZHIpIHsKIAkJCQlyZXQgPSAtRU5PTUVNOwogCQkJCWdv
dG8gZXJyOwpkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJsb2NrLmMKaW5kZXgg
YzgwMDI5ZS4uZjAxOWFlZSAxMDA2NDQKLS0tIGEvbW0vbWVtYmxvY2suYworKysgYi9tbS9tZW1i
bG9jay5jCkBAIC0xMzM4LDEyICsxMzM4LDEzIEBAIHN0YXRpYyBwaHlzX2FkZHJfdCBfX2luaXQg
bWVtYmxvY2tfYWxsb2NfcmFuZ2VfbmlkKHBoeXNfYWRkcl90IHNpemUsCiAJcmV0dXJuIDA7CiB9
CiAKLXBoeXNfYWRkcl90IF9faW5pdCBtZW1ibG9ja19hbGxvY19yYW5nZShwaHlzX2FkZHJfdCBz
aXplLCBwaHlzX2FkZHJfdCBhbGlnbiwKLQkJCQkJcGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRk
cl90IGVuZCwKLQkJCQkJZW51bSBtZW1ibG9ja19mbGFncyBmbGFncykKK3BoeXNfYWRkcl90IF9f
aW5pdCBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKHBoeXNfYWRkcl90IHNpemUsCisJCQkJCSAg
ICAgcGh5c19hZGRyX3QgYWxpZ24sCisJCQkJCSAgICAgcGh5c19hZGRyX3Qgc3RhcnQsCisJCQkJ
CSAgICAgcGh5c19hZGRyX3QgZW5kKQogewogCXJldHVybiBtZW1ibG9ja19hbGxvY19yYW5nZV9u
aWQoc2l6ZSwgYWxpZ24sIHN0YXJ0LCBlbmQsIE5VTUFfTk9fTk9ERSwKLQkJCQkJZmxhZ3MpOwor
CQkJCQlNRU1CTE9DS19OT05FKTsKIH0KIAogcGh5c19hZGRyX3QgX19pbml0IG1lbWJsb2NrX3Bo
eXNfYWxsb2NfbmlkKHBoeXNfYWRkcl90IHNpemUsIHBoeXNfYWRkcl90IGFsaWduLCBpbnQgbmlk
KQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
