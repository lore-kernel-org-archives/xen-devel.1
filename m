From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 18/27] xen: Adapt assembly for PIE support
Date: Thu, 24 May 2018 11:11:44 +0200
Message-ID: <73524c81-ba3f-8245-9795-f2aebacd8403__48177.7563960806$1527153102$gmane$org@suse.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-19-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6gbh=il=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fLmIb-0008NX-AJ
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 09:12:41 +0000
In-Reply-To: <20180523195421.180248-19-thgarnie@google.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Yonghong Song <yhs@fb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Tom Lendacky <thomas.lendacky@amd.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>Len
Cc: linux-arch@vger.kernel.org, kvm@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-sparse@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-hardening@lists.openwall.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDUvMTggMjE6NTQsIFRob21hcyBHYXJuaWVyIHdyb3RlOgo+IENoYW5nZSB0aGUgYXNz
ZW1ibHkgY29kZSB0byB1c2UgdGhlIG5ldyBfQVNNX01PVkFCUyBtYWNybyB3aGljaCBnZXQgYQo+
IHN5bWJvbCByZWZlcmVuY2Ugd2hpbGUgYmVpbmcgUElFIGNvbXBhdGlibGUuIEFkYXB0IHRoZSBy
ZWxvY2F0aW9uIHRvb2wKPiB0byBpZ25vcmUgMzItYml0IFhlbiBjb2RlLgo+IAo+IFBvc2l0aW9u
IEluZGVwZW5kZW50IEV4ZWN1dGFibGUgKFBJRSkgc3VwcG9ydCB3aWxsIGFsbG93IHRvIGV4dGVu
ZGVkIHRoZQo+IEtBU0xSIHJhbmRvbWl6YXRpb24gcmFuZ2UgYmVsb3cgdGhlIC0yRyBtZW1vcnkg
bGltaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdhcm5pZXIgPHRoZ2FybmllQGdvb2ds
ZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
