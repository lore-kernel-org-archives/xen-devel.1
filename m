From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement
 XSDT support for RSDP
Date: Wed, 21 Nov 2018 15:42:11 +0100
Message-ID: <20181121144211.GE4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-6-sameo@linux.intel.com>
 <20181108151623.4de26ecb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uxgw=oa=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gPTiM-00045p-1z
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 14:42:50 +0000
Content-Disposition: inline
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

SGkgSWdvciwKCk9uIFRodSwgTm92IDA4LCAyMDE4IGF0IDAzOjE2OjIzUE0gKzAxMDAsIElnb3Ig
TWFtbWVkb3Ygd3JvdGU6Cj4gT24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDoyOCArMDEwMAo+IFNh
bXVlbCBPcnRpeiA8c2FtZW9AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IFhTRFQgaXMg
dGhlIDY0LWJpdCB2ZXJzaW9uIG9mIHRoZSBsZWdhY3kgQUNQSSBSU0RUIChSb290IFN5c3RlbQo+
ID4gRGVzY3JpcHRpb24gVGFibGUpLiBSU0RUIG9ubHkgYWxsb3cgZm9yIDMyLWJpdCBhZGRyZXNz
c2VzIGFuZCBoYXZlIHRodXMKPiA+IGJlZW4gZGVwcmVjYXRlZC4gU2luY2UgQUNQSSB2ZXJzaW9u
IDIuMCwgUlNEUHMgc2hvdWxkIHBvaW50IGF0IFhTRFRzIGFuZAo+ID4gbm8gbG9uZ2VyIFJTRFRz
LCBhbHRob3VnaCBSU0RUcyBhcmUgc3RpbGwgc3VwcG9ydGVkIGZvciBiYWNrd2FyZAo+ID4gY29t
cGF0aWJpbGl0eS4KPiA+IAo+ID4gU2luY2UgdmVyc2lvbiAyLjAsIFJTRFBzIHNob3VsZCBhZGQg
YW4gZXh0ZW5kZWQgY2hlY2tzdW0sIGEgY29tcGxldGUgdGFibGUKPiA+IGxlbmd0aCBhbmQgYSB2
ZXJzaW9uIGZpZWxkIHRvIHRoZSB0YWJsZS4KPiAKPiBUaGlzIHBhdGNoIHJlLWltcGxlbWVudHMg
d2hhdCBhcm0vdmlydCBib2FyZCBhbHJlYWR5IGRvZXMKPiBhbmQgZml4ZXMgY2hlY2tzdW0gYnVn
IGluIHRoZSBsYXRlciBhbmQgYXQgdGhlIHNhbWUgdGltZQo+IHdpdGhvdXQgYSB1c2VyICh3aXRo
aW4gdGhlIHBhdGNoKS4KPiAKPiBJJ2Qgc3VnZ2VzdCByZWRvIGl0IGEgd2F5IHNpbWlsYXIgdG8g
RkFEVCByZWZhY3RvcmluZwo+ICAgcGF0Y2ggMTogZml4IGNoZWNrc3VtIGJ1ZyBpbiB2aXJ0L2Fy
bQo+ICAgcGF0Y2ggMjogdXBkYXRlIHJlZmVyZW5jZSB0YWJsZXMgaW4gdGVzdAo+ICAgcGF0Y2gg
MzogaW50cm9kdWNlIEFjcGlSc2RwRGF0YSBzaW1pbGFyIHRvIGNvbW1pdCA5MzdkMWI1ODcKPiAg
ICAgICAgICAgICAgKGJvdGggYXJtIGFuZCB4ODYpIHdpY2ggc3RvcmVzIGFsbCBkYXRhIGluIGhv
cyBieXRlIG9yZGVyCj4gICBwYXRjaCA0OiBjb252ZXJ0IGFybSdzIGltcGwuIHRvIGJ1aWxkX2Fw
cGVuZF9pbnRfbm9wcmVmaXgoKSBBUEkgKGNvbW1pdCA1ZDdhMzM0ZjcpCj4KPiAgICAgICAgICAg
IC4uLiBtb3ZlIG91dCB0byBhbWwtYnVpbGQuYwo+ICAgcGF0Y2ggNTogcmV1c2UgZ2VuZXJhbGl6
ZWQgYXJtJ3MgYnVpbGRfcnNkcCgpIGZvciB4ODYsIGRyb3BwaW5nIHg4NiBzcGVjaWZpYyBvbmUK
PiAgICAgICBhbWVuZGluZyBpdCB0byBnZW5lcmF0ZSByZXYxIHZhcmlhbnQgZGVmaW5lZCBieSBy
ZXZpc2lvbiBpbiBBY3BpUnNkcERhdGEKPiAgICAgICAoY29tbWl0IGRkMWIyMDM3YSkKSSBhZ3Jl
ZSBwYXRjaGVzICMxLCAjMiBhbmQgIzUgbWFrZSBzZW5zZS4gMyBhbmQgNCBhcyB3ZWxsLCBidXQg
aGVyZQp5b3UncmUgYXNraW5nIGFib3V0IHNvbWV0aGluZyB0aGF0J3Mgb3V0IG9mIHNjb3BlIG9m
IHRoZSBjdXJyZW50IHNlcmllLgpJJ2xsIG1vdmUgdGhvc2UgcGF0Y2hlcyBmcm9tIHRoaXMgc2Vy
aWUgYW5kIGJ1aWxkIGEgNiBwYXRjaGVzIG5ldyBzZXJpZQphcyBzdWdnZXN0ZWQuCgpDaGVlcnMs
ClNhbXVlbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
