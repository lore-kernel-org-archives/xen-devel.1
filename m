From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 1/4] amd-iommu: add flush iommu_ops
Date: Wed, 5 Dec 2018 12:58:35 +0000
Message-ID: <f9c9a57e24794d2da1fd4ca58087279f@AMSPEX02CL03.citrite.net>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-2-paul.durrant@citrix.com>
 <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
 <06f4edfeb8824993bc0cc59e56eebc12@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f1m+=oo=citrix.com=prvs=870045bc7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUWlD-0003Ca-DO
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:58:39 +0000
In-Reply-To: <06f4edfeb8824993bc0cc59e56eebc12@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Suravee Suthikulpanit' <suravee.suthikulpanit@amd.com>, 'xen-devel' <xen-devel@lists.xenproject.org>, 'Brian Woods' <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudAo+IFNlbnQ6
IDA1IERlY2VtYmVyIDIwMTggMTI6NTcKPiBUbzogJ0phbiBCZXVsaWNoJyA8SkJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPjsgU3VyYXZlZSBT
dXRoaWt1bHBhbml0Cj4gPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQW5kcmV3IENv
b3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFdlaQo+IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IHhlbi1k
ZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+IFN1YmplY3Q6IFJFOiBbUEFU
Q0ggdjMgMS80XSBhbWQtaW9tbXU6IGFkZCBmbHVzaCBpb21tdV9vcHMKPiAKPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNo
QHN1c2UuY29tXQo+ID4gU2VudDogMDUgRGVjZW1iZXIgMjAxOCAxMTo0Ngo+ID4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogQnJpYW4gV29vZHMgPGJy
aWFuLndvb2RzQGFtZC5jb20+OyBTdXJhdmVlIFN1dGhpa3VscGFuaXQKPiA+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IEFuZHJldyBDb29wZXIKPiA+IDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQo+
ID4gTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvNF0gYW1kLWlvbW11
OiBhZGQgZmx1c2ggaW9tbXVfb3BzCj4gPgo+ID4gPj4+IE9uIDA1LjEyLjE4IGF0IDEyOjI5LCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiAtLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKPiA+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X21hcC5jCj4gPiA+IEBAIC02MzQsNiArNjM0LDU2IEBAIGludCBhbWRf
aW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdAo+ID4gZGZuKQo+ID4gPiAg
ICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+ID4gPgo+ID4gPiAgICAg
IGFtZF9pb21tdV9mbHVzaF9wYWdlcyhkLCBkZm5feChkZm4pLCAwKTsKPiA+ID4gKyAgICByZXR1
cm4gMDsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgZmx1c2hf
Y291bnQodW5zaWduZWQgbG9uZyBkZm4sIHVuc2lnbmVkIGludAo+ID4gcGFnZV9jb3VudCwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvcmRlcikK
PiA+ID4gK3sKPiA+ID4gKyAgICB1bnNpZ25lZCBsb25nIHN0YXJ0ID0gZGZuID4+IG9yZGVyOwo+
ID4gPiArICAgIHVuc2lnbmVkIGxvbmcgZW5kID0gKGRmbiArIHBhZ2VfY291bnQgLSAxKSA+PiAx
Owo+ID4KPiA+IEdyYW50ZWQgaW4gbXkgZWFybGllciByZXBseSBJIGhhZCBhIG1pc3Npbmcgb3Bl
bmluZyBwYXJlbnRoZXNpcywKPiA+IGJ1dCB0aGUgYWJvdmUgaXMgcHJldHR5IGNsZWFybHkgdGhl
IHdyb25nIHdheSBvZiBhZGRyZXNzaW5nCj4gPiB0aGUgcmVzdWx0aW5nIGJ1aWxkIGVycm9yLgo+
IAo+IFNvcnJ5LCB0aGF0J3Mgd2F5IHRvbyBjcnlwdGljLiBXaGF0IGJ1aWxkIGVycm9yPwoKSSBh
Z3JlZSB0aGVyZSBpcyBhIHR5cG8gdGhlcmUsIGluIHRoYXQgdGhlICc+PiAxJyBzaG91bGQgYmUg
Jz4+IG9yZGVyJy4uLiBJcyB0aGF0IHdoYXQgeW91J3JlIGdldHRpbmcgYXQ/CgogIFBhdWwKCj4g
Cj4gICBQYXVsCj4gCj4gPgo+ID4gSmFuCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
