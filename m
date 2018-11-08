From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 8 Nov 2018 15:33:30 +0000
Message-ID: <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKmJQ-0006E3-9G
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:33:40 +0000
Content-Disposition: inline
In-Reply-To: <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDk6MTE6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjExLjE4IGF0IDE2OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAwNS8xMS8xOCAxNTo0OCwgV2VpIExpdSB3cm90ZToKPiA+PiBPbiBN
b24sIE5vdiAwNSwgMjAxOCBhdCAwODowNDozN0FNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+Pj4+Pj4gT24gMDIuMTEuMTggYXQgMTY6NTUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90
ZToKPiA+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+ID4+Pj4gKysrIGIv
eGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4gPj4+PiBAQCAtMjk4LDggKzI5OCwyMSBAQCBz
dGF0aWMgdW5zaWduZWQgaW50IHdyaXRlX3N0dWJfdHJhbXBvbGluZSgKPiA+Pj4+ICB9Cj4gPj4+
PiAgCj4gPj4+PiAgREVGSU5FX1BFUl9DUFUoc3RydWN0IHN0dWJzLCBzdHVicyk7Cj4gPj4+PiAr
Cj4gPj4+PiArI2lmZGVmIENPTkZJR19QVgo+ID4+Pj4gIHZvaWQgbHN0YXJfZW50ZXIodm9pZCk7
Cj4gPj4+PiAgdm9pZCBjc3Rhcl9lbnRlcih2b2lkKTsKPiA+Pj4+ICsjZWxzZQo+ID4+Pj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKQo+ID4+Pj4gK3sKPiA+Pj4+ICsgICAg
cGFuaWMoIiVzIGNhbGxlZCIsIF9fZnVuY19fKTsKPiA+Pj4+ICt9Cj4gPj4+PiArCj4gPj4+PiAr
c3RhdGljIGlubGluZSB2b2lkIGNzdGFyX2VudGVyKHZvaWQpCj4gPj4+PiArewo+ID4+Pj4gKyAg
ICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5jX18pOwo+ID4+Pj4gK30KPiA+Pj4+ICsjZW5kaWYg
LyogQ09ORklHX1BWICovCj4gPj4+IERvIHdlIHJlYWxseSBuZWVkIHR3byBzZXBhcmF0ZSBzdHVi
cyAoYW5kIHR3byBzZXBhcmF0ZSBzdHJpbmcgbGl0ZXJhbHMpCj4gPj4+IGhlcmU/Cj4gPj4gSSB0
aGluayBpdCBpcyBjbGVhcmVyIGlmIHdlIGhhdmUgdHdvIGRpc3RpbmN0IG1lc3NhZ2VzLiBCdXQg
SSdtIG5vdCB0b28KPiA+PiBmdXNzZWQgZWl0aGVyIHdheSByZWFsbHkuIElmIHlvdSBmZWVsIHN0
cm9uZ2x5IGFib3V0IHRoaXMsIEknbSBoYXBweSB0bwo+ID4+IGNoYW5nZSBpdCB0byBvbmx5IG9u
ZSBmdW5jdGlvbi4KPiA+IAo+ID4gVGhpcyBpcyB0aGUgY29ycmVjdCB3YXkgdG8gZG8gaXQuICBf
X2Z1bmNfXyB3aWxsIGFscmVhZHkgYmUgaW4gdGhlCj4gPiBzdHJpbmcgdGFibGUsIGFuZCB0aGUg
Zm9ybWF0IHN0cmluZyAoYmVpbmcgaWRlbnRpY2FsKSB3aWxsIGJlIG1lcmdlZC4KPiAKPiBXaHkg
d291bGQgX19mdW5jX18gYmUgaW4gdGhlIHN0cmluZyB0YWJsZSBhbHJlYWR5LCBmb3IgZnVuY3Rp
b25zCj4gY29udGFpbmluZyBubyBvdGhlciByZWZlcmVuY2VzIHRvIGl0PwoKV2hhdCBpcyB0aGUg
d2F5IGZvcndhcmQ/IERvIHdlIHJlYWxseSBjYXJlIGlmIHRoZXJlIGlzIG9uZSBtb3JlIHN0cmlu
ZwpsaXRlcmFsIGluIHRoZSBiaW5hcnk/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
