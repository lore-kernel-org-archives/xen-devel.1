From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 8 Nov 2018 15:36:17 +0000
Message-ID: <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nrah=nt=citrix.com=prvs=843bae1bd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKmRg-0007YP-J9
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:42:12 +0000
In-Reply-To: <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTEvMTggMTU6MzMsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBOb3YgMDUsIDIwMTgg
YXQgMDk6MTE6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjExLjE4
IGF0IDE2OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiAwNS8x
MS8xOCAxNTo0OCwgV2VpIExpdSB3cm90ZToKPj4+PiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAw
ODowNDozN0FNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMDIuMTEuMTgg
YXQgMTY6NTUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC90
cmFwcy5jCj4+Pj4+PiBAQCAtMjk4LDggKzI5OCwyMSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHdy
aXRlX3N0dWJfdHJhbXBvbGluZSgKPj4+Pj4+ICB9Cj4+Pj4+PiAgCj4+Pj4+PiAgREVGSU5FX1BF
Ul9DUFUoc3RydWN0IHN0dWJzLCBzdHVicyk7Cj4+Pj4+PiArCj4+Pj4+PiArI2lmZGVmIENPTkZJ
R19QVgo+Pj4+Pj4gIHZvaWQgbHN0YXJfZW50ZXIodm9pZCk7Cj4+Pj4+PiAgdm9pZCBjc3Rhcl9l
bnRlcih2b2lkKTsKPj4+Pj4+ICsjZWxzZQo+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsc3Rh
cl9lbnRlcih2b2lkKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIsIF9f
ZnVuY19fKTsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIGNz
dGFyX2VudGVyKHZvaWQpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwg
X19mdW5jX18pOwo+Pj4+Pj4gK30KPj4+Pj4+ICsjZW5kaWYgLyogQ09ORklHX1BWICovCj4+Pj4+
IERvIHdlIHJlYWxseSBuZWVkIHR3byBzZXBhcmF0ZSBzdHVicyAoYW5kIHR3byBzZXBhcmF0ZSBz
dHJpbmcgbGl0ZXJhbHMpCj4+Pj4+IGhlcmU/Cj4+Pj4gSSB0aGluayBpdCBpcyBjbGVhcmVyIGlm
IHdlIGhhdmUgdHdvIGRpc3RpbmN0IG1lc3NhZ2VzLiBCdXQgSSdtIG5vdCB0b28KPj4+PiBmdXNz
ZWQgZWl0aGVyIHdheSByZWFsbHkuIElmIHlvdSBmZWVsIHN0cm9uZ2x5IGFib3V0IHRoaXMsIEkn
bSBoYXBweSB0bwo+Pj4+IGNoYW5nZSBpdCB0byBvbmx5IG9uZSBmdW5jdGlvbi4KPj4+IFRoaXMg
aXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGl0LiAgX19mdW5jX18gd2lsbCBhbHJlYWR5IGJlIGlu
IHRoZQo+Pj4gc3RyaW5nIHRhYmxlLCBhbmQgdGhlIGZvcm1hdCBzdHJpbmcgKGJlaW5nIGlkZW50
aWNhbCkgd2lsbCBiZSBtZXJnZWQuCj4+IFdoeSB3b3VsZCBfX2Z1bmNfXyBiZSBpbiB0aGUgc3Ry
aW5nIHRhYmxlIGFscmVhZHksIGZvciBmdW5jdGlvbnMKPj4gY29udGFpbmluZyBubyBvdGhlciBy
ZWZlcmVuY2VzIHRvIGl0Pwo+IFdoYXQgaXMgdGhlIHdheSBmb3J3YXJkPyBEbyB3ZSByZWFsbHkg
Y2FyZSBpZiB0aGVyZSBpcyBvbmUgbW9yZSBzdHJpbmcKPiBsaXRlcmFsIGluIHRoZSBiaW5hcnk/
CgpOby7CoCBPbmUgZXh0cmEgc3RyaW5nIGxpa2UgdGhpcyBpcyBub3Qgc29tZXRoaW5nIHdoaWNo
IG5lZWRzIGNhcmluZwphYm91dCBpbiB0aGUgc2xpZ2h0ZXN0LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
