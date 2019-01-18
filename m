From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Fri, 18 Jan 2019 17:40:39 +0000
Message-ID: <7c75ca26-d297-2ca4-3c5c-79e2d0106ec0@citrix.com>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lx82=P2=citrix.com=prvs=914ba968d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gkY8K-0000A2-5F
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 17:40:44 +0000
In-Reply-To: <20190118160328.10455-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMjAxOSAxNjowMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gaW5kZXgg
Y2RjODAyMWNiZC4uODJmYjg2YzdmZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9t
bXUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gQEAgLTExMSwxNyArMTExLDE3
IEBAIGVudW0KPiAgI2RlZmluZSBJT01NVV9GTFVTSEZfbW9kaWZpZWQgKDF1IDw8IF9JT01NVV9G
TFVTSEZfbW9kaWZpZWQpCj4gIAo+ICBpbnQgX19tdXN0X2NoZWNrIGlvbW11X21hcChzdHJ1Y3Qg
ZG9tYWluICpkLCBkZm5fdCBkZm4sIG1mbl90IG1mbiwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIsIHVuc2lnbmVkIGludCBmbGFncywKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhZ2VfY291bnQsIHVuc2lnbmVk
IGludCBmbGFncywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpm
bHVzaF9mbGFncyk7CgpJJ2QgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gbWFrZSBwYWdlX2NvdW50
IGFuIHVuc2lnbmVkIGxvbmcsIGFzIHdlIGNhbgpub3cgc2Vuc2libHkgaXNzdWUgYSBzaW5nbGUg
Y2FsbCBmb3IgYW4gZW50aXJlIEJBUiwgYW5kIHNvbWUgZ3JhcGhpY3MKY2FyZCBCQVJzIGFyZSBn
ZXR0aW5nIHRvIGJlIGEgbHVkaWNyb3VzIHNpemUuCgpPdGhlcndpc2UsIExHVE0gYW5kIGNhbiBh
bHNvIGJlIGZpeGVkIG9uIGNvbW1pdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
