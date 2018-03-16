From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/4] stricter ioreq server permissions checks
Date: Fri, 16 Mar 2018 16:58:53 +0000
Message-ID: <20180316165857.7112-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xurk=gg=citrix.com=prvs=606d9f1fe=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ewsh8-0006c1-M4
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 16:59:06 +0000
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

VGhpcyBzZXJpZXMgdGlnaHRlbnMgdXAgcGVybWlzc2lvbnMgY2hlY2tpbmcgb24gaW9yZXEgc2Vy
dmVyIGNvbnRyb2wgcGxhbmUKb3BlcmF0aW9ucy4KClBhdWwgRHVycmFudCAoNCk6CiAgeDg2L2h2
bTogc3RvcCBwYXNzaW5nIGV4cGxpY2l0IGRvbWlkIHRvIGh2bV9jcmVhdGVfaW9yZXFfc2VydmVy
KCkKICB4ODYvaHZtOiB0YWtlIGEgcmVmZXJlbmNlIG9uIGlvcmVxIHNlcnZlciBlbXVsYXRpbmcg
ZG9tYWluCiAgeDg2L2h2bTogcmUtc3RydWN0dXJlIHNvbWUgb2YgdGhlIGlvcmVxIHNlcnZlciBs
b29rLXVwIGxvb3BzCiAgeDg2L2h2bTogYWRkIHN0cmljdGVyIHBlcm1pc3Npb25zIGNoZWNrcyB0
byBpb3JlcSBzZXJ2ZXIgY29udHJvbCBwbGFuZQoKIHhlbi9hcmNoL3g4Ni9odm0vZG0uYyAgICAg
ICAgICAgIHwgICA1ICstCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICB8ICAxMSAr
LQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAgICAgICAgfCAyMzcgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4u
aCB8ICAgNCArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCAgfCAgIDcgKy0KIDUg
ZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDE1NiBkZWxldGlvbnMoLSkKCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
