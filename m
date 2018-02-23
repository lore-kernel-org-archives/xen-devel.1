From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v4 12/19] fixup! xen/arm64: Add
	ARM_SMCCC_ARCH_WORKAROUND_1 BP hardening support
Date: Fri, 23 Feb 2018 16:47:46 +0000
Message-ID: <20180223164753.27311-13-julien.grall@arm.com>
References: <20180223164753.27311-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223164753.27311-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, volodymyr_babchuk@epam.com, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

LS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvYnBpLlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJt
NjQvYnBpLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvYnBpLlMKaW5kZXggOTgxZmI4M2E4OC4uYjU5
ZTMwN2IwZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2JwaS5TCisrKyBiL3hlbi9h
cmNoL2FybS9hcm02NC9icGkuUwpAQCAtODUsOCArODUsOCBAQCBFTlRSWShfX3BzY2lfaHlwX2Jw
X2ludmFsX2VuZCkKIAogRU5UUlkoX19zbWNjY193b3JrYXJvdW5kXzFfc21jX3N0YXJ0KQogICAg
IHN1YiAgICAgc3AsIHNwLCAjKDggKiA0KQotICAgIHN0cCAgICAgeDIsIHgzLCBbc3AsICMoOCAq
IDApXQogICAgIHN0cCAgICAgeDAsIHgxLCBbc3AsICMoOCAqIDIpXQorICAgIHN0cCAgICAgeDIs
IHgzLCBbc3AsICMoOCAqIDApXQogICAgIG1vdiAgICAgdzAsICNBUk1fU01DQ0NfQVJDSF9XT1JL
QVJPVU5EXzFfRklECiAgICAgc21jICAgICAjMAogICAgIGxkcCAgICAgeDIsIHgzLCBbc3AsICMo
OCAqIDApXQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
