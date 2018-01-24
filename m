From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH 0/3] xen/arm: SMCCC fixes and PSCI clean-up
Date: Wed, 24 Jan 2018 18:34:42 +0000
Message-ID: <20180124183445.23705-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, volodymyr_babchuk@epam.com, andre.przywara@linaro.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgY29udGFpbnMgU01DQ0MgZml4ZXMgKHNl
ZSAjMikgYW5kIFBTQ0kgY2xlYW4tdXAuCgpDaGVlcnMsCgpKdWxpZW4gR3JhbGwgKDMpOgogIHhl
bi9hcm06IHZwc2NpOiBSZW1vdmluZyBkdW1teSBNSUdSQVRFIGFuZCBNSUdSQVRFX0lORk9fVVBf
Q1BVCiAgeGVuL2FybTogdnNtYzogRG9uJ3QgaW1wbGVtZW50IGZ1bmN0aW9uIElEIHRoYXQgZG9l
c24ndCBleGlzdAogIHhlbi9hcm06IHZwc2NpOiBNb3ZlIFBTQ0kgZnVuY3Rpb24gZGlzcGF0Y2hp
bmcgZnJvbSB2c21jLmMgdG8gdnBzY2kuYwoKIHhlbi9hcmNoL2FybS92cHNjaS5jICAgICAgICAg
ICAgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2Fy
Y2gvYXJtL3ZzbWMuYyAgICAgICAgICAgICAgfCAxMjIgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGVyZmNfZGVmbi5oIHwgICAyIC0KIHhlbi9p
bmNsdWRlL2FzbS1hcm0vcHNjaS5oICAgICAgIHwgIDIzICstLS0tLQogeGVuL2luY2x1ZGUvYXNt
LWFybS9zbWNjYy5oICAgICAgfCAgMjAgKysrKystCiA1IGZpbGVzIGNoYW5nZWQsIDE2MCBpbnNl
cnRpb25zKCspLCAxNTYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
