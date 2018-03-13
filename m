From: Thomas Garnier <thgarnie@google.com>
Subject: [PATCH v2 02/27] x86: Use symbol name on bug table for
	PIE support
Date: Tue, 13 Mar 2018 13:59:20 -0700
Message-ID: <20180313205945.245105-3-thgarnie__235.851392108266$1520974742$gmane$org@google.com>
References: <20180313205945.245105-1-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=etlo=gd=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1evr1t-0000eG-RT
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 21:00:17 +0000
Received: by mail-pg0-x244.google.com with SMTP id i14so417533pgv.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 14:00:16 -0700 (PDT)
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

UmVwbGFjZSB0aGUgJWMgY29uc3RyYWludCB3aXRoICVQLiBUaGUgJWMgaXMgaW5jb21wYXRpYmxl
IHdpdGggUElFCmJlY2F1c2UgaXQgaW1wbGllcyBhbiBpbW1lZGlhdGUgdmFsdWUgd2hlcmVhcyAl
UCByZWZlcmVuY2UgYSBzeW1ib2wuCgpQb3NpdGlvbiBJbmRlcGVuZGVudCBFeGVjdXRhYmxlIChQ
SUUpIHN1cHBvcnQgd2lsbCBhbGxvdyB0byBleHRlbmRlZCB0aGUKS0FTTFIgcmFuZG9taXphdGlv
biByYW5nZSBiZWxvdyB0aGUgLTJHIG1lbW9yeSBsaW1pdC4KClNpZ25lZC1vZmYtYnk6IFRob21h
cyBHYXJuaWVyIDx0aGdhcm5pZUBnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNt
L2J1Zy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9idWcuaAppbmRleCA2ODA0ZDY2NDI3NjcuLjNkNjkwYTRhYmY1MCAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vYnVnLmgKQEAgLTM1LDcgKzM1LDcgQEAgZG8gewkJCQkJCQkJCVwKIAlhc20gdm9sYXRpbGUo
IjE6XHQiIGlucyAiXG4iCQkJCQlcCiAJCSAgICAgIi5wdXNoc2VjdGlvbiBfX2J1Z190YWJsZSxc
ImF3XCJcbiIJCVwKIAkJICAgICAiMjpcdCIgX19CVUdfUkVMKDFiKSAiXHQjIGJ1Z19lbnRyeTo6
YnVnX2FkZHJcbiIJXAotCQkgICAgICJcdCIgIF9fQlVHX1JFTCglYzApICJcdCMgYnVnX2VudHJ5
OjpmaWxlXG4iCVwKKwkJICAgICAiXHQiICBfX0JVR19SRUwoJVAwKSAiXHQjIGJ1Z19lbnRyeTo6
ZmlsZVxuIglcCiAJCSAgICAgIlx0LndvcmQgJWMxIiAgICAgICAgIlx0IyBidWdfZW50cnk6Omxp
bmVcbiIJXAogCQkgICAgICJcdC53b3JkICVjMiIgICAgICAgICJcdCMgYnVnX2VudHJ5OjpmbGFn
c1xuIglcCiAJCSAgICAgIlx0Lm9yZyAyYislYzNcbiIJCQkJCVwKLS0gCjIuMTYuMi42NjAuZzcw
OTg4Nzk3MWItZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
