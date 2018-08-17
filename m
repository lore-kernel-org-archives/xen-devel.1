From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 08/34] x86: enclose hvm_op and dm_op in
 CONFIG_HVM in PV hypercall table
Date: Fri, 17 Aug 2018 16:12:26 +0100
Message-ID: <4385411f3be7d5ca99fe1e5e43f0b30d701afac1.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQt-0007z1-3s
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:59 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UFYgZ3Vlc3QgKERvbTApIG5lZWRzIHRvIGFibGUgdG8gdXNlIHRoZXNlIHR3byBoeXBlcmNhbGxz
IGluIG9yZGVyIHRvCnNlcnZlIEhWTSBndWVzdHMuIEJ1dCBpZiB4ZW4gZG9lc24ndCBzdXBwb3J0
IEhWTSBhdCBhbGwgdGhlcmUgaXMgbm8KcG9pbnQgaW4gZXhwb3NpbmcgdGhlbSB0byBQViBndWVz
dHMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9wdi9oeXBlcmNhbGwuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9oeXBlcmNhbGwuYyBiL3hl
bi9hcmNoL3g4Ni9wdi9oeXBlcmNhbGwuYwppbmRleCBiYmMzMDExLi43NWU2Y2RiIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvcHYvaHlwZXJjYWxsLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2h5
cGVyY2FsbC5jCkBAIC02OCw3ICs2OCw5IEBAIGNvbnN0IGh5cGVyY2FsbF90YWJsZV90IHB2X2h5
cGVyY2FsbF90YWJsZVtdID0gewogI2VuZGlmCiAgICAgSFlQRVJDQUxMKGV2ZW50X2NoYW5uZWxf
b3ApLAogICAgIENPTVBBVF9DQUxMKHBoeXNkZXZfb3ApLAorI2lmZGVmIENPTkZJR19IVk0KICAg
ICBIWVBFUkNBTEwoaHZtX29wKSwKKyNlbmRpZgogICAgIEhZUEVSQ0FMTChzeXNjdGwpLAogICAg
IEhZUEVSQ0FMTChkb21jdGwpLAogI2lmZGVmIENPTkZJR19LRVhFQwpAQCAtNzgsNyArODAsOSBA
QCBjb25zdCBoeXBlcmNhbGxfdGFibGVfdCBwdl9oeXBlcmNhbGxfdGFibGVbXSA9IHsKICAgICBI
WVBFUkNBTEwodG1lbV9vcCksCiAjZW5kaWYKICAgICBIWVBFUkNBTEwoeGVucG11X29wKSwKKyNp
ZmRlZiBDT05GSUdfSFZNCiAgICAgQ09NUEFUX0NBTEwoZG1fb3ApLAorI2VuZGlmCiAgICAgSFlQ
RVJDQUxMKG1jYSksCiAgICAgSFlQRVJDQUxMKGFyY2hfMSksCiB9OwotLSAKZ2l0LXNlcmllcyAw
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
