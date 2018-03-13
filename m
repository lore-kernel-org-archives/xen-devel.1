From: Thomas Garnier <thgarnie@google.com>
Subject: [PATCH v2 03/27] x86: Use symbol name in jump table for
	PIE support
Date: Tue, 13 Mar 2018 13:59:21 -0700
Message-ID: <20180313205945.245105-4-thgarnie__26247.4069175825$1520974747$gmane$org@google.com>
References: <20180313205945.245105-1-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=etlo=gd=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1evr1w-0000gJ-69
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 21:00:20 +0000
Received: by mail-pl0-x244.google.com with SMTP id v9-v6so502642plp.12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Mar 2018 14:00:18 -0700 (PDT)
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
L2p1bXBfbGFiZWwuaCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vanVt
cF9sYWJlbC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCmluZGV4IDhjMGRl
NDI4MjY1OS4uZGZkY2RjMzk2MDRhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9q
dW1wX2xhYmVsLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCkBAIC0z
Nyw5ICszNyw5IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBhcmNoX3N0YXRpY19icmFu
Y2goc3RydWN0IHN0YXRpY19rZXkgKmtleSwgYm9vbCBicmFuCiAJCSIuYnl0ZSAiIF9fc3RyaW5n
aWZ5KFNUQVRJQ19LRVlfSU5JVF9OT1ApICJcblx0IgogCQkiLnB1c2hzZWN0aW9uIF9fanVtcF90
YWJsZSwgIFwiYXdcIiBcblx0IgogCQlfQVNNX0FMSUdOICJcblx0IgotCQlfQVNNX1BUUiAiMWIs
ICVsW2xfeWVzXSwgJWMwICsgJWMxIFxuXHQiCisJCV9BU01fUFRSICIxYiwgJWxbbF95ZXNdLCAl
UDAgXG5cdCIKIAkJIi5wb3BzZWN0aW9uIFxuXHQiCi0JCTogOiAgImkiIChrZXkpLCAiaSIgKGJy
YW5jaCkgOiA6IGxfeWVzKTsKKwkJOiA6ICAiWCIgKCYoKGNoYXIgKilrZXkpW2JyYW5jaF0pIDog
OiBsX3llcyk7CiAKIAlyZXR1cm4gZmFsc2U7CiBsX3llczoKQEAgLTUzLDkgKzUzLDkgQEAgc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGFyY2hfc3RhdGljX2JyYW5jaF9qdW1wKHN0cnVjdCBz
dGF0aWNfa2V5ICprZXksIGJvb2wKIAkJIjI6XG5cdCIKIAkJIi5wdXNoc2VjdGlvbiBfX2p1bXBf
dGFibGUsICBcImF3XCIgXG5cdCIKIAkJX0FTTV9BTElHTiAiXG5cdCIKLQkJX0FTTV9QVFIgIjFi
LCAlbFtsX3llc10sICVjMCArICVjMSBcblx0IgorCQlfQVNNX1BUUiAiMWIsICVsW2xfeWVzXSwg
JVAwIFxuXHQiCiAJCSIucG9wc2VjdGlvbiBcblx0IgotCQk6IDogICJpIiAoa2V5KSwgImkiIChi
cmFuY2gpIDogOiBsX3llcyk7CisJCTogOiAgIlgiICgmKChjaGFyICopa2V5KVticmFuY2hdKSA6
IDogbF95ZXMpOwogCiAJcmV0dXJuIGZhbHNlOwogbF95ZXM6Ci0tIAoyLjE2LjIuNjYwLmc3MDk4
ODc5NzFiLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
