From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v3 23/27] x86/modules: Adapt module loading
 for PIE support
Date: Wed, 23 May 2018 15:01:38 -0700
Message-ID: <CAJcbSZHPc2w7g8Q4UZV3sx=s6LVL_+dsomro7to6RNhd-4F4Ag__23520.7252706916$1527112848$gmane$org@mail.gmail.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-24-thgarnie@google.com>
 <168ebedb-7c27-d1f3-c2f9-223d44186a52@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ffdn=ik=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fLbpQ-00034I-DA
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 22:01:52 +0000
Received: by mail-it0-x241.google.com with SMTP id 70-v6so6302267ity.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 15:01:51 -0700 (PDT)
In-Reply-To: <168ebedb-7c27-d1f3-c2f9-223d44186a52@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Herbert Xu <herbert@gondor.apana>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMjMsIDIwMTggYXQgMjoyNyBQTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cgo+IEhpLAoKPiAoZm9yIHNldmVyYWwgcGF0Y2hlcyBpbiB0aGlz
IHNlcmllczopCj4gVGhlIGNvbW1pdCBtZXNzYWdlIGlzIGNvbmZ1c2luZy4gIFNlZSBiZWxvdy4K
ClRoYW5rcyBmb3IgdGhlIGVkaXRzLCBJIHdpbGwgY2hhbmdlIHRoZSBkaWZmZXJlbnQgY29tbWl0
IG1lc3NhZ2VzLgoKCgo+IE9uIDA1LzIzLzIwMTggMTI6NTQgUE0sIFRob21hcyBHYXJuaWVyIHdy
b3RlOgo+ID4gQWRhcHQgbW9kdWxlIGxvYWRpbmcgdG8gc3VwcG9ydCBQSUUgcmVsb2NhdGlvbnMu
IEdlbmVyYXRlIGR5bmFtaWMgR09UIGlmCj4gPiBhIHN5bWJvbCByZXF1aXJlcyBpdCBidXQgbm8g
ZW50cnkgZXhpc3QgaW4gdGhlIGtlcm5lbCBHT1QuCgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBleGlzdHMKCj4gPgo+ID4gUG9zaXRpb24gSW5kZXBlbmRlbnQgRXhlY3V0
YWJsZSAoUElFKSBzdXBwb3J0IHdpbGwgYWxsb3cgdG8gZXh0ZW5kZWQgdGhlCgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3aWxsIGFsbG93IHVzIHRv
IGV4dGVuZAp0aGUKCj4gPiBLQVNMUiByYW5kb21pemF0aW9uIHJhbmdlIGJlbG93IHRoZSAtMkcg
bWVtb3J5IGxpbWl0LgoKPiBEb2VzIHRoYXQgc2F5ICJiZWxvdyB0aCBuZWdhdGl2ZSAyRyBtZW1v
cnkgbGltaXQiPwo+IEkgZG9uJ3QgZ2V0IGl0LgoKWWVzLCBiZWxvdyAweGZmZmZmZmZmODAwMDAw
MDAgYmFzaWNhbGx5LiBJIHRoaW5rIEkgd2lsbCBqdXN0IHNheSB0aGF0LgoKCgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBHYXJuaWVyIDx0aGdhcm5pZUBnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiAgYXJjaC94ODYvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgNCArCj4gPiAgYXJjaC94
ODYvaW5jbHVkZS9hc20vbW9kdWxlLmggICB8ICAxMSArKwo+ID4gIGFyY2gveDg2L2luY2x1ZGUv
YXNtL3NlY3Rpb25zLmggfCAgIDQgKwo+ID4gIGFyY2gveDg2L2tlcm5lbC9tb2R1bGUuYyAgICAg
ICAgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICBhcmNoL3g4Ni9r
ZXJuZWwvbW9kdWxlLmxkcyAgICAgIHwgICAzICsKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE5OCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3g4Ni9rZXJuZWwvbW9kdWxlLmxkcwoKCj4gVGhhbmtzLAo+IC0tCj4gflJhbmR5CgoKCi0tIApU
aG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
