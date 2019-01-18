From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Fri, 18 Jan 2019 18:02:03 +0000
Message-ID: <20190118180201.uva5nhf2g23uamkn__25599.0436453887$1547880418$gmane$org@pburton-laptop>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B57R=P2=wavecomp.com=pburton@srs-us1.protection.inumbo.net>)
 id 1gkYT2-0002DC-Ta
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 18:02:08 +0000
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Content-Language: en-US
Content-ID: <8AB5FF9934BD5A4E822E85B3C315428B@namprd22.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: xen-devel@lists.xenproject.org

SGkgTWlrZSwKCk9uIFdlZCwgSmFuIDE2LCAyMDE5IGF0IDAzOjQ0OjE5UE0gKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6Cj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIG1lbWJs
b2NrX2FsbG9jKigpIGZ1bmN0aW9ucyBhbmQgY2FsbAo+IHBhbmljKCkgaW4gY2FzZSBvZiBlcnJv
ci4KPiBUaGUgcGFuaWMgbWVzc2FnZSByZXBlYXRzIHRoZSBvbmUgdXNlZCBieSBwYW5pY2luZyBt
ZW1ibG9jayBhbGxvY2F0b3JzIHdpdGgKPiBhZGp1c3RtZW50IG9mIHBhcmFtZXRlcnMgdG8gaW5j
bHVkZSBvbmx5IHJlbGV2YW50IG9uZXMuCj4gCj4gVGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkg
YXV0b21hdGVkIHdpdGggc2VtYW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiBiZWxvdyB3aXRo
IG1hbnVhbCBtYXNzYWdpbmcgb2YgZm9ybWF0IHN0cmluZ3MuCj4gCj4gQEAKPiBleHByZXNzaW9u
IHB0ciwgc2l6ZSwgYWxpZ247Cj4gQEAKPiBwdHIgPSBtZW1ibG9ja19hbGxvYyhzaXplLCBhbGln
bik7Cj4gKyBpZiAoIXB0cikKPiArIAlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUg
Ynl0ZXMgYWxpZ249MHglbHhcbiIsIF9fZnVuY19fLAo+IHNpemUsIGFsaWduKTsKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4lCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rlb24uYyBiL2FyY2gv
bWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rlb24uYwo+IGluZGV4IGU4ZWI2MGUuLmRiMWRlYjIg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZG1hLW9jdGVvbi5jCj4gKysr
IGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZG1hLW9jdGVvbi5jCj4gQEAgLTI0NSw2ICsyNDUs
OSBAQCB2b2lkIF9faW5pdCBwbGF0X3N3aW90bGJfc2V0dXAodm9pZCkKPiAgCXN3aW90bGJzaXpl
ID0gc3dpb3RsYl9uc2xhYnMgPDwgSU9fVExCX1NISUZUOwo+ICAKPiAgCW9jdGVvbl9zd2lvdGxi
ID0gbWVtYmxvY2tfYWxsb2NfbG93KHN3aW90bGJzaXplLCBQQUdFX1NJWkUpOwo+ICsJaWYgKCFv
Y3Rlb25fc3dpb3RsYikKPiArCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUgYnl0
ZXMgYWxpZ249JWx4XG4iLAo+ICsJCSAgICAgIF9fZnVuY19fLCBzd2lvdGxic2l6ZSwgUEFHRV9T
SVpFKTsKPiAgCj4gIAlpZiAoc3dpb3RsYl9pbml0X3dpdGhfdGJsKG9jdGVvbl9zd2lvdGxiLCBz
d2lvdGxiX25zbGFicywgMSkgPT0gLUVOT01FTSkKPiAgCQlwYW5pYygiQ2Fubm90IGFsbG9jYXRl
IFNXSU9UTEIgYnVmZmVyIik7CgpUaGF0IG9uZSBzaG91bGQgYmUgJXp1IHJhdGhlciB0aGFuICVs
dS4gVGhlIHJlc3QgbG9va3MgZ29vZCwgc28gd2l0aAp0aGF0IG9uZSB0d2VhazoKCiAgICBBY2tl
ZC1ieTogUGF1bCBCdXJ0b24gPHBhdWwuYnVydG9uQG1pcHMuY29tPiAjIE1JUFMgcGFydHMKClRo
YW5rcywKICAgIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
