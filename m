From: Thomas Garnier <thgarnie@google.com>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Tue, 29 May 2018 08:55:34 -0700
Message-ID: <CAJcbSZHuR8AJVU2mENi9KD7j=dWL4PqEUUgUc880X7Nizvkjbg__19032.5897223831$1527609276$gmane$org@mail.gmail.com>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
 <20180524110306.GA20225@amd>
 <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw@mail.gmail.com>
 <20180525091447.GC9666@amd>
 <CAJcbSZH17D01Stk4vRKKzjW6dxvK8x+S9sWL6vUopSP9=-x7Nw@mail.gmail.com>
 <20180529123114.GB21399@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nupj=iq=google.com=thgarnie@srs-us1.protection.inumbo.net>)
 id 1fNgyT-0002Vn-T7
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 15:55:49 +0000
Received: by mail-io0-x244.google.com with SMTP id d73-v6so18174224iog.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 08:55:48 -0700 (PDT)
In-Reply-To: <20180529123114.GB21399@amd>
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

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgNTozMSBBTSBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5j
ej4gd3JvdGU6Cgo+IE9uIEZyaSAyMDE4LTA1LTI1IDEwOjAwOjA0LCBUaG9tYXMgR2FybmllciB3
cm90ZToKPiA+IE9uIEZyaSwgTWF5IDI1LCAyMDE4IGF0IDI6MTQgQU0gUGF2ZWwgTWFjaGVrIDxw
YXZlbEB1Y3cuY3o+IHdyb3RlOgo+ID4KPiA+ID4gT24gVGh1IDIwMTgtMDUtMjQgMDk6MzU6NDIs
IFRob21hcyBHYXJuaWVyIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWF5IDI0LCAyMDE4IGF0IDQ6
MDMgQU0gUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
PiBPbiBXZWQgMjAxOC0wNS0yMyAxMjo1NDowMywgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gPiA+
ID4gPiA+IENoYW5nZSB0aGUgYXNzZW1ibHkgY29kZSB0byB1c2Ugb25seSByZWxhdGl2ZSByZWZl
cmVuY2VzIG9mCnN5bWJvbHMKPiA+IGZvcgo+ID4gPiA+IHRoZQo+ID4gPiA+ID4gPiBrZXJuZWwg
dG8gYmUgUElFIGNvbXBhdGlibGUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFBvc2l0aW9uIElu
ZGVwZW5kZW50IEV4ZWN1dGFibGUgKFBJRSkgc3VwcG9ydCB3aWxsIGFsbG93IHRvCj4gPiBleHRl
bmRlZCB0aGUKPiA+ID4gPiA+ID4gS0FTTFIgcmFuZG9taXphdGlvbiByYW5nZSBiZWxvdyB0aGUg
LTJHIG1lbW9yeSBsaW1pdC4KPiA+ID4gPgo+ID4gPiA+ID4gV2hhdCB0ZXN0aW5nIGRpZCB0aGlz
IGdldD8KPiA+ID4gPgo+ID4gPiA+IFRlc3RlZCBib290LCBoaWJlcm5hdGlvbiBhbmQgcGVyZm9y
bWFuY2Ugb24gcWVtdSBhbmQgZGVkaWNhdGVkCm1hY2hpbmUuCj4gPgo+ID4gPiBXZWxsLCB0aGlz
IGlzIHN1c3BlbmQsIG5vdCBoaWJlcm5hdGlvbiBjb2RlLgo+ID4KPiA+ID4gU28gInN1ZG8gcG0t
c3VzcGVuZCIgb3IgImVjaG8gbWVtID4gL3N5cy9wb3dlci9zdGF0ZSIgd291bGQgYmUgZ29vZAo+
ID4gPiB3YXkgdG8gdGVzdCB0aGlzLgo+ID4KPiA+IFRoYW5rcywgaXQgd29ya2VkLiBJIGFkZGVk
IHRoaXMgdG8gdGhlIHRlc3RzdWl0ZSBJIHVzZSBmb3IgS0FTTFIuCgo+IFRoYW5rcyEKCj4gWW91
IGNhbiBhZGQgbXkgQWNrZWQtYnk6LgoKV2lsbCBkby4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoK
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQYXZlbAoKPiAtLQo+IChlbmdsaXNoKSBodHRwOi8vd3d3LmxpdmVqb3VybmFs
LmNvbS9+cGF2ZWxtYWNoZWsKPiAoY2Vza3ksIHBpY3R1cmVzKQpodHRwOi8vYXRyZXkua2FybGlu
Lm1mZi5jdW5pLmN6L35wYXZlbC9waWN0dXJlL2hvcnNlcy9ibG9nLmh0bWwKCgoKLS0gClRob21h
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
