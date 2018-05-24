From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v3 11/27] x86/power/64: Adapt assembly for
 PIE support
Date: Thu, 24 May 2018 09:37:20 -0700
Message-ID: <CAJcbSZEnRhFDvYCG4ORH71LrcH2bAzOU5yF-oa9KkLpKo5UuSQ__22325.0560732142$1527179783$gmane$org@mail.gmail.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-12-thgarnie@google.com>
 <20180524110341.GB20225@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mvh5=il=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fLtF9-0003tX-MZ
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:37:35 +0000
Received: by mail-io0-x243.google.com with SMTP id d73-v6so3054208iog.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 09:37:34 -0700 (PDT)
In-Reply-To: <20180524110341.GB20225@amd>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, "H . Peter Anvin" <hpa@zytor.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Herbert Xu <herbert@gondor.a>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgNDowNCBBTSBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5j
ej4gd3JvdGU6Cgo+IE9uIFdlZCAyMDE4LTA1LTIzIDEyOjU0OjA1LCBUaG9tYXMgR2FybmllciB3
cm90ZToKPiA+IENoYW5nZSB0aGUgYXNzZW1ibHkgY29kZSB0byB1c2Ugb25seSByZWxhdGl2ZSBy
ZWZlcmVuY2VzIG9mIHN5bWJvbHMgZm9yCnRoZQo+ID4ga2VybmVsIHRvIGJlIFBJRSBjb21wYXRp
YmxlLgo+ID4KPiA+IFBvc2l0aW9uIEluZGVwZW5kZW50IEV4ZWN1dGFibGUgKFBJRSkgc3VwcG9y
dCB3aWxsIGFsbG93IHRvIGV4dGVuZGVkIHRoZQo+ID4gS0FTTFIgcmFuZG9taXphdGlvbiByYW5n
ZSBiZWxvdyB0aGUgLTJHIG1lbW9yeSBsaW1pdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgR2FybmllciA8dGhnYXJuaWVAZ29vZ2xlLmNvbT4KCj4gQWdhaW4sIHdhcyB0aGlzIHRlc3Rl
ZD8KCkhpYmVybmF0aW9uIHdhcyB0ZXN0ZWQgYXMgbXVjaCBhcyBJIGNhbiB3aXRoIHFlbXUgYW5k
IG15IGRlZGljYXRlZCBtYWNoaW5lLgpBbnkgc3BlY2lmaWMgdGVzdCB5b3UgdGhpbmsgSSBzaG91
bGQgdXNlPwoKCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvcG93ZXIvaGliZXJuYXRlX2FzbV82
NC5TCmIvYXJjaC94ODYvcG93ZXIvaGliZXJuYXRlX2FzbV82NC5TCj4gPiBpbmRleCBjZThkYTNh
MDQxMmMuLjZmZGQ3YmJjM2MzMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L3Bvd2VyL2hpYmVy
bmF0ZV9hc21fNjQuUwo+ID4gKysrIGIvYXJjaC94ODYvcG93ZXIvaGliZXJuYXRlX2FzbV82NC5T
Cj4gPiBAQCAtMjQsNyArMjQsNyBAQAo+ID4gICNpbmNsdWRlIDxhc20vZnJhbWUuaD4KPiA+Cj4g
PiAgRU5UUlkoc3dzdXNwX2FyY2hfc3VzcGVuZCkKPiA+IC0gICAgIG1vdnEgICAgJHNhdmVkX2Nv
bnRleHQsICVyYXgKPiA+ICsgICAgIGxlYXEgICAgc2F2ZWRfY29udGV4dCglcmlwKSwgJXJheAo+
ID4gICAgICAgbW92cSAgICAlcnNwLCBwdF9yZWdzX3NwKCVyYXgpCj4gPiAgICAgICBtb3ZxICAg
ICVyYnAsIHB0X3JlZ3NfYnAoJXJheCkKPiA+ICAgICAgIG1vdnEgICAgJXJzaSwgcHRfcmVnc19z
aSglcmF4KQo+ID4gQEAgLTExNSw3ICsxMTUsNyBAQCBFTlRSWShyZXN0b3JlX3JlZ2lzdGVycykK
PiA+ICAgICAgIG1vdnEgICAgJXJheCwgJWNyNDsgICMgdHVybiBQR0UgYmFjayBvbgo+ID4KPiA+
ICAgICAgIC8qIFdlIGRvbid0IHJlc3RvcmUgJXJheCwgaXQgbXVzdCBiZSAwIGFueXdheSAqLwo+
ID4gLSAgICAgbW92cSAgICAkc2F2ZWRfY29udGV4dCwgJXJheAo+ID4gKyAgICAgbGVhcSAgICBz
YXZlZF9jb250ZXh0KCVyaXApLCAlcmF4Cj4gPiAgICAgICBtb3ZxICAgIHB0X3JlZ3Nfc3AoJXJh
eCksICVyc3AKPiA+ICAgICAgIG1vdnEgICAgcHRfcmVnc19icCglcmF4KSwgJXJicAo+ID4gICAg
ICAgbW92cSAgICBwdF9yZWdzX3NpKCVyYXgpLCAlcnNpCgo+IC0tCj4gKGVuZ2xpc2gpIGh0dHA6
Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hlawo+IChjZXNreSwgcGljdHVyZXMpCmh0
dHA6Ly9hdHJleS5rYXJsaW4ubWZmLmN1bmkuY3ovfnBhdmVsL3BpY3R1cmUvaG9yc2VzL2Jsb2cu
aHRtbAoKCgotLSAKVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
