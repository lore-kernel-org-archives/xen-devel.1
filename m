From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 02/21] powerpc: use memblock functions
 returning virtual address
Date: Tue, 29 Jan 2019 20:52:17 +1100
Message-ID: <871s4vssdq.fsf__30043.2943551399$1548755614$gmane$org@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-3-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qp+R=QF=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1goQ4K-00048u-EK
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:52:36 +0000
In-Reply-To: <1548057848-15136-3-git-send-email-rppt@linux.ibm.com>
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

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IEZyb206IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgo+Cj4gU2luY2Ugb25seSB0aGUg
dmlydHVhbCBhZGRyZXNzIG9mIGFsbG9jYXRlZCBibG9ja3MgaXMgdXNlZCwKPiBsZXRzIHVzZSBm
dW5jdGlvbnMgcmV0dXJuaW5nIGRpcmVjdGx5IHZpcnR1YWwgYWRkcmVzcy4KPgo+IFRob3NlIGZ1
bmN0aW9ucyBoYXZlIHRoZSBhZHZhbnRhZ2Ugb2YgYWxzbyB6ZXJvaW5nIHRoZSBibG9jay4KPgo+
IFsgTVI6Cj4gIC0gdXBkYXRlZCBlcnJvciBtZXNzYWdlIGluIGFsbG9jX3N0YWNrKCkgdG8gYmUg
bW9yZSB2ZXJib3NlCj4gIC0gY29udmVyZXRlZCBzZXZlcmFsIGFkZGl0aW9uYWwgY2FsbCBzaXRl
cyBdCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGMtcy5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5j
b20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvZHRfY3B1X2Z0cnMuYyB8ICAzICstLQo+
ICBhcmNoL3Bvd2VycGMva2VybmVsL2lycS5jICAgICAgICAgfCAgNSAtLS0tLQo+ICBhcmNoL3Bv
d2VycGMva2VybmVsL3BhY2EuYyAgICAgICAgfCAgNiArKysrKy0KPiAgYXJjaC9wb3dlcnBjL2tl
cm5lbC9wcm9tLmMgICAgICAgIHwgIDUgKysrKy0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1
cF8zMi5jICAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCkxHVE0uCgpBY2tlZC1ieTog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgoKY2hlZXJzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
