From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 8 Oct 2018 12:14:45 +0200
Message-ID: <20181008101445.38735-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/pwx=mu=citrix.com=prvs=812c9b64b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9SZg-0003Nk-Tq
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:15:40 +0000
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

Q29tbWl0IDI5MTY5NTFjMSBjaGFuZ2VkIHRoZSBjaGVjayBpbiBpb21tdV9zaGFyZV9wMm1fdGFi
bGUgdG8gdXNlCm5lZWRfaW9tbXUoZCkgaW5zdGVhZCBvZiBpb21tdV9lbmFibGVkLCB3aGljaCBi
cm9rZSB0aGUgY2hlY2sgYmVjYXVzZQphdCB0aGUgcG9pbnQgaW4gZG9tYWluIGNvbnN0cnVjdGlv
biB3aGVyZSBpb21tdV9zaGFyZV9wMm1fdGFibGUgaXMKY2FsbGVkIG5lZWRfaW9tbXUoZCkgd2ls
bCBhbHdheXMgcmV0dXJuIGZhbHNlLgoKRml4IHRoaXMgYnkgcmV2ZXJ0aW5nIHRvIHRoZSBwcmV2
aW91cyBsb2dpYy4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmluZGV4IGRlYmI1ZTZmZTEuLmE5
NDA4ZjFkZTkgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtNTA1LDcgKzUwNSw3IEBAIGlu
dCBpb21tdV9kb19kb21jdGwoCiAKIHZvaWQgaW9tbXVfc2hhcmVfcDJtX3RhYmxlKHN0cnVjdCBk
b21haW4qIGQpCiB7Ci0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKKyAgICBpZiAoIGlv
bW11X2VuYWJsZWQgJiYgaGFwX2VuYWJsZWQoZCkgJiYgaW9tbXVfaGFwX3B0X3NoYXJlICkKICAg
ICAgICAgaW9tbXVfZ2V0X29wcygpLT5zaGFyZV9wMm0oZCk7CiB9CiAKLS0gCjIuMTkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
