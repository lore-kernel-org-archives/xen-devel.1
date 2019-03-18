From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v8 10/11] viridian: add implementation of
 synthetic timers
Date: Mon, 18 Mar 2019 15:46:23 +0000
Message-ID: <6001528cc0ae46f481f156802d8bcdd4@AMSPEX02CL02.citrite.net>
References: <20190318112059.21910-1-paul.durrant@citrix.com>
 <20190318112059.21910-11-paul.durrant@citrix.com>
 <5C8FAA00020000780021FE95@prv1-mh.provo.novell.com>
 <f742ebef90204de1ac1044c100620a2b@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0sDq=RV=citrix.com=prvs=973115de2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h5uVa-0005JF-Rg
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 15:49:02 +0000
In-Reply-To: <f742ebef90204de1ac1044c100620a2b@AMSPEX02CL02.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4gPiArICAgIHsNCj4gPiA+
ICsgICAgICAgIGV4cGlyYXRpb24gPSB2cy0+Y291bnQ7DQo+ID4gPiArICAgICAgICBpZiAoIGV4
cGlyYXRpb24gLSBub3cgPD0gMCApDQo+ID4gPiArICAgICAgICB7DQo+ID4gPiArICAgICAgICAg
ICAgdnMtPmV4cGlyYXRpb24gPSBleHBpcmF0aW9uOw0KPiA+ID4gKyAgICAgICAgICAgIHN0aW1l
cl9leHBpcmUodnMpOw0KPiA+DQo+ID4gQXJlbid0IHlvdSBpbnRyb2R1Y2luZyBhIHJpc2sgZm9y
IHJhY2VzIGJ5IGNhbGxpbmcgdGhlIHRpbWVyIGZ1bmN0aW9uDQo+ID4gZGlyZWN0bHkgZnJvbSBo
ZXJlPyBzdGFydF90aW1lcigpLCBhZnRlciBhbGwsIGdldHMgY2FsbGVkIGZyb20gcXVpdGUgYQ0K
PiA+IGZldyBwbGFjZXMuDQo+ID4NCj4gDQo+IEluIHByYWN0aWNlIEkgZG9uJ3QgdGhpbmsgdGhl
cmUgc2hvdWxkIGJlIGFueSBwcm9ibGVtYXRpYyByYWNlLCBidXQgSSdsbCBjaGVjayBhZ2Fpbi4N
Cj4gDQoNCkkgdGhpbmsgdGhlICdwZXJpb2RpYycgbmFtZSBtaWdodCBiZSBjb25mdXNpbmcgdGhp
bmdzLi4uIFRoZSBYZW4gdGltZXJzIGFyZSBhbGwgc2luZ2xlLXNob3QsIGl0J3MganVzdCB0aGF0
IHN0YXJ0X3N0aW1lcigpIGlzIHJlLWNhbGxlZCBhZnRlciBhIHN1Y2Nlc3NmdWwgcG9sbCBpZiB0
aGUgdmlyaWRpYW4gdGltZXIgaXMgY29uZmlndXJlZCB0byBiZSBwZXJpb2RpYy4gU28gSSBkb24n
dCB0aGluayB0aGVyZSBpcyBjYXNlIHdoZXJlIHRoZSB1bmRlcmx5aW5nIFhlbiB0aW1lciBjb3Vs
ZCBhY3R1YWxseSBiZSBydW5uaW5nIHdoZW4gd2UgZW50ZXIgc3RhcnRfc3RpbWVyKCkuDQoNCiAg
UGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
