From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 06/21] memblock:
 memblock_phys_alloc_try_nid(): don't panic
Date: Fri, 25 Jan 2019 17:45:02 +0000
Message-ID: <20190125174502.GL25901__10442.2672580526$1548438375$gmane$org@arrakis.emea.arm.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YsmX=QB=arm.com=catalin.marinas@srs-us1.protection.inumbo.net>)
 id 1gn5XW-0000X5-DX
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 17:45:14 +0000
Content-Disposition: inline
In-Reply-To: <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@l
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTA6MDM6NTNBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9hcmNoL2FybTY0L21t
L251bWEuYwo+IGluZGV4IGFlMzRlM2EuLjJjNjFlYTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9tbS9udW1hLmMKPiArKysgYi9hcmNoL2FybTY0L21tL251bWEuYwo+IEBAIC0yMzcsNiArMjM3
LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ub2RlX2RhdGEoaW50IG5pZCwgdTY0IHN0
YXJ0X3BmbiwgdTY0IGVuZF9wZm4pCj4gIAkJcHJfaW5mbygiSW5pdG1lbSBzZXR1cCBub2RlICVk
IFs8bWVtb3J5LWxlc3Mgbm9kZT5dXG4iLCBuaWQpOwo+ICAKPiAgCW5kX3BhID0gbWVtYmxvY2tf
cGh5c19hbGxvY190cnlfbmlkKG5kX3NpemUsIFNNUF9DQUNIRV9CWVRFUywgbmlkKTsKPiArCWlm
ICghbmRfcGEpCj4gKwkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUg
JWQgZGF0YVxuIiwKPiArCQkgICAgICBuZF9zaXplLCBuaWQpOwo+ICsKPiAgCW5kID0gX192YShu
ZF9wYSk7Cj4gIAo+ICAJLyogcmVwb3J0IGFuZCBpbml0aWFsaXplICovCgpEb2VzIGl0IG1lYW4g
dGhhdCBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQoKSBuZXZlciByZXR1cm5zIHZhbGlkCnBo
eXNpY2FsIG1lbW9yeSBzdGFydGluZyBhdCAwPwoKLS0gCkNhdGFsaW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
