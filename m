From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Fri, 9 Nov 2018 11:10:11 +0000
Message-ID: <5106114a-a927-65f9-8b72-4004fa79e467@bitdefender.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
 <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
 <f20f68a3-f52c-2e65-63ab-00f2f9622f8a@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tcxi=nu=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gL4g4-0001U3-Dq
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:10:16 +0000
In-Reply-To: <f20f68a3-f52c-2e65-63ab-00f2f9622f8a@bitdefender.com>
Content-Language: en-US
Content-ID: <0DF4D62DB4240641A76AE0589817423D@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDA5LjExLjIwMTggMTM6MDUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDA4LjExLjIwMTggMjA6MDIsIFdlaSBMaXUgd3JvdGU6DQo+PiBPbiBUaHUs
IE5vdiAwOCwgMjAxOCBhdCAwNzo1NjoyOVBNICswMjAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6
DQo+Pj4gT24gMTEvOC8xOCA3OjIyIFBNLCBXZWkgTGl1IHdyb3RlOg0KPj4+PiBPbiBUaHUsIE5v
diAwOCwgMjAxOCBhdCAwNTo1NjowN1BNICswMjAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6DQo+
Pj4+PiBPbiAxMS84LzE4IDU6NTMgUE0sIFdlaSBMaXUgd3JvdGU6DQo+Pj4+Pj4gT24gVGh1LCBO
b3YgMDgsIDIwMTggYXQgMDU6MTk6NDhQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0K
Pj4+Pj4+PiBPbiAxMS82LzE4IDc6MTYgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+Pj4+
Pj4+IE9uIE1vbiwgTm92IDUsIDIwMTggYXQgMjo1NCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QQ0KPj4+Pj4+Pj4gPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGNvdXBsZSBvZiByZWdzIHRvIHRoZSB2bV9ldmVu
dCB0aGF0IGFyZSB1c2VkIGJ5DQo+Pj4+Pj4+Pj4gdGhlIGludHJvc3BlY3Rpb24uIFRoZSBiYXNl
LCBsaW1pdCBhbmQgYXINCj4+Pj4+Pj4+PiBiaXRzIGFyZSBjb21wcmVzc2VkIGludG8gYSB1aW50
NjRfdCB1bmlvbiBzbyBhcyBub3QgdG8gZW5sYXJnZSB0aGUNCj4+Pj4+Pj4+PiB2bV9ldmVudC4N
Cj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFp
c2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFja2VkLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRvIHRo
ZSBiZXN0IG9mIG15IGFiaWxpdHkgdG8gZmlndXJlIG91dCB0aGUgbmVjZXNzYXJ5IGFja3MsIEkg
YmVsaWV2ZQ0KPj4+Pj4+PiB0aGF0IHRoaXMgb25lIGlzIHJlYWR5IHRvIGdvIGluLiA6KQ0KPj4+
Pj4+DQo+Pj4+Pj4gQWxyaWdodC4gSSB3aWxsIHBpY2sgdGhpcyB1cCBpbiBteSBuZXh0IHN3ZWVw
Lg0KPj4+Pj4NCj4+Pj4+IFRoYW5rcyENCj4+Pj4NCj4+Pj4NCj4+Pj4gVW5mb3J0dW5hdGVseSB0
aGlzIHdpbGwgYnJlYWsgc2hpbSBidWlsZCB3aGVuIEhWTSBpcyBkaXNhYmxlZC4gUGxlYXNlDQo+
Pj4+IHN1Ym1pdCBhIG5ldyB2ZXJzaW9uLiBJIHRoaW5rIHlvdSB3aWxsIG5lZWQgdG8gcHV0DQo+
Pj4+IHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3RlciB1bmRlciBDT05GSUdfSFZNLg0KPj4+
DQo+Pj4gVmVyeSBzb3JyeSBhYm91dCB0aGF0LiBXZSdsbCByZXN1Ym1pdC4NCj4+DQo+PiBTcGVh
a2luZyBvZiBidWlsZCBicmVha2FnZTogd291bGQgeW91IGd1eXMgY29uc2lkZXIgc2lnbmluZyB1
cCB0byBnaXRsYWINCj4+IHNvIHRoYXQgeW91IGNhbiB1c2UgYWxsIHRoZSBidWlsZCB0ZXN0IGlu
ZnJhc3RydWN0dXJlIHRoZXJlIGJlZm9yZQ0KPj4gc3VibWlzc2lvbj8gSXQgd291bGQgcHJvYmFi
bHkgc2F5IHlvdSBmcm9tIGJ1aWxkaW5nIGxvY2FsIGZvciBkaWZmZXJlbnQNCj4+IGRpc3Ryb3Mg
YW5kIGNvbmZpZ3MuDQo+Pg0KPj4gU2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94
ZW4vcGlwZWxpbmVzLzM1OTE4NTEwDQo+Pg0KPiANCj4gSGkgV2VpLA0KPiANCj4gSSd2ZSBndWFy
ZGVkIHRoZSB2bV9ldmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIgd2l0aCBDT05GSUdfSFZNIGZv
ciB0aGUNCj4gbmV4dCB2ZXJzaW9uLiBJJ3ZlIHJ1biB0aGUgdGVzdHMgb24gZ2l0bGFiIGFuZCB0
aGV5IHdoZXJlIGFsbCBwYXNzZWQuIEkNCj4gd2FudCB0byBzdWdnZXN0IGlmIHlvdSBjYW4gYWRk
IHNvbWUgQU1EIHRlc3RzIHNvIHdlIGNhbiBiZSBzdXJlIHRoYXQgYWxsDQoNCkkgd2FudGVkIHRv
IHNheSBBUk0gbm90IEFNRCwgc29ycnkNCg0KfkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
