From: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Thu, 17 Jan 2019 15:06:03 +0800
Message-ID: <20190117070602.GA31839__39015.904806047$1547709390$gmane$org@guoren-Inspiron-7460>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aPK7=PZ=kernel.org=guoren@srs-us1.protection.inumbo.net>)
 id 1gk1lK-0001GG-9R
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 07:06:50 +0000
Content-Disposition: inline
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MTlQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiAgYXJjaC9jc2t5L21tL2hpZ2htZW0uYyAgICAgICAgICAgICAgICAgICAgfCAgNSAr
KysrKwouLi4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2hpZ2htZW0uYyBiL2FyY2gvY3Nr
eS9tbS9oaWdobWVtLmMKPiBpbmRleCA1M2IxYmZhLi4zMzE3Yjc3NCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2Nza3kvbW0vaGlnaG1lbS5jCj4gKysrIGIvYXJjaC9jc2t5L21tL2hpZ2htZW0uYwo+IEBA
IC0xNDEsNiArMTQxLDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmaXhyYW5nZV9pbml0KHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+ICAJCQlmb3IgKDsgKGsgPCBQVFJT
X1BFUl9QTUQpICYmICh2YWRkciAhPSBlbmQpOyBwbWQrKywgaysrKSB7Cj4gIAkJCQlpZiAocG1k
X25vbmUoKnBtZCkpIHsKPiAgCQkJCQlwdGUgPSAocHRlX3QgKikgbWVtYmxvY2tfYWxsb2NfbG93
KFBBR0VfU0laRSwgUEFHRV9TSVpFKTsKPiArCQkJCQlpZiAoIXB0ZSkKPiArCQkJCQkJcGFuaWMo
IiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPSVseFxuIiwKPiArCQkJCQkJ
ICAgICAgX19mdW5jX18sIFBBR0VfU0laRSwKPiArCQkJCQkJICAgICAgUEFHRV9TSVpFKTsKPiAr
Cj4gIAkJCQkJc2V0X3BtZChwbWQsIF9fcG1kKF9fcGEocHRlKSkpOwo+ICAJCQkJCUJVR19PTihw
dGUgIT0gcHRlX29mZnNldF9rZXJuZWwocG1kLCAwKSk7Cj4gIAkJCQl9CgpMb29rcyBnb29kIGZv
ciBtZSBhbmQgcGFuaWMgaXMgb2suCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8cmVuX2d1b0BjLXNr
eS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
