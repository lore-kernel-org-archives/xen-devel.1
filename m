From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 06:06:35 -0700
Message-ID: <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2mkr=og=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRd4a-0003hI-Dj
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 13:06:40 +0000
In-Reply-To: <20181126173045.1274-1-paul.durrant@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDE4OjMwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBwYWdlIG1lcmdpbmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBiaXQg
NjMgb2YgYSBQVEUsIHdoaWNoIHVzZWQKPiB0byBiZSBzcGVjaWZpZWQgYXMgaWdub3JlZC4gSG93
ZXZlciwgYml0cyA1IGFuZCA2IGFyZSBub3cgc3BlY2lmaWVkIGFzCj4gJ2FjY2Vzc2VkJyBhbmQg
J2RpcnR5JyBiaXRzIGFuZCB0aGVpciB1c2Ugb25seSByZW1haW5zIHNhZmUgYXMgbG9uZyBhcwo+
IHRoZSBEVEUgJ0hvc3QgQWNjZXNzIERpcnR5JyBiaXRzIHJlbWFpbiBjbGVhci4KClVwb24gc2Vj
b25kIHRob3VnaHQgLSBpcyB0aGlzIGFjdHVhbGx5IHRydWUgd2l0aCB0aGUgWFNBLTI3NQpjaGFu
Z2VzIGluIHBsYWNlPyBBcyBsb25nIGFzIHRoZSBkb21haW4gaXMgbm90IHJ1bm5pbmcgeWV0LApo
b3cgd291bGQgQSBhbmQvb3IgRCBiaXRzIGdldCBzZXQ/Cgo+IEBAIC02OTgsNTUgKzU2OSwxNCBA
QCBpbnQgYW1kX2lvbW11X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZu
X3QgbWZuLAo+ICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICAgICAgfQo+ICAKPiAtICAgIC8q
IEluc3RhbGwgNGsgbWFwcGluZyBmaXJzdCAqLwo+ICsgICAgLyogSW5zdGFsbCA0ayBtYXBwaW5n
ICovCj4gICAgICBuZWVkX2ZsdXNoID0gc2V0X2lvbW11X3B0ZV9wcmVzZW50KHB0X21mblsxXSwg
ZGZuX3goZGZuKSwgbWZuX3gobWZuKSwgMSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgISEoZmxhZ3MgJiBJT01NVUZfd3JpdGFibGUpLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAhIShmbGFncyAmIElPTU1VRl9yZWFkYWJsZSkpOwo+
ICAKPiAgICAgIGlmICggbmVlZF9mbHVzaCApCj4gLSAgICB7Cj4gICAgICAgICAgYW1kX2lvbW11
X2ZsdXNoX3BhZ2VzKGQsIGRmbl94KGRmbiksIDApOwo+IC0gICAgICAgIC8qIE5vIGZ1cnRoZXIg
bWVyZ2luZywgYXMgdGhlIGxvZ2ljIGRvZXNuJ3QgY29wZS4gKi8KPiAtICAgICAgICBoZC0+YXJj
aC5ub19tZXJnZSA9IHRydWU7CgpCZXNpZGVzIHJlbW92aW5nIHRoZSB1c2VzIG9mIHRoaXMgZmll
bGQsIHdoaWNoIHdhcyBpbnRyb2R1Y2VkIGZvcgpYU0EtMjc1LCB5b3Ugc2hvdWxkIHRoZW4gYWxz
byByZW1vdmUgdGhlIGZpZWxkIGl0c2VsZiBJIHRoaW5rLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
