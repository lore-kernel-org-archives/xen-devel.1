From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Wed, 16 Jan 2019 15:32:03 +0100
Message-ID: <1c04fc81-7e7c-9b4a-cab2-c9b023e1a3b1__29230.8573647917$1547649062$gmane$org@suse.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjmEq-0004lD-F5
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:32:16 +0000
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-xtensa@linux
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMjAxOSAxNDo0NCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBBZGQgY2hlY2sgZm9y
IHRoZSByZXR1cm4gdmFsdWUgb2YgbWVtYmxvY2tfYWxsb2MqKCkgZnVuY3Rpb25zIGFuZCBjYWxs
Cj4gcGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+IFRoZSBwYW5pYyBtZXNzYWdlIHJlcGVhdHMg
dGhlIG9uZSB1c2VkIGJ5IHBhbmljaW5nIG1lbWJsb2NrIGFsbG9jYXRvcnMgd2l0aAo+IGFkanVz
dG1lbnQgb2YgcGFyYW1ldGVycyB0byBpbmNsdWRlIG9ubHkgcmVsZXZhbnQgb25lcy4KPiAKPiBU
aGUgcmVwbGFjZW1lbnQgd2FzIG1vc3RseSBhdXRvbWF0ZWQgd2l0aCBzZW1hbnRpYyBwYXRjaGVz
IGxpa2UgdGhlIG9uZQo+IGJlbG93IHdpdGggbWFudWFsIG1hc3NhZ2luZyBvZiBmb3JtYXQgc3Ry
aW5ncy4KPiAKPiBAQAo+IGV4cHJlc3Npb24gcHRyLCBzaXplLCBhbGlnbjsKPiBAQAo+IHB0ciA9
IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiArIGlmICghcHRyKQo+ICsgCXBhbmljKCIl
czogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18s
Cj4gc2l6ZSwgYWxpZ24pOwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4KCkZvciB0aGUgWGVuIHBhcnQ6CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
