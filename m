Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221EC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB8672148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB8672148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFp-0007ol-CT; Wed, 24 Apr 2019 17:00:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFo-0007oY-Vy
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:17 +0000
X-Inumbo-ID: 6e82a483-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6e82a483-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DDD15BE;
 Wed, 24 Apr 2019 10:00:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7353F557;
 Wed, 24 Apr 2019 10:00:14 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:51 +0100
Message-Id: <20190424165955.23718-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 08/12] xen/arm: mm: Remove enum xenmap_operation
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424165951.MMOGZ6O_VnwTnmM4abKdbXyixCkmm6st1PyFWdF0NsA@z>

VGhlIGVudW0geGVubWFwX29wZXJhdGlvbiBpcyBub3QgdXNlZCBhbnltb3JlLiBTbyByZW1vdmUg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgot
LS0KIHhlbi9hcmNoL2FybS9tbS5jIHwgMjQgKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDYxMWVhNTM5OTIu
Ljk3ZTg3NmQ4NjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNo
L2FybS9tbS5jCkBAIC05NjksMTMgKzk2OSw2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJs
ZShscGFlX3QgKmVudHJ5KQogICAgIHJldHVybiAwOwogfQogCi1lbnVtIHhlbm1hcF9vcGVyYXRp
b24gewotICAgIElOU0VSVCwKLSAgICBSRU1PVkUsCi0gICAgTU9ESUZZLAotICAgIFJFU0VSVkUK
LX07Ci0KIC8qIFNhbml0eSBjaGVjayBvZiB0aGUgZW50cnkgKi8KIHN0YXRpYyBib29sIHhlbl9w
dF9jaGVja19lbnRyeShscGFlX3QgZW50cnksIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdz
KQogewpAQCAtMTAzNSw4ICsxMDI4LDggQEAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5
KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAgICAgcmV0dXJu
IHRydWU7CiB9CiAKLXN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeShlbnVtIHhlbm1hcF9v
cGVyYXRpb24gb3AsIHVuc2lnbmVkIGxvbmcgYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKK3N0YXRpYyBpbnQgeGVuX3B0
X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgbHBhZV90IHB0
ZSwgKmVudHJ5OwogICAgIGxwYWVfdCAqdGhpcmQgPSBOVUxMOwpAQCAtMTA5NCw4ICsxMDg3LDcg
QEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVubWFwX29wZXJhdGlvbiBv
cCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbl9wdF9s
b2NrKTsKIAotc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBv
cCwKLSAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZpcnQsCitzdGF0aWMg
aW50IHhlbl9wdF91cGRhdGUodW5zaWduZWQgbG9uZyB2aXJ0LAogICAgICAgICAgICAgICAgICAg
ICAgICAgIG1mbl90IG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IG5yX21mbnMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQpA
QCAtMTEyNiw3ICsxMTE4LDcgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFw
X29wZXJhdGlvbiBvcCwKIAogICAgIGZvciggOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFH
RV9TSVpFICkKICAgICB7Ci0gICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShvcCwgYWRk
ciwgbWZuLCBmbGFncyk7CisgICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShhZGRyLCBt
Zm4sIGZsYWdzKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBicmVhazsKIApAQCAt
MTE1MSwyNCArMTE0MywyNCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbih1bnNpZ25lZCBsb25nIHZp
cnQsCiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCiAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAgcmV0dXJuIHhlbl9wdF91
cGRhdGUoSU5TRVJULCB2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKKyAgICByZXR1cm4geGVu
X3B0X3VwZGF0ZSh2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKIH0KIAogaW50IHBvcHVsYXRl
X3B0X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWduZWQgbG9uZyBucl9tZm5zKQogewot
ICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VSVkUsIHZpcnQsIElOVkFMSURfTUZOLCBucl9t
Zm5zLCBfUEFHRV9QT1BVTEFURSk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUodmlydCwgSU5W
QUxJRF9NRk4sIG5yX21mbnMsIF9QQUdFX1BPUFVMQVRFKTsKIH0KIAogaW50IGRlc3Ryb3lfeGVu
X21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQogewogICAgIEFTU0VS
VCh2IDw9IGUpOwotICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFTU9WRSwgdiwgSU5WQUxJRF9N
Rk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUo
diwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBtb2Rp
ZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCiB7CiAgICAgQVNTRVJUKHMgPD0gZSk7Ci0gICAgcmV0dXJuIHhlbl9wdF91
cGRhdGUoTU9ESUZZLCBzLCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZULCBmbGFn
cyk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUocywgSU5WQUxJRF9NRk4sIChlIC0gcykgPj4g
UEFHRV9TSElGVCwgZmxhZ3MpOwogfQogCiBlbnVtIG1nIHsgbWdfY2xlYXIsIG1nX3JvLCBtZ19y
dywgbWdfcnggfTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
