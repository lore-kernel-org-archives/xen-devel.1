From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Thu, 15 Mar 2018 16:39:25 +0000
Message-ID: <a006c937-2bcd-8bbb-fd87-4627bdfd267f@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-9-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAwNjoyMCBQTSwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBUaGUgZnVuY3Rpb24g
cG9wdWxhdGVfcHRfcmFuZ2UgaXMgdXNlZCB0byBwb3B1bGF0ZSBpbiBhZHZhbmNlIHRoZQo+IHBh
Z2UtdGFibGUgYnV0IGl0IHdpbGwgbm90IGRvIHRoZSBhY3R1YWwgbWFwcGluZy4gU28gcGFzc2lu
ZyB0aGUgTUZOIGluCj4gcGFyYW1ldGVyIGlzIHBvaW50bGVzcy4gTm90ZSB0aGF0IHRoZSBvbmx5
IGNhbGxlciBwYXNzIDAuLi4KPiAKPiBBdCB0aGUgc2FtZSB0aW1lIHJlcGxhY2UgMCBieSBJTlZB
TElEX01GTnMuIFdoaWxlIHRoaXMgZG9lcyBub3QgbWF0dGVyCj4gYXMgdGhlIGVudHJ5IHdpbGwg
bWFya2VkIGFzIG5vdCB2YWxpZCBhbmQgcG9wdWxhdGVkLCBJTlZBTElEX01GTgo+IGhlbHBzIHRo
ZSByZWFkZXIgdG8ga25vdyB0aGUgTUZOIGlzIGludmFsaWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
