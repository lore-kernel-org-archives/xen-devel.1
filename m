From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 3/6] vpt: convert periodic_time fields to bool
Date: Fri, 8 Jun 2018 17:07:54 +0200
Message-ID: <20180608150758.25307-4-roger.pau@citrix.com>
References: <20180608150758.25307-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0yj=i2=citrix.com=prvs=690ca12ba=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fRIzv-00011D-NM
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 15:08:15 +0000
In-Reply-To: <20180608150758.25307-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92cHQuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCmlu
ZGV4IDBlYjVmZjYzMmUuLmY2OTNjMGJjZjEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL3ZwdC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCkBAIC0zNywx
MSArMzcsMTEgQEAgdHlwZWRlZiB2b2lkIHRpbWVfY2Ioc3RydWN0IHZjcHUgKnYsIHZvaWQgKm9w
YXF1ZSk7CiAKIHN0cnVjdCBwZXJpb2RpY190aW1lIHsKICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxp
c3Q7Ci0gICAgYm9vbF90IG9uX2xpc3Q7Ci0gICAgYm9vbF90IG9uZV9zaG90OwotICAgIGJvb2xf
dCBkb19ub3RfZnJlZXplOwotICAgIGJvb2xfdCBpcnFfaXNzdWVkOwotICAgIGJvb2xfdCB3YXJu
ZWRfdGltZW91dF90b29fc2hvcnQ7CisgICAgYm9vbCBvbl9saXN0OworICAgIGJvb2wgb25lX3No
b3Q7CisgICAgYm9vbCBkb19ub3RfZnJlZXplOworICAgIGJvb2wgaXJxX2lzc3VlZDsKKyAgICBi
b29sIHdhcm5lZF90aW1lb3V0X3Rvb19zaG9ydDsKICNkZWZpbmUgUFRTUkNfaXNhICAgIDEgLyog
SVNBIHRpbWUgc291cmNlICovCiAjZGVmaW5lIFBUU1JDX2xhcGljICAyIC8qIExBUElDIHRpbWUg
c291cmNlICovCiAjZGVmaW5lIFBUU1JDX2lvYXBpYyAzIC8qIElPQVBJQyB0aW1lIHNvdXJjZSAq
LwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
