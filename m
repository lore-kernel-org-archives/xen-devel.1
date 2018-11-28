From: Sasha Levin <sashal@kernel.org>
Subject: Re: Patch "x86/entry/64: Remove %ebx handling from
 error_entry/exit" has been added to the 4.9-stable tree
Date: Wed, 28 Nov 2018 10:43:29 -0500
Message-ID: <20181128154149.GK131942__47045.8949952901$1543419816$gmane$org@sasha-vm>
References: <153492235124199@kroah.com>
 <5b11beecd1491a3b4441e277240c00c8d0ea965f.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7d8k=OH=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1gS1zy-00012U-1z
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 15:43:34 +0000
Content-Disposition: inline
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
Cc: jgross@suse.com, tglx@linutronix.de, dvlasenk@redhat.com, jpoimboe@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, m.v.b@runbox.com, linux@dominikbrodowski.net, srn@prgmr.com, torvalds@linux-foundation.org, bp@alien8.de, stable@vger.kernel.org, luto@kernel.org, brgerst@gmail.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, hpa@zytor.com, mingo@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDI6NTY6MzJQTSArMDAwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+T24gV2VkLCAyMDE4LTA4LTIyIGF0IDA5OjE5ICswMjAwLCBncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZyB3cm90ZToKPj4gVGhpcyBpcyBhIG5vdGUgdG8gbGV0IHlvdSBrbm93IHRo
YXQgSSd2ZSBqdXN0IGFkZGVkIHRoZSBwYXRjaCB0aXRsZWQKPj4KPj4gICAgIHg4Ni9lbnRyeS82
NDogUmVtb3ZlICVlYnggaGFuZGxpbmcgZnJvbSBlcnJvcl9lbnRyeS9leGl0Cj4+Cj4+IHRvIHRo
ZSA0Ljktc3RhYmxlIHRyZWUgd2hpY2ggY2FuIGJlIGZvdW5kIGF0Ogo+PiAgICAgaHR0cDovL3d3
dy5rZXJuZWwub3JnL2dpdC8/cD1saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9zdGFibGUtcXVldWUu
Z2l0O2E9c3VtbWFyeQo+Pgo+PiBUaGUgZmlsZW5hbWUgb2YgdGhlIHBhdGNoIGlzOgo+PiAgICAg
IHg4Ni1lbnRyeS02NC1yZW1vdmUtZWJ4LWhhbmRsaW5nLWZyb20tZXJyb3JfZW50cnktZXhpdC5w
YXRjaAo+PiBhbmQgaXQgY2FuIGJlIGZvdW5kIGluIHRoZSBxdWV1ZS00Ljkgc3ViZGlyZWN0b3J5
Lgo+Cj5DYW4gd2UgaGF2ZSBpdCBmb3IgNC40IHRvbywgcGxlYXNlPwo+Cj4+IFsgTm90ZSB0byBz
dGFibGUgbWFpbnRhaW5lcnM6IHRoaXMgc2hvdWxkIHByb2JhYmx5IGdldCBhcHBsaWVkIHRvIGFs
bAo+PiAgIGtlcm5lbHMuICBJZiB5b3UncmUgbmVydm91cyBhYm91dCB0aGF0LCBhIG1vcmUgY29u
c2VydmF0aXZlIGZpeCB0bwo+PiAgIGFkZCB4b3JsICVlYngsJWVieDsgaW5jbCAlZWJ4IGJlZm9y
ZSB0aGUganVtcCB0byBlcnJvcl9leGl0IHNob3VsZAo+PiAgIGFsc28gZml4IHRoZSBwcm9ibGVt
LiBdCj4KPkNhbiB3ZSBhc3N1bWUgaXQncyBhbHdheXMgZnJvbSBrZXJuZWw/IFRoZSBYZW4gY29k
ZSBkZWZpbml0ZWx5IHNlZW1zIHRvCj5oYW5kbGUgaW52b2tpbmcgdGhpcyBmcm9tIGJvdGgga2Vy
bmVsIGFuZCB1c2Vyc3BhY2UgY29udGV4dHMuCj4KPlNob3VsZG4ndCAlZWJ4IGdldCBzZXQgdG8g
IShyZWdzLT5yc3AgJiAzKSA/Cj4KPkVpdGhlciB3YXksIGxldCdzIGp1c3QgZG8gaXQgaW4gdGhl
IHN0YWJsZSB0cmVlIGV4YWN0bHkgdGhlIHNhbWUgd2F5Cj5pdCdzIGRvbmUgdXBzdHJlYW0uCj4K
Pj4gLSAqIE9uIGVudHJ5LCBFQlggaXMgYSAicmV0dXJuIHRvIGtlcm5lbCBtb2RlIiBmbGFnOgo+
Cj5SZS1pbnRyb2R1Y2UgdGhlIHR5cG8gJ0VCUycgaGVyZSwgdG8gbWFrZSB0aGUgcGF0Y2ggYXBw
bHkgY2xlYW5seSB0bwo+NC40LiBJdCdzIG9ubHkgcmVtb3ZpbmcgdGhhdCBsaW5lIGFueXdheS4K
Pgo+T3IganVzdCBjaGVycnktcGljayB1cHN0cmVhbSBjb21taXQgNzVjYTViMjIyNjBlZjcgZmly
c3QuCgpRdWV1ZWQgZm9yIDQuNC4gSSd2ZSBqdXN0IGdyYWJiZWQgdGhlIGV4dHJhIHNwZWxsY2hl
Y2sgZml4IGFzIHdlbGwuCgotLQpUaGFua3MsClNhc2hhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
