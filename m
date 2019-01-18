From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 21/21] memblock: drop
 memblock_alloc_*_nopanic() variants
Date: Fri, 18 Jan 2019 09:42:30 +0100
Message-ID: <20190118084230.GA8855__10196.3290981532$1547800926$gmane$org@kroah.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-22-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9EN1=P2=linuxfoundation.org=gregkh@kernel.org>)
 id 1gkPk1-00052B-R1
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 08:43:05 +0000
Content-Disposition: inline
In-Reply-To: <1547646261-32535-22-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MjFQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBBcyBhbGwgdGhlIG1lbWJsb2NrIGFsbG9jYXRpb24gZnVuY3Rpb25zIHJldHVybiBO
VUxMIGluIGNhc2Ugb2YgZXJyb3IKPiByYXRoZXIgdGhhbiBwYW5pYygpLCB0aGUgZHVwbGljYXRl
cyB3aXRoIF9ub3BhbmljIHN1ZmZpeCBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJjL2tl
cm5lbC91bndpbmQuYyAgICAgICB8ICAzICstLQo+ICBhcmNoL3NoL21tL2luaXQuYyAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVyY3B1LmMgfCAxMCArKysr
Ky0tLS0tCj4gIGFyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYyAgICB8IDE0ICsrKysrKysrLS0t
LS0tCj4gIGRyaXZlcnMvZmlybXdhcmUvbWVtbWFwLmMgICAgICB8ICAyICstCj4gIGRyaXZlcnMv
dXNiL2Vhcmx5L3hoY2ktZGJjLmMgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvbWVtYmxvY2su
aCAgICAgICB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGtlcm5l
bC9kbWEvc3dpb3RsYi5jICAgICAgICAgICB8ICAyICstCj4gIGtlcm5lbC9wcmludGsvcHJpbnRr
LmMgICAgICAgICB8IDE3ICsrKysrKystLS0tLS0tLS0tCj4gIG1tL21lbWJsb2NrLmMgICAgICAg
ICAgICAgICAgICB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIG1t
L3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgbW0vcGFnZV9l
eHQuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbW0vcGVyY3B1LmMgICAgICAgICAgICAg
ICAgICAgIHwgMTEgKysrKy0tLS0tLS0KPiAgbW0vc3BhcnNlLmMgICAgICAgICAgICAgICAgICAg
IHwgIDYgKystLS0tCj4gIDE0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDExNCBk
ZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
