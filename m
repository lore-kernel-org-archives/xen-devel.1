From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 15/21] sparc: add checks for the return
 value of memblock_alloc*()
Date: Wed, 16 Jan 2019 09:21:47 -0800 (PST)
Message-ID: <20190116.092147.2222967221278304230.davem__45967.139179311$1547659252$gmane$org@davemloft.net>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-16-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5WqY=PY=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gjosz-0005Bt-5O
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 17:21:53 +0000
In-Reply-To: <1547646261-32535-16-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: rppt@linux.ibm.com
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, heiko.carstens@de.ibm.com, x86@kernel.org, linux-mips@vger.kernel.org, jcmvbkbc@gmail.com, guoren@kernel.org, sparclinux@vger.kernel.org, hch@lst.de, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp, richard@nod.at, linux-sh@vger.kernel.org, linux@armlinux.org.uk, kasan-dev@googlegroups.com, geert@linux-m68k.org, msalter@redhat.com, dennis@kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, pmladek@suse.com, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, robh+dt@kernel.org, green.hu@gmail.com, xen-devel@lists.xenproject.org, shorne@gmail.com, gxt@pku.edu.cn, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpEYXRlOiBXZWQsIDE2IEph
biAyMDE5IDE1OjQ0OjE1ICswMjAwCgo+IEFkZCBwYW5pYygpIGNhbGxzIGlmIG1lbWJsb2NrX2Fs
bG9jKigpIHJldHVybnMgTlVMTC4KPiAKPiBNb3N0IG9mIHRoZSBjaGFuZ2VzIGFyZSBzaW1wbHkg
YWRkaXRpb24gb2YKPiAKPiAgICAgICAgIGlmKCFwdHIpCj4gICAgICAgICAgICAgICAgIHBhbmlj
KCk7Cj4gCj4gc3RhdGVtZW50cyBhZnRlciB0aGUgY2FsbHMgdG8gbWVtYmxvY2tfYWxsb2MqKCkg
dmFyaWFudHMuCj4gCj4gRXhjZXB0aW9ucyBhcmUgcGNwdV9wb3B1bGF0ZV9wdGUoKSBhbmQga2Vy
bmVsX21hcF9yYW5nZSgpIHRoYXQgd2VyZQo+IHNsaWdodGx5IHJlZmFjdG9yZWQgdG8gYWNjb21t
b2RhdGUgdGhlIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+CgpBY2tlZC1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxv
ZnQubmV0PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
