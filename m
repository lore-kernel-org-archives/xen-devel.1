From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 23/27] x86/modules: Adapt module loading
 for PIE support
Date: Wed, 23 May 2018 14:26:51 -0700
Message-ID: <168ebedb-7c27-d1f3-c2f9-223d44186a52__35131.4617706977$1527110764$gmane$org@infradead.org>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-24-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phfy=ik=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1fLbHr-0007Se-82
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 21:27:11 +0000
In-Reply-To: <20180523195421.180248-24-thgarnie@google.com>
Content-Language: en-US
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

SGksCgooZm9yIHNldmVyYWwgcGF0Y2hlcyBpbiB0aGlzIHNlcmllczopClRoZSBjb21taXQgbWVz
c2FnZSBpcyBjb25mdXNpbmcuICBTZWUgYmVsb3cuCgoKT24gMDUvMjMvMjAxOCAxMjo1NCBQTSwg
VGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gQWRhcHQgbW9kdWxlIGxvYWRpbmcgdG8gc3VwcG9ydCBQ
SUUgcmVsb2NhdGlvbnMuIEdlbmVyYXRlIGR5bmFtaWMgR09UIGlmCj4gYSBzeW1ib2wgcmVxdWly
ZXMgaXQgYnV0IG5vIGVudHJ5IGV4aXN0IGluIHRoZSBrZXJuZWwgR09ULgoKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXhpc3RzCgo+IAo+IFBvc2l0aW9uIEluZGVwZW5kZW50
IEV4ZWN1dGFibGUgKFBJRSkgc3VwcG9ydCB3aWxsIGFsbG93IHRvIGV4dGVuZGVkIHRoZQoKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2lsbCBhbGxvdyB1
cyB0byBleHRlbmQgdGhlCgo+IEtBU0xSIHJhbmRvbWl6YXRpb24gcmFuZ2UgYmVsb3cgdGhlIC0y
RyBtZW1vcnkgbGltaXQuCgpEb2VzIHRoYXQgc2F5ICJiZWxvdyB0aCBuZWdhdGl2ZSAyRyBtZW1v
cnkgbGltaXQiPwpJIGRvbid0IGdldCBpdC4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBH
YXJuaWVyIDx0aGdhcm5pZUBnb29nbGUuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9NYWtlZmlsZSAg
ICAgICAgICAgICAgIHwgICA0ICsKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vbW9kdWxlLmggICB8
ICAxMSArKwo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oIHwgICA0ICsKPiAgYXJj
aC94ODYva2VybmVsL21vZHVsZS5jICAgICAgICB8IDE4MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ICBhcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmxkcyAgICAgIHwgICAzICsKPiAg
NSBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2tlcm5lbC9tb2R1bGUubGRzCgoKVGhhbmtzLAotLSAK
flJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
