From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/7] amd-iommu: cleanup and add lookup_page
 method
Date: Thu, 20 Sep 2018 15:11:42 +0100
Message-ID: <20180920141149.1643-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vqbt=mc=citrix.com=prvs=7948b9fa5=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g2zj5-0004fB-AW
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:14:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGFpbSBvZiB0aGlzIHNlcmllcyBpcyB0byBhZGQgYSBsb29rdXBfcGFnZSBtZXRob2QgZm9y
IEFNRCBJT01NVQphbmFsb2dvdXMgdG8gdGhhdCByZWNlbnRseSBhZGRlZCBmb3IgVlQtZC4gVGhh
dCBpcyBkb25lIGJ5IHRoZSBsYXN0CnBhdGNoLiBUaGUgZmlyc3QgZml2ZSBwYXRjaGVzIGFyZSBj
bGVhbnVwIG9mIHRoZSBBTUQgSU9NTVUgY29kZSwgYW5kCnBhdGNoIHNpeCBtb2RpZmllcyB0aGUg
VlQtZCBjb2RlIHRvIHJlbW92ZSBhIHNlbWFudGljIHByb2JsZW0uCgpQYXVsIER1cnJhbnQgKDcp
OgogIGFtZC1pb21tdTogZG9uJ3QgZG9tYWluX2NyYXNoKCkgaW5zaWRlIG1hcC91bm1hcF9wYWdl
KCkKICBhbWQtaW9tbXU6IHJlLW5hbWUgdTgvMTYvMzIvNjQgdG8gdWludDgvMTYvMzIvNjRfdAog
IGFtZC1pb21tdTogY29udmVydCBhbGwgYm9vbF90IHRvIGJvb2wKICBhbWQtaW9tbXU6IHJlZHVj
ZSBjb2RlIGR1cGxpY2F0aW9uLi4uCiAgYW1kLWlvbW11OiBpbnRyb2R1Y2UgbmV3IGdldC9zZXRf
aW9tbXVfcGRlX2luZm8oKSBmdW5jdGlvbnMuLi4KICB2dGQ6IGNoYW5nZSBsb29rdXBfcGFnZSBm
YWlsdXJlIHNlbWFudGljcwogIGFtZC1pb21tdTogYWRkIGxvb2t1cF9wYWdlIG1ldGhvZCB0byBp
b21tdV9vcHMKCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMgICAgICAg
fCA1NTEgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9wY2lfYW1kX2lvbW11LmMgICB8ICAgMSArCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvaW9tbXUuYyAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2
bS9hbWQtaW9tbXUtcHJvdG8uaCB8ICAgMiArCiA0IGZpbGVzIGNoYW5nZWQsIDMxNyBpbnNlcnRp
b25zKCspLCAyNDIgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgpD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+CkNjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlr
dWxwYW5pdEBhbWQuY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
