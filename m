From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the
 return value of memblock_alloc*()
Date: Thu, 31 Jan 2019 08:41:39 +0200
Message-ID: <20190131064139.GB28876__25901.6103389271$1548916989$gmane$org@rapoport-lnx>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
 <b7c12014-14ae-2a38-900c-41fd145307bc@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3pr=QH=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gp631-000775-Kv
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 06:42:03 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0V6cfjd017113
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 01:42:01 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qbss2wdj9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 01:42:01 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Thu, 31 Jan 2019 06:41:57 -0000
Content-Disposition: inline
In-Reply-To: <b7c12014-14ae-2a38-900c-41fd145307bc@c-s.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-xtensa@li
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDc6MDc6NDZBTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiAKPiBMZSAyMS8wMS8yMDE5IMOgIDA5OjA0LCBNaWtlIFJhcG9wb3J0IGEg
w6ljcml0wqA6Cj4gPkFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1ibG9ja19h
bGxvYyooKSBmdW5jdGlvbnMgYW5kIGNhbGwKPiA+cGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+
ID5UaGUgcGFuaWMgbWVzc2FnZSByZXBlYXRzIHRoZSBvbmUgdXNlZCBieSBwYW5pY2luZyBtZW1i
bG9jayBhbGxvY2F0b3JzIHdpdGgKPiA+YWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRvIGluY2x1
ZGUgb25seSByZWxldmFudCBvbmVzLgo+ID4KPiA+VGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkg
YXV0b21hdGVkIHdpdGggc2VtYW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiA+YmVsb3cgd2l0
aCBtYW51YWwgbWFzc2FnaW5nIG9mIGZvcm1hdCBzdHJpbmdzLgo+ID4KPiA+QEAKPiA+ZXhwcmVz
c2lvbiBwdHIsIHNpemUsIGFsaWduOwo+ID5AQAo+ID5wdHIgPSBtZW1ibG9ja19hbGxvYyhzaXpl
LCBhbGlnbik7Cj4gPisgaWYgKCFwdHIpCj4gPisgCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9j
YXRlICVsdSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18sCj4gPnNpemUsIGFsaWduKTsK
PiA+Cj4gPlNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
PiA+UmV2aWV3ZWQtYnk6IEd1byBSZW4gPHJlbl9ndW9AYy1za3kuY29tPiAgICAgICAgICAgICAj
IGMtc2t5Cj4gPkFja2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+CSAg
ICAgIyBNSVBTCj4gPkFja2VkLWJ5OiBIZWlrbyBDYXJzdGVucyA8aGVpa28uY2Fyc3RlbnNAZGUu
aWJtLmNvbT4gIyBzMzkwCj4gPlJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+ICAgICAgICAgIyBYZW4KPiA+LS0tCj4gCj4gWy4uLl0KPiAKPiA+ZGlmZiAtLWdpdCBh
L21tL3NwYXJzZS5jIGIvbW0vc3BhcnNlLmMKPiA+aW5kZXggN2VhNWRjNi4uYWQ5NDI0MiAxMDA2
NDQKPiA+LS0tIGEvbW0vc3BhcnNlLmMKPiA+KysrIGIvbW0vc3BhcnNlLmMKPiAKPiBbLi4uXQo+
IAo+ID5AQCAtNDI1LDYgKzQzNiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc3BhcnNlX2J1ZmZl
cl9pbml0KHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCkKPiA+ICAJCW1lbWJsb2NrX2FsbG9j
X3RyeV9uaWRfcmF3KHNpemUsIFBBR0VfU0laRSwKPiA+ICAJCQkJCQlfX3BhKE1BWF9ETUFfQURE
UkVTUyksCj4gPiAgCQkJCQkJTUVNQkxPQ0tfQUxMT0NfQUNDRVNTSUJMRSwgbmlkKTsKPiA+Kwlp
ZiAoIXNwYXJzZW1hcF9idWYpCj4gPisJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVs
dSBieXRlcyBhbGlnbj0weCVseCBuaWQ9JWQgZnJvbT0lbHhcbiIsCj4gPisJCSAgICAgIF9fZnVu
Y19fLCBzaXplLCBQQUdFX1NJWkUsIG5pZCwgX19wYShNQVhfRE1BX0FERFJFU1MpKTsKPiA+Kwo+
IAo+IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfcmF3KCkgZG9lcyBub3QgcGFuaWMgKGhlbHAgZXhw
bGljaXRseSBzYXlzOiBEb2VzIG5vdAo+IHplcm8gYWxsb2NhdGVkIG1lbW9yeSwgZG9lcyBub3Qg
cGFuaWMgaWYgcmVxdWVzdCBjYW5ub3QgYmUgc2F0aXNmaWVkLikuCgoiRG9lcyBub3QgcGFuaWMi
IGRvZXMgbm90IG1lYW4gaXQgYWx3YXlzIHN1Y2NlZWRzLgogCj4gU3RlcGhlbiBSb3Rod2VsbCBy
ZXBvcnRzIGEgYm9vdCBmYWlsdXJlIGR1ZSB0byB0aGlzIGNoYW5nZS4KClBsZWFzZSBzZWUgbXkg
cmVwbHkgb24gdGhhdCB0aHJlYWQuCgo+IENocmlzdG9waGUKPiAKPiA+ICAJc3BhcnNlbWFwX2J1
Zl9lbmQgPSBzcGFyc2VtYXBfYnVmICsgc2l6ZTsKPiA+ICB9Cj4gPgo+IAoKLS0gClNpbmNlcmVs
eSB5b3VycywKTWlrZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
