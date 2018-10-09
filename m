From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/6] x86/dom0: switch parse_dom0_param to use
 parse_boolean
Date: Tue, 9 Oct 2018 11:42:32 +0200
Message-ID: <20181009094236.51522-3-roger.pau@citrix.com>
References: <20181009094236.51522-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=av44=mv=citrix.com=prvs=81391bf32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9oXp-00062V-9S
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:43:13 +0000
In-Reply-To: <20181009094236.51522-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhwZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyBi
L3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKaW5kZXggODZlYjdkYjFkYS4uZGNkN2FmYjA1OCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYv
ZG9tMF9idWlsZC5jCkBAIC0yMjUsMTYgKzIyNSwxNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJz
ZV9kb20wX3BhcmFtKGNvbnN0IGNoYXIgKnMpCiAgICAgaW50IHJjID0gMDsKIAogICAgIGRvIHsK
KyAgICAgICAgaW50IHZhbDsKIAogICAgICAgICBzcyA9IHN0cmNocihzLCAnLCcpOwogICAgICAg
ICBpZiAoICFzcyApCiAgICAgICAgICAgICBzcyA9IHN0cmNocihzLCAnXDAnKTsKIAotICAgICAg
ICBpZiAoICFzdHJuY21wKHMsICJwdmgiLCBzcyAtIHMpICkKLSAgICAgICAgICAgIGRvbTBfcHZo
ID0gdHJ1ZTsKKyAgICAgICAgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigicHZoIiwgcywgc3Mp
KSA+PSAwICkKKyAgICAgICAgICAgIGRvbTBfcHZoID0gdmFsOwogI2lmZGVmIENPTkZJR19TSEFE
T1dfUEFHSU5HCi0gICAgICAgIGVsc2UgaWYgKCAhc3RybmNtcChzLCAic2hhZG93Iiwgc3MgLSBz
KSApCi0gICAgICAgICAgICBvcHRfZG9tMF9zaGFkb3cgPSB0cnVlOworICAgICAgICBlbHNlIGlm
ICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNoYWRvdyIsIHMsIHNzKSkgPj0gMCApCisgICAgICAg
ICAgICBvcHRfZG9tMF9zaGFkb3cgPSB2YWw7CiAjZW5kaWYKICAgICAgICAgZWxzZQogICAgICAg
ICAgICAgcmMgPSAtRUlOVkFMOwotLSAKMi4xOS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
