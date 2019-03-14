From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 0/4] clean up MSR save/restore code
Date: Thu, 14 Mar 2019 13:01:07 +0000
Message-ID: <20190314130111.32603-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4L16=RR=citrix.com=prvs=9699b3d2b=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h4Pzq-00020J-17
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:02:06 +0000
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
bS9odm0uYyAgICAgICAgIHwgNTggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDc1ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIHhlbi9hcmNoL3g4Ni9tc3IuYyAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysr
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCAgfCAgOCArLS0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92Y3B1LmggfCAgMSAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L21zci5oICAgICAg
fCAgNSArKysKIDcgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9u
cygtKQotLS0KdjI6CiAtIERyb3AgcGF0Y2hlcyAjMiBhbmQgIzYgb2YgdGhlIHYxIHNlcmllcwoK
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBp
bnRlbC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6ICJSb2dl
ciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
