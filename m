From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] amd-iommu: use bitfields for PTE/PDE and DTE
Date: Mon, 4 Feb 2019 11:19:52 +0000
Message-ID: <20190204111954.11312-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/eIc=QL=citrix.com=prvs=931483abb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gqcIK-0003dF-Rv
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 11:20:08 +0000
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

UmVkdWNlIGNvZGUgc2l6ZSBieSB+MzAwIGxpbmVzLgoKUGF1bCBEdXJyYW50ICgyKToKICBhbWQt
aW9tbXU6IHVzZSBhIGJpdGZpZWxkIGZvciBQVEUvUERFCiAgYW1kLWlvbW11OiB1c2UgYSBiaXRm
aWVsZCBmb3IgRFRFCgogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMg
ICAgIHwgIDU1ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jICAg
ICAgIHwgMzM4ICsrKystLS0tLS0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYyAgIHwgMTAxICsrLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9hbWQt
aW9tbXUuaCAgICAgICAgICAgICAgIHwgICA1IC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2
bS9hbWQtaW9tbXUtZGVmcy5oICB8IDE2NyArKysrLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaCB8ICAzNSArLQogNiBmaWxlcyBjaGFuZ2VkLCAyMDEg
aW5zZXJ0aW9ucygrKSwgNTAwIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
