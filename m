From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/4] clean up MSR save/restore code
Date: Mon, 11 Mar 2019 18:09:07 +0000
Message-ID: <20190311180911.2108-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3PMT-0002Th-Dz
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:09:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF1bCBEdXJyYW50ICg0KToKICB4ODY6IHN0b3AgaGFuZGxpbmcgTVNSX0lBMzJfQk5EQ0ZHUyBz
YXZlL3Jlc3RvcmUgaW4gaW1wbGVtZW50YXRpb24KICAgIGNvZGUKICB4ODY6IG1vdmUgdGhlIHNh
dmVkIHZhbHVlIG9mIE1TUl9JQTMyX1hTUyBpbnRvIHN0cnVjdCB2Y3B1X21zcnMKICB4ODY6IHN0
b3AgaGFuZGxpbmcgTVNSX0lBMzJfWFNTIHNhdmUvcmVzdG9yZSBpbiBpbXBsZW1lbnRhdGlvbiBj
b2RlCiAgeDg2OiByZW1vdmUgZGVmdW5jdCBpbml0L2xvYWQvc2F2ZV9tc3IoKSBodm1fZnVuY3MK
CiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2
bS9odm0uYyAgICAgICAgIHwgNTggKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDY4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tc3IuYyAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysr
KysrKystCiB4ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMgfCAgMiArLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vaHZtLmggIHwgIDQgLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3Zj
cHUuaCB8ICAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmggICAgICB8ICA3ICsrKy0KIDgg
ZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygtKQotLS0KdjI6
CiAtIERyb3AgcGF0Y2hlcyAjMiBhbmQgIzYgb2YgdGhlIHYxIHNlcmllcwoKQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNj
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOp
IiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
