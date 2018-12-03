From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 4/7] xen: introduce mfn_init macro
Date: Mon,  3 Dec 2018 13:03:38 -0800
Message-ID: <1543871021-315-4-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812031302070.13706@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1812031302070.13706@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, julien.grall@arm.com, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYmUgdXNlZCBpbiBjb25zdGFudCBpbml0aWFsaXphdGlvbnMgb2YgbWZuX3QgdmFyaWFibGVz
LCBzdWNoIGFzOgoKc3RhdGljIG1mbl90IG5vZGUgPSBtZm5faW5pdChNTV9BRERSKTsKCkl0IGlz
IG5lY2Vzc2FyeSBiZWNhdXNlIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIGNhbm5vdCBiZSB1c2Vk
IGFzIHN0YXRpYwppbml0aWFsaXplcnMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzog
VGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLS0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9p
bmNsdWRlL3hlbi9tbS5oCmluZGV4IDA1NGQwMmUuLjY5Mjk2N2UgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCkBAIC03Nyw2ICs3Nywx
MiBAQCBUWVBFX1NBRkUodW5zaWduZWQgbG9uZywgbWZuKTsKICN1bmRlZiBtZm5feAogI2VuZGlm
CiAKKyNpZm5kZWYgTkRFQlVHCisjZGVmaW5lIG1mbl9pbml0KHgpIHsgeCB9CisjZWxzZQorI2Rl
ZmluZSBtZm5faW5pdCh4KSB4CisjZW5kaWYKKwogc3RhdGljIGlubGluZSBtZm5fdCBtZm5fYWRk
KG1mbl90IG1mbiwgdW5zaWduZWQgbG9uZyBpKQogewogICAgIHJldHVybiBfbWZuKG1mbl94KG1m
bikgKyBpKTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
