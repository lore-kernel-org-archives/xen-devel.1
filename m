From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xl: remove apic option for PVH guests
Date: Thu, 1 Mar 2018 16:01:23 +0000
Message-ID: <20180301160123.b5psgx5pjkvxkprh@citrix.com>
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <20180301122205.bopopnky7n55zdmo@citrix.com>
 <7cb0df11-35a4-86fc-b475-e8a8c71102e7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rbbq=fx=citrix.com=prvs=5917dc0a2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1erQf1-0007o9-D2
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 16:02:23 +0000
Content-Disposition: inline
In-Reply-To: <7cb0df11-35a4-86fc-b475-e8a8c71102e7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDEsIDIwMTggYXQgMDM6NTc6MThQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMS8wMy8xOCAxMjoyMiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgRmVi
IDI4LCAyMDE4IGF0IDEwOjIwOjUzQU0gKzAwMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+
PiBYU0EtMjU2IGZvcmNlcyB0aGUgbG9jYWwgQVBJQyB0byBhbHdheXMgYmUgZW5hYmxlZCBmb3Ig
UFZIIGd1ZXN0cywgc28KPiA+PiBpZ25vcmUgYW55IGFwaWMgb3B0aW9uIGZvciBQVkggZ3Vlc3Rz
LiBVcGRhdGUgdGhlIGRvY3VtZW50YXRpb24KPiA+PiBhY2NvcmRpbmdseS4KPiA+IEkgdGhpbmsg
aG93IEkgd2lsbCBhcHByb2FjaCB0aGlzIGlzIHRvIGRpY3RhdGUgdGhhdCBQVkggYWx3YXlzIGhh
cyBMQVBJQwo+ID4gaW4gb3VyIGluLXRyZWUgZG9jdW1lbnQsIHRoZW4gdXNlIHRoYXQgYXMgdGhl
IGp1c3RpZmljYXRpb24gZm9yIHRoaXMKPiA+IGNoYW5nZS4gVGhhdCdzIHRoZSBjb25zZW5zdXMg
ZnJvbSAyIHllYXJzIGFnbywgcmlnaHQ/Cj4gPgo+ID4gT3Igd2UncmUganVzdCB3b3JraW5nIGFy
b3VuZCB0aGUgbGltaXRhdGlvbiBpbiBvdXIgY29kZSBiYXNlLCBhbmQgdXNlcnMKPiA+IG1heSBk
ZW1hbmQgYSBuby1MQVBJQyBQVkggZ3Vlc3QganVzdCBiZWNhdXNlLi4uCj4gCj4gQ3VycmVudGx5
LCBYZW4gZW5mb3JjZXMgdGhhdCBIVk0gZ3Vlc3RzIGhhdmUgYW4gTEFQSUMuwqAgVGhpcyBpcyBi
ZWNhdXNlCj4gbWFraW5nIHRoZSBub24tTEFQSUMgY2FzZSBmdW5jdGlvbiBjb3JyZWN0bHkvc2Fm
ZWx5IGRldm9sdmVkIGludG8gYQo+IG1hc3NpdmUgcmF0cyBuZXN0IGFuZCBJIHN0b3BwZWQgdHJ5
aW5nIHRvIGZpeCBpdCBhZnRlciAyIGRheXMgb2YgdHJ5aW5nLgo+IAo+IEF0IHRoZSBtb21lbnQs
IGl0IHdvdWxkIGJlIHdpc2UgdG8gZGlzY3VzcyB3aGV0aGVyIHRoZSBub24tTEFQSUMgY2FzZSBp
cwo+IGFjdHVhbGx5IHNlbnNpYmxlLsKgIEkgcGVyc29uYWxseSBzZWUgbm8gdmFsdWUgaW4ga2Vl
cGluZyBpdC4KPiAKCisxCgo+IElmIHNvbWVvbmUgY2FuIGNvbWUgdXAgd2l0aCBhIGNvbnZpbmNp
bmcgdXNlY2FzZSBmb3Iga2VlcGluZyBpdCwgdGhlbgo+IG9rLCBidXQgdGhlIGJhcnJpZXIgZm9y
IHRoaXMgaXMgaW5jcmVhc2luZyBhbGwgdGhlIHRpbWUsIGVzcGVjaWFsbHkgbm93Cj4gdGhhdCBo
YXJkd2FyZSBhY2NlbGVyYXRpb24gYW5kIHBvc3RlZCBpbnRlcnJ1cHRzIG1lYW5zIHRoYXQgYQo+
IHBpcGVsaW5lLXZpcnR1YWxpc2VkIEFQSUMgaXMgZmFzdGVyIGFuZCBtb3JlIGVmZmljaWVudCB0
aGFuIGFueSBvZiBvdXIKPiBldmVudCBjaGFubmVsIG1lY2hhbmlzbXMuCgorMQoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
