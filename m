From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 04/16] x86: make construct_dom0 build with
 !CONFIG_PV
Date: Fri, 19 Oct 2018 15:28:30 +0100
Message-ID: <b7b033adf8a230464f1feef1f053d8060a6bad5e.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDVle-0002d0-N0
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:28:46 +0000
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnYyOiBwYW5p
YyBpbnN0ZWFkLgotLS0KIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgfCAgOSArKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxk
LmMKaW5kZXggZGNkN2FmYi4uMGYwOTc3ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbTBf
YnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCkBAIC01MTAsOCArNTEwLDEz
IEBAIGludCBfX2luaXQgY29uc3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9k
dWxlX3QgKmltYWdlLAogICAgIH0KICNlbmRpZgogCi0gICAgcmMgPSAoaXNfaHZtX2RvbWFpbihk
KSA/IGRvbTBfY29uc3RydWN0X3B2aCA6IGRvbTBfY29uc3RydWN0X3B2KQotICAgICAgICAgKGQs
IGltYWdlLCBpbWFnZV9oZWFkcm9vbSwgaW5pdHJkLCBjbWRsaW5lKTsKKyAgICBpZiAoIGlzX2h2
bV9kb21haW4oZCkgKQorICAgICAgICByYyA9IGRvbTBfY29uc3RydWN0X3B2aChkLCBpbWFnZSwg
aW1hZ2VfaGVhZHJvb20sIGluaXRyZCwgY21kbGluZSk7CisgICAgZWxzZSBpZiAoIGlzX3B2X2Rv
bWFpbihkKSApCisgICAgICAgIHJjID0gZG9tMF9jb25zdHJ1Y3RfcHYoZCwgaW1hZ2UsIGltYWdl
X2hlYWRyb29tLCBpbml0cmQsIGNtZGxpbmUpOworICAgIGVsc2UKKyAgICAgICAgcGFuaWMoIkNh
bm5vdCBjb25zdHJ1Y3QgRG9tMC4gTm8gZ3Vlc3QgaW50ZXJmYWNlIGF2YWlsYWJsZS4iKTsKKwog
ICAgIGlmICggcmMgKQogICAgICAgICByZXR1cm4gcmM7CiAKLS0gCmdpdC1zZXJpZXMgMC45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
