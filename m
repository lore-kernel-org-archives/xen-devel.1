From: Chao Gao <chao.gao@intel.com>
Subject: [PATCH v4 3/3] xen/pt: initialize 'warned' field of
 arch_msix properly
Date: Thu, 20 Dec 2018 23:29:36 +0800
Message-ID: <1545319776-23459-3-git-send-email-chao.gao@intel.com>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kl4e=O5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ga0D4-0008IT-GD
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:26:02 +0000
In-Reply-To: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
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
YW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgogLSBuZXdseSBh
ZGRlZAotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMiArLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9tc2kuaCAgICAgfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggY2NhZTBlYy4u
ZGFkOGJlNiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMg
c3RydWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHU4IGJ1cywg
dTggZGV2Zm4pCiAgICAgICAgICAgICB4ZnJlZShwZGV2KTsKICAgICAgICAgICAgIHJldHVybiBO
VUxMOwogICAgICAgICB9Ci0gICAgICAgIHNwaW5fbG9ja19pbml0KCZtc2l4LT50YWJsZV9sb2Nr
KTsKKyAgICAgICAgaW5pdF9hcmNoX21zaXgobXNpeCk7CiAgICAgICAgIHBkZXYtPm1zaXggPSBt
c2l4OwogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc2kuaCBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvbXNpLmgKaW5kZXggMTAzODdkYy4uYzIyOTNhYiAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc2kuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21z
aS5oCkBAIC0yNTIsNSArMjUyLDEwIEBAIHZvaWQgZ3Vlc3RfbWFza19tc2lfaXJxKHN0cnVjdCBp
cnFfZGVzYyAqLCBib29sIG1hc2spOwogdm9pZCBhY2tfbm9ubWFza2FibGVfbXNpX2lycShzdHJ1
Y3QgaXJxX2Rlc2MgKik7CiB2b2lkIGVuZF9ub25tYXNrYWJsZV9tc2lfaXJxKHN0cnVjdCBpcnFf
ZGVzYyAqLCB1OCB2ZWN0b3IpOwogdm9pZCBzZXRfbXNpX2FmZmluaXR5KHN0cnVjdCBpcnFfZGVz
YyAqLCBjb25zdCBjcHVtYXNrX3QgKik7CitzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF9hcmNoX21z
aXgoc3RydWN0IGFyY2hfbXNpeCAqbXNpeCkKK3sKKyAgICBzcGluX2xvY2tfaW5pdCgmbXNpeC0+
dGFibGVfbG9jayk7CisgICAgbXNpeC0+d2FybmVkID0gRE9NSURfSU5WQUxJRDsKK30KIAogI2Vu
ZGlmIC8qIF9fQVNNX01TSV9IICovCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
