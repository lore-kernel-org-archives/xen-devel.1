From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 23/27] x86/modules: Adapt module loading
 for PIE support
Date: Wed, 23 May 2018 16:07:24 -0700
Message-ID: <b7bd7c41-80ac-d5e9-29bb-dfca9b60eda3__26944.5746591829$1527116822$gmane$org@infradead.org>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-24-thgarnie@google.com>
 <168ebedb-7c27-d1f3-c2f9-223d44186a52@infradead.org>
 <CAJcbSZHPc2w7g8Q4UZV3sx=s6LVL_+dsomro7to6RNhd-4F4Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phfy=ik=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1fLcrW-0000XY-40
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 23:08:06 +0000
In-Reply-To: <CAJcbSZHPc2w7g8Q4UZV3sx=s6LVL_+dsomro7to6RNhd-4F4Ag@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Herbert Xu <herbert@gondor.apana>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjMvMjAxOCAwMzowMSBQTSwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gT24gV2VkLCBN
YXkgMjMsIDIwMTggYXQgMjoyNyBQTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4gd3JvdGU6Cj4gCj4+IEhpLAo+IAo+PiAoZm9yIHNldmVyYWwgcGF0Y2hlcyBpbiB0aGlzIHNl
cmllczopCj4+IFRoZSBjb21taXQgbWVzc2FnZSBpcyBjb25mdXNpbmcuICBTZWUgYmVsb3cuCj4g
Cj4gVGhhbmtzIGZvciB0aGUgZWRpdHMsIEkgd2lsbCBjaGFuZ2UgdGhlIGRpZmZlcmVudCBjb21t
aXQgbWVzc2FnZXMuCj4gCj4gCj4gCj4+IE9uIDA1LzIzLzIwMTggMTI6NTQgUE0sIFRob21hcyBH
YXJuaWVyIHdyb3RlOgo+Pj4gQWRhcHQgbW9kdWxlIGxvYWRpbmcgdG8gc3VwcG9ydCBQSUUgcmVs
b2NhdGlvbnMuIEdlbmVyYXRlIGR5bmFtaWMgR09UIGlmCj4+PiBhIHN5bWJvbCByZXF1aXJlcyBp
dCBidXQgbm8gZW50cnkgZXhpc3QgaW4gdGhlIGtlcm5lbCBHT1QuCj4gCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBleGlzdHMKPiAKPj4+Cj4+PiBQb3NpdGlvbiBJbmRl
cGVuZGVudCBFeGVjdXRhYmxlIChQSUUpIHN1cHBvcnQgd2lsbCBhbGxvdyB0byBleHRlbmRlZCB0
aGUKPiAKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHdpbGwgYWxsb3cgdXMgdG8gZXh0ZW5kCj4gdGhlCj4gCj4+PiBLQVNMUiByYW5kb21pemF0aW9u
IHJhbmdlIGJlbG93IHRoZSAtMkcgbWVtb3J5IGxpbWl0Lgo+IAo+PiBEb2VzIHRoYXQgc2F5ICJi
ZWxvdyB0aCBuZWdhdGl2ZSAyRyBtZW1vcnkgbGltaXQiPwo+PiBJIGRvbid0IGdldCBpdC4KPiAK
PiBZZXMsIGJlbG93IDB4ZmZmZmZmZmY4MDAwMDAwMCBiYXNpY2FsbHkuIEkgdGhpbmsgSSB3aWxs
IGp1c3Qgc2F5IHRoYXQuCgpZZXMsIHBsZWFzZSwgdGhhdCdzIG11Y2ggYmV0dGVyLgoKPiAKPiAK
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2FybmllciA8dGhnYXJuaWVAZ29vZ2xlLmNv
bT4KPj4+IC0tLQo+Pj4gIGFyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDQgKwo+
Pj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL21vZHVsZS5oICAgfCAgMTEgKysKPj4+ICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oIHwgICA0ICsKPj4+ICBhcmNoL3g4Ni9rZXJuZWwvbW9k
dWxlLmMgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+PiAg
YXJjaC94ODYva2VybmVsL21vZHVsZS5sZHMgICAgICB8ICAgMyArCj4+PiAgNSBmaWxlcyBjaGFu
Z2VkLCAxOTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC94ODYva2VybmVsL21vZHVsZS5sZHMKPiAKPiAKPj4gVGhhbmtzLAo+PiAtLQo+
PiB+UmFuZHkKPiAKPiAKPiAKCgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
