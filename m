From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 51/55] x86/pv: properly map and unmap page
 table in dom0_construct_pv
Date: Thu, 7 Feb 2019 16:44:52 +0000
Message-ID: <20190207164456.9260-52-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1x-0001rw-Dg
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:00:05 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvcHYvZG9tMF9idWlsZC5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvZG9t
MF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwppbmRleCAyOTNiZTA3NmQ5
Li5hMDdkMjEzOGEyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKQEAgLTY5MCw2ICs2OTAsOCBAQCBpbnQg
X19pbml0IGRvbTBfY29uc3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCiAKICAgICBpZiAoIGlz
X3B2XzMyYml0X2RvbWFpbihkKSApCiAgICAgeworICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydDsK
KwogICAgICAgICAvKiBFbnN1cmUgdGhlIGZpcnN0IGZvdXIgTDMgZW50cmllcyBhcmUgYWxsIHBv
cHVsYXRlZC4gKi8KICAgICAgICAgZm9yICggaSA9IDAsIGwzdGFiID0gbDNzdGFydDsgaSA8IDQ7
ICsraSwgKytsM3RhYiApCiAgICAgICAgIHsKQEAgLTcwNCw3ICs3MDYsOSBAQCBpbnQgX19pbml0
IGRvbTBfY29uc3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgbDNl
X2dldF9wYWdlKCpsM3RhYiktPnUuaW51c2UudHlwZV9pbmZvIHw9IFBHVF9wYWVfeGVuX2wyOwog
ICAgICAgICB9CiAKLSAgICAgICAgaW5pdF94ZW5fcGFlX2wyX3Nsb3RzKGwzZV90b19sMmUobDNz
dGFydFszXSksIGQpOworICAgICAgICBsMnQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDNlX2dl
dF9tZm4obDNzdGFydFszXSkpOworICAgICAgICBpbml0X3hlbl9wYWVfbDJfc2xvdHMobDJ0LCBk
KTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKICAgICB9CiAKICAgICAv
KiBQYWdlcyB0aGF0IGFyZSBwYXJ0IG9mIHBhZ2UgdGFibGVzIG11c3QgYmUgcmVhZCBvbmx5LiAq
LwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
