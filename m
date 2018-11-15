From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] xen-init-dom0: set Dom0 UUID if
 requested
Date: Thu, 15 Nov 2018 13:36:16 +0000
Message-ID: <3c9d3285-2574-33c4-a5e0-a8c12ffc1997@citrix.com>
References: <20181114181732.19013-1-wei.liu2@citrix.com>
 <20181114181732.19013-4-wei.liu2@citrix.com>
 <b4976883-1223-91a4-d945-ab4949d4a062@citrix.com>
 <20181115112037.irjcivtiel2iqgcp@zion.uk.xensource.com>
 <20181115133532.jh3yzahgf4oqaed6@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vERR=N2=citrix.com=prvs=850f8f69e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gNHoi-0004pd-B4
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 13:36:20 +0000
In-Reply-To: <20181115133532.jh3yzahgf4oqaed6@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTEvMjAxOCAxMzozNSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIE5vdiAxNSwgMjAx
OCBhdCAxMToyMDozN0FNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBUaHUsIE5vdiAxNSwg
MjAxOCBhdCAxMDo0NTo1MkFNICswMDAwLCBFZHdpbiBUw7Zyw7ZrIHdyb3RlOgo+Pj4gT24gMTQv
MTEvMjAxOCAxODoxNywgV2VpIExpdSB3cm90ZToKPj4+PiBSZWFkIGZyb20gWEVOX0NPTkZJR19E
SVIvZG9tMC11dWlkLiBJZiBpdCBjb250YWlucyBhIHZhbGlkIFVVSUQsIHNldAo+Pj4+IGl0IGZv
ciBEb20wLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPj4+IFtzbmlwXQo+Pj4gSW4gZ2VuZXJhbCB0aGlzIGxvb2tzIGdvb2QsIGhvd2V2ZXIg
SSBhbSBub3QgZmFtaWxpYXIgd2l0aCBsaWJ4bAo+Pj4gY29udmVudGlvbnMsIHNvIGp1c3Qgc29t
ZSBnZW5lcmljIGNvbW1lbnRzIGJlbG93Lgo+Pj4KPj4+PiArc3RhdGljIHZvaWQgZ2V0X2RvbTBf
dXVpZChsaWJ4bF91dWlkICp1dWlkKQo+Pj4+ICt7Cj4+Pj4gKyAgICBpbnQgZmQgPSAtMTsKPj4+
PiArICAgIHNzaXplX3QgcjsKPj4+PiArICAgIGNoYXIgdXVpZF9idWZbTElCWExfVVVJRF9GTVRM
RU4rMV07Cj4+Pj4gKwo+Pj4+ICsgICAgbGlieGxfdXVpZF9jbGVhcih1dWlkKTsKPj4+PiArCj4+
Pj4gKyAgICBmZCA9IG9wZW4oRE9NMF9VVUlEX1BBVEgsIE9fUkRPTkxZKTsKPj4+PiArICAgIGlm
IChmZCA8IDApIHsKPj4+PiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImZhaWxlZCB0byBvcGVu
ICVzXG4iLCBET00wX1VVSURfUEFUSCk7Cj4+Pj4gKyAgICAgICAgZ290byBvdXQ7Cj4+Pj4gKyAg
ICB9Cj4+Pj4gKwo+Pj4+ICsgICAgciA9IHJlYWQoZmQsIHV1aWRfYnVmLCBMSUJYTF9VVUlEX0ZN
VExFTik7Cj4+PiBDb3VsZCB0aGlzIGJlIGEgc2hvcnQgcmVhZD8gSSdtIG5vdCBmYW1pbGlhciB3
aXRoIGxpYnhsIGNvbnZlbnRpb25zLCBidXQKPj4+IHdvdWxkIHRoZXJlIGJlIGEgdXRpbGl0eSBm
dW5jdGlvbiB0aGF0IHJlcGVhdHMgdGhlIHJlYWQgaWYgaXQgaXMgc2hvcnQsCj4+PiBvciB3b3Vs
ZCBmcmVhZCBiZSBiZXR0ZXI/Cj4+IEkgY2FuIHVzZSBsaWJ4bF9yZWFkX2V4YWN0bHkgaW5zdGVh
ZC4gVGhhdCBzYXZlcyBtZSBmcm9tIHdyaXRpbmcgc29tZQo+PiBjb2RlIHRvIGhhbmRsZSBldmVy
eSBjb3JuZXIgY2FzZS4KPj4KPiBPbiBzZWNvbmQgdGhvdWdodCwgdGhpcyByZXF1aXJlcyBjb2Rl
IHRvIGFsbG9jYXRpbmcgYW5kIGRlc3Ryb3lpbmcgbGlieGwKPiBjdHguIEkgd2lsbCB3cml0ZSBh
IGxvb3AgaGVyZSB0byBoYW5kbGUgc2hvcnQtcmVhZCBpbnN0ZWFkLgoKZm9wZW4oKS9mcmVhZCgp
IHdpbGwgZ2V0IHlvdSB0aGUgY29ycmVjdCBiZWhhdmlvdXIgZm9yIGZhciBsZXNzIGNvZGUuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
