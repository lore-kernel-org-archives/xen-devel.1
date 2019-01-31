From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the
 return value of memblock_alloc*()
Date: Thu, 31 Jan 2019 07:23:02 -0800
Message-ID: <CAMo8BfKhjwimXrGCcPjmS0+w8o6yW=ohG-hZ7caWnGpPSF6qJA__10376.319736109$1548949315$gmane$org@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DyzR=QH=gmail.com=jcmvbkbc@srs-us1.protection.inumbo.net>)
 id 1gpEBQ-0007Xw-A2
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 15:23:16 +0000
Received: by mail-yw1-xc41.google.com with SMTP id t13so1380125ywe.13
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 07:23:14 -0800 (PST)
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
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.orgm
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTI6MDYgQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPiB3cm90ZToKPgo+IEFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBt
ZW1ibG9ja19hbGxvYyooKSBmdW5jdGlvbnMgYW5kIGNhbGwKPiBwYW5pYygpIGluIGNhc2Ugb2Yg
ZXJyb3IuCj4gVGhlIHBhbmljIG1lc3NhZ2UgcmVwZWF0cyB0aGUgb25lIHVzZWQgYnkgcGFuaWNp
bmcgbWVtYmxvY2sgYWxsb2NhdG9ycyB3aXRoCj4gYWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRv
IGluY2x1ZGUgb25seSByZWxldmFudCBvbmVzLgo+Cj4gVGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0
bHkgYXV0b21hdGVkIHdpdGggc2VtYW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiBiZWxvdyB3
aXRoIG1hbnVhbCBtYXNzYWdpbmcgb2YgZm9ybWF0IHN0cmluZ3MuCj4KPiBAQAo+IGV4cHJlc3Np
b24gcHRyLCBzaXplLCBhbGlnbjsKPiBAQAo+IHB0ciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFs
aWduKTsKPiArIGlmICghcHRyKQo+ICsgICAgICAgcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2Nh
dGUgJWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLCBfX2Z1bmNfXywKPiBzaXplLCBhbGlnbik7Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEd1byBSZW4gPHJlbl9ndW9AYy1za3kuY29tPiAgICAgICAgICAgICAjIGMtc2t5
Cj4gQWNrZWQtYnk6IFBhdWwgQnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4gICAgICAgICAj
IE1JUFMKPiBBY2tlZC1ieTogSGVpa28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5j
b20+ICMgczM5MAo+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
ICAgICAgICAgIyBYZW4KPiAtLS0KPiAgYXJjaC94dGVuc2EvbW0va2FzYW5faW5pdC5jICAgICAg
ICAgICAgICAgfCAgNCArKysrCj4gIGFyY2gveHRlbnNhL21tL21tdS5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKysrCgpGb3IgeHRlbnNhOgpBY2tlZC1ieTogTWF4IEZpbGlwcG92IDxqY212
YmtiY0BnbWFpbC5jb20+CgotLSAKVGhhbmtzLgotLSBNYXgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
