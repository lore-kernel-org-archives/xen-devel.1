From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Fri, 30 Nov 2018 16:37:33 +0000
Message-ID: <CEC3C969-9BCD-466D-9566-05CE2E005193@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <23550.51384.89698.110737@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2nge=oj=citrix.com=prvs=86598431a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSlnN-0007Te-6J
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:37:37 +0000
In-Reply-To: <23550.51384.89698.110737@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <FCD9CDE339F6F641A3797840A5777E25@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIE5vdiAyOCwgMjAxOCwgYXQgNDo1NiBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+ICAgICBpZiAoIXhzX3JtKENUWC0+eHNoLCBYQlRf
TlVMTCwgcGF0aCkpDQo+PiAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAieHNfcm0gZmFpbGVk
IGZvciAlcyIsIHBhdGgpOw0KPj4gDQo+PiAtICAgIC8qIFdlIHNob3VsZCB0cnkgdG8gZGVzdHJv
eSB0aGUgZGV2aWNlIG1vZGVsIGFueXdheS4gKi8NCj4+IC0gICAgcmMgPSBraWxsX2RldmljZV9t
b2RlbChnYywNCj4+IC0gICAgICAgICAgICAgIEdDU1BSSU5URigiL2xvY2FsL2RvbWFpbi8lZC9p
bWFnZS9kZXZpY2UtbW9kZWwtcGlkIiwgZG9taWQpKTsNCj4+ICsgICAgLyogDQo+PiArICAgICAq
IFdlIHNob3VsZCB0cnkgdG8gZGVzdHJveSB0aGUgZGV2aWNlIG1vZGVsIGFueXdheS4gIENoZWNr
IHRvIHNlZQ0KPj4gKyAgICAgKiBpZiB3ZSBjYW4ga2lsbCBieSBVSUQNCj4+ICsgICAgICovDQo+
PiArICAgIHJldCA9IGxpYnhsX194c19yZWFkX2NoZWNrZWQoZ2MsIFhCVF9OVUxMLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCIvbG9jYWwvZG9tYWluLyVk
L2ltYWdlL2RldmljZS1tb2RlbC11aWQiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkb21pZCksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmRtX3VpZF9zdHIpOw0KPiANCj4gSSBrbm93IHRoaXMgZnVuY3Rpb24gaXMgYmFkIGlu
IGl0cyB1c2Ugb2YgYHJjJyBmb3Igc3lzY2FsbCByZXR1cm4gYnV0DQo+IHBsZWFzZSBkb24ndCBt
YWtlIGl0IHdvcnNlIGJ5IGludHJvZHVjaW5nIGByZXQnIGZvciB3aGF0IHNob3VsZCBiZQ0KPiBg
cmMnLiAgV291bGQgeW91IG1pbmQgYWRkaW5nIGEgcHJlLXBhdGNoIHRvIGNoYW5nZSBgcmMnIHRv
IGByJyBhbmQNCj4gdGhlbiB5b3UgY2FuIHVzZSBgcmPigJkgPw0KDQpBY3R1YWxseSwgaXQgbG9v
a3MgbGlrZSBraWxsX2RldmljZV9tb2RlbCgpIHJldHVybnMgYSBsaWJ4bCBlcnJvciB2YWx1ZS4g
IFNvIHdlIHNob3VsZCB1c2UgdGhlIGV4aXN0aW5nIHJjIGZvciBib3RoIGtpbGxfZGV2aWNlX21v
ZGVsKCkgYW5kIHhzX3JlYWRfY2hlY2tlZCgpLCBhbmQgaW50cm9kdWNlIGByYCB0byB1c2UgZm9y
IHNldHJlc3VpZCgpICZjDQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
