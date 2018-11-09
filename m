From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Fri, 9 Nov 2018 11:05:23 +0000
Message-ID: <f20f68a3-f52c-2e65-63ab-00f2f9622f8a@bitdefender.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
 <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tcxi=nu=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gL4bP-0000Wh-OB
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:05:27 +0000
In-Reply-To: <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <C5170639580DD34E9C7D9756DCE5EA35@eurprd02.prod.outlook.com>
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

DQoNCk9uIDA4LjExLjIwMTggMjA6MDIsIFdlaSBMaXUgd3JvdGU6DQo+IE9uIFRodSwgTm92IDA4
LCAyMDE4IGF0IDA3OjU2OjI5UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4+IE9u
IDExLzgvMTggNzoyMiBQTSwgV2VpIExpdSB3cm90ZToNCj4+PiBPbiBUaHUsIE5vdiAwOCwgMjAx
OCBhdCAwNTo1NjowN1BNICswMjAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6DQo+Pj4+IE9uIDEx
LzgvMTggNTo1MyBQTSwgV2VpIExpdSB3cm90ZToNCj4+Pj4+IE9uIFRodSwgTm92IDA4LCAyMDE4
IGF0IDA1OjE5OjQ4UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4+Pj4+PiBPbiAx
MS82LzE4IDc6MTYgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+Pj4+Pj4gT24gTW9uLCBO
b3YgNSwgMjAxOCBhdCAyOjU0IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+Pj4+Pj4+IDxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyBw
YXRjaCBhZGRzIGEgY291cGxlIG9mIHJlZ3MgdG8gdGhlIHZtX2V2ZW50IHRoYXQgYXJlIHVzZWQg
YnkNCj4+Pj4+Pj4+IHRoZSBpbnRyb3NwZWN0aW9uLiBUaGUgYmFzZSwgbGltaXQgYW5kIGFyDQo+
Pj4+Pj4+PiBiaXRzIGFyZSBjb21wcmVzc2VkIGludG8gYSB1aW50NjRfdCB1bmlvbiBzbyBhcyBu
b3QgdG8gZW5sYXJnZSB0aGUNCj4+Pj4+Pj4+IHZtX2V2ZW50Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gVG8gdGhlIGJlc3Qgb2YgbXkgYWJpbGl0eSB0byBm
aWd1cmUgb3V0IHRoZSBuZWNlc3NhcnkgYWNrcywgSSBiZWxpZXZlDQo+Pj4+Pj4gdGhhdCB0aGlz
IG9uZSBpcyByZWFkeSB0byBnbyBpbi4gOikNCj4+Pj4+DQo+Pj4+PiBBbHJpZ2h0LiBJIHdpbGwg
cGljayB0aGlzIHVwIGluIG15IG5leHQgc3dlZXAuDQo+Pj4+DQo+Pj4+IFRoYW5rcyENCj4+Pg0K
Pj4+DQo+Pj4gVW5mb3J0dW5hdGVseSB0aGlzIHdpbGwgYnJlYWsgc2hpbSBidWlsZCB3aGVuIEhW
TSBpcyBkaXNhYmxlZC4gUGxlYXNlDQo+Pj4gc3VibWl0IGEgbmV3IHZlcnNpb24uIEkgdGhpbmsg
eW91IHdpbGwgbmVlZCB0byBwdXQNCj4+PiB2bV9ldmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIg
dW5kZXIgQ09ORklHX0hWTS4NCj4+DQo+PiBWZXJ5IHNvcnJ5IGFib3V0IHRoYXQuIFdlJ2xsIHJl
c3VibWl0Lg0KPiANCj4gU3BlYWtpbmcgb2YgYnVpbGQgYnJlYWthZ2U6IHdvdWxkIHlvdSBndXlz
IGNvbnNpZGVyIHNpZ25pbmcgdXAgdG8gZ2l0bGFiDQo+IHNvIHRoYXQgeW91IGNhbiB1c2UgYWxs
IHRoZSBidWlsZCB0ZXN0IGluZnJhc3RydWN0dXJlIHRoZXJlIGJlZm9yZQ0KPiBzdWJtaXNzaW9u
PyBJdCB3b3VsZCBwcm9iYWJseSBzYXkgeW91IGZyb20gYnVpbGRpbmcgbG9jYWwgZm9yIGRpZmZl
cmVudA0KPiBkaXN0cm9zIGFuZCBjb25maWdzLg0KPiANCj4gU2VlIGh0dHBzOi8vZ2l0bGFiLmNv
bS94ZW4tcHJvamVjdC94ZW4vcGlwZWxpbmVzLzM1OTE4NTEwDQo+IA0KDQpIaSBXZWksDQoNCkkn
dmUgZ3VhcmRlZCB0aGUgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyIHdpdGggQ09ORklH
X0hWTSBmb3IgdGhlIA0KbmV4dCB2ZXJzaW9uLiBJJ3ZlIHJ1biB0aGUgdGVzdHMgb24gZ2l0bGFi
IGFuZCB0aGV5IHdoZXJlIGFsbCBwYXNzZWQuIEkgDQp3YW50IHRvIHN1Z2dlc3QgaWYgeW91IGNh
biBhZGQgc29tZSBBTUQgdGVzdHMgc28gd2UgY2FuIGJlIHN1cmUgdGhhdCBhbGwgDQp0aGUgY3Jv
c3MgY29tcGlsZSB0aGluZ3MgYXJlIGluIHBsYWNlIGJlZm9yZSBzZW5kaW5nIGFueSBwYXRjaC4N
Cg0KVGhhbmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
