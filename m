From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 11/15] libxl_dm: Pre-open QMP socket for
 QEMU
Date: Mon, 12 Nov 2018 15:22:08 +0000
Message-ID: <20181112152208.GH1302@perard.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-12-anthony.perard@citrix.com>
 <23493.61815.315512.256184@mariner.uk.xensource.com>
 <20181112145256.GF1302@perard.uk.xensource.com>
 <23529.39126.887208.455960@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rjzm=nx=citrix.com=prvs=8477fb41c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gME2X-0007iI-SK
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:22:13 +0000
Content-Disposition: inline
In-Reply-To: <23529.39126.887208.455960@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDM6MTQ6MzBQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAxMS8xNV0gbGlieGxf
ZG06IFByZS1vcGVuIFFNUCBzb2NrZXQgZm9yIFFFTVUiKToKPiA+IE9uIFR1ZSwgT2N0IDE2LCAy
MDE4IGF0IDAzOjExOjAzUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiBBbnRob255
IFBFUkFSRCB3cml0ZXMgKCJbUEFUQ0ggdjUgMTEvMTVdIGxpYnhsX2RtOiBQcmUtb3BlbiBRTVAg
c29ja2V0IGZvciBRRU1VIik6Cj4gPiA+ID4gICAgICByZXQgPSBsaWJ4bF9fYnVpbGRfZGV2aWNl
X21vZGVsX2FyZ3MoZ2MsICJzdHViZG9tLWRtIiwgZ3Vlc3RfZG9taWQsCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Vlc3RfY29uZmlnLCAmYXJncywg
TlVMTCwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
X3N0YXRlLCBOVUxMKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkX3N0YXRlLCBOVUxMLCBOVUxMKTsKPiA+ID4gCj4gPiA+IERpZCB5b3UgY29uc2lk
ZXIgYWRkaW5nIGRtX21vbml0b3JfZmQgdG8gZF9zdGF0ZSA/Cj4gPiAKPiA+IE5vLCBJIGRpZG4n
dCwgSSdtIG5vdCBzdXIgd2hhdCBjYW4gZ28gaW50byBkX3N0YXRlLiBCdXQgdGhhdCBzZWVtcwo+
ID4gYmV0dGVyIHRoYXQgYWRkaW5nIGFuIGFyZ3VtZW50IHRvIG1hbnkgZnVuY3Rpb24gcHJvdG90
eXBlcy4KPiAKPiBJIHRoaW5rIHByZXR0eSBtdWNoIGFueXRoaW5nIHRvIGRvIHdpdGggY3JlYXRp
bmcgYSBkb21haW4gY2FuIGdvIGluCj4gdGhlcmUuCj4gCj4gPiBPbiB0aGUgb3RoZXIgaGFuZCwg
SSB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGRtX21vbml0b3JfZmQgaGF2ZSBhCj4gPiBw
cm9wZXIgaW5pdGlhbCB2YWx1ZSAoLTEpIHdoZW4gbmVlZGVkLgo+IAo+IFllcywgaXQgd291bGQg
aGF2ZSB0byBiZSBpbml0aWFsaXNlZCBhbG9uZyB3aXRoIHRoZSBvdGhlciBtZW1iZXJzIG9mCj4g
bGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZS4KCkkgZGlkbid0IG1hbmFnZSB0byBmaW5kb3V0IHdo
ZXJlIHRoaXMgbWlnaHQgYmUuIFRoZXJlIGlzCmxpYnhsX19idWlsZF9wcmUoKSBidXQgSSBkb24n
dCBrbm93IGlmIGl0J3MgYWx3YXlzIGNhbGxlZC4gSXMgdGhpcyB0aGUKcmlnaHQgcGxhY2UsIG9y
IGlzIGl0IGluaXRpYWxpc2VkIHNvbWV3aGVyZSBlbHNlPwoKQWxzbywgbm93IEkgd291bGQgcHJv
YmFibHkgbmVlZCB0byBjYWxsIGxpYnhsX19wcmVfb3Blbl9xbXBfc29ja2V0KCkKZnJvbSBsaWJ4
bF9fc3Bhd25fbG9jYWxfZG0oKSBhcyB0aGUgZF9zdGF0ZSAobGlieGxfZG9tYWluX2J1aWxkX2lu
Zm8pIGlzCmNvbnN0IHdoZW4gcGFzc2VkIHRvIGxpYnhsX19idWlsZF9kZXZpY2VfbW9kZWxfYXJn
cy4gQnV0IHRoYXQgaXMKcHJvYmFibHkgZmluZS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
