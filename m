From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v9 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Fri, 14 Sep 2018 02:30:15 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191303261@SHSMSX101.ccr.corp.intel.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gyat=l4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0ds9-0002yh-RV
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 02:30:17 +0000
In-Reply-To: <20180913152128.6114-9-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEzLCAyMDE4IDExOjIxIFBNCj4gCj4gVGhpcyBwYXRj
aCBhZGRzIGEgbmV3IG1ldGhvZCB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbiB0byBm
aW5kCj4gdGhlCj4gTUZOIGN1cnJlbnRseSBtYXBwZWQgYnkgdGhlIHNwZWNpZmllZCBERk4gYWxv
bmcgd2l0aCBhIHdyYXBwZXIgZnVuY3Rpb24KPiBpbiBnZW5lcmljIElPTU1VIGNvZGUgdG8gY2Fs
bCB0aGUgaW1wbGVtZW50YXRpb24gaWYgaXQgZXhpc3RzLgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2gg
b25seSBhZGRzIGEgWGVuLWludGVybmFsIGludGVyZmFjZS4gVGhpcyB3aWxsIGJlIHVzZWQgYnkK
PiAgICAgICBhIHN1YnNlcXVlbnQgcGF0Y2guCj4gICAgICAgQW5vdGhlciBzdWJzZXF1ZW50IHBh
dGNoIHdpbGwgYWRkIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBmb3IgQU1ECj4gICAgICAgSU9NTVVz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
