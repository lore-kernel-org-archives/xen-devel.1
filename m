From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/arm: Don't build GICv3 with the new vGIC
Date: Fri, 19 Oct 2018 15:23:55 +0100
Message-ID: <20181019142355.10352-1-julien.grall@arm.com>
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
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDU0ZWM1OWY2YjAgInhlbi9hcm06IHZnaWMtdjM6IERvbid0IGNyZWF0ZSBlbXB0eSBy
ZS1kaXN0cmlidXRvcgpyZWdpb25zIiBicmVha3MgY29tcGlsYXRpb24gd2hlbiB1c2luZyB0aGUg
bmV3IHZHSUMuCgpUaGlzIGlzIGJlY2F1c2UgdGhlIGZpZWxkIG5yX3JlZ2lvbnMgaXMgbm90IGV4
aXN0aW5nIGluIHRoZSB2Z2ljCnN0cnVjdHVyZS4gRm9yIHNpbXBsaWNpdHksIGFzIHZHSUN2MyBp
cyBub3QgeWV0IGltcG9ydGVkLCBkaXNhYmxlIEdJQ3YzLgoKUmVwb3J0ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL0tjb25maWcgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCmluZGV4
IGMwZTk2OWU0NWEuLjU4MWRlNjdiNmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmln
CisrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCkBAIC00MCw3ICs0MCw3IEBAIGNvbmZpZyBBQ1BJ
CiAKIGNvbmZpZyBHSUNWMwogCWJvb2wgIkdJQ3YzIGRyaXZlciIKLQlkZXBlbmRzIG9uIEFSTV82
NAorCWRlcGVuZHMgb24gQVJNXzY0ICYmICFORVdfVkdJQwogCWRlZmF1bHQgeQogCS0tLWhlbHAt
LS0KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
