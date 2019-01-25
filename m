From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 06/21] memblock:
 memblock_phys_alloc_try_nid(): don't panic
Date: Fri, 25 Jan 2019 21:32:52 +0200
Message-ID: <20190125193252.GH31519__27983.7061696284$1548444870$gmane$org@rapoport-lnx>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
 <20190125174502.GL25901@arrakis.emea.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hnek=QB=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gn7E6-0002FS-Uu
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 19:33:18 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0PJNgeO084696
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 14:33:16 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q888x11pg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 14:33:15 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Fri, 25 Jan 2019 19:33:11 -0000
Content-Disposition: inline
In-Reply-To: <20190125174502.GL25901@arrakis.emea.arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@l
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDU6NDU6MDJQTSArMDAwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDIxLCAyMDE5IGF0IDEwOjAzOjUzQU0gKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9h
cmNoL2FybTY0L21tL251bWEuYwo+ID4gaW5kZXggYWUzNGUzYS4uMmM2MWVhNCAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gPiArKysgYi9hcmNoL2FybTY0L21tL251bWEu
Ywo+ID4gQEAgLTIzNyw2ICsyMzcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX25vZGVf
ZGF0YShpbnQgbmlkLCB1NjQgc3RhcnRfcGZuLCB1NjQgZW5kX3BmbikKPiA+ICAJCXByX2luZm8o
IkluaXRtZW0gc2V0dXAgbm9kZSAlZCBbPG1lbW9yeS1sZXNzIG5vZGU+XVxuIiwgbmlkKTsKPiA+
ICAKPiA+ICAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQobmRfc2l6ZSwgU01Q
X0NBQ0hFX0JZVEVTLCBuaWQpOwo+ID4gKwlpZiAoIW5kX3BhKQo+ID4gKwkJcGFuaWMoIkNhbm5v
dCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUgJWQgZGF0YVxuIiwKPiA+ICsJCSAgICAgIG5k
X3NpemUsIG5pZCk7Cj4gPiArCj4gPiAgCW5kID0gX192YShuZF9wYSk7Cj4gPiAgCj4gPiAgCS8q
IHJlcG9ydCBhbmQgaW5pdGlhbGl6ZSAqLwo+IAo+IERvZXMgaXQgbWVhbiB0aGF0IG1lbWJsb2Nr
X3BoeXNfYWxsb2NfdHJ5X25pZCgpIG5ldmVyIHJldHVybnMgdmFsaWQKPiBwaHlzaWNhbCBtZW1v
cnkgc3RhcnRpbmcgYXQgMD8KClllcywgaXQgZG9lcy4KbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9u
b2RlKCkgdGhhdCBpcyB1c2VkIGJ5IGFsbCBhbGxvY2F0aW9uIG1ldGhvZHMKc2tpcHMgdGhlIGZp
cnN0IHBhZ2UgWzFdLgogClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9tbS9tZW1ibG9jay5jI24yNTcKCj4g
LS0gCj4gQ2F0YWxpbgo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
