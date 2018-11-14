From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 0/6] mm/kdump: allow to exclude pages
 that are logically offline
Date: Thu, 15 Nov 2018 00:05:38 +0100
Message-ID: <63c5f4b6-828a-764e-f64d-e603dc4b104e__17801.323955837$1542236681$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <8932E1F4-A5A9-4462-9800-CAC1EF85AC5D@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCq3=NZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gN4ES-0005EK-G2
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 23:06:00 +0000
In-Reply-To: <8932E1F4-A5A9-4462-9800-CAC1EF85AC5D@vmware.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nadav Amit <namit@vmware.com>, linux-mm <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave Young <dyoung@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Haiyang
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMTEuMTggMjM6NTcsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gRnJvbTogRGF2aWQgSGlsZGVu
YnJhbmQKPiBTZW50OiBOb3ZlbWJlciAxNCwgMjAxOCBhdCA5OjE2OjU4IFBNIEdNVAo+PiBTdWJq
ZWN0OiBbUEFUQ0ggUkZDIDAvNl0gbW0va2R1bXA6IGFsbG93IHRvIGV4Y2x1ZGUgcGFnZXMgdGhh
dCBhcmUgbG9naWNhbGx5IG9mZmxpbmUKPj4KPj4KPj4gUmlnaHQgbm93LCBwYWdlcyBpbmZsYXRl
ZCBhcyBwYXJ0IG9mIGEgYmFsbG9vbiBkcml2ZXIgd2lsbCBiZSBkdW1wZWQKPj4gYnkgZHVtcCB0
b29scyBsaWtlIG1ha2VkdW1wZmlsZS4gV2hpbGUgWEVOIGlzIGFibGUgdG8gY2hlY2sgaW4gdGhl
Cj4+IGNyYXNoIGtlcm5lbCB3aGV0aGVyIGEgY2VydGFpbiBwZm4gaXMgYWN0dWFsbCBiYWNrZWQg
YnkgbWVtb3J5IGluIHRoZQo+PiBoeXBlcnZpc29yIChzZWUgeGVuX29sZG1lbV9wZm5faXNfcmFt
KSBhbmQgb3B0aW1pemUgdGhpcyBjYXNlLCBkdW1wcyBvZgo+PiB2aXJ0aW8tYmFsbG9vbiBhbmQg
aHYtYmFsbG9vbiBpbmZsYXRlZCBtZW1vcnkgd2lsbCBlc3NlbnRpYWxseSByZXN1bHQgaW4KPj4g
emVybyBwYWdlcyBnZXR0aW5nIGFsbG9jYXRlZCBieSB0aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGR1
bXAgZ2V0dGluZwo+PiBmaWxsZWQgd2l0aCB0aGlzIGRhdGEuCj4gCj4gSXMgdGhlcmUgYW55IHJl
YXNvbiB0aGF0IFZNd2FyZSBiYWxsb29uIGRyaXZlciBpcyBub3QgbWVudGlvbmVkPwoKRGVmaW5p
dGVseSAuLi4KCi4uLiBub3QgOykgLiBJIGhhdmVuJ3QgbG9va2VkIGF0IHZtd2FyZSdzIGJhbGxv
b24gZHJpdmVyIHlldCAoSSBvbmx5IHNhdwp0aGF0IHRoZXJlIHdhcyBxdWl0ZSBzb21lIGFjdGl2
aXR5IHJlY2VudGx5KS4gSSBndWVzcyBpdCBzaG91bGQgaGF2ZQpzaW1pbGFyIHByb2JsZW1zLiAo
SSBtZWFuIHJlYWRpbmcgYW5kIGR1bXBpbmcgZGF0YSBub2JvZHkgY2FyZXMgYWJvdXQgaXMKY2Vy
dGFpbmx5IG5vdCBkZXNpcmVkKQoKQ2FuIHlvdSBzaGFyZSBpZiBzb21ldGhpbmcgbGlrZSB0aGlz
IGlzIGFsc28gZGVzaXJlZCBmb3Igdm13YXJlJ3MKaW1wbGVtZW50YXRpb24/IChJIHRhZ2dlZCB0
aGlzIGFzIFJGQyB0byBnZXQgc29tZSBtb3JlIGZlZWRiYWNrKQoKSXQgc2hvdWxkIGluIHRoZW9y
eSBiZSBhcyBzaW1wbGUgYXMgYWRkaW5nIGEgaGFuZGZ1bCBvZgpfU2V0UGFnZU9mZmxpbmUoKS9f
Q2xlYXJQYWdlT2ZmbGluZSgpIGF0IHRoZSByaWdodCBzcG90cy4KCi0tIAoKVGhhbmtzLAoKRGF2
aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
