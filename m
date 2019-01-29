From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 09/21] memblock: drop
 memblock_alloc_base()
Date: Tue, 29 Jan 2019 21:29:19 +1100
Message-ID: <87sgxbrc3k.fsf__49972.7675852895$1548757830$gmane$org@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-10-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qp+R=QF=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1goQe3-0007zY-Bh
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 10:29:31 +0000
In-Reply-To: <1548057848-15136-10-git-send-email-rppt@linux.ibm.com>
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

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IFRoZSBtZW1ibG9j
a19hbGxvY19iYXNlKCkgZnVuY3Rpb24gdHJpZXMgdG8gYWxsb2NhdGUgYSBtZW1vcnkgdXAgdG8g
dGhlCj4gbGltaXQgc3BlY2lmaWVkIGJ5IGl0cyBtYXhfYWRkciBwYXJhbWV0ZXIgYW5kIHBhbmlj
cyBpZiB0aGUgYWxsb2NhdGlvbgo+IGZhaWxzLiBSZXBsYWNlIGl0cyB1c2FnZSB3aXRoIG1lbWJs
b2NrX3BoeXNfYWxsb2NfcmFuZ2UoKSBhbmQgbWFrZSB0aGUKPiBjYWxsZXJzIGNoZWNrIHRoZSBy
ZXR1cm4gdmFsdWUgYW5kIHBhbmljIGluIGNhc2Ugb2YgZXJyb3IuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvcnRhcy5jICAgICAgfCAgNiArKysrKy0KPiAgYXJjaC9wb3dlcnBjL21tL2hhc2hf
dXRpbHNfNjQuYyB8ICA4ICsrKysrKy0tCj4gIGFyY2gvczM5MC9rZXJuZWwvc21wLmMgICAgICAg
ICAgfCAgNiArKysrKy0KPiAgZHJpdmVycy9tYWNpbnRvc2gvc211LmMgICAgICAgICB8ICAyICst
Cj4gIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaCAgICAgICAgfCAgMiAtLQo+ICBtbS9tZW1ibG9j
ay5jICAgICAgICAgICAgICAgICAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBNaWNoYWVs
IEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQoKY2hlZXJzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
