From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 10:05:54 +0000
Message-ID: <20180322100554.dyxdlw446w7hapg2@MacBook-Pro-de-Roger.local>
References: <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <20180321171504.afl75q77kji34ybo@MacBook-Pro-de-Roger.local>
 <20180322084958.0000571c@gmail.com>
 <ddd21242437244689dea27c847ca6f54@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fjst=gm=citrix.com=prvs=61285f498=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyx6g-0003Fu-IZ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:06:02 +0000
Content-Disposition: inline
In-Reply-To: <ddd21242437244689dea27c847ca6f54@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Alexey G' <x1917x@gmail.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDk6Mjk6NDRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gVGhlIG1vcmUgSSB0aGluayBhYm91dCBpdCwgdGhlIG1vcmUgSSBsaWtlIHRoZSBl
eGlzdGluZwo+ID4gbWFwX2lvX3JhbmdlX3RvX2lvcmVxX3NlcnZlcigpIGFwcHJvYWNoLiA6KCBJ
dCB3b3JrcyB3aXRob3V0IGRvaW5nCj4gPiBhbnl0aGluZywgbm8gaGFja3MsIG5vIG5ldyBpbnRl
cmZhY2VzLCBib3RoIE1NQ09ORklHIGFuZCBDRjgvQ0ZDIGFyZQo+ID4gd29ya2luZyBhcyBleHBl
Y3RlZC4gVGhlcmUgaXMgYSBwcm9ibGVtIHRvIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoCj4gPiB0
aGUgc3BlY2lmaWMgbXVsdGlwbGUgaW9yZXEgc2VydmVycyBmZWF0dXJlLCBidXQgcHJvdmlkaW5n
IGEgbmV3Cj4gPiBkbW9wL2h5cGVyY2FsbCAod2hpY2ggeW91IHN1Z2dlc3QgaXMgYSBtdXN0IGhh
dmUgdGhpbmcgdG8gdHJhcCBNTUNPTkZJRwo+ID4gTU1JTyB0byBnaXZlIFFFTVUgb25seSB0aGUg
ZnJlZWRvbSB0byB0ZWxsIHdoZXJlIGl0IGlzIGxvY2F0ZWQpIGFsbG93cwo+ID4gdG8gc29sdmUg
dGhpcyBwcm9ibGVtIGluIGFueSBwb3NzaWJsZSB3YXksIGVpdGhlciBNTUlPIC0+IFBDSSBjb25m
Cj4gPiB0cmFuc2xhdGlvbiBvciBhbnl0aGluZyBlbHNlLgo+ID4gCj4gCj4gSSBkb24ndCB0aGlu
ayB3ZSBldmVuIHdhbnQgUUVNVSB0byBoYXZlIHRoZSBmcmVlZG9tIHRvIHNheSB3aGVyZSB0aGUK
PiBNTUNPTkZJRyBhcmVhcyBhcmUgbG9jYXRlZCwgZG8gd2U/CgpTYWRseSB0aGlzIGhvdyB0aGUg
Y2hpcHNldCB3b3Jrcy4gVGhlIFBDSUVYQkFSIHJlZ2lzdGVyIGNvbnRhaW5zIHRoZQpwb3NpdGlv
biBvZiB0aGUgTUNGRyBhcmVhLiBBbmQgdGhpcyBpcyBlbXVsYXRlZCBieSBRRU1VLgoKPiBRRU1V
IGlzIG5vdCBpbiBjaGFyZ2Ugb2YgdGhlCj4gZ3Vlc3QgbWVtb3J5IG1hcCBhbmQgaXQgaXMgbm90
IHJlc3BvbnNpYmxlIGZvciB0aGUgYnVpbGRpbmcgdGhlIE1DRkcKPiB0YWJsZSwgWGVuIGlzLgoK
V2VsbCwgdGhlIG9uZSB0aGF0IGJ1aWxkcyB0aGUgTUNGRyB0YWJsZSBpcyBodm1sb2FkZXIgYWN0
dWFsbHksIHdoaWNoCmlzIHRoZSBvbmUgdGhhdCBpbml0aWFsbHkgc2V0cyB0aGUgdmFsdWUgb2Yg
UENJRVhCQVIgYW5kIHRodXMgdGhlCmluaXRpYWwgcG9zaXRpb24gb2YgdGhlIE1DRkcuCgo+IFNv
IGl0IHNob3VsZCBiZSBYZW4gdGhhdCBkZWNpZGVzIHdoZXJlIHRoZSBNTUNPTkZJRwo+IGFyZWEg
Z29lcyBmb3IgZWFjaCByZWdpc3RlcmVkIFBDSSBkZXZpY2UgYW5kIGl0IHNob3VsZCBiZSBYZW4g
dGhhdAo+IGFkZHMgdGhhdCB0byB0aGUgTUNGRyB0YWJsZS4gSXQgc2hvdWxkIGJlIFhlbiB0aGF0
IGhhbmRsZXMgdGhlCj4gTU1DT05GSUcgTU1JTyBhY2Nlc3NlcyBhbmQgdGhlc2Ugc2hvdWxkIGJl
IGZvcndhcmRlZCB0byBRRU1VIGFzIFBDSQo+IGNvbmZpZyBJT1JFUXMuICBOb3csIGl0IG1heSBi
ZSB0aGF0IHdlIG5lZWQgdG8gaW50cm9kdWNlIGEgWGVuCj4gc3BlY2lmaWMgbWVjaGFuaXNtIGlu
dG8gUUVNVSB0byB0aGVuIHJvdXRlIHRob3NlIGNvbmZpZyBzcGFjZQo+IHRyYW5zYWN0aW9ucyB0
byB0aGUgZGV2aWNlIG1vZGVscyBidXQgdGhhdCB3b3VsZCBiZSBhbiBpbXByb3ZlbWVudAo+IG92
ZXIgdGhlIGN1cnJlbnQgY2Y4L2NmYyBoYWNrZXJ5IGFueXdheS4KCkkgdGhpbmsgd2UgbmVlZCBh
IHdheSBmb3IgUUVNVSB0byB0ZWxsIFhlbiB0aGUgcG9zaXRpb24gb2YgdGhlIE1DRkcKYXJlYSwg
YW5kIGFueSBjaGFuZ2VzIHRvIGl0LgoKSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGVtdWxhdGUg
dGhlIFBDSUVYQkFSIHJlZ2lzdGVyIGluc2lkZSBvZiBYZW4sCmlmIHdlIGRvIHRoYXQgdGhlbiB3
ZSB3b3VsZCBsaWtlbHkgaGF2ZSB0byBlbXVsYXRlIHRoZSBmdWxsIEV4cHJlc3MKQ2hpcHNldCBp
bnNpZGUgb2YgWGVuLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
