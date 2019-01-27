From: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v2 01/21] openrisc: prefer memblock APIs
 returning virtual address
Date: Sun, 27 Jan 2019 12:07:08 +0900
Message-ID: <20190127030708.GU3235__36306.0562683799$1548571065$gmane$org@lianli.shorne-pla.net>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-2-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2+pD=QD=gmail.com=shorne@srs-us1.protection.inumbo.net>)
 id 1gnamv-0001Da-TE
 for xen-devel@lists.xenproject.org; Sun, 27 Jan 2019 03:07:13 +0000
Received: by mail-pl1-x642.google.com with SMTP id u6so6245262plm.8
 for <xen-devel@lists.xenproject.org>; Sat, 26 Jan 2019 19:07:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1548057848-15136-2-git-send-email-rppt@linux.ibm.com>
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

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTA6MDM6NDhBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBUaGUgYWxsb2NhdGlvbiBvZiB0aGUgcGFnZSB0YWJsZXMgbWVtb3J5IGluIG9wZW5y
aWNzIHVzZXMKPiBtZW1ibG9ja19waHlzX2FsbG9jKCkgYW5kIHRoZW4gY29udmVydHMgdGhlIHJl
dHVybmVkIHBoeXNpY2FsIGFkZHJlc3MgdG8KPiB2aXJ0dWFsIG9uZS4gVXNlIG1lbWJsb2NrX2Fs
bG9jX3JhdygpIGFuZCBhZGQgYSBwYW5pYygpIGlmIHRoZSBhbGxvY2F0aW9uCj4gZmFpbHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0t
LQo+ICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL21tL2luaXQuYyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gaW5kZXggZDE1NzMx
MC4uY2FlYjQxOCAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL21tL2luaXQuYwo+ICsrKyBi
L2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gQEAgLTEwNSw3ICsxMDUsMTAgQEAgc3RhdGljIHZv
aWQgX19pbml0IG1hcF9yYW0odm9pZCkKPiAgCQkJfQo+ICAKPiAgCQkJLyogQWxsb2Mgb25lIHBh
Z2UgZm9yIGhvbGRpbmcgUFRFJ3MuLi4gKi8KPiAtCQkJcHRlID0gKHB0ZV90ICopIF9fdmEobWVt
YmxvY2tfcGh5c19hbGxvYyhQQUdFX1NJWkUsIFBBR0VfU0laRSkpOwo+ICsJCQlwdGUgPSBtZW1i
bG9ja19hbGxvY19yYXcoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwo+ICsJCQlpZiAoIXB0ZSkKPiAr
CQkJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlIHBhZ2UgZm9yIFBURXNcbiIsCj4gKwkJ
CQkgICAgICBfX2Z1bmNfXyk7Cj4gIAkJCXNldF9wbWQocG1lLCBfX3BtZChfS0VSTlBHX1RBQkxF
ICsgX19wYShwdGUpKSk7Cj4gIAo+ICAJCQkvKiBGaWxsIHRoZSBuZXdseSBhbGxvY2F0ZWQgcGFn
ZSB3aXRoIFBURSdTICovCgpUaGlzIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuCgpBY2tlZC1ieTog
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
