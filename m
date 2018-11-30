From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] iommu improvements
Date: Fri, 30 Nov 2018 10:45:16 +0000
Message-ID: <20181130104518.39981-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yj6f=OJ=citrix.com=prvs=865b20271=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gSgJf-0001Sl-DZ
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 10:46:35 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF1bCBEdXJyYW50ICgyKToKICBhbWQtaW9tbXU6IGFkZCBmbHVzaCBpb21tdV9vcHMKICBpb21t
dTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRlciBtYXAvdW5tYXAgb3BlcmF0aW9ucwoK
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyAgICAgICB8IDExNCArKysr
KysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9h
bWRfaW9tbXUuYyAgIHwgICAyICsKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMg
ICAgICAgICAgICB8ICAxMyArKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAg
ICAgICAgICAgICB8ICAzMSArKysrKystCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuYyAgICAgICAgICAgfCAgMjYgKysrLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
aW9tbXUuYyAgICAgICAgICAgfCAgMTUgKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Zt
L2FtZC1pb21tdS1wcm90by5oIHwgICA3ICstCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTggKysrLQogOCBmaWxlcyBjaGFuZ2VkLCAxNzUgaW5zZXJ0
aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
