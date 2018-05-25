From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Fri, 25 May 2018 10:00:04 -0700
Message-ID: <CAJcbSZH17D01Stk4vRKKzjW6dxvK8x+S9sWL6vUopSP9=-x7Nw__9119.80511523343$1527267596$gmane$org@mail.gmail.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
 <20180524110306.GA20225@amd>
 <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw@mail.gmail.com>
 <20180525091447.GC9666@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wghg=im=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fMG4j-0007h0-DD
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 17:00:21 +0000
Received: by mail-io0-x241.google.com with SMTP id o185-v6so7148470iod.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 May 2018 10:00:18 -0700 (PDT)
In-Reply-To: <20180525091447.GC9666@amd>
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

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMjoxNCBBTSBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5j
ej4gd3JvdGU6Cgo+IE9uIFRodSAyMDE4LTA1LTI0IDA5OjM1OjQyLCBUaG9tYXMgR2FybmllciB3
cm90ZToKPiA+IE9uIFRodSwgTWF5IDI0LCAyMDE4IGF0IDQ6MDMgQU0gUGF2ZWwgTWFjaGVrIDxw
YXZlbEB1Y3cuY3o+IHdyb3RlOgo+ID4KPiA+ID4gT24gV2VkIDIwMTgtMDUtMjMgMTI6NTQ6MDMs
IFRob21hcyBHYXJuaWVyIHdyb3RlOgo+ID4gPiA+IENoYW5nZSB0aGUgYXNzZW1ibHkgY29kZSB0
byB1c2Ugb25seSByZWxhdGl2ZSByZWZlcmVuY2VzIG9mIHN5bWJvbHMKZm9yCj4gPiB0aGUKPiA+
ID4gPiBrZXJuZWwgdG8gYmUgUElFIGNvbXBhdGlibGUuCj4gPiA+ID4KPiA+ID4gPiBQb3NpdGlv
biBJbmRlcGVuZGVudCBFeGVjdXRhYmxlIChQSUUpIHN1cHBvcnQgd2lsbCBhbGxvdyB0bwpleHRl
bmRlZCB0aGUKPiA+ID4gPiBLQVNMUiByYW5kb21pemF0aW9uIHJhbmdlIGJlbG93IHRoZSAtMkcg
bWVtb3J5IGxpbWl0Lgo+ID4KPiA+ID4gV2hhdCB0ZXN0aW5nIGRpZCB0aGlzIGdldD8KPiA+Cj4g
PiBUZXN0ZWQgYm9vdCwgaGliZXJuYXRpb24gYW5kIHBlcmZvcm1hbmNlIG9uIHFlbXUgYW5kIGRl
ZGljYXRlZCBtYWNoaW5lLgoKPiBXZWxsLCB0aGlzIGlzIHN1c3BlbmQsIG5vdCBoaWJlcm5hdGlv
biBjb2RlLgoKPiBTbyAic3VkbyBwbS1zdXNwZW5kIiBvciAiZWNobyBtZW0gPiAvc3lzL3Bvd2Vy
L3N0YXRlIiB3b3VsZCBiZSBnb29kCj4gd2F5IHRvIHRlc3QgdGhpcy4KClRoYW5rcywgaXQgd29y
a2VkLiBJIGFkZGVkIHRoaXMgdG8gdGhlIHRlc3RzdWl0ZSBJIHVzZSBmb3IgS0FTTFIuCgoKPiBU
aGFua3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUGF2ZWwKCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9hY3Bp
L3dha2V1cF82NC5TCj4gPiBiL2FyY2gveDg2L2tlcm5lbC9hY3BpL3dha2V1cF82NC5TCj4gPiA+
ID4gaW5kZXggNTBiOGVkMDMxN2EzLi40NzI2NTljMGY4MTEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEv
YXJjaC94ODYva2VybmVsL2FjcGkvd2FrZXVwXzY0LlMKPiA+ID4gPiArKysgYi9hcmNoL3g4Ni9r
ZXJuZWwvYWNwaS93YWtldXBfNjQuUwo+ID4gPiA+IEBAIC0xNCw3ICsxNCw3IEBACj4gPiA+ID4g
ICAgICAgICogSG9vcmF5LCB3ZSBhcmUgaW4gTG9uZyA2NC1iaXQgbW9kZSAoYnV0IHN0aWxsIHJ1
bm5pbmcgaW4KbG93Cj4gPiBtZW1vcnkpCj4gPiA+ID4gICAgICAgICovCj4gPiA+ID4gIEVOVFJZ
KHdha2V1cF9sb25nNjQpCj4gPiA+ID4gLSAgICAgbW92cSAgICBzYXZlZF9tYWdpYywgJXJheAo+
ID4gPiA+ICsgICAgIG1vdnEgICAgc2F2ZWRfbWFnaWMoJXJpcCksICVyYXgKPiA+ID4gPiAgICAg
ICBtb3ZxICAgICQweDEyMzQ1Njc4OWFiY2RlZjAsICVyZHgKPiA+ID4gPiAgICAgICBjbXBxICAg
ICVyZHgsICVyYXgKPiA+ID4gPiAgICAgICBqbmUgICAgIGJvZ3VzXzY0X21hZ2ljCj4gPgo+ID4g
PiBCZWNhdXNlLCBhcyBjb21tZW50IHNheXMsIHRoaXMgaXMgcmF0aGVyIHRyaWNreSBjb2RlLgo+
ID4KPiA+IEkgYWdyZWUsIEkgdGhpbmsgbWFpbnRhaW5lcnMgZmVlZGJhY2sgaXMgdmVyeSBpbXBv
cnRhbnQgZm9yIHRoaXMKcGF0Y2hzZXQuCgoKPiAtLQo+IChlbmdsaXNoKSBodHRwOi8vd3d3Lmxp
dmVqb3VybmFsLmNvbS9+cGF2ZWxtYWNoZWsKPiAoY2Vza3ksIHBpY3R1cmVzKQpodHRwOi8vYXRy
ZXkua2FybGluLm1mZi5jdW5pLmN6L35wYXZlbC9waWN0dXJlL2hvcnNlcy9ibG9nLmh0bWwKCgoK
LS0gClRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
