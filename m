From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/3] xen-init-dom0: set Dom0 UUID if
 requested
Date: Thu, 15 Nov 2018 13:35:32 +0000
Message-ID: <20181115133532.jh3yzahgf4oqaed6@zion.uk.xensource.com>
References: <20181114181732.19013-1-wei.liu2@citrix.com>
 <20181114181732.19013-4-wei.liu2@citrix.com>
 <b4976883-1223-91a4-d945-ab4949d4a062@citrix.com>
 <20181115112037.irjcivtiel2iqgcp@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kRFN=N2=citrix.com=prvs=850791b01=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gNHo1-0004kh-1V
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:35:37 +0000
Content-Disposition: inline
In-Reply-To: <20181115112037.irjcivtiel2iqgcp@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMTE6MjA6MzdBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIE5vdiAxNSwgMjAxOCBhdCAxMDo0NTo1MkFNICswMDAwLCBFZHdpbiBUw7Zyw7Zr
IHdyb3RlOgo+ID4gT24gMTQvMTEvMjAxOCAxODoxNywgV2VpIExpdSB3cm90ZToKPiA+ID4gUmVh
ZCBmcm9tIFhFTl9DT05GSUdfRElSL2RvbTAtdXVpZC4gSWYgaXQgY29udGFpbnMgYSB2YWxpZCBV
VUlELCBzZXQKPiA+ID4gaXQgZm9yIERvbTAuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gCj4gPiBbc25pcF0KPiA+IEluIGdlbmVy
YWwgdGhpcyBsb29rcyBnb29kLCBob3dldmVyIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggbGlieGwK
PiA+IGNvbnZlbnRpb25zLCBzbyBqdXN0IHNvbWUgZ2VuZXJpYyBjb21tZW50cyBiZWxvdy4KPiA+
IAo+ID4gPiArc3RhdGljIHZvaWQgZ2V0X2RvbTBfdXVpZChsaWJ4bF91dWlkICp1dWlkKQo+ID4g
PiArewo+ID4gPiArICAgIGludCBmZCA9IC0xOwo+ID4gPiArICAgIHNzaXplX3QgcjsKPiA+ID4g
KyAgICBjaGFyIHV1aWRfYnVmW0xJQlhMX1VVSURfRk1UTEVOKzFdOwo+ID4gPiArCj4gPiA+ICsg
ICAgbGlieGxfdXVpZF9jbGVhcih1dWlkKTsKPiA+ID4gKwo+ID4gPiArICAgIGZkID0gb3BlbihE
T00wX1VVSURfUEFUSCwgT19SRE9OTFkpOwo+ID4gPiArICAgIGlmIChmZCA8IDApIHsKPiA+ID4g
KyAgICAgICAgZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gb3BlbiAlc1xuIiwgRE9NMF9VVUlE
X1BBVEgpOwo+ID4gPiArICAgICAgICBnb3RvIG91dDsKPiA+ID4gKyAgICB9Cj4gPiA+ICsKPiA+
ID4gKyAgICByID0gcmVhZChmZCwgdXVpZF9idWYsIExJQlhMX1VVSURfRk1UTEVOKTsKPiA+IAo+
ID4gQ291bGQgdGhpcyBiZSBhIHNob3J0IHJlYWQ/IEknbSBub3QgZmFtaWxpYXIgd2l0aCBsaWJ4
bCBjb252ZW50aW9ucywgYnV0Cj4gPiB3b3VsZCB0aGVyZSBiZSBhIHV0aWxpdHkgZnVuY3Rpb24g
dGhhdCByZXBlYXRzIHRoZSByZWFkIGlmIGl0IGlzIHNob3J0LAo+ID4gb3Igd291bGQgZnJlYWQg
YmUgYmV0dGVyPwo+IAo+IEkgY2FuIHVzZSBsaWJ4bF9yZWFkX2V4YWN0bHkgaW5zdGVhZC4gVGhh
dCBzYXZlcyBtZSBmcm9tIHdyaXRpbmcgc29tZQo+IGNvZGUgdG8gaGFuZGxlIGV2ZXJ5IGNvcm5l
ciBjYXNlLgo+IAoKT24gc2Vjb25kIHRob3VnaHQsIHRoaXMgcmVxdWlyZXMgY29kZSB0byBhbGxv
Y2F0aW5nIGFuZCBkZXN0cm95aW5nIGxpYnhsCmN0eC4gSSB3aWxsIHdyaXRlIGEgbG9vcCBoZXJl
IHRvIGhhbmRsZSBzaG9ydC1yZWFkIGluc3RlYWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
