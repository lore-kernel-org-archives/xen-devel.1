From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 05/13] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Tue, 10 Jul 2018 17:49:58 +0100
Message-ID: <61d6f65e-df11-c45b-c03b-19924162e7cc@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxqp=j2=citrix.com=prvs=722797069=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fcvq0-0003rL-Av
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 16:50:04 +0000
In-Reply-To: <20180707110526.35822-6-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFR1cm4gaW9tbXVf
bWFwL3VubWFwX3BhZ2UoKSBpbnRvIHN0cmFpZ2h0Zm9yd2FyZCB3cmFwcGVycyB0aGF0IGNoZWNr
IHRoZQo+IGV4aXN0ZW5jZSBvZiB0aGUgcmVsZXZhbnQgaW9tbXVfb3AgYW5kIGNhbGwgdGhyb3Vn
aCB0byBpdC4gVGhpcyBtYWtlcyB0aGVtCj4gdXNhYmxlIGJ5IFBWIElPTU1VIGNvZGUgdG8gYmUg
ZGVsaXZlcmVkIGluIGZ1dHVyZSBwYXRjaGVzLgo+IExlYXZlIHRoZSBkZWNpc2lvbiBvbiB3aGV0
aGVyIHRvIGludm9rZSBkb21haW5fY3Jhc2goKSB1cCB0byB0aGUgY2FsbGVyLgo+IFRoaXMgaGFz
IHRoZSBhZGRlZCBiZW5lZml0IHRoYXQgdGhlIChtb2R1bGUvbGluZSBudW1iZXIpIG1lc3NhZ2Ug
dGhhdAo+IGRvbWFpbl9jcmFzaCgpIHNwaXRzIG91dCB3aWxsIGJlIG1vcmUgaW5kaWNhdGl2ZSBv
ZiB3aGVyZSB0aGUgcHJvYmxlbSBsaWVzLgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggaW5jbHVkZXMg
b25lIGJpdCBvZiBjbGVhbi11cCBpbiBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkKPiAgICAgICBy
ZXBsYWNpbmcgdXNlIG9mIHAybS0+ZG9tYWluIHdpdGggdGhlIGRvbWFpbiBwb2ludGVyIHBhc3Nl
ZCBpbnRvIHRoZQo+ICAgICAgIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpJIGhhdmUgc29tZSBtaW5vciByZXNlcnZh
dGlvbnMgYWJvdXQgdGhpcywgc2luY2UgaXQgY291bGQgbGVhdmUgb3BlbiB0aGUKcG9zc2liaWxp
dHkgdGhhdCBhIGZhaWxlZCBvcGVyYXRpb24gKmRvZXNuJ3QqIHJlc3VsdCBpbiBhIGRvbWFpbiBj
cmFzaAp3aGVuIGl0IHNob3VsZC4gIEJ1dCBhbGwgdGhlIGZ1bmN0aW9ucyBpbiBxdWVzdGlvbiBh
cmUgX19tdXN0X2NoZWNrLCBzbwp0aGUgcmlzayBvZiB0aGF0IHNvcnQgb2YgYnVnIGNyZWVwaW5n
IGluIGlzIHNpZ25pZmljYW50bHkgbG93ZXIuCgpTbzoKClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
