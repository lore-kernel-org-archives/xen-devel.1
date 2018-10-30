From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Tue, 30 Oct 2018 06:59:48 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BAB4@SHSMSX101.ccr.corp.intel.com>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <14a94f1b-0942-92a2-3b49-86adcc69b871@citrix.com>
 <5BD1BC5402000078001F4A63@prv1-mh.provo.novell.com>
 <c6e6da14-2a0e-80ea-1d0e-2ffd4b400351@citrix.com>
 <5BD1CBCE02000078001F4AC5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zlu6=nk=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gHO0J-0002pd-8b
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 06:59:55 +0000
In-Reply-To: <5BD1CBCE02000078001F4AC5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBPY3RvYmVyIDI1LCAyMDE4IDk6NTggUE0KPiAKPiA+Pj4gT24gMjUuMTAuMTggYXQg
MTU6MDIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIDI1LzEwLzE4
IDEzOjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+PiBPbiAxNS4xMC4xOCBhdCAxNDowNiwg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+PiBGcm9tIHRoZSBkZWJ1Z2dp
bmcsIHdlIHNlZSB0aGF0IFBQUi9JUlIvSVNSIGFwcGVhciB0byByZXRhaW4gdGhlaXIKPiBzdGF0
ZQo+ID4+PiBhY3Jvc3MgdGhlIG13YWl0LCBhbmQgdGhlcmUgaXMgbm90aGluZyBpbiB0aGUgbWFu
dWFsIHdoaWNoIEkgY2FuIHNlZQo+ID4+PiBkaXNjdXNzaW5nIHRoZSBpbnRlcmFjdGlvbiBvZiBM
QVBJQyBzdGF0ZSBhbmQgQyBzdGF0ZXMuCj4gPj4gSXMgaXQgcGVyaGFwcyBhIGJhZCBpZGVhIHRv
IGdvIGlkbGUgd2l0aCBhbiB1bi1hY2tlZCBpbnRlcnJ1cHQ/Cj4gPgo+ID4gTW9zdCBsaWtlbHku
Cj4gPgo+ID4gVGhlbiBhZ2FpbiwgZ29pbmcgaWRsZSB3aXRoIGFuIHVuLWFja2VkIGxpbmUgaW50
ZXJydXB0IGRvZXMgYXBwZWFyIHRvCj4gPiB3b3JrLiAgSXQgaXMgb25seSB1bi1hY2tlZCBlZGdl
IGludGVycnVwdHMgd2hpY2ggYXBwZWFyIHRvIGhpdCB0aGlzIGlzc3VlLgo+IAo+IFdlbGwsIG5v
bi1tYXNrYWJsZSBNU0kgYXJlIHRoZSBvbmx5IG9uZXMgKG91dHNpZGUgb2YgIm5ldyIgSU8tQVBJ
Qwo+IGFjayBtb2RlLCB3aGljaCBzaG91bGQgbm90IGJlIHVzZWQgb24gcmVjZW50IGhhcmR3YXJl
IGJlY2F1c2Ugb2YKPiBkaXJlY3RlZCBFT0kgcHJlc3VtYWJseSBiZWluZyBhdmFpbGFibGUgZXZl
cnl3aGVyZSkgd2hlcmUgdGhlIGFjawo+IGdldHMgZGVmZXJyZWQgdW50aWwgdGhlIC5lbmQgaG9v
ayAoaS5lLiBhZnRlciB0aGUgaGFuZGxlciB3YXMgcnVuKS4KPiBJT1cgQUZBSUNUIGxpbmUgaW50
ZXJydXB0cyB3b3VsZCBuZXZlciBiZSBwZW5kaW5nIHdoZW4gd2UgZ28gaWRsZS4KPiAKPiA+IFN0
aWxsIC0gSSdkIHByZWZlciBzb21lIGd1aWRhbmNlIGZyb20gdGhlIGhhcmR3YXJlIGZvbGsgYXMg
dG8gd2hhdCBjYW4KPiA+IHJlYWxpc3RpY2FsbHkgYmUgZXhwZWN0ZWQgaGVyZS4KPiAKPiBGdWxs
eSBhZ3JlZS4KCkp1c3Qgc2VudCBhIG1haWwgaW50ZXJuYWxseSB0byBnZXQgY2xhcmlmaWNhdGlv
bi4KClRoYW5rcwpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
