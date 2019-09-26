Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A43C4360C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 18:38:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C899206E0
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 18:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C899206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYf3-0002aO-Fx; Thu, 26 Sep 2019 18:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYf3-0002a0-4n
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:41 +0000
X-Inumbo-ID: d1bc3ba6-e08c-11e9-965e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id d1bc3ba6-e08c-11e9-965e-12813bfff9fa;
 Thu, 26 Sep 2019 18:38:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3DF5142F;
 Thu, 26 Sep 2019 11:38:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 232163F67D;
 Thu, 26 Sep 2019 11:38:22 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:07 +0100
Message-Id: <20190926183808.11630-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace use of
 ALTERNATIVE with alternative_if
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgYWx0ZXJuYXRpdmVfaWYgbWFrZXMgdGhlIGNvZGUgYSBiaXQgbW9yZSBzdHJlYW1saW5l
ZC4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGF1dG8tbm9wIGluZnJhc3Ry
dWN0dXJlIHRvIGF2b2lkCmNvdW50aW5nIHRoZSBudW1iZXIgb2Ygbm9wIGluIHRoZSBlbHNlIHBh
cnQgZm9yIGFyY2gvYXJtL2FybTY0L2VudHJ5LlMKClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIFRoaXMgaXMgcHJldHR5IG11Y2ggYSBt
YXR0ZXIgb2YgdGFzdGUsIGJ1dCBhdCBsZWFzdCBmb3IgYXJtNjQgdGhpcwogICAgYWxsb3dzIHVz
IHRvIHVzZSB0aGUgYXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUuIFNvIHRoZSBhcm0zMiBpcyBtb3Jl
CiAgICB0byBrZWVwIGlubGluZSB3aXRoIGFybTY0LgotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9l
bnRyeS5TIHwgOSArKysrKystLS0KIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgOCArKysr
Ky0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2VudHJ5LlMKaW5kZXggMGI0Y2QxOWFiZC4uMTQyOGNkMzU4MyAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTMyL2VudHJ5LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMK
QEAgLTY1LDkgKzY1LDEyIEBAIHNhdmVfZ3Vlc3RfcmVnczoKICAgICAgICAgICogSWYgdGhlIFNL
SVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQgaGFzIGJlZW4gc2V0IGluIHRoZSBjcHUK
ICAgICAgICAgICogZmVhdHVyZSwgdGhlIGNoZWNraW5nIG9mIHBlbmRpbmcgU0Vycm9ycyB3aWxs
IGJlIHNraXBwZWQuCiAgICAgICAgICAqLwotICAgICAgICBBTFRFUk5BVElWRSgibm9wIiwKLSAg
ICAgICAgICAgICAgICAgICAgImIgc2tpcF9jaGVjayIsCi0gICAgICAgICAgICAgICAgICAgIFNL
SVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCisgICAgICAgIGFsdGVybmF0aXZlX2lm
IFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKKyAgICAgICAgbm9wCisgICAgICAg
IGFsdGVybmF0aXZlX2Vsc2UKKyAgICAgICAgYiAgIHNraXBfY2hlY2sKKyAgICAgICAgYWx0ZXJu
YXRpdmVfZW5kaWYKKwogICAgICAgICAvKgogICAgICAgICAgKiBTdGFydCB0byBjaGVjayBwZW5k
aW5nIHZpcnR1YWwgYWJvcnQgaW4gdGhlIGdhcCBvZiBHdWVzdCAtPiBIWVAKICAgICAgICAgICog
d29ybGQgc3dpdGNoLgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwppbmRleCA0NThkMTJmMTg4Li45MWNmNmVlNmY0IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUworKysgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvZW50cnkuUwpAQCAtMTcwLDkgKzE3MCwxMSBAQAogICAgICAgICAgKiBpcyBub3Qgc2V0
LiBJZiBhIHZTRXJyb3IgdG9vayBwbGFjZSwgdGhlIGluaXRpYWwgZXhjZXB0aW9uIHdpbGwgYmUK
ICAgICAgICAgICogc2tpcHBlZC4gRXhpdCBBU0FQCiAgICAgICAgICAqLwotICAgICAgICBBTFRF
Uk5BVElWRSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9yOyBjYm56IHgwLCAxZiIsCi0gICAgICAg
ICAgICAgICAgICAgICJub3A7IG5vcCIsCi0gICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hS
T05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCisgICAgICAgIGFsdGVybmF0aXZlX2lmIFNLSVBfU1lO
Q0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKKyAgICAgICAgYmwgICAgICBjaGVja19wZW5kaW5n
X3ZzZXJyb3IKKyAgICAgICAgY2JueiAgICB4MCwgMWYKKyAgICAgICAgYWx0ZXJuYXRpdmVfZWxz
ZV9ub3BfZW5kaWYKKwogICAgICAgICBtb3YgICAgIHgwLCBzcAogICAgICAgICBibCAgICAgIGVu
dGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycQogICAgICAgICBtc3IgICAgIGRhaWZjbHIs
IFxpZmxhZ3MKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
