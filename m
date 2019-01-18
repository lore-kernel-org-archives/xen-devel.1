From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 12/21] arch: use memblock_alloc() instead of
 memblock_alloc_from(size, align, 0)
Date: Fri, 18 Jan 2019 17:53:36 +0000
Message-ID: <20190118175334.mj2mahbf4onhujgz__25426.0265421637$1547880418$gmane$org@pburton-laptop>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-13-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B57R=P2=wavecomp.com=pburton@srs-us1.protection.inumbo.net>)
 id 1gkYKr-00019B-J8
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 17:53:41 +0000
In-Reply-To: <1547646261-32535-13-git-send-email-rppt@linux.ibm.com>
Content-Language: en-US
Content-ID: <27E0FF00A643614DAB51ABA4F92A557E@namprd22.prod.outlook.com>
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

SGkgTWlrZSwKCk9uIFdlZCwgSmFuIDE2LCAyMDE5IGF0IDAzOjQ0OjEyUE0gKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6Cj4gVGhlIGxhc3QgcGFyYW1ldGVyIG9mIG1lbWJsb2NrX2FsbG9jX2Zy
b20oKSBpcyB0aGUgbG93ZXIgbGltaXQgZm9yIHRoZQo+IG1lbW9yeSBhbGxvY2F0aW9uLiBXaGVu
IGl0IGlzIDAsIHRoZSBjYWxsIGlzIGVxdWl2YWxlbnQgdG8KPiBtZW1ibG9ja19hbGxvYygpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KCkFj
a2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+ICMgTUlQUyBwYXJ0CgpU
aGFua3MsCiAgICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
