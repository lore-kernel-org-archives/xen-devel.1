From: Thomas Garnier <thgarnie@google.com>
Subject: [PATCH v2 04/27] x86: Add macro to get symbol address
	for PIE support
Date: Tue, 13 Mar 2018 13:59:22 -0700
Message-ID: <20180313205945.245105-5-thgarnie__23223.9156066955$1520974747$gmane$org@google.com>
References: <20180313205945.245105-1-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=etlo=gd=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1evr1x-0000gy-GB
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 21:00:21 +0000
Received: by mail-pf0-x241.google.com with SMTP id h11so427315pfn.4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 14:00:20 -0700 (PDT)
In-Reply-To: <20180313205945.245105-1-thgarnie@google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Thomas Garnier <thgarnie@google.com>, Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Matthias Kaehlcke <mka@chromium.org>, Kees Cook <keescook@chromium.org>, Tom Lendacky <thomas.lendacky@amd.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>, Raf
Cc: linux-arch@vger.kernel.org, kvm@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-sparse@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-hardening@lists.openwall.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbmV3IF9BU01fTU9WQUJTIG1hY3JvIHRvIGZldGNoIGEgc3ltYm9sIGFkZHJlc3MuIEl0
IHdpbGwgYmUgdXNlZAp0byByZXBsYWNlICJfQVNNX01PViAkPHN5bWJvbD4sICVkc3QiIGNvZGUg
Y29uc3RydWN0IHRoYXQgYXJlIG5vdCBjb21wYXRpYmxlCndpdGggUElFLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEdhcm5pZXIgPHRoZ2FybmllQGdvb2dsZS5jb20+Ci0tLQogYXJjaC94ODYvaW5j
bHVkZS9hc20vYXNtLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2FzbS5oIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vYXNtLmgKaW5kZXggMzg2YTY5MDBlMjA2Li42NTNkOGI4MmYwMTUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2FzbS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2FzbS5o
CkBAIC0zMCw2ICszMCw3IEBACiAjZGVmaW5lIF9BU01fQUxJR04JX19BU01fU0VMKC5iYWxpZ24g
NCwgLmJhbGlnbiA4KQogCiAjZGVmaW5lIF9BU01fTU9WCV9fQVNNX1NJWkUobW92KQorI2RlZmlu
ZSBfQVNNX01PVkFCUwlfX0FTTV9TRUwobW92bCwgbW92YWJzcSkKICNkZWZpbmUgX0FTTV9JTkMJ
X19BU01fU0laRShpbmMpCiAjZGVmaW5lIF9BU01fREVDCV9fQVNNX1NJWkUoZGVjKQogI2RlZmlu
ZSBfQVNNX0FERAlfX0FTTV9TSVpFKGFkZCkKLS0gCjIuMTYuMi42NjAuZzcwOTg4Nzk3MWItZ29v
ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
