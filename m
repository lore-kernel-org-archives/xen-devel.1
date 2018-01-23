From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/compat: fix compilation errors with
	clang 6
Date: Tue, 23 Jan 2018 07:04:50 -0700
Message-ID: <5A674F1202000078001A1952@prv-mh.provo.novell.com>
References: <20180123123824.69979-1-roger.pau@citrix.com>
 <5A67480402000078001A190D@prv-mh.provo.novell.com>
 <20180123135406.5rwdpzln7wosis2o@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edzC9-0007pG-9k
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 14:05:01 +0000
In-Reply-To: <20180123135406.5rwdpzln7wosis2o@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE0OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDIzLCAyMDE4IGF0IDA2OjM0OjQ0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjMuMDEuMTggYXQgMTM6MzgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gRml4IHRoaXMgYnkgdXNpbmcgcHJhZ21hIHB1c2gvcG9wIGluIG9yZGVyIHRv
IHN0b3JlIHRoZSBjdXJyZW50IHByYWdtYQo+PiA+IHZhbHVlIGluIHRoZSBjb21waWxlciBzdGFj
ayBhbmQgbGF0ZXIgcmVzdG9yaW5nIGl0Lgo+PiAKPj4gRm9yIExpbnV4IHRoaXMgaXMgZmluZSBh
bGwgdGhlIHdheSBiYWNrIHRvIGdjYyA0LjEgYWZhaWN0LCBidXQgd2hhdAo+PiBhYm91dCBvdGhl
ciBPU2VzIHVzaW5nIGdjYz8gSW4gNC4xLCBvbmx5IGNvbmZpZy9saW51eC5oIGFuZCBhIGZldwo+
PiBzcGVjaWFsIGNvbmZpZy9pMzg2LyouaCBkZWZpbmUgdGhlIG5lY2Vzc2FyeSBtYWNybwo+PiAo
SEFORExFX1BSQUdNQV9QQUNLX1BVU0hfUE9QKS4KPiAKPiBPSywgdGhlbiBJIGhhdmUgdGhlIGZv
bGxvd2luZyB2ZXJzaW9uOgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9NYWtlZmlsZSBi
L3hlbi9pbmNsdWRlL01ha2VmaWxlCj4gaW5kZXggMTI5OWIxOTYyZi4uMTkwNjZhMzNhMCAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9NYWtlZmlsZQo+ICsrKyBiL3hlbi9pbmNsdWRlL01ha2Vm
aWxlCj4gQEAgLTM1LDggKzM1LDEzIEBAIGNwcGZsYWdzLXkgICAgICAgICAgICAgICAgOj0gLWlu
Y2x1ZGUgcHVibGljL3hlbi1jb21wYXQuaCAKPiAtRFhFTl9HRU5FUkFUSU5HX0NPTVBBCj4gIGNw
cGZsYWdzLSQoQ09ORklHX1g4NikgICAgKz0gLW0zMgo+ICAKPiAgIyA4LWJ5dGUgdHlwZXMgYXJl
IDQtYnl0ZSBhbGlnbmVkIG9uIHg4Nl8zMiAuLi4KPiAraWZlcSAoJChjbGFuZykseSkKPiArcHJl
Zml4LSQoQ09ORklHX1g4NikgICAgICA6PSBcI3ByYWdtYSBwYWNrKHB1c2gsIDQpCj4gK3N1ZmZp
eC0kKENPTkZJR19YODYpICAgICAgOj0gXCNwcmFnbWEgcGFjayhwb3ApCj4gK2Vsc2UKPiAgcHJl
Zml4LSQoQ09ORklHX1g4NikgICAgICA6PSBcI3ByYWdtYSBwYWNrKDQpCj4gIHN1ZmZpeC0kKENP
TkZJR19YODYpICAgICAgOj0gXCNwcmFnbWEgcGFjaygpCj4gK2VuZGlmCj4gIAo+ICBlbmRpZgo+
ICAKPiAKPiBTaW5jZSBBVE0gdGhhdCdzIGEgY2xhbmcgb25seSBpc3N1ZSBJIGd1ZXNzIHdlIGNh
biBsZWF2ZSBpdCBsaWtlIHRoYXQuCj4gSSdtIG5vdCBhd2FyZSBvZiBhbnl3YXkgdG8ga25vdyB3
aGV0aGVyIHRoZSBjb21waWxlciBzdXBwb3J0cyBwcmFnbWEKPiBwYWNrIHdpdGggcHN1aC9wb3Au
Cj4gCj4gTGV0IG1lIGtub3cgaWYgdGhhdCdzIGZpbmUgYW5kIEkgd2lsbCBzZW5kIG91dCBhIGZv
cm1hbCB2Mi4KClllcywgdGhhdCdzIGZpbmUgaW5kZWVkLiBDaGVja2luZyB3aGV0aGVyIHRoZSBj
b25zdHJ1Y3QgaXMKc3VwcG9ydGVkIHdvdWxkIGludm9sdmUgYSB0ZXN0IGNvbXBpbGUsIHdoaWNo
IEkgdGhpbmsgd2Ugc2hvdWxkCmJvdGhlciBkb2luZyBvbmx5IHdoZW4gd2UgY2FuJ3QgYXZvaWQg
dGhpcyBhbnltb3JlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
