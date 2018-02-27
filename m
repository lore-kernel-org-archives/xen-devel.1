From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Tue, 27 Feb 2018 09:07:04 -0500
Message-ID: <8d8038ba-a1fd-f182-b2e9-c74e4c4d9abb@oracle.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <4a278c80-0009-b875-c7ec-ea3333ae83b0@citrix.com>
 <5A8EF37002000078001AA7AB@prv-mh.provo.novell.com>
 <2aa2cf71-64e1-a810-f194-a4a62279a1ce@oracle.com>
 <5A8FD6FA02000078001AAB69@prv-mh.provo.novell.com>
 <5A95276C02000078001AC104@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=thka=fv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eqftx-0005xP-3O
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 14:06:41 +0000
In-Reply-To: <5A95276C02000078001AC104@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjcvMjAxOCAwMzozOSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDIu
MTggYXQgMDg6NTUsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDIyLjAyLjE4
IGF0IDIzOjE2LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4gT24gMDIv
MjIvMjAxOCAxMDo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMjIuMDIuMTgg
YXQgMTU6NTMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+Pj4gT24gMjIv
MDIvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gLi4uIGZvciB1bmtub3duIE1T
UnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVhcmx5IHNheXMKPj4+Pj4+
IHRoYXQgdGhlIGZ1bmN0aW9uIHJldHVybnMgMCBmb3IgdW5yZWNvZ25pemVkIE1TUnMsIHNvCj4+
Pj4+PiB7c3ZtLHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpIHNob3VsZCBub3QgY29udmVydCB0
aGlzIGludG8gc3VjY2Vzcy4KPj4+Pj4+Cj4+Pj4+PiBBdCB0aGUgdGltZSBpdCB3ZW50IGluLCBj
b21taXQgMDEzZTM0ZjVhNiAoIng4NjogaGFuZGxlIHBhZ2VkIGdmbiBpbgo+Pj4+Pj4gd3Jtc3Jf
aHlwZXJ2aXNvcl9yZWdzIikgd2FzIHByb2JhYmx5IG9rYXksIHNpbmNlIHByaW9yIHRvIHRoYXQg
dGhlCj4+Pj4+PiByZXR1cm4gdmFsdWUgd2Fzbid0IGNoZWNrZWQgYXQgYWxsLiBCdXQgdGhhdCdz
IG5vdCBob3cgd2Ugd2FudCB0aGluZ3MKPj4+Pj4+IHRvIGJlIGhhbmRsZWQgbm93YWRheXMuCj4+
Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pj4+PiBJIGFncmVlIGluIHByaW5jaXBsZSwgYnV0IHRoaXMgZG9lcyBoYXZlIGEgbGFyZ2Ug
cG90ZW50aWFsIHJpc2sgZm9yCj4+Pj4+IGd1ZXN0cy4gIEFueSB1bmtub3duIE1TUiB3aGljaCBn
dWVzdHMgZG9uJ3QgY2hlY2sgZm9yICNHUCBmYXVsdHMgZnJvbQo+Pj4+PiB3aWxsIG5vdyBjYXVz
ZSB0aGUgZ3Vlc3RzIHRvIGNyYXNoLgo+Pj4+Pgo+Pj4+PiBUaGF0IHNhaWQsIGl0IGlzIHRoZSBj
b3JyZWN0IGRpcmVjdGlvbiB0byBnbyBsb25nLXRlcm0sIGFuZCB3ZSd2ZSBnb3QgdG8KPj4+Pj4g
dGhyb3cgdGhlIHN3aXRjaCBzb21lIHRpbWUsIGJ1dCBJIGV4cGVjdCB0aGlzIHdpbGwgY2F1c2Ug
cHJvYmxlbXMgaW4gdGhlCj4+Pj4+IHNob3J0IHRlcm0sIGVzcGVjaWFsbHkgZm9yIG1pZ3JhdGVk
LWluIGd1ZXN0cy4KPj4+PiBUaGlua2luZyBhYm91dCB0aGlzIGFnYWluLCB0aGUgUkRNU1Igc2lk
ZSBvZiB0aGluZ3MgYWxyZWFkeSByYWlzZXMKPj4+PiAjR1AgZm9yIGluYWNjZXNzaWJsZSBNU1Jz
LiBXZSBvYnZpb3VzbHkgY2FuJ3QgZG8gYSBwcm9iaW5nIFdSTVNSCj4+Pj4gaW4ge3N2bSx2bXh9
X21zcl93cml0ZV9pbnRlcmNlcHQoKSwgYnV0IGNvdWxkbid0IHdlIHJkbXNyX3NhZmUoKQo+Pj4+
IGluIHRoZSAiY2FzZSAwOiIgYmxvY2ssIHRyZWF0aW5nIHRoZSByZXN1bHQgYXMgdGhlIHZlcmRp
Y3Qgd2hldGhlciB0bwo+Pj4+IHJhaXNlICNHUCB0byB0aGUgZ3Vlc3Q/IEFzIHRoZSByZWFkIHBh
dGggZG9lcyB0aGlzIGFueXdheSwgd2UncmUKPj4+PiBub3QgZXhwb3Npbmcgb3Vyc2VsdmVzIHRv
IG5ldyByaXNrcy4KPj4+IFdoYXQgYWJvdXQgd3JpdGUtb25seSBNU1JzPwo+PiBCYWQgbHVjayAo
SSdtIHNvcnJ5IHRvIHNheSBzbywgYnV0IHdlIGhhdmUgYW4gYWN0dWFsIGJ1ZyB0byBmaXggaGVy
ZSkuCj4+IElmIHdlIGZpbmQgYW55IHN1Y2ggaXMgdXNlZCwgd2UnbGwgaGF2ZSB0byBhZGQgaW5k
aXZpZHVhbCBjYXNlIGxhYmVscy4KPiBTaW5jZSBpdCB3YXNuJ3QgY2xlYXIgd2l0aCB5b3VyIHF1
ZXN0aW9uIGFib3ZlIGFuZCB5b3UgZWFybGllcgo+IGdpdmVuIFItYiwgSSBoYWQgZHJvcHBlZCB0
aGUgbGF0dGVyIGZyb20gdjIuIENvdWxkIHlvdSBjbGFyaWZ5Cj4gd2hldGhlciBJIG1heSByZWlu
c3RhdGUgaXQ/CgpZZXMsIHBsZWFzZS4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
