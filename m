From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Fri, 07 Dec 2018 04:49:52 -0700
Message-ID: <5C0A5E60020000780020406B@prv1-mh.provo.novell.com>
References: <20181206153427.35260-1-paul.durrant@citrix.com>
 <20181206153427.35260-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gVEdq-0006r8-DO
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 11:49:58 +0000
In-Reply-To: <20181206153427.35260-4-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjEyLjE4IGF0IDE2OjM0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBhbnkgaW1wbGljaXQgZmx1c2hpbmcgdGhhdCBvY2N1cnMg
aW4gdGhlIGltcGxlbWVudGF0aW9uCj4gb2YgbWFwIGFuZCB1bm1hcCBvcGVyYXRpb25zIGFuZCBh
ZGRzIG5ldyBpb21tdV9tYXAvdW5tYXAoKSB3cmFwcGVyCj4gZnVuY3Rpb25zLiBUbyBtYWludGFp
biBzZW1hdGljcyBvZiB0aGUgaW9tbXVfbGVnYWN5X21hcC91bm1hcCgpIHdyYXBwZXIKPiBmdW5j
dGlvbnMsIHRoZXNlIGFyZSBtb2RpZmllZCB0byBjYWxsIHRoZSBuZXcgd3JhcHBlciBmdW5jdGlv
bnMgYW5kIHRoZW4KPiBwZXJmb3JtIGFuIGV4cGxpY2l0IGZsdXNoIG9wZXJhdGlvbi4KPiAKPiBC
ZWNhdXNlIFZULWQgY3VycmVudGx5IHBlcmZvcm1zIHR3byBkaWZmZXJlbnQgdHlwZXMgb2YgZmx1
c2ggZGVwZW5kZW50IHVwb24KPiB3aGV0aGVyIGEgUFRFIGlzIGJlaW5nIG1vZGlmaWVkIHZlcnN1
cyBtZXJlbHkgYWRkZWQgKGkuZS4gcmVwbGFjaW5nIGEgbm9uLQo+IHByZXNlbnQgUFRFKSAnaW9t
bXUgZmx1c2ggZmxhZ3MnIGFyZSBkZWZpbmVkIGJ5IHRoaXMgcGF0Y2ggYW5kIHRoZQo+IGlvbW11
X29wcyBtYXBfcGFnZSgpIGFuZCB1bm1hcF9wYWdlKCkgbWV0aG9kcyBhcmUgbW9kaWZpZWQgdG8g
T1IgdGhlIHR5cGUKPiBvZiBmbHVzaCBuZWNlc3NhcnkgZm9yIHRoZSBQVEUgdGhhdCBoYXMgYmVl
biBwb3B1bGF0ZWQgb3IgZGVwb3B1bGF0ZWQgaW50bwo+IGFuIGFjY3VtdWxhdGVkIGZsYWdzIHZh
bHVlLiBUaGUgYWNjdW11bGF0ZWQgdmFsdWUgY2FuIHRoZW4gYmUgcGFzc2VkIGludG8KPiB0aGUg
ZXhwbGljaXQgZmx1c2ggb3BlcmF0aW9uLgo+IAo+IFRoZSBBUk0gU01NVSBpbXBsZW1lbnRhdGlv
bnMgb2YgbWFwX3BhZ2UoKSBhbmQgdW5tYXBfcGFnZSgpIGN1cnJlbnRseQo+IHBlcmZvcm0gbm8g
aW1wbGljaXQgZmx1c2hpbmcgYW5kIHRoZXJlZm9yZSB0aGUgbW9kaWZpZWQgbWV0aG9kcyBkbyBu
b3QKPiBhZGp1c3QgdGhlIGZsdXNoIGZsYWdzLgo+IAo+IE5PVEU6IFRoZSBwZXItY3B1ICdpb21t
dV9kb250X2ZsdXNoX2lvdGxiJyBpcyByZXNwZWN0ZWQgYnkgdGhlCj4gICAgICAgaW9tbXVfbGVn
YWN5X21hcC91bm1hcCgpIHdyYXBwZXIgZnVuY3Rpb25zIGFuZCB0aGVyZWZvcmUgdGhpcyBub3cK
PiAgICAgICBhcHBsaWVzIHRvIGFsbCBJT01NVSBpbXBsZW1lbnRhdGlvbnMgcmF0aGVyIHRoYW4g
anVzdCBWVC1kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
