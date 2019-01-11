From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v8 06/17] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 11 Jan 2019 12:16:38 +0000
Message-ID: <20190111121637.GL1508@perard.uk.xensource.com>
References: <20190104153056.19138-1-anthony.perard@citrix.com>
 <20190104153056.19138-7-anthony.perard@citrix.com>
 <23608.34479.976461.767202@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KriI=PT=citrix.com=prvs=907059760=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ghvkG-0000ef-Vg
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 12:17:05 +0000
Content-Disposition: inline
In-Reply-To: <23608.34479.976461.767202@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMTI6MDY6MDdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY4IDA2LzE3XSBsaWJ4bF9xbXA6
IEltcGxlbWVudGF0aW9uIG9mIGxpYnhsX19ldl9xbXBfKiIpOgo+ID4gVGhpcyBwYXRjaCBpbXBs
ZW1lbnQgdGhlIEFQSSBsaWJ4bF9fZXZfcW1wIGRvY3VtZW50ZWQgaW4gdGhlIHByZXZpb3VzCj4g
PiBwYXRjaCwgImxpYnhsOiBEZXNpZ24gb2YgYW4gYXN5bmMgQVBJIHRvIGlzc3VlIFFNUCBjb21t
YW5kcyB0byBRRU1VIi4KPiA+IAo+ID4gU2luY2UgdGhpcyBBUEkgaXMgdG8gaW50ZXJhY3Qgd2l0
aCBRRU1VIHZpYSB0aGUgUU1QIHByb3RvY29sLCBpdCBhbHNvCj4gPiBpbXBsZW1lbnQgYSBRTVAg
Y2xpZW50LiBUaGUgc3BlY2lmaWNhdGlvbiBmb3IgdGhlIFFFTVUgTWFjaGluZSBQcm90b2NvbAo+
ID4gKFFNUCkgY2FuIGJlIGZvdW5kIGluIHRoZSBRRU1VIHJlcG9zaXRvcnkgYXQ6Cj4gPiBodHRw
czovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWJsb2JfcGxhaW47Zj1kb2NzL2ludGVyb3Av
cW1wLXNwZWMudHh0Cj4gCj4gVGhhbmtzLiAgSSBoYXZlIHJlLXJldmlld2VkIHRoaXMgYW5kIEkg
aGF2ZSBvbmx5IHRoaXMgb25lIHF1ZXN0aW9uOgo+IAo+ID4gKyAgICB3aGlsZSAoZXYtPnR4X2J1
Zl9vZmYgPCBldi0+dHhfYnVmX2xlbikgewo+ID4gKyAgICAgICAgc3NpemVfdCBtYXhfd3JpdGUg
PSBldi0+dHhfYnVmX2xlbiAtIGV2LT50eF9idWZfb2ZmOwo+ID4gKyAgICAgICAgciA9IHdyaXRl
KGZkLCBldi0+dHhfYnVmICsgZXYtPnR4X2J1Zl9vZmYsIG1heF93cml0ZSk7Cj4gPiArICAgICAg
ICBpZiAociA8IDApIHsKPiA+ICsgICAgICAgICAgICBpZiAoZXJybm8gPT0gRUlOVFIpCj4gPiAr
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgIGlmIChlcnJubyA9PSBF
V09VTERCTE9DSykKPiA+ICsgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAg
TE9HRUQoRVJST1IsIGV2LT5kb21pZCwgImZhaWxlZCB0byB3cml0ZSB0byBRTVAgc29ja2V0Iik7
Cj4gPiArICAgICAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7Cj4gPiArICAgICAgICB9Cj4gPiAr
ICAgICAgICBhc3NlcnQociA+PSAwICYmIHIgPD0gbWF4X3dyaXRlKTsKPiAKPiBEb2Vzbid0IHRo
aXMgd2FudCB0byBiZQo+ICAgKyAgICAgICAgYXNzZXJ0KHIgPiAwICYmIHIgPD0gbWF4X3dyaXRl
KTsKClllcywgSSB0aGluayB0aGF0IHdvdWxkIGJlIGZpbmUuIEkgZ3Vlc3MgdGhhdCB3b3VsZCBj
YXRjaCBpc3N1ZSB3aGVyZQptYXhfd3JpdGUgaXMgMCAoc28gdHJ5aW5nIHRvIHdyaXRlIDAgYnl0
ZXMpLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
