From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the
 return value of memblock_alloc*()
Date: Thu, 31 Jan 2019 07:07:46 +0100
Message-ID: <b7c12014-14ae-2a38-900c-41fd145307bc__36897.4135535368$1548914941$gmane$org@c-s.fr>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wBWz=QH=c-s.fr=christophe.leroy@srs-us1.protection.inumbo.net>)
 id 1gp5Vx-00032v-G9
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 06:07:53 +0000
In-Reply-To: <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Content-Language: fr
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-xtensa@li
List-Id: xen-devel@lists.xenproject.org

CgpMZSAyMS8wMS8yMDE5IMOgIDA5OjA0LCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gQWRk
IGNoZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIG1lbWJsb2NrX2FsbG9jKigpIGZ1bmN0aW9u
cyBhbmQgY2FsbAo+IHBhbmljKCkgaW4gY2FzZSBvZiBlcnJvci4KPiBUaGUgcGFuaWMgbWVzc2Fn
ZSByZXBlYXRzIHRoZSBvbmUgdXNlZCBieSBwYW5pY2luZyBtZW1ibG9jayBhbGxvY2F0b3JzIHdp
dGgKPiBhZGp1c3RtZW50IG9mIHBhcmFtZXRlcnMgdG8gaW5jbHVkZSBvbmx5IHJlbGV2YW50IG9u
ZXMuCj4gCj4gVGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkgYXV0b21hdGVkIHdpdGggc2VtYW50
aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiBiZWxvdyB3aXRoIG1hbnVhbCBtYXNzYWdpbmcgb2Yg
Zm9ybWF0IHN0cmluZ3MuCj4gCj4gQEAKPiBleHByZXNzaW9uIHB0ciwgc2l6ZSwgYWxpZ247Cj4g
QEAKPiBwdHIgPSBtZW1ibG9ja19hbGxvYyhzaXplLCBhbGlnbik7Cj4gKyBpZiAoIXB0cikKPiAr
IAlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUgYnl0ZXMgYWxpZ249MHglbHhcbiIs
IF9fZnVuY19fLAo+IHNpemUsIGFsaWduKTsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9w
b3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPHJlbl9ndW9A
Yy1za3kuY29tPiAgICAgICAgICAgICAjIGMtc2t5Cj4gQWNrZWQtYnk6IFBhdWwgQnVydG9uIDxw
YXVsLmJ1cnRvbkBtaXBzLmNvbT4JICAgICAjIE1JUFMKPiBBY2tlZC1ieTogSGVpa28gQ2Fyc3Rl
bnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+ICMgczM5MAo+IFJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ICAgICAgICAgIyBYZW4KPiAtLS0KClsuLi5dCgo+
IGRpZmYgLS1naXQgYS9tbS9zcGFyc2UuYyBiL21tL3NwYXJzZS5jCj4gaW5kZXggN2VhNWRjNi4u
YWQ5NDI0MiAxMDA2NDQKPiAtLS0gYS9tbS9zcGFyc2UuYwo+ICsrKyBiL21tL3NwYXJzZS5jCgpb
Li4uXQoKPiBAQCAtNDI1LDYgKzQzNiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc3BhcnNlX2J1
ZmZlcl9pbml0KHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCkKPiAgIAkJbWVtYmxvY2tfYWxs
b2NfdHJ5X25pZF9yYXcoc2l6ZSwgUEFHRV9TSVpFLAo+ICAgCQkJCQkJX19wYShNQVhfRE1BX0FE
RFJFU1MpLAo+ICAgCQkJCQkJTUVNQkxPQ0tfQUxMT0NfQUNDRVNTSUJMRSwgbmlkKTsKPiArCWlm
ICghc3BhcnNlbWFwX2J1ZikKPiArCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUg
Ynl0ZXMgYWxpZ249MHglbHggbmlkPSVkIGZyb209JWx4XG4iLAo+ICsJCSAgICAgIF9fZnVuY19f
LCBzaXplLCBQQUdFX1NJWkUsIG5pZCwgX19wYShNQVhfRE1BX0FERFJFU1MpKTsKPiArCgptZW1i
bG9ja19hbGxvY190cnlfbmlkX3JhdygpIGRvZXMgbm90IHBhbmljIChoZWxwIGV4cGxpY2l0bHkg
c2F5czogRG9lcyAKbm90IHplcm8gYWxsb2NhdGVkIG1lbW9yeSwgZG9lcyBub3QgcGFuaWMgaWYg
cmVxdWVzdCBjYW5ub3QgYmUgc2F0aXNmaWVkLikuCgpTdGVwaGVuIFJvdGh3ZWxsIHJlcG9ydHMg
YSBib290IGZhaWx1cmUgZHVlIHRvIHRoaXMgY2hhbmdlLgoKQ2hyaXN0b3BoZQoKPiAgIAlzcGFy
c2VtYXBfYnVmX2VuZCA9IHNwYXJzZW1hcF9idWYgKyBzaXplOwo+ICAgfQo+ICAgCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
