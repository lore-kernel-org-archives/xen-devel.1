From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 28/34] x86/vm_event: put vm_event_fill_regs
 under CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:46 +0100
Message-ID: <d8838b921f3d33265ca7ed08ff256a7423a58404.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggC-0001Zr-Gi
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:48 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

SWRlYWxseSB0aGUgSFZNIHNwZWNpZmljIHBhcnQgb2YgVk0gZXZlbnQgc2hvdWxkIGJlIG1vdmVk
IGludG8gaHZtLyBhdApzb21lIHBvaW50LCBidXQgdGhpcyB3aWxsIGRvIGZvciBub3cuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni92bV9ldmVudC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMKaW5kZXggZjkxYWFkZS4uYjRmNmFmYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3ZtX2V2
ZW50LmMKKysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKQEAgLTEyNCw2ICsxMjQsNyBAQCB2
b2lkIHZtX2V2ZW50X21vbml0b3JfbmV4dF9pbnRlcnJ1cHQoc3RydWN0IHZjcHUgKnYpCiAKIHZv
aWQgdm1fZXZlbnRfZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKQogeworI2lmIENP
TkZJR19IVk0KICAgICBjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyA9IGd1ZXN0X2Nw
dV91c2VyX3JlZ3MoKTsKICAgICBzdHJ1Y3Qgc2VnbWVudF9yZWdpc3RlciBzZWc7CiAgICAgc3Ry
dWN0IGh2bV9od19jcHUgY3R4dDsKQEAgLTE3Nyw2ICsxNzgsNyBAQCB2b2lkIHZtX2V2ZW50X2Zp
bGxfcmVncyh2bV9ldmVudF9yZXF1ZXN0X3QgKnJlcSkKIAogICAgIGh2bV9nZXRfc2VnbWVudF9y
ZWdpc3RlcihjdXJyLCB4ODZfc2VnX2NzLCAmc2VnKTsKICAgICByZXEtPmRhdGEucmVncy54ODYu
Y3NfYXJieXRlcyA9IHNlZy5hdHRyOworI2VuZGlmCiB9CiAKIHZvaWQgdm1fZXZlbnRfZW11bGF0
ZV9jaGVjayhzdHJ1Y3QgdmNwdSAqdiwgdm1fZXZlbnRfcmVzcG9uc2VfdCAqcnNwKQotLSAKZ2l0
LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
