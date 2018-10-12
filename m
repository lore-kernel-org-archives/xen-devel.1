From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH] amd-iommu: get rid of pointless
 IOMMU_PAGING_MODE_LEVEL_X definitions
Date: Fri, 12 Oct 2018 17:14:05 +0000
Message-ID: <20181012171402.GB22686@amd.com>
References: <20180927124601.24455-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jdua=my=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gB10r-0007wN-Kc
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 17:14:09 +0000
In-Reply-To: <20180927124601.24455-1-paul.durrant@citrix.com>
Content-Language: en-US
Content-ID: <1EE04F5F083FFC4DB26C40EEC374C53B@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMDE6NDY6MDFQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBsZXZlbHMgYXJlIGFic29sdXRlIG51bWJlcnMgc3VjaCB0aGF0IElPTU1VX1BB
R0lOR19NT0RFX0xFVkVMX1gKPiBldmFsdWF0ZXMgdG8gWCAoZm9yIHRoZSB2YWxpZCByYW5nZSBv
ZiAwIC0gNykgc28gc2ltcGx5IHVzZSBudW1iZXJzIGluCj4gdGhlIGNvZGUuCj4gCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBhbHNvIGFkZHMgZW1hY3MgYm9p
bGVycGxhdGUgdG8gYW1kLWlvbW11LWRlZnMuaAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpJcyB0aGVyZSBhIHN0cm9uZyByZWFzb24g
dG8gZ2V0IHJpZCBvZiB0aGVzZT8gIFNvbWUgb2YgZXhhbXBsZXMgYmVsb3cKY3JlYXRlIHNlZW1p
bmdseSBtYWdpYyBudW1iZXJzIGluIHRoZSBjb2RlLiAgV2hpbGUgaWYgeW91J3JlIGZhbWlsaWFy
CndpdGggdGhlIGZ1bmN0aW9ucyB0aGlzIGlzbid0IGEgYmlnIGRlYWwsIG90aGVyd2lzZSB5b3Ug
aGF2ZSB0byBkaWcKZnVydGhlciB0byB0ZWxsLgoKPiArICAgIHB0ZSA9IHRhYmxlICsgcGZuX3Rv
X3BkZV9pZHgoZ2ZuLCAxKTsKCj4gKyAgICBuZWVkX2ZsdXNoID0gc2V0X2lvbW11X3BkZV9wcmVz
ZW50KHBkZSwgbmV4dF9tZm4sIDAsIGl3LCBpcik7CgpJZiB0aGVyZSdzIGEgZ2VuZXJhbCBjb25z
ZW5zdXMgdGhhdCBnZXR0aW5nIHJpZCBvZiB0aGVzZSBpcyBiZXR0ZXIsIEkKZG9uJ3QgbWluZCBh
bmQgd2lsbCBhZ3JlZSB0byBpdC4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
