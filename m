From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH RFC 0/6] mm/kdump: allow to exclude pages
 that are logically offline
Date: Wed, 14 Nov 2018 22:57:51 +0000
Message-ID: <8932E1F4-A5A9-4462-9800-CAC1EF85AC5D__5794.25247055969$1542262010$gmane$org@vmware.com>
References: <20181114211704.6381-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kztb=nz=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1gN46h-0004Kq-Ej
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 22:57:59 +0000
In-Reply-To: <20181114211704.6381-1-david@redhat.com>
Content-Language: en-US
Content-ID: <8127D4BDFD768A4B9EE74019E7FFB6E1@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Dave Young <dyoung@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Haiyang
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRGF2aWQgSGlsZGVuYnJhbmQKU2VudDogTm92ZW1iZXIgMTQsIDIwMTggYXQgOToxNjo1
OCBQTSBHTVQKPiBTdWJqZWN0OiBbUEFUQ0ggUkZDIDAvNl0gbW0va2R1bXA6IGFsbG93IHRvIGV4
Y2x1ZGUgcGFnZXMgdGhhdCBhcmUgbG9naWNhbGx5IG9mZmxpbmUKPiAKPiAKPiBSaWdodCBub3cs
IHBhZ2VzIGluZmxhdGVkIGFzIHBhcnQgb2YgYSBiYWxsb29uIGRyaXZlciB3aWxsIGJlIGR1bXBl
ZAo+IGJ5IGR1bXAgdG9vbHMgbGlrZSBtYWtlZHVtcGZpbGUuIFdoaWxlIFhFTiBpcyBhYmxlIHRv
IGNoZWNrIGluIHRoZQo+IGNyYXNoIGtlcm5lbCB3aGV0aGVyIGEgY2VydGFpbiBwZm4gaXMgYWN0
dWFsbCBiYWNrZWQgYnkgbWVtb3J5IGluIHRoZQo+IGh5cGVydmlzb3IgKHNlZSB4ZW5fb2xkbWVt
X3Bmbl9pc19yYW0pIGFuZCBvcHRpbWl6ZSB0aGlzIGNhc2UsIGR1bXBzIG9mCj4gdmlydGlvLWJh
bGxvb24gYW5kIGh2LWJhbGxvb24gaW5mbGF0ZWQgbWVtb3J5IHdpbGwgZXNzZW50aWFsbHkgcmVz
dWx0IGluCj4gemVybyBwYWdlcyBnZXR0aW5nIGFsbG9jYXRlZCBieSB0aGUgaHlwZXJ2aXNvciBh
bmQgdGhlIGR1bXAgZ2V0dGluZwo+IGZpbGxlZCB3aXRoIHRoaXMgZGF0YS4KCklzIHRoZXJlIGFu
eSByZWFzb24gdGhhdCBWTXdhcmUgYmFsbG9vbiBkcml2ZXIgaXMgbm90IG1lbnRpb25lZD8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
