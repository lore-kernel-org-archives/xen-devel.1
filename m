From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 8/9] viridian: add implementation of
 synthetic timers
Date: Wed, 06 Mar 2019 07:38:12 -0700
Message-ID: <5C7FDB54020000780021C250@prv1-mh.provo.novell.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-9-paul.durrant@citrix.com>
 <5C7401940200007800219EEC@prv1-mh.provo.novell.com>
 <e4806e589a84416c989389e97b58dd0b@AMSPEX02CL02.citrite.net>
 <5C7FC397020000780021C16F@prv1-mh.provo.novell.com>
 <9aa18af47adc41d0bc1a8ded2e5f25fe@AMSPEX02CL02.citrite.net>
 <7cb6ed2cf8324378a5f33f6918f13e30@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u+pJ=RJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1Xgb-0001n0-QX
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 14:38:21 +0000
In-Reply-To: <7cb6ed2cf8324378a5f33f6918f13e30@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAzLjE5IGF0IDE0OjA5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQKPj4gU2VudDogMDYgTWFyY2ggMjAxOSAxMzowNgo+PiAK
Pj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+IFNl
bnQ6IDA2IE1hcmNoIDIwMTkgMTI6NTcKPj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzIDgvOV0g
dmlyaWRpYW46IGFkZCBpbXBsZW1lbnRhdGlvbiBvZiBzeW50aGV0aWMgdGltZXJzCj4+ID4KPj4g
PiA+Pj4gT24gMDYuMDMuMTkgYXQgMTI6MjMsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+ID4gPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0K
Pj4gPiA+PiBTZW50OiAyNSBGZWJydWFyeSAyMDE5IDE0OjU0Cj4+ID4gPj4KPj4gPiA+PiA+Pj4g
T24gMzEuMDEuMTkgYXQgMTE6NDcsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
ID4gPj4gPiArewo+PiA+ID4+ID4gKyAgICBjb25zdCBzdHJ1Y3QgdmlyaWRpYW5fcGFnZSAqcnQg
PSAmZC0+YXJjaC5odm0udmlyaWRpYW4tPnJlZmVyZW5jZV90c2M7Cj4+ID4gPj4gPiArICAgIEhW
X1JFRkVSRU5DRV9UU0NfUEFHRSAqcCA9IHJ0LT5wdHI7Cj4+ID4gPj4gPiArICAgIHVpbnQzMl90
IHN0YXJ0LCBlbmQ7Cj4+ID4gPj4gPiArICAgIF9faW50MTI4X3QgdHNjOwo+PiA+ID4+ID4gKyAg
ICBfX2ludDEyOF90IHNjYWxlOwo+PiA+ID4+Cj4+ID4gPj4gSSBkb24ndCB0aGluayB5b3UgbmVl
ZCBib3RoIG9mIHRoZW0gYmUgMTI4IGJpdHMgd2lkZS4gSSBhbHNvIGRvbid0Cj4+ID4gPj4gc2Vl
IHdoeSBlaXRoZXIgd291bGQgd2FudCB0byBiZSBvZiBhIHNpZ25lZCB0eXBlLgo+PiA+ID4KPj4g
PiA+IFRoZSBzcGVjIHNheXMgKGFzIGluIHRoZSBjb21tZW50IGJlbG93KToKPj4gPiA+Cj4+ID4g
PiAiVGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgdGltZSBpcyBjb21wdXRlZCBieSB0aGUgZm9sbG93
aW5nIGZvcm11bGE6Cj4+ID4gPgo+PiA+ID4gUmVmZXJlbmNlVGltZSA9ICgoVmlydHVhbFRzYyAq
IFRzY1NjYWxlKSA+PiA2NCkgKyBUc2NPZmZzZXQKPj4gPiA+Cj4+ID4gPiBUaGUgbXVsdGlwbGlj
YXRpb24gaXMgYSA2NCBiaXQgbXVsdGlwbGljYXRpb24sIHdoaWNoIHJlc3VsdHMgaW4gYSAxMjgg
Yml0Cj4+ID4gPiBudW1iZXIgd2hpY2ggaXMgdGhlbiBzaGlmdGVkIDY0IHRpbWVzIHRvIHRoZSBy
aWdodCB0byBvYnRhaW4gdGhlIGhpZ2ggNjQKPj4gPiA+IGJpdHMuVHNjU2NhbGUiCj4+ID4KPj4g
PiBXZWxsLCB5ZXMsIHlvdSB3YW50IGEgMTI4LWJpdCByZXN1bHQuIEJ1dCBmb3IgdGhhdCB5b3Ug
ZG9uJ3QgbmVlZCB0bwo+PiA+IG11bHRpcGx5IDEyOC1iaXQgcXVhbnRpdGllcy4gU2VlIGUuZy4g
b3VyIG93biBzY2FsZV9kZWx0YSgpIG9yCj4+ID4gaHZtX3NjYWxlX3RzYygpLgo+PiAKPj4gVGVz
dGluZyBzaG93ZWQgdGhhdCBieSBub3QgY2FzdGluZyBmaXJzdCB0aGluZ3Mgd2VyZSBicm9rZW4u
IEkgYXNzdW1lZCB0aGlzIHdhcyBiZWNhdXNlIHRoZSByZXN1bHQgb2YKPj4gdGhlIG11bHRpcGxp
Y2F0aW9uIHdhcyBiZWluZyB0cnVuY2F0ZWQgdG8gNjQtYml0cyBiZWZvcmUgYXNzaWdubWVudCwg
YnV0IEkgY2FuIGNoZWNrIHRoZSBnZW5lcmF0ZWQKPj4gY29kZS4gSSdsbCBhbHNvIGhhdmUgYSBs
b29rIGF0IHRoZSBleGFtcGxlcyB5b3UgY2l0ZS4KPiAKPiBCb3RoIHRob3NlIGV4YW1wbGVzIGRv
IHRoZSBtdWx0aXBsaWNhdGlvbiBieSBpbmxpbmUgYXNtIChwcmVzdW1hYmx5IHRvIGF2b2lkIAo+
IHRydW5jYXRpb24pLiBJcyB0aGF0IHdoYXQgeW91J2QgcHJlZmVyPwoKVGhhdCB3b3VsZCBpbW8g
YmUgYmVzdCwgbm90IHRoZSBsZWFzdCBiZWNhdXNlIG9mIG1ha2luZyB1cyBpbmRlcGVuZGVudApv
ZiBwb3NzaWJsZSBpc3N1ZXMgd2l0aCAxMjgtYml0IGFyaXRobWV0aWMgb24gb2xkZXIgY29tcGls
ZXJzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
