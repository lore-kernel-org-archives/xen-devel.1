From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2 21/21] memblock: drop
 memblock_alloc_*_nopanic() variants
Date: Wed, 30 Jan 2019 14:38:45 +0100
Message-ID: <20190130133845.nps4itatl4fm6dcl__39358.7172309466$1548855590$gmane$org@pathway.suse.cz>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-22-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z9Wc=QG=suse.com=pmladek@srs-us1.protection.inumbo.net>)
 id 1goq4q-0006Ke-FK
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 13:38:52 +0000
Content-Disposition: inline
In-Reply-To: <1548057848-15136-22-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDIwMTktMDEtMjEgMTA6MDQ6MDgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gQXMgYWxs
IHRoZSBtZW1ibG9jayBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXR1cm4gTlVMTCBpbiBjYXNlIG9m
IGVycm9yCj4gcmF0aGVyIHRoYW4gcGFuaWMoKSwgdGhlIGR1cGxpY2F0ZXMgd2l0aCBfbm9wYW5p
YyBzdWZmaXggY2FuIGJlIHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+ICBhcmNoL2FyYy9rZXJuZWwvdW53aW5k
LmMgICAgICAgfCAgMyArLS0KPiAgYXJjaC9zaC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgYXJjaC94ODYva2VybmVsL3NldHVwX3BlcmNwdS5jIHwgMTAgKysrKystLS0tLQo+ICBh
cmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMgICAgfCAxNCArKysrKysrKy0tLS0tLQo+ICBkcml2
ZXJzL2Zpcm13YXJlL21lbW1hcC5jICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3VzYi9lYXJseS94
aGNpLWRiYy5jICAgfCAgMiArLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICAgfCAz
NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBrZXJuZWwvZG1hL3N3aW90
bGIuYyAgICAgICAgICAgfCAgMiArLQo+ICBrZXJuZWwvcHJpbnRrL3ByaW50ay5jICAgICAgICAg
fCAgOSArLS0tLS0tLS0KCkZvciBwcmludGs6ClJldmlld2VkLWJ5OiBQZXRyIE1sYWRlayA8cG1s
YWRla0BzdXNlLmNvbT4KQWNrZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgoK
QmVzdCBSZWdhcmRzLApQZXRyCgo+ICBtbS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAgfCAz
NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBtbS9wYWdlX2FsbG9jLmMg
ICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIG1tL3BhZ2VfZXh0LmMgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIG1tL3BlcmNwdS5jICAgICAgICAgICAgICAgICAgICB8IDExICsr
KystLS0tLS0tCj4gIG1tL3NwYXJzZS5jICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+
ICAxNCBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMTIgZGVsZXRpb25zKC0pCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
