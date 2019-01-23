From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Wed, 23 Jan 2019 19:08:18 +0100
Message-ID: <20190123180818.78684-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vroR=P7=citrix.com=prvs=919cbf1eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gmMwy-0004cz-UO
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 18:08:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG9yZGVyIG9mIHRoZSBwYWdlX29yZGVyIGFuZCB0aGUgZmxhZ3MgcGFyYW1ldGVycyBhcmUg
aW52ZXJ0ZWQgaW4KdGhlIGNhbGwgdG8gaW9tbXVfbWFwIG1hZGUgaW4gaW9tbXVfaHdkb21faW5p
dC4KCkZpeGVzOiBlOGFmZTExMjRjYzEgKCJpb21tdTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hl
ciBvcmRlciBtYXAvdW5tYXAgb3BlcmF0aW9ucyIpClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0t
LQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmlu
ZGV4IDk4ZTZmYzM1ZTIuLmFjZDE3YWMyZGMgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAt
MjI2LDcgKzIyNiw3IEBAIHZvaWQgX19od2RvbV9pbml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWN0
IGRvbWFpbiAqZCkKICAgICAgICAgICAgICAgICAgID09IFBHVF93cml0YWJsZV9wYWdlKSApCiAg
ICAgICAgICAgICAgICAgbWFwcGluZyB8PSBJT01NVUZfd3JpdGFibGU7CiAKLSAgICAgICAgICAg
IHJldCA9IGlvbW11X21hcChkLCBfZGZuKGRmbiksIF9tZm4obWZuKSwgbWFwcGluZywgMCwKKyAg
ICAgICAgICAgIHJldCA9IGlvbW11X21hcChkLCBfZGZuKGRmbiksIF9tZm4obWZuKSwgMCwgbWFw
cGluZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZmx1c2hfZmxhZ3MpOwogCiAgICAg
ICAgICAgICBpZiAoICFyYyApCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
