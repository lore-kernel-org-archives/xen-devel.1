From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH RFC 0/6] mm/kdump: allow to exclude pages
 that are logically offline
Date: Wed, 14 Nov 2018 23:41:16 +0000
Message-ID: <63214D36-14FD-4080-8E35-CF2A392D6507__24728.3513345339$1542262005$gmane$org@vmware.com>
References: <20181114211704.6381-1-david@redhat.com>
 <8932E1F4-A5A9-4462-9800-CAC1EF85AC5D@vmware.com>
 <63c5f4b6-828a-764e-f64d-e603dc4b104e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kztb=nz=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1gN4ml-0000Iw-68
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 23:41:27 +0000
In-Reply-To: <63c5f4b6-828a-764e-f64d-e603dc4b104e@redhat.com>
Content-Language: en-US
Content-ID: <45598D8ED7B9944FBB381B5CF426DFE4@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm <linux-mm@kvack.org>, Julien Freche <jfreche@vmware.com>
Cc: Michal Hocko <mhocko@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave Young <dyoung@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Haiyang
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRGF2aWQgSGlsZGVuYnJhbmQNClNlbnQ6IE5vdmVtYmVyIDE0LCAyMDE4IGF0IDExOjA1
OjM4IFBNIEdNVA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyAwLzZdIG1tL2tkdW1wOiBhbGxv
dyB0byBleGNsdWRlIHBhZ2VzIHRoYXQgYXJlIGxvZ2ljYWxseSBvZmZsaW5lDQo+IA0KPiANCj4g
T24gMTQuMTEuMTggMjM6NTcsIE5hZGF2IEFtaXQgd3JvdGU6DQo+PiBGcm9tOiBEYXZpZCBIaWxk
ZW5icmFuZA0KPj4gU2VudDogTm92ZW1iZXIgMTQsIDIwMTggYXQgOToxNjo1OCBQTSBHTVQNCj4+
PiBTdWJqZWN0OiBbUEFUQ0ggUkZDIDAvNl0gbW0va2R1bXA6IGFsbG93IHRvIGV4Y2x1ZGUgcGFn
ZXMgdGhhdCBhcmUgbG9naWNhbGx5IG9mZmxpbmUNCj4+PiANCj4+PiANCj4+PiBSaWdodCBub3cs
IHBhZ2VzIGluZmxhdGVkIGFzIHBhcnQgb2YgYSBiYWxsb29uIGRyaXZlciB3aWxsIGJlIGR1bXBl
ZA0KPj4+IGJ5IGR1bXAgdG9vbHMgbGlrZSBtYWtlZHVtcGZpbGUuIFdoaWxlIFhFTiBpcyBhYmxl
IHRvIGNoZWNrIGluIHRoZQ0KPj4+IGNyYXNoIGtlcm5lbCB3aGV0aGVyIGEgY2VydGFpbiBwZm4g
aXMgYWN0dWFsbCBiYWNrZWQgYnkgbWVtb3J5IGluIHRoZQ0KPj4+IGh5cGVydmlzb3IgKHNlZSB4
ZW5fb2xkbWVtX3Bmbl9pc19yYW0pIGFuZCBvcHRpbWl6ZSB0aGlzIGNhc2UsIGR1bXBzIG9mDQo+
Pj4gdmlydGlvLWJhbGxvb24gYW5kIGh2LWJhbGxvb24gaW5mbGF0ZWQgbWVtb3J5IHdpbGwgZXNz
ZW50aWFsbHkgcmVzdWx0IGluDQo+Pj4gemVybyBwYWdlcyBnZXR0aW5nIGFsbG9jYXRlZCBieSB0
aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGR1bXAgZ2V0dGluZw0KPj4+IGZpbGxlZCB3aXRoIHRoaXMg
ZGF0YS4NCj4+IA0KPj4gSXMgdGhlcmUgYW55IHJlYXNvbiB0aGF0IFZNd2FyZSBiYWxsb29uIGRy
aXZlciBpcyBub3QgbWVudGlvbmVkPw0KPiANCj4gRGVmaW5pdGVseSAuLi4NCj4gDQo+IC4uLiBu
b3QgOykgLiBJIGhhdmVuJ3QgbG9va2VkIGF0IHZtd2FyZSdzIGJhbGxvb24gZHJpdmVyIHlldCAo
SSBvbmx5IHNhdw0KPiB0aGF0IHRoZXJlIHdhcyBxdWl0ZSBzb21lIGFjdGl2aXR5IHJlY2VudGx5
KS4gSSBndWVzcyBpdCBzaG91bGQgaGF2ZQ0KPiBzaW1pbGFyIHByb2JsZW1zLiAoSSBtZWFuIHJl
YWRpbmcgYW5kIGR1bXBpbmcgZGF0YSBub2JvZHkgY2FyZXMgYWJvdXQgaXMNCj4gY2VydGFpbmx5
IG5vdCBkZXNpcmVkKQ0KPiANCj4gQ2FuIHlvdSBzaGFyZSBpZiBzb21ldGhpbmcgbGlrZSB0aGlz
IGlzIGFsc28gZGVzaXJlZCBmb3Igdm13YXJlJ3MNCj4gaW1wbGVtZW50YXRpb24/IChJIHRhZ2dl
ZCB0aGlzIGFzIFJGQyB0byBnZXQgc29tZSBtb3JlIGZlZWRiYWNrKQ0KPiANCj4gSXQgc2hvdWxk
IGluIHRoZW9yeSBiZSBhcyBzaW1wbGUgYXMgYWRkaW5nIGEgaGFuZGZ1bCBvZg0KPiBfU2V0UGFn
ZU9mZmxpbmUoKS9fQ2xlYXJQYWdlT2ZmbGluZSgpIGF0IHRoZSByaWdodCBzcG90cy4NCg0KVGhh
bmtzLCBJIHdhcyBqdXN0IHN1c3BlY3RpbmcgaXQgaXMgcGVyc29uYWwgOy0pDQoNCkFjdHVhbGx5
LCBzb21lIHBhdGNoZXMgdGhhdCBJIHNlbnQgZm9yIDQuMjAgdG8gdXNlIHRoZSBiYWxsb29uLWNv
bXBhY3Rpb24NCmluZnJhc3RydWN0dXJlIGJ5IHRoZSBWTXdhcmUgYmFsbG9vbiBmZWxsIGJldHdl
ZW4gdGhlIGNyYWNrcywgYW5kIEkgbmVlZA0KdG8gcmVzZW5kIHRoZW0uDQoNCkkgd291bGQgb2J2
aW91c2x5IHByZWZlciB0aGF0IHlvdXIgY2hhbmdlcyB3b3VsZCBiZSBkb25lIG9uIHRvcCBvZiB0
aG9zZQ0KdGhhdCB3ZXJlIHNraXBwZWQuIFRoaXMgcGF0Y2gtc2V0IHNvdW5kcyB2ZXJ5IHJlYXNv
bmFibGUgdG8gbWUsIGJ1dCBJIHByZWZlcg0KdGhhdCBKdWxpZW4gKGNj4oCZZCkgd291bGQgYWxz
byBnaXZlIGhpcyBvcGluaW9uLg0KDQpSZWdhcmRzLA0KTmFkYXYKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
