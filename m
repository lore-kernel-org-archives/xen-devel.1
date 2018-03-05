From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] new config option vtsc_khz_tolerance to
 avoid TSC emulation
Date: Mon, 05 Mar 2018 07:45:24 -0700
Message-ID: <5A9D661402000078001AE986@prv-mh.provo.novell.com>
References: <20180305113555.8467-1-olaf@aepfle.de>
 <5A9D51A902000078001AE868@prv-mh.provo.novell.com>
 <20180305151835.6d36d52e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180305151835.6d36d52e.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE1OjE4LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIE1v
biwgMDUgTWFyIDIwMTggMDY6MTg6MTcgLTA3MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gPj4+IE9uIDA1LjAzLjE4IGF0IDEyOjM1LCA8b2xhZkBh
ZXBmbGUuZGU+IHdyb3RlOiAgCj4+ID4gKyAgICBjYXNlIFhFTl9ET01DVExfc2V0X3Z0c2Nfa2h6
X3RvbGVyYW5jZToKPj4gPiArICAgICAgICBpZiAoIGQgPT0gY3VycmQgKQo+PiA+ICsgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOyAgCj4+IFdoeT8gVGhlcmUncyBlLmcuIG5vIGRvbWFpbl9wYXVz
ZSgpIGludm9sdmVkIGhlcmUuCj4gCj4gSSBoYXZlIHRob3VnaHQgYWJvdXQgdGhhdC4gTm93IEkg
dGhpbmsgdGhhdCBwYXJ0IGNhbiBiZSBldmVuIHNpbXBsZXIsCj4ganVzdCBsaWtlIHRoZSBmb2xs
b3dpbmcgWEVOX0RPTUNUTF9zdXBwcmVzc19zcHVyaW91c19wYWdlX2ZhdWx0czoKPiBqdXN0IGNo
YW5nZSB0aGF0IHJlYWQtb25seSB2YWx1ZSB1bmNvbmRpdGlvbmFsbHkuIFRoZXJlIGlzIG5vIG9i
dmlvdXMKPiBoYXJtIGluIGNoYW5naW5nIHRoYXQgdmFsdWUuCj4gCj4+IEFsc28gdGhyb3VnaG91
dCB0aGUgcGF0Y2ggSSB3b25kZXIgaWYgaXQgd2Fzbid0IG1vcmUgbmF0dXJhbCB0bwo+PiBwdXQg
dGhlIHVuaXQgbGFzdCBpbiB0aGUgcGFyYW1ldGVyIC8gZmllbGQgbmFtZXMuCj4gCj4gVGhhdCB3
YXMganVzdCB0byBrZWVwIHRoZSBkaWZmIHNsaWdodGx5IHNtYWxsZXIuCgpJJ20gb25seSB0YWxr
aW5nIGFib3V0IGFkZGl0aW9ucyB5b3UgbWFrZSwgYW5kIEkgZG9uJ3Qgc2VlIGEgc2l6ZQpkaWZm
ZXJlbmNlIGJldHdlZW4gInZ0c2Nfa2h6X3RvbGVyYW5jZSIgYW5kICJ2dHNjX3RvbGVyYW5jZV9r
aHoiLgoKPj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICIlczogZCV1OiBo
b3N0IGhhcyAlbHUga0h6LCIKPj4gPiArICAgICAgICAgICAgICAgICAgICIgZG9tVSBleHBlY3Rz
ICV1IGtIeiwiCj4+ID4gKyAgICAgICAgICAgICAgICAgICAiIGRpZmZlcmVuY2Ugb2YgJXUgaXMg
JXMgdG9sZXJhbmNlIG9mICV1XG4iLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgX19mdW5jX18s
IGQtPmRvbWFpbl9pZCwgY3B1X2toeiwgZ3RzY19raHosIGtoel9kaWZmLAo+PiA+ICsgICAgICAg
ICAgICAgICAgICAgZGlmZl90b2xlcmF0ZWQgPyAid2l0aGluIiA6ICJvdXRzaWRlIiwgdnRzY19r
aHpfdG9sZXJhbmNlKTsgIAo+PiBMZWZ0b3ZlciBkZWJ1Z2dpbmcgbWVzc2FnZT8KPiAKPiBJIHRo
aW5rIGl0IGlzIHdvcnRoIHRvIGxvZyB0aGF0IGV2ZW50LCBwZXJoYXBzIG5vdCB3aXRoIFdBUk5J
TkcgbGV2ZWwuCgpYRU5MT0dfR19JTkZPIGF0IG1vc3QsIEkgd291bGQgc2F5LCBhbmQgcGVyaGFw
cyBvbmx5IHdoZW4KdGhlIHNldHRpbmcgaXMgbm9uLXplcm8uCgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
