From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 2/6] tools/libxc: Define VM_EVENT type
Date: Mon, 11 Feb 2019 12:30:37 +0000
Message-ID: <68483a2b9250a4535636638dc8ee54aee8793afd.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <cover.1545245243.git.ppircalabu@bitdefender.com>
 <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CEF8020000780020B645@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sPx1=QS=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1gtAjS-0001fN-P5
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 12:30:42 +0000
In-Reply-To: <5C34CEF8020000780020B645@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <90D61E417D19C04DA2618259DFCCB98F@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMDE5LTAxLTA4IGF0IDA5OjI1IC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiA+ID4gT24gMTkuMTIuMTggYXQgMTk6NTIsIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4g
d3JvdGU6DQo+ID4gDQo+ID4gQEAgLTc5Niw3ICs3ODcsNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9n
ZGJzeF9kb21zdGF0dXMgew0KPiA+ICAgKiBFWERFViAgLSBndWVzdCBoYXMgUG9EIGVuYWJsZWQN
Cj4gPiAgICogRUJVU1kgIC0gZ3Vlc3QgaGFzIG9yIGhhZCBwYWdpbmcgZW5hYmxlZCwgcmluZyBi
dWZmZXIgc3RpbGwNCj4gPiBhY3RpdmUNCj4gPiAgICovDQo+ID4gLSNkZWZpbmUgWEVOX0RPTUNU
TF9WTV9FVkVOVF9PUF9QQUdJTkcgICAgICAgICAgICAxDQo+ID4gKyNkZWZpbmUgWEVOX1ZNX0VW
RU5UX1RZUEVfUEFHSU5HICAgICAgICAgMQ0KPiANCj4gQXNzdW1pbmcgdGhlIHJlbmFtaW5nIGlz
IGZvciB0aGUgcHVycG9zZSBvZiByZS11c2UgZWxzZXdoZXJlLA0KPiBJIHRoaW5rIHRoZXNlIHNo
b3VsZCBiZSBtb3ZlZCB0byB2bV9ldmVudC5oIHRoZW4uDQoNCkkgd2lsbCBtb3ZlIHRoZSBkZWZp
bml0aW9ucyB0byB2bV9ldmVudC5oIGJ1dCBwYXJ0IG9mIHRoZSBjb3JyZXNwb25kaW5nDQpjb21t
ZW50cyB3aWxsIGhhdmUgdG8gcmVtYWluIGluIGRvbWN0bC5oIChlLmcuIFhFTl9WTV9FVkVOVF9F
TkFCTEUNCmVycm9yIGNvZGVzIGZvciBlYWNoIHZtX2V2ZW50IHR5cGUpLg0KPiANCj4gPiArICog
VGhpcyBoeXBlcmNhbGwgYWxsb3dzIG9uZSB0byBjb250cm9sIHRoZSB2bV9ldmVudCByaW5ncw0K
PiA+IChlbmFibGUvZGlzYWJsZSksDQo+ID4gKyAqIGFzIHdlbGwgYXMgdG8gc2lnbmFsIHRvIHRo
ZSBoeXBlcnZpc29yIHRvIHB1bGwgcmVzcG9uc2VzDQo+ID4gKHJlc3VtZSkgYW5kDQo+ID4gKyAq
IHJldHJpZXZlIHRoZSBldmVudCBjaGFubmVsIGZyb20gdGhlIGdpdmVuIHJpbmcuDQo+ID4gKyAq
Lw0KPiA+ICsjZGVmaW5lIFhFTl9WTV9FVkVOVF9FTkFCTEUgICAgICAgICAgICAgICAwDQo+ID4g
KyNkZWZpbmUgWEVOX1ZNX0VWRU5UX0RJU0FCTEUgICAgICAgICAgICAgIDENCj4gPiArI2RlZmlu
ZSBYRU5fVk1fRVZFTlRfUkVTVU1FICAgICAgICAgICAgICAgMg0KPiANCj4gU2FtZSBwZXJoYXBz
IGZvciB0aGVzZSwgYWxiZWl0IGhlcmUgeW91IGp1c3QgbW92ZSB0aGVtIGRvd24gYQ0KPiBmZXcg
bGluZXMuDQpUaGVzZSBhcmUgdGhlIGFjdHVhbCBYRU5fRE9NQ1RMX3ZtX2V2ZW50X29wIG9wY29k
ZXMuIFRoZXkgYXJlIHVzZWQgb25seQ0KaW4gY29uanVuY3Rpb24gd2l0aCB0aGlzIGRvbWN0bCBz
byBJIHdvdWxkIHByZWZlciBub3QgdG8gbW92ZSB0aGVtLg0KDQpNYW55IHRoYW5rcyBmb3IgeW91
ciBjb21tZW50cywNClBldHJlDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
