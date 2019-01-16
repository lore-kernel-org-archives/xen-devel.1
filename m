From: Chao Gao <chao.gao@intel.com>
Subject: [PATCH v5 3/3] xen/pt: initialize 'warned' field of
 arch_msix properly
Date: Wed, 16 Jan 2019 16:17:32 +0800
Message-ID: <1547626652-23384-3-git-send-email-chao.gao@intel.com>
References: <1547626652-23384-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CZYe=PY=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gjgKW-00027Q-2u
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 08:13:44 +0000
In-Reply-To: <1547626652-23384-1-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

QWxzbyBjbGVhbiB1cCBjdXJyZW50IGNvZGUgYnkgbW92aW5nIGluaXRpYWxpemF0aW9uIG9mIGFy
Y2ggc3BlY2lmaWMKZmllbGRzIG91dCBvZiBjb21tb24gY29kZS4KClNpZ25lZC1vZmYtYnk6IENo
YW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6CiAtIHJlbmFtZSBpbml0X2FyY2hfbXNpeCB0
byBhcmNoX2luaXRfbXNpeAogLSBwbGFjZSBhcmNoX2luaXRfbXNpeCByaWdodCBhZnRlciB0aGUg
ZGVmaW5pdGlvbiBvZiBhcmNoX21zaXgKCkNoYW5nZXMgaW4gdjQ6CiAtIG5ld2x5IGFkZGVkCi0t
LQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAyICstCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L21zaS5oICAgICB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggNGYyYmUwMi4uOTVmYzA2
YiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMgc3RydWN0
IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHU4IGJ1cywgdTggZGV2
Zm4pCiAgICAgICAgICAgICB4ZnJlZShwZGV2KTsKICAgICAgICAgICAgIHJldHVybiBOVUxMOwog
ICAgICAgICB9Ci0gICAgICAgIHNwaW5fbG9ja19pbml0KCZtc2l4LT50YWJsZV9sb2NrKTsKKyAg
ICAgICAgYXJjaF9pbml0X21zaXgobXNpeCk7CiAgICAgICAgIHBkZXYtPm1zaXggPSBtc2l4Owog
ICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc2kuaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvbXNpLmgKaW5kZXggMTAzODdkYy4uN2IxM2MwNyAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tc2kuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21zaS5oCkBA
IC0yNDIsNiArMjQyLDEyIEBAIHN0cnVjdCBhcmNoX21zaXggewogICAgIGRvbWlkX3Qgd2FybmVk
OwogfTsKIAorc3RhdGljIGlubGluZSB2b2lkIGFyY2hfaW5pdF9tc2l4KHN0cnVjdCBhcmNoX21z
aXggKm1zaXgpCit7CisgICAgc3Bpbl9sb2NrX2luaXQoJm1zaXgtPnRhYmxlX2xvY2spOworICAg
IG1zaXgtPndhcm5lZCA9IERPTUlEX0lOVkFMSUQ7Cit9CisKIHZvaWQgZWFybHlfbXNpX2luaXQo
dm9pZCk7CiB2b2lkIG1zaV9jb21wb3NlX21zZyh1bnNpZ25lZCB2ZWN0b3IsIGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywKICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtc2lfbXNnICptc2cpOwot
LSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
