From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the
 return value of memblock_alloc*()
Date: Mon, 21 Jan 2019 09:39:40 +0100
Message-ID: <CAMuHMdUhaTv0E3oMjMjoW0XReZgB=bm+8OGUvuDtLPBJzGQYjw__21987.0695531883$1548060044$gmane$org@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h+p5=P5=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1glV7d-0005Bp-0R
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 08:39:57 +0000
Received: by mail-vs1-f65.google.com with SMTP id p74so12158523vsc.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 00:39:54 -0800 (PST)
In-Reply-To: <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgOTowNiBBTSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+IHdyb3RlOgo+IEFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1i
bG9ja19hbGxvYyooKSBmdW5jdGlvbnMgYW5kIGNhbGwKPiBwYW5pYygpIGluIGNhc2Ugb2YgZXJy
b3IuCj4gVGhlIHBhbmljIG1lc3NhZ2UgcmVwZWF0cyB0aGUgb25lIHVzZWQgYnkgcGFuaWNpbmcg
bWVtYmxvY2sgYWxsb2NhdG9ycyB3aXRoCj4gYWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRvIGlu
Y2x1ZGUgb25seSByZWxldmFudCBvbmVzLgo+Cj4gVGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkg
YXV0b21hdGVkIHdpdGggc2VtYW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiBiZWxvdyB3aXRo
IG1hbnVhbCBtYXNzYWdpbmcgb2YgZm9ybWF0IHN0cmluZ3MuCj4KPiBAQAo+IGV4cHJlc3Npb24g
cHRyLCBzaXplLCBhbGlnbjsKPiBAQAo+IHB0ciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWdu
KTsKPiArIGlmICghcHRyKQo+ICsgICAgICAgcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUg
JWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLCBfX2Z1bmNfXywKPiBzaXplLCBhbGlnbik7Cj4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cgo+ICBhcmNo
L202OGsvYXRhcmkvc3RyYW0uYyAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9t
NjhrL21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKPiAgYXJjaC9tNjhr
L21tL21jZm1tdS5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiAgYXJjaC9tNjhr
L21tL21vdG9yb2xhLmMgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKPiAgYXJjaC9t
NjhrL21tL3N1bjNtbXUuYyAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiAgYXJjaC9t
NjhrL3N1bjMvc3VuM2R2bWEuYyAgICAgICAgICAgICAgICAgfCAgMyArKysKCkZvciBtNjhrOgpS
ZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KQWNr
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
