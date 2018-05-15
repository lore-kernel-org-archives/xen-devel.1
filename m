From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 6/7] xen/x86/efi: Verify dom0 kernel
 with SHIM_LOCK protocol in efi_multiboot2()
Date: Tue, 15 May 2018 02:06:52 -0600
Message-ID: <5AFA951C02000078001C2C0C@prv1-mh.provo.novell.com>
References: <1499550803-25664-1-git-send-email-daniel.kiper@oracle.com>
 <1499550803-25664-7-git-send-email-daniel.kiper@oracle.com>
 <5AEC805902000078001C0CEE@prv1-mh.provo.novell.com>
 <20180508130941.GJ8391@olila.local.net-space.pl>
 <5AF9684102000078001C26E5@prv1-mh.provo.novell.com>
 <20180514165653.GP12135@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ecih=ic=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIUz4-0007xQ-7v
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 08:06:58 +0000
In-Reply-To: <20180514165653.GP12135@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE4IGF0IDE4OjU2LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiwgTWF5IDE0LCAyMDE4IGF0IDA0OjQzOjEzQU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMDguMDUuMTggYXQgMTU6MDksIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gT24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDk6NDY6MzNBTSAtMDYw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAwOC4wNy4xNyBhdCAyMzo1MywgPGRh
bmllbC5raXBlckBvcmFjbGUuY29tPiB3cm90ZToKPj4gPj4gPiBAQCAtNDg0LDkgKzQ5NywxMiBA
QCBfX2VmaTY0X21iMl9zdGFydDoKPj4gPj4gPiAgICAgICAgICAvKiBLZWVwIHRoZSBzdGFjayBh
bGlnbmVkLiBEbyBub3QgcG9wIGEgc2luZ2xlIGl0ZW0gb2ZmIGl0LiAqLwo+PiA+PiA+ICAgICAg
ICAgIG1vdiAgICAgKCVyc3ApLCVyZGkKPj4gPj4gPgo+PiA+PiA+ICsgICAgICAgIG1vdiAgICAg
JXIxNGQsJWVkeAo+PiA+PiA+ICsKPj4gPj4gPiAgICAgICAgICAvKgo+PiA+PiA+ICAgICAgICAg
ICAqIGVmaV9tdWx0aWJvb3QyKCkgaXMgY2FsbGVkIGFjY29yZGluZyB0byBTeXN0ZW0gViBBTUQ2
NCBBQkk6Cj4+ID4+ID4gLSAgICAgICAgICogICAtIElOOiAgJXJkaSAtIEVGSSBJbWFnZUhhbmRs
ZSwgJXJzaSAtIEVGSSBTeXN0ZW1UYWJsZS4KPj4gPj4gPiArICAgICAgICAgKiAgIC0gSU46ICVy
ZGkgLSBFRkkgSW1hZ2VIYW5kbGUsICVyc2kgLSBFRkkgU3lzdGVtVGFibGUsCj4+ID4+ID4gKyAg
ICAgICAgICogICAgICAgICAlcmR4IC0gZG9tMCBrZXJuZWwgbW9kdWxlIHN0cnVjdCBhZGRyZXNz
Lgo+PiA+Pgo+PiA+PiBIb3cgY29tZSBldmVyeXRoaW5nIGZ1cnRoZXIgdXAgdHJlYXRzIHRoaXMg
YXMgYSAzMi1iaXQgcXVhbnRpdHkgb25seT8KPj4gPgo+PiA+IEFjY29yZGluZyB0byB0aGUgTXVs
dGlib290MiBzcGVjIHRoZSBib290bG9hZGVyIGlzIG5vdCBhbGxvd2VkIHRvCj4+ID4gcHV0IHRo
ZSBrZXJuZWwgKHhlbi5neikgYW5kIHRoZSBtb2R1bGVzIGFib3ZlIDQgR2lCIGJvdW5kYXJ5Lgo+
Pgo+PiBJbnRlcmVzdGluZyAtIGhvdyB3b3VsZCB0aGV5IGxvYWQgYSAxR2IgaW5pdHJkIG9uIGEg
c3lzdGVtIHdpdGgganVzdCAxR2IKPj4gUkFNIGJlbG93IDRHYj8gTm90IHRvIHNwZWFrIG9mIGEg
NEdiIGluaXRyZCAuLi4KPiAKPiBUaGF0IGlzIG5vdCBwb3NzaWJsZSByaWdodCBub3cuIFRoaXMg
cmVxdWlyZXMgY2hhbmdlcyBpbiB0aGUgYm9vdCBwcm90b2NvbC4KPiBBbnl3YXksIGhhdmUgeW91
IHNlZW4gc3VjaCBzZXR1cHMgaW4gdGhlIHdpbGQgdG9kYXk/CgpZZWFycyBhZ28gd2UndmUgYWxy
ZWFkeSBoYWQgdG8gbWFrZSBvdXIgWGVub0xpbnV4IGZvcndhcmQgcG9ydCBjb3BlIHdpdGgKNTEy
TWIrIGluaXRyZC1zIC0gc2VlIHRoZSBjb21taXQgaW50cm9kdWNpbmcgWEVOX0VMRk5PVEVfTU9E
X1NUQVJUX1BGTiwKd2hpY2ggdGVsbHMgeW91IHRoYXQgWGVuIGl0c2VsZiBuZWVkZWQgdG8gYmUg
Y2hhbmdlZCBmb3IgdGhpcyBhcyB3ZWxsLiBUaG9zZQpmb2xrcyB3YW50ZWQgdG8gYmUgYWJsZSB0
byBib290IGEgZnVsbCBmbGVkZ2VkIGRpc3RybyB3aXRob3V0IGxvYWRpbmcgYW55dGhpbmcKZnJv
bSBkaXNrIChvciBuZXR3b3JrKSBwb3N0LWJvb3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
