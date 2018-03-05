From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Mon, 05 Mar 2018 07:41:54 -0700
Message-ID: <5A9D654202000078001AE983@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
 <5A997D2202000078001ADE90@prv-mh.provo.novell.com>
 <8a879538-9206-cc79-2951-69f89f53dbc1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8a879538-9206-cc79-2951-69f89f53dbc1@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE1OjE4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAyLzAzLzE4IDE1OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjEuMDIuMTgg
YXQgMTU6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBAQCAtOTUsMTEgKzEw
MSwxOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG1heF9vcmRlcihjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkKQo+Pj4gICAgICAgcmV0dXJuIG1pbihvcmRlciwgTUFYX09SREVSICsgMFUpOwo+Pj4gICB9
Cj4+PiAgIAo+Pj4gKy8qIEhlbHBlciB0byBjb3B5IGEgdHlwZXNhZmUgTUZOIHRvIGd1ZXN0ICov
Cj4+PiArI2RlZmluZSBjb3B5X21mbl90b19ndWVzdChobmQsIG9mZiwgbWZuKSAgICAgICAgICAg
IFwKPj4+ICsgICAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+Pj4gKyAgICAgICAgeGVuX3Bmbl90IG1mbl8gPSBtZm5feChtZm4pOyAgICAgICAgICAg
ICAgICBcCj4+PiArICAgICAgICBfX2NvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KGhuZCwgb2ZmLCAmbWZu
XywgMSk7IFwKPj4+ICsgICAgfSkKPj4gCj4+IEhtbSwgbm90IHJlYWxseSBuaWNlLCBidXQgd2hh
dCBkbyB5b3UgZG8uCj4gCj4gSSBhbSBvcGVuIHRvIGJldHRlciBzdWdnZXN0aW9uLiBJIHdhbnRl
ZCB0byBhdm9pZCB0aGUgY29udmVyc2lvbiBhbGwgCj4gb3ZlciB0aGUgY29kZS4KCkkgaGF2ZSBu
byBiZXR0ZXIgc3VnZ2VzdGlvbiwgSSdtIHNvcnJ5LCBoZW5jZSB0aGUgImJ1dCB3aGF0IGRvCnlv
dSBkby4iCgo+IEFsc28sIGRvIHlvdSBoYXZlIGFuIG9waW5pb24gb24gV2VpJ3Mgc3VnZ2VzdGlv
bjoKPiAKPiAiV2hhdCBJIG1lYW50IHdhcyB0byBtYWtlIGNvcHlfe3RvLGZyb219X2d1ZXN0KiB0
eXBlLXNhZmUuIEkganVzdCBmZWVsIGl0Cj4gYSBiaXQgc3RyYW5nZSB5b3Ugb25seSBjcmVhdGVk
IGEgd3JhcHBlciBmb3IgdGhpcyBmaWxlLiBJIHdvbmRlciB3aHkuCj4gCj4gTm90ZSBJJ20ganVz
dCBhc2tpbmcgcXVlc3Rpb24uIFRoYXQncyBub3QgbmVjZXNzYXJpbHkgYSBnb29kIGlkZWEgdG8K
PiB0dXJuIHRoZW0gYWxsIGluIHRoZSBlbmQuIgoKV2VsbCwgSSBkaWRuJ3QgcmVhbGx5IHVuZGVy
c3RhbmQgd2hhdCBoZSdzIGFmdGVyIChpbiB0aGUgY29udGV4dCBvZgp0aGlzIHNlcmllcykgLSBj
b3B5X3t0byxmcm9tfV9ndWVzdCgpIGRvbid0IHRha2Ugb3IgcmV0dXJuIE1GTnMgb3IKR0ZOcy4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
