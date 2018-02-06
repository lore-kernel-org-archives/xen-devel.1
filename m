From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH v3 0/3] xen/arm: SMCCC fixes and PSCI clean-up
Date: Tue,  6 Feb 2018 15:53:22 +0000
Message-ID: <20180206155325.11703-1-julien.grall@linaro.org>
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
ICAgIHwgMTU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2Fy
Y2gvYXJtL3ZzbWMuYyAgICAgICAgICAgICAgfCAxMjYgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9wZXJmY19kZWZuLmggfCAgIDIgLQogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wc2NpLmggICAgICAgfCAgMjMgLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20t
YXJtL3NtY2NjLmggICAgICB8ICAyMCArKysrLQogeGVuL2luY2x1ZGUvYXNtLWFybS92cHNjaS5o
ICAgICAgfCAgNDIgKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMo
KyksIDE2MiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20t
YXJtL3Zwc2NpLmgKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
