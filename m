From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 10/16] x86: don't setup legacy syscall vector
 when !CONFIG_PV
Date: Fri, 19 Oct 2018 15:28:36 +0100
Message-ID: <88a2440e85ce60162b6d7284530be7a2ab8ccbbc.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDWEY-0006Et-NY
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:58:38 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UHV0IHRoZSBjb2RlIGluIHNtcGJvb3QuYyB1bmRlciBDT05GSUdfUFYuIE5vdCB0aGF0IHdlIGRv
bid0IG5lZWQgdG8Kc2V0IHVwIGEgc3R1YiBoZXJlIGJlY2F1c2UgZW50cnkuUyBhbHJlYWR5IGRv
ZXMgdGhhdC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0t
LQp2MjogbmV3Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5j
IGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCAzNWFiZmM0Li40M2RlYjgyIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMK
QEAgLTEwOTQsMTIgKzEwOTQsMTQgQEAgdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh2b2lk
KQogICAgIHsKICAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnB2X2NyMyA9IDA7CiAKKyNpZmRlZiBD
T05GSUdfUFYKICAgICAgICAgLyoKICAgICAgICAgICogQWxsIGVudHJ5IHBvaW50cyB3aGljaCBt
YXkgbmVlZCB0byBzd2l0Y2ggcGFnZSB0YWJsZXMgaGF2ZSB0byBzdGFydAogICAgICAgICAgKiB3
aXRoIGludGVycnVwdHMgb2ZmLiBSZS13cml0ZSB3aGF0IHB2X3RyYXBfaW5pdCgpIGhhcyBwdXQg
dGhlcmUuCiAgICAgICAgICAqLwogICAgICAgICBfc2V0X2dhdGUoaWR0X3RhYmxlICsgTEVHQUNZ
X1NZU0NBTExfVkVDVE9SLCBTWVNfREVTQ19pcnFfZ2F0ZSwgMywKICAgICAgICAgICAgICAgICAg
ICZpbnQ4MF9kaXJlY3RfdHJhcCk7CisjZW5kaWYKICAgICB9CiAKICAgICBzZXRfbnJfc29ja2V0
cygpOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
