From: Julien Freche <jfreche@vmware.com>
Subject: Re: [PATCH RFC 0/6] mm/kdump: allow to exclude pages
 that are logically offline
Date: Thu, 15 Nov 2018 01:42:30 +0000
Message-ID: <B6456717-0A6F-4957-A7F2-11599701226A__819.699155590747$1542262031$gmane$org@vmware.com>
References: <20181114211704.6381-1-david@redhat.com>
 <8932E1F4-A5A9-4462-9800-CAC1EF85AC5D@vmware.com>
 <63c5f4b6-828a-764e-f64d-e603dc4b104e@redhat.com>
 <63214D36-14FD-4080-8E35-CF2A392D6507@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hmcg=n2=vmware.com=jfreche@srs-us1.protection.inumbo.net>)
 id 1gN6g3-0001TD-CL
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 01:42:39 +0000
In-Reply-To: <63214D36-14FD-4080-8E35-CF2A392D6507@vmware.com>
Content-Language: en-US
Content-ID: <E20FFFB53594D84E87A1E97CF4FFF55A@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nadav Amit <namit@vmware.com>, David Hildenbrand <david@redhat.com>, linux-mm <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave Young <dyoung@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Haiyang
List-Id: xen-devel@lists.xenproject.org

Pk9uIDExLzE0LzE4LCAzOjQxIFBNLCAiTmFkYXYgQW1pdCIgPG5hbWl0QHZtd2FyZS5jb20+IHdy
b3RlOg0KPj5Gcm9tOiBEYXZpZCBIaWxkZW5icmFuZA0KPj5TZW50OiBOb3ZlbWJlciAxNCwgMjAx
OCBhdCAxMTowNTozOCBQTSBHTVQNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIDAvNl0gbW0v
a2R1bXA6IGFsbG93IHRvIGV4Y2x1ZGUgcGFnZXMgdGhhdCBhcmUgbG9naWNhbGx5IG9mZmxpbmUN
Cj4+IA0KPj4gDQo+PiBDYW4geW91IHNoYXJlIGlmIHNvbWV0aGluZyBsaWtlIHRoaXMgaXMgYWxz
byBkZXNpcmVkIGZvciB2bXdhcmUncw0KPj4gaW1wbGVtZW50YXRpb24/IChJIHRhZ2dlZCB0aGlz
IGFzIFJGQyB0byBnZXQgc29tZSBtb3JlIGZlZWRiYWNrKQ0KPj4gDQo+PiBJdCBzaG91bGQgaW4g
dGhlb3J5IGJlIGFzIHNpbXBsZSBhcyBhZGRpbmcgYSBoYW5kZnVsIG9mDQo+PiBfU2V0UGFnZU9m
ZmxpbmUoKS9fQ2xlYXJQYWdlT2ZmbGluZSgpIGF0IHRoZSByaWdodCBzcG90cy4NCj4gICAgDQo+
IFRoYW5rcywgSSB3YXMganVzdCBzdXNwZWN0aW5nIGl0IGlzIHBlcnNvbmFsIDstKQ0KPg0KPiBJ
IHdvdWxkIG9idmlvdXNseSBwcmVmZXIgdGhhdCB5b3VyIGNoYW5nZXMgd291bGQgYmUgZG9uZSBv
biB0b3Agb2YgdGhvc2UNCj4gdGhhdCB3ZXJlIHNraXBwZWQuIFRoaXMgcGF0Y2gtc2V0IHNvdW5k
cyB2ZXJ5IHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJIHByZWZlcg0KPiB0aGF0IEp1bGllbiAoY2Pi
gJlkKSB3b3VsZCBhbHNvIGdpdmUgaGlzIG9waW5pb24uDQogICAgDQpJIHRoaW5rIHRoaXMgaXMg
ZGVzaXJhYmxlIGZvciBWTXdhcmUncyBpbXBsZW1lbnRhdGlvbiBhbHNvLiBZb3UgYXJlIHJpZ2h0
LA0KZHVtcGluZyBkYXRhIHRoYXQgaXMgbm90IHJlbGV2YW50IGlzIGEgd2FzdGUgOi0pIA0KSSBo
YXZlbid0IGhlYXJkIG9mIGFueSBwYW5pYy9pc3N1ZSBkdWUgdG8gdGhpcyBidXQgdGhhdCdzIHN0
aWxsIGEgZ29vZCBvcHRpbWl6YXRpb24uDQoNCk5hZGF2IG9yIEkgY291bGQgaGVscCB0byB0ZXN0
IHRoYXQgb24gRVNYIGlmIHJlcXVpcmVkLg0KDQpSZWdhcmRzLA0KDQotLSANCkp1bGllbiBGcmVj
aGUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
