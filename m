From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 21/21] memblock: drop
 memblock_alloc_*_nopanic() variants
Date: Thu, 17 Jan 2019 10:28:42 +0100
Message-ID: <20190117092842.wnvsc6em5mxga3rn__33831.2862943441$1547717318$gmane$org@pathway.suse.cz>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-22-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/e1m=PZ=suse.com=pmladek@srs-us1.protection.inumbo.net>)
 id 1gk3zg-0004hz-E8
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 09:29:48 +0000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDIwMTktMDEtMTYgMTU6NDQ6MjEsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gQXMgYWxs
IHRoZSBtZW1ibG9jayBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXR1cm4gTlVMTCBpbiBjYXNlIG9m
IGVycm9yCj4gcmF0aGVyIHRoYW4gcGFuaWMoKSwgdGhlIGR1cGxpY2F0ZXMgd2l0aCBfbm9wYW5p
YyBzdWZmaXggY2FuIGJlIHJlbW92ZWQuCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEva2VybmVsL3By
aW50ay9wcmludGsuYyBiL2tlcm5lbC9wcmludGsvcHJpbnRrLmMKPiBpbmRleCBjNGYwYTQxLi5h
ZTY1MjIxIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9wcmludGsvcHJpbnRrLmMKPiArKysgYi9rZXJu
ZWwvcHJpbnRrL3ByaW50ay5jCj4gQEAgLTExNDcsMTcgKzExNDcsMTQgQEAgdm9pZCBfX2luaXQg
c2V0dXBfbG9nX2J1ZihpbnQgZWFybHkpCj4gIAlpZiAoIW5ld19sb2dfYnVmX2xlbikKPiAgCQly
ZXR1cm47Cj4gIAo+IC0JaWYgKGVhcmx5KSB7Cj4gLQkJbmV3X2xvZ19idWYgPQo+IC0JCQltZW1i
bG9ja19hbGxvYyhuZXdfbG9nX2J1Zl9sZW4sIExPR19BTElHTik7Cj4gLQl9IGVsc2Ugewo+IC0J
CW5ld19sb2dfYnVmID0gbWVtYmxvY2tfYWxsb2Nfbm9wYW5pYyhuZXdfbG9nX2J1Zl9sZW4sCj4g
LQkJCQkJCQkgIExPR19BTElHTik7Cj4gLQl9Cj4gLQo+ICsJbmV3X2xvZ19idWYgPSBtZW1ibG9j
a19hbGxvYyhuZXdfbG9nX2J1Zl9sZW4sIExPR19BTElHTik7CgpUaGUgYWJvdmUgY2hhbmdlIGlz
IGVub3VnaC4KCj4gIAlpZiAodW5saWtlbHkoIW5ld19sb2dfYnVmKSkgewo+IC0JCXByX2Vycigi
bG9nX2J1Zl9sZW46ICVsdSBieXRlcyBub3QgYXZhaWxhYmxlXG4iLAo+IC0JCQluZXdfbG9nX2J1
Zl9sZW4pOwo+ICsJCWlmIChlYXJseSkKPiArCQkJcGFuaWMoImxvZ19idWZfbGVuOiAlbHUgYnl0
ZXMgbm90IGF2YWlsYWJsZVxuIiwKPiArCQkJCW5ld19sb2dfYnVmX2xlbik7CgpwYW5pYygpIGlz
IG5vdCBuZWVkZWQgaGVyZS4gcHJpbnRrKCkgd2lsbCBqdXN0IGNvbnRpbnVlIHVzaW5nCnRoZSAo
c21hbGxlcikgc3RhdGljIGJ1ZmZlci4KCj4gKwkJZWxzZQo+ICsJCQlwcl9lcnIoImxvZ19idWZf
bGVuOiAlbHUgYnl0ZXMgbm90IGF2YWlsYWJsZVxuIiwKPiArCQkJICAgICAgIG5ld19sb2dfYnVm
X2xlbik7Cj4gIAkJcmV0dXJuOwo+ICAJfQoKQmVzdCBSZWdhcmRzLApQZXRyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
