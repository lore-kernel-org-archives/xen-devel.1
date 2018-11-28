From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: Patch "x86/entry/64: Remove %ebx handling from
 error_entry/exit" has been added to the 4.9-stable tree
Date: Wed, 28 Nov 2018 08:44:08 -0800
Message-ID: <D7629DC3-8AB2-4E7D-89A2-96B0DB87AD4E__34454.7571884052$1543423372$gmane$org@amacapital.net>
References: <153492235124199@kroah.com>
 <5b11beecd1491a3b4441e277240c00c8d0ea965f.camel@infradead.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+xxz=oh=amacapital.net=luto@srs-us1.protection.inumbo.net>)
 id 1gS2we-0000Dd-Ic
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:44:12 +0000
Received: by mail-pf1-x441.google.com with SMTP id c72so10430514pfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 08:44:11 -0800 (PST)
In-Reply-To: <5b11beecd1491a3b4441e277240c00c8d0ea965f.camel@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: jgross@suse.com, tglx@linutronix.de, dvlasenk@redhat.com, b5010a090d3586b2d6e06c7ad3ec5542d1241c45.1532282627.git.luto@kernel.org, jpoimboe@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, m.v.b@runbox.com, linux@dominikbrodowski.net, srn@prgmr.com, torvalds@linux-foundation.org, bp@alien8.de, stable@vger.kernel.orgluto@kernel.org, brgerst@gmail.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, hpa@zytor.com, mingo@kernel.org
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIE5vdiAyOCwgMjAxOCwgYXQgNjo1NiBBTSwgRGF2aWQgV29vZGhvdXNlIDxkd213MkBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiAKPj4gT24gV2VkLCAyMDE4LTA4LTIyIGF0IDA5OjE5ICsw
MjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToKPj4gVGhpcyBpcyBhIG5vdGUg
dG8gbGV0IHlvdSBrbm93IHRoYXQgSSd2ZSBqdXN0IGFkZGVkIHRoZSBwYXRjaCB0aXRsZWQKPj4g
Cj4+ICAgIHg4Ni9lbnRyeS82NDogUmVtb3ZlICVlYnggaGFuZGxpbmcgZnJvbSBlcnJvcl9lbnRy
eS9leGl0Cj4+IAo+PiB0byB0aGUgNC45LXN0YWJsZSB0cmVlIHdoaWNoIGNhbiBiZSBmb3VuZCBh
dDoKPj4gICAgaHR0cDovL3d3dy5rZXJuZWwub3JnL2dpdC8/cD1saW51eC9rZXJuZWwvZ2l0L3N0
YWJsZS9zdGFibGUtcXVldWUuZ2l0O2E9c3VtbWFyeQo+PiAKPj4gVGhlIGZpbGVuYW1lIG9mIHRo
ZSBwYXRjaCBpczoKPj4gICAgIHg4Ni1lbnRyeS02NC1yZW1vdmUtZWJ4LWhhbmRsaW5nLWZyb20t
ZXJyb3JfZW50cnktZXhpdC5wYXRjaAo+PiBhbmQgaXQgY2FuIGJlIGZvdW5kIGluIHRoZSBxdWV1
ZS00Ljkgc3ViZGlyZWN0b3J5Lgo+IAo+IENhbiB3ZSBoYXZlIGl0IGZvciA0LjQgdG9vLCBwbGVh
c2U/Cj4gCj4+IFsgTm90ZSB0byBzdGFibGUgbWFpbnRhaW5lcnM6IHRoaXMgc2hvdWxkIHByb2Jh
Ymx5IGdldCBhcHBsaWVkIHRvIGFsbAo+PiAga2VybmVscy4gIElmIHlvdSdyZSBuZXJ2b3VzIGFi
b3V0IHRoYXQsIGEgbW9yZSBjb25zZXJ2YXRpdmUgZml4IHRvCj4+ICBhZGQgeG9ybCAlZWJ4LCVl
Yng7IGluY2wgJWVieCBiZWZvcmUgdGhlIGp1bXAgdG8gZXJyb3JfZXhpdCBzaG91bGQKPj4gIGFs
c28gZml4IHRoZSBwcm9ibGVtLiBdCj4gCj4gQ2FuIHdlIGFzc3VtZSBpdCdzIGFsd2F5cyBmcm9t
IGtlcm5lbD8gVGhlIFhlbiBjb2RlIGRlZmluaXRlbHkgc2VlbXMgdG8KPiBoYW5kbGUgaW52b2tp
bmcgdGhpcyBmcm9tIGJvdGgga2VybmVsIGFuZCB1c2Vyc3BhY2UgY29udGV4dHMuCgpJIGxlYXJu
ZWQgdGhhdCBteSBjb21tZW50IGhlcmUgd2FzIHdyb25nIHNob3J0bHkgYWZ0ZXIgdGhlIHBhdGNo
IGxhbmRlZCA6KAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
