From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v4] x86/mm: Add mem access rights to NPT
Date: Wed, 26 Sep 2018 11:17:48 +0300
Message-ID: <be1e86c0dc619d52149661a51f7699b2117ef5d1.camel@bitdefender.com>
References: <1532353689-2242-1-git-send-email-aisaila@bitdefender.com>
 <5B56E99D02000078001D706B@prv1-mh.provo.novell.com>
 <31981fe5-90b4-9490-08d9-f58afc28b6b1@citrix.com>
 <5B57154C02000078001D72F6@prv1-mh.provo.novell.com>
 <9ad5e355-8d22-c67c-b803-46dc935fe47b@citrix.com>
 <5B5852F402000078001D79E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B5852F402000078001D79E9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE4LTA3LTI1IGF0IDA0OjM3IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBPbiAyNS4wNy4xOCBhdCAxMToyNSwgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAKPiA+IE9uIDA3LzI0LzIwMTggMDE6MDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPiA+ID4gPiBPbiAyNC4wNy4xOCBhdCAxMzoyNiwgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gT24gMDcvMjQvMjAxOCAwOTo1NSBBTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiAyMy4wNy4xOCBhdCAxNTo0OCwgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICsgICAg
ICAgIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHhmcmVlKGQtPmFyY2gubW9uaXRvci5tc3Jf
Yml0bWFwKTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiA+
ID4gPiArICAgICAgICB9Cj4gPiA+ID4gPiA+ICsgICAgICAgIHJhZGl4X3RyZWVfaW5pdChwMm0t
Pm1lbV9hY2Nlc3Nfc2V0dGluZ3MpOwo+ID4gPiA+ID4gPiArICAgIH0KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gV2hhdCdzIHRoZSBTVk0gY29ubmVjdGlvbiBoZXJlPyBQbGVhc2UgZG9uJ3QgZm9yZ2V0
IHRoYXQgcDJtLQo+ID4gPiA+ID4gcHQuYwo+ID4gPiA+ID4gYWxzbyBzZXJ2ZXMgdGhlIHNoYWRv
dyBjYXNlLiBQZXJoYXBzIHN0cnVjdCBwMm1fZG9tYWluIHNob3VsZAo+ID4gPiA+ID4gY29udGFp
biBhIGJvb2xlYW4gaW5kaWNhdG9yIHdoZXRoZXIgdGhpcyBhdXhpbGlhcnkgZGF0YQo+ID4gPiA+
ID4gc3RydWN0dXJlIGlzCj4gPiA+ID4gPiBuZWVkZWQ/Cj4gPiA+ID4gCj4gPiA+ID4gSXQncyBi
YXNpY2FsbHkganVzdCAiaGFwX2VuYWJsZWQoKSIgaXNuJ3QgaXQ/Cj4gPiA+IAo+ID4gPiBPbmx5
IGlmIHdlIGNhbid0IG1ha2UgaXQgdGhlcmUgd2hlbiBFUFQgaXMgYWN0aXZlLgo+ID4gCj4gPiBJ
dCBjYW4gbWFrZSBpdCBoZXJlIHdoZW4gVk1YIGlzIGFjdGl2ZSBhbmQgc2hhZG93IGlzIGVuYWJs
ZWQsIGJ1dAo+ID4gaXQKPiA+IHNob3VsZG4ndCBiZSBhYmxlIHRvIGdldCBoZXJlIHdoZW4gRVBU
IGlzIGFjdGl2ZS4gIFdlIGNvdWxkIGFkZCBhbgo+ID4gQVNTRVJUKCkgdG8gdGhhdCBlZmZlY3Q7
IGl0IHNob3VsZCBiZSBzYWZlIGluIHByb2R1Y3Rpb24sIGFzIHRoZQo+ID4gb25seQo+ID4gc2lk
ZSBlZmZlY3Qgc2hvdWxkIGJlIHRoYXQgd2UgZG8gYSBzbWFsbCBwb2ludGxlc3MgYWxsb2NhdGlv
bi4KPiAKPiBTbyBJJ3ZlIGxvb2tlZCBhIGxpdHRsZSBtb3JlIGNsb3NlbHk6IFRoaXMgaXMgYmVp
bmcgYWRkZWQgdG8KPiBhcmNoX21vbml0b3JfaW5pdF9kb21haW4oKSwgY2FsbGVkIGZyb20gdm1f
ZXZlbnRfZG9tY3RsKCkuIEkgY2FuJ3QKPiBzZWUgd2h5IHRoaXMgd291bGRuJ3QgYmUgcmVhY2hh
YmxlIHdpdGggRVBUIGVuYWJsZWQuCj4gCkhpIEdlb3JnZSwgCgpBbnkgaW5wdXQgb24gdGhpcz8K
ClJlZ2FyZHMsIApBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
