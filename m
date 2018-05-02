From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH RFC 07/10] passthrough/amd: split out hvm
 code from iommu_map.c
Date: Wed, 2 May 2018 12:32:04 -0500
Message-ID: <2e9999a2-78b4-fc4a-ae02-69bb381bf3dd@amd.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fezt=hv=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1fDvc0-0003iy-Cv
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 17:32:16 +0000
In-Reply-To: <20180221214701.1646-8-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2VpLAoKT24gMi8yMS8xOCAzOjQ2IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE1vdmUgYW5kIHJlbmFt
ZSB1cGRhdGVfcGFnaW5nX21vZGUuIENyZWF0ZSBhIGxvY2FsIGhlYWRlciBmaWxlIGZvcgo+IHRo
aXMgYW5kIG90aGVyIGZ1bmN0aW9ucyB0aGF0IG5lZWQgZXhwb3J0aW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXU8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogU3VyYXZlZSBT
dXRoaWt1bHBhbml0PHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IC0tLQo+ICAgeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2FtZC9NYWtlZmlsZSAgICB8ICAgMSArCj4gICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvYW1kL2h2bS5jICAgICAgIHwgMTA4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9hbWQvaW9t
bXUuaCAgICAgfCAgMzIgKysrKysrKysrCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
YW1kL2lvbW11X21hcC5jIHwgMTAzICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICA0IGZp
bGVzIGNoYW5nZWQsIDE0OCBpbnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvYW1kL2h2bS5jCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2FtZC9pb21tdS5o
CgpJIGFtIHN0aWxsIG5vdCBzdXJlIHdoeSB0aGUgdXBkYXRlX3BhZ2luZ19tb2RlIG5lZWQgdG8g
YmUgbW92ZWQgb3V0IG9mIGlvbW11X21hcC5jLgpDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8K
ClRoYW5rcywKU3VyYXZlZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
