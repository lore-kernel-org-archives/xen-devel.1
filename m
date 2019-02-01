From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] xen/iommu: fix iommu_ops attribute
Date: Fri, 01 Feb 2019 08:44:57 -0700
Message-ID: <5C5469790200007800213345@prv1-mh.provo.novell.com>
References: <20190201151349.23532-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpb01-0007p5-Ud
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 15:45:01 +0000
In-Reply-To: <20190201151349.23532-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE5IGF0IDE2OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+IEBAIC01NzAsNyArNTcw
LDcgQEAgc3RhdGljIHZvaWQgYW1kX2R1bXBfcDJtX3RhYmxlKHN0cnVjdCBkb21haW4gKmQpCj4g
ICAgICBhbWRfZHVtcF9wMm1fdGFibGVfbGV2ZWwoaGQtPmFyY2gucm9vdF90YWJsZSwgaGQtPmFy
Y2gucGFnaW5nX21vZGUsIDAsIDApOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGlv
bW11X29wcyBfX2luaXRjb25zdHJlbCBhbWRfaW9tbXVfb3BzID0gewo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGlvbW11X29wcyBhbWRfaW9tbXVfb3BzID0gewoKVGhpcyBvbmUncyBub3QgbmVlZGVk
IC0gdGhlcmUncyBvbmx5IGFuIF9faW5pdCBmdW5jdGlvbiByZWZlcmVuY2luZwp0aGlzIHN0cnVj
dHVyZS4KCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+IEBAIC0yNzA2LDcgKzI3MDYs
NyBAQCBzdGF0aWMgdm9pZCB2dGRfZHVtcF9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiAqZCkKPiAg
ICAgIHZ0ZF9kdW1wX3AybV90YWJsZV9sZXZlbChoZC0+YXJjaC5wZ2RfbWFkZHIsIGFnYXdfdG9f
bGV2ZWwoaGQtPmFyY2guYWdhdyksIDAsIDApOwo+ICB9Cj4gIAo+IC1jb25zdCBzdHJ1Y3QgaW9t
bXVfb3BzIF9faW5pdGNvbnN0cmVsIGludGVsX2lvbW11X29wcyA9IHsKPiArY29uc3Qgc3RydWN0
IGlvbW11X29wcyBpbnRlbF9pb21tdV9vcHMgPSB7CgpUaGlzIG9uZSdzIGluZGVlZCByZWZlcmVu
Y2VkIGJ5IGEgbm9uLV9faW5pdCBmdW5jdGlvbiwgYnV0IHRoZQpmaXggaXMgaW1vIHRvIGF2b2lk
IHRoYXQgcmVmZXJlbmNlIGZyb20gaW9tbXVfZW5hYmxlX3gyYXBpY19JUigpOgpXZSBzaG91bGQg
bm90IG92ZXJ3cml0ZSB0aGUgcHJldmlvdXNseSBlc3RhYmxpc2hlZCAoYW5kCnBvdGVudGlhbGx5
IHN1YnNlcXVlbnRseSBhZGp1c3RlZCkgaG9vayBwb2ludGVycy4gU28gSSB0aGluawp0aGUgYXNz
aWdubWVudCB3YW50cyB0byBnbyBpbiBhIHN5c3RlbV9zdGF0ZSBkZXBlbmRlbnQKY29uZGl0aW9u
YWwgKGFuZCB0aGVyZSBpcyBvbmUgYSBmZXcgbGluZXMgdXAsIHNvIGl0IGNvdWxkIG1vdmUKanVz
dCB0aGVyZSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
