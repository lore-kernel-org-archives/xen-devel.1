From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 06/21] memblock:
 memblock_phys_alloc_try_nid(): don't panic
Date: Tue, 29 Jan 2019 20:58:13 +1100
Message-ID: <87va27rdje.fsf__25239.2337237083$1548755958$gmane$org@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
 <87y373rdll.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qp+R=QF=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1goQ9u-0004NS-A9
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:58:22 +0000
In-Reply-To: <87y373rdll.fsf@concordia.ellerman.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xten
List-Id: xen-devel@lists.xenproject.org

TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiB3cml0ZXM6Cgo+IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JpdGVzOgo+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L21tL251bWEuYyBiL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4+IGluZGV4IGFlMzRlM2Eu
LjJjNjFlYTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4+ICsrKyBiL2Fy
Y2gvYXJtNjQvbW0vbnVtYS5jCj4+IEBAIC0yMzcsNiArMjM3LDEwIEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cF9ub2RlX2RhdGEoaW50IG5pZCwgdTY0IHN0YXJ0X3BmbiwgdTY0IGVuZF9wZm4p
Cj4+ICAJCXByX2luZm8oIkluaXRtZW0gc2V0dXAgbm9kZSAlZCBbPG1lbW9yeS1sZXNzIG5vZGU+
XVxuIiwgbmlkKTsKPj4gIAo+PiAgCW5kX3BhID0gbWVtYmxvY2tfcGh5c19hbGxvY190cnlfbmlk
KG5kX3NpemUsIFNNUF9DQUNIRV9CWVRFUywgbmlkKTsKPj4gKwlpZiAoIW5kX3BhKQo+PiArCQlw
YW5pYygiQ2Fubm90IGFsbG9jYXRlICV6dSBieXRlcyBmb3Igbm9kZSAlZCBkYXRhXG4iLAo+PiAr
CQkgICAgICBuZF9zaXplLCBuaWQpOwo+PiArCj4+ICAJbmQgPSBfX3ZhKG5kX3BhKTsKCldyb25n
IGh1bmssIE9fbwoKPiBBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlk
LmF1PiAocG93ZXJwYykKCllvdSBrbm93IHdoYXQgSSBtZWFuIHRob3VnaCA6KQoKY2hlZXJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
