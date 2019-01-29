From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 06/21] memblock:
 memblock_phys_alloc_try_nid(): don't panic
Date: Tue, 29 Jan 2019 20:56:54 +1100
Message-ID: <87y373rdll.fsf__39299.9075514794$1548755884$gmane$org@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qp+R=QF=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1goQ8b-0004J7-QK
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:57:01 +0000
In-Reply-To: <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
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

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L21tL251bWEuYyBiL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gaW5kZXggYWUz
NGUzYS4uMmM2MWVhNCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L21tL251bWEuYwo+ICsrKyBi
L2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gQEAgLTIzNyw2ICsyMzcsMTAgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldHVwX25vZGVfZGF0YShpbnQgbmlkLCB1NjQgc3RhcnRfcGZuLCB1NjQgZW5kX3Bm
bikKPiAgCQlwcl9pbmZvKCJJbml0bWVtIHNldHVwIG5vZGUgJWQgWzxtZW1vcnktbGVzcyBub2Rl
Pl1cbiIsIG5pZCk7Cj4gIAo+ICAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQo
bmRfc2l6ZSwgU01QX0NBQ0hFX0JZVEVTLCBuaWQpOwo+ICsJaWYgKCFuZF9wYSkKPiArCQlwYW5p
YygiQ2Fubm90IGFsbG9jYXRlICV6dSBieXRlcyBmb3Igbm9kZSAlZCBkYXRhXG4iLAo+ICsJCSAg
ICAgIG5kX3NpemUsIG5pZCk7Cj4gKwo+ICAJbmQgPSBfX3ZhKG5kX3BhKTsKCkFja2VkLWJ5OiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQoKY2hlZXJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
