From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 3/9] libxl: Get rid of support for
 QEMU_USER_BASE (xen-qemuuser-domidNN)
Date: Fri, 30 Nov 2018 12:53:20 +0000
Message-ID: <980E034A-58AC-408E-8923-A9931D0A17DE@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-3-george.dunlap@citrix.com>
 <20181128153202.p3aymgn5kzeosdjh@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ngE=OJ=citrix.com=prvs=86598431a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSiIN-0003BV-Mv
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 12:53:23 +0000
In-Reply-To: <20181128153202.p3aymgn5kzeosdjh@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <A3F28C2CE4FBCE4F97B7167DC91EDCB2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDI4LCAyMDE4LCBhdCAzOjMyIFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTm92IDIzLCAyMDE4IGF0IDA1OjE0OjU2UE0g
KzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBRRU1VX1VTRVJfQkFTRSBhbGxvd3MgYSB1
c2VyIHRvIHNwZWNpZnkgdGhlIFVJRCB0byB1c2Ugd2hlbiBydW5uaW5nDQo+PiB0aGUgZGV2aWNl
bW9kZWwgZm9yIGEgc3BlY2lmaWMgZG9tYWluIG51bWJlci4gIFVuZm9ydHVuYXRlbHksIHRoaXMg
aXMNCj4+IG5vdCByZWFsbHkgcHJhY3RpY2FsOiBJdCByZXF1aXJlcyBuZWFybHkgMzIsMDAwIGVu
dHJpZXMgaW4NCj4+IC9ldGMvcGFzc3dkLiAgUUVNVV9VU0VSX1JBTkdFX0JBU0UgaXMgbXVjaCBt
b3JlIHByYWN0aWNhbC4NCj4+IA0KPj4gUmVtb3ZlIHN1cHBvcnQgZm9yIFFFTVVfVVNFUl9CQVNF
Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+DQo+IA0KPiBJIGhhdmUgbm8gcHJvYmxlbSB3aXRoIHlvdSByZW1vdmluZyB0aGlz
LCBidXQgeW91IGZvcmdvdCB0byBjaGFuZ2UNCj4geGwuY2ZnLnBvZC41LmluLg0KDQpIbW3igKYg
aXQgc2VlbXMgd2hhdCBJICpyZWFsbHkqIGZvcmdvdCB0byBkbyB3YXMgcmVtb3ZlIHRoYXQgZW50
aXJlIHNlY3Rpb24gYW5kIHBvaW50IHRvIHRoZSBmZWF0dXJlIGRvYyBpbnN0ZWFkLiAgSXTigJlz
IHF1aXRlIG91dCBvZiBkYXRlIG5vdyAoZS5nLiwgY2Ryb20gaW5zZXJ0IHNob3VsZCB3b3JrIEkg
dGhpbmssIHFlbXUgaXMgY2hyb290ZWQgc28gY2Fu4oCZdCByZWFkIHdvcmxkLXJlYWRhYmxlIGZp
bGVzLCAmYykuICBXaXRoIHlvdXIgcGVybWlzc2lvbiBJ4oCZbGwgcHV0IGZpeGluZyB0aGF0IHVw
IHByb3Blcmx5IG9uIGEgdG8tZG8gbGlzdCAodG8gYmUgZG9uZSBiZWZvcmUgNC4xMiByZWxlYXNl
IGF0IGEgbWluaW11bSkuDQoNCiAtR2VvcmdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
