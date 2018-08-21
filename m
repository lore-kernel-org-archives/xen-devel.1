From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 20/34] x86/mtrr: move is_var_mtrr_overlapped
Date: Tue, 21 Aug 2018 15:12:56 +0100
Message-ID: <20180821141256.xxesidzfhheubwwf@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <df0874d31c8cac2c860f91747a343b70a241cd6a.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BC63B02000078001E0459@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs7PH-0006Nl-M5
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 14:13:15 +0000
Content-Disposition: inline
In-Reply-To: <5B7BC63B02000078001E0459@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDE6NTg6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBNb3ZlIGl0IHRvIHg4NiBnZW5lcmljIGNvZGUuIFdoaWxlIGF0IGl0LCB1c2UgcHJv
cGVyIGJvb2xlYW4gdHlwZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IHdpdGggYSBjb3VwbGUgb2YgY29zbWV0aWMgYWRqdXN0bWVudHMgYmV5b25kIHRoZSBi
b29sCj4gY29udmVyc2lvbiB5b3UndmUgYWxyZWFkeSBkb25lOgo+IAo+ID4gK2Jvb2wgaXNfdmFy
X210cnJfb3ZlcmxhcHBlZChjb25zdCBzdHJ1Y3QgbXRycl9zdGF0ZSAqbSkKPiA+ICt7Cj4gPiAr
ICAgIHVuc2lnbmVkIGludCBzZWcsIGk7Cj4gPiArICAgIHVuc2lnbmVkIGludCBudW1fdmFyX3Jh
bmdlcyA9IE1BU0tfRVhUUihtLT5tdHJyX2NhcCwgTVRSUmNhcF9WQ05UKTsKPiA+ICsKPiA+ICsg
ICAgZm9yICggaSA9IDA7IGkgPCBudW1fdmFyX3JhbmdlczsgaSsrICkKPiA+ICsgICAgewo+ID4g
KyAgICAgICAgdWludDY0X3QgYmFzZTEgPSBtLT52YXJfcmFuZ2VzW2ldLmJhc2UgPj4gUEFHRV9T
SElGVDsKPiA+ICsgICAgICAgIHVpbnQ2NF90IG1hc2sxID0gbS0+dmFyX3Jhbmdlc1tpXS5tYXNr
ID4+IFBBR0VfU0hJRlQ7Cj4gCj4gSGVyZSBhbmQgYmVsb3cgSSB3b25kZXIgd2hldGhlciBQRk5f
RE9XTigpIHdvdWxkbid0IGJlCj4gYXBwcm9wcmlhdGUgdG8gdXNlLiBJJ2xsIGxlYXZlIHRoYXQg
dXAgdG8geW91IHRob3VnaC4KPiAKClNpbmNlIGJhc2UgYW5kIG1hc2sgYXJlbid0IHJlYWxseSBQ
Rk4gc28gSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlCmFwcHJvcHJpYXRlIHRvIGxlYXZlIHRoZW0g
YXMtaXMuCgpJIGhhdmUgZml4ZWQgdXAgdGhlIG90aGVyIHR3byBpc3N1ZXMgeW91IG1lbnRpb25l
ZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
