From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Thu, 15 Mar 2018 11:08:12 +0000
Message-ID: <20180315110812.za6zjwz74f27xvrw@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180314182009.14274-9-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDY6MjA6MDFQTSArMDAwMCwganVsaWVuLmdyYWxsQGFy
bS5jb20gd3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
PiAKPiBUaGUgZnVuY3Rpb24gcG9wdWxhdGVfcHRfcmFuZ2UgaXMgdXNlZCB0byBwb3B1bGF0ZSBp
biBhZHZhbmNlIHRoZQo+IHBhZ2UtdGFibGUgYnV0IGl0IHdpbGwgbm90IGRvIHRoZSBhY3R1YWwg
bWFwcGluZy4gU28gcGFzc2luZyB0aGUgTUZOIGluCj4gcGFyYW1ldGVyIGlzIHBvaW50bGVzcy4g
Tm90ZSB0aGF0IHRoZSBvbmx5IGNhbGxlciBwYXNzIDAuLi4KPiAKPiBBdCB0aGUgc2FtZSB0aW1l
IHJlcGxhY2UgMCBieSBJTlZBTElEX01GTnMuIFdoaWxlIHRoaXMgZG9lcyBub3QgbWF0dGVyCj4g
YXMgdGhlIGVudHJ5IHdpbGwgbWFya2VkIGFzIG5vdCB2YWxpZCBhbmQgcG9wdWxhdGVkLCBJTlZB
TElEX01GTgo+IGhlbHBzIHRoZSByZWFkZXIgdG8ga25vdyB0aGUgTUZOIGlzIGludmFsaWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
