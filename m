Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACF3C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431962148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 431962148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFg-0007mq-3h; Wed, 24 Apr 2019 17:00:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFe-0007jX-S4
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:06 +0000
X-Inumbo-ID: 68ce6a76-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 68ce6a76-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0FD0EBD;
 Wed, 24 Apr 2019 10:00:05 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B49AC3F557;
 Wed, 24 Apr 2019 10:00:04 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:44 +0100
Message-Id: <20190424165955.23718-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 01/12] xen/arm: lpae: Add a macro to generate
 offsets from an address
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
Message-ID: <20190424165944.qXHYL-ESaTY2noriMttZvtC850WPMoibeDaqMjVD6-E@z>

VGhlcmUgYXJlIGZldyBwbGFjZXMgcmVxdWlyaW5nIHRvIGdlbmVyYXRlIG9mZnNldHMgZnJvbSBh
biBhZGRyZXNzLgpSYXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCB3ZSBjYW4gaW50
cm9kdWNlIGEgbWFjcm8gdG8gZG8gdGhlCmpvYiBmb3IgdXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9wMm0uYyAg
ICAgICAgIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0v
bHBhZS5oIHwgIDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9h
cmNoL2FybS9wMm0uYwppbmRleCA5MmMyNDEzZjIwLi4wNmZhMzQyYThmIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCkBAIC0zNjgsMTIgKzM2
OCw3IEBAIG1mbl90IHAybV9nZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2ZuX3Qg
Z2ZuLAogICAgIHAybV90eXBlX3QgX3Q7CiAKICAgICAvKiBDb252ZW5pZW5jZSBhbGlhc2VzICov
Ci0gICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldHNbNF0gPSB7Ci0gICAgICAgIHplcm9ldGhf
dGFibGVfb2Zmc2V0KGFkZHIpLAotICAgICAgICBmaXJzdF90YWJsZV9vZmZzZXQoYWRkciksCi0g
ICAgICAgIHNlY29uZF90YWJsZV9vZmZzZXQoYWRkciksCi0gICAgICAgIHRoaXJkX3RhYmxlX29m
ZnNldChhZGRyKQotICAgIH07CisgICAgREVDTEFSRV9PRkZTRVRTKG9mZnNldHMsIGFkZHIpOwog
CiAgICAgQVNTRVJUKHAybV9pc19sb2NrZWQocDJtKSk7CiAgICAgQlVJTERfQlVHX09OKFRISVJE
X01BU0sgIT0gUEFHRV9NQVNLKTsKQEAgLTg4OCw3ICs4ODMsNiBAQCBzdGF0aWMgaW50IF9fcDJt
X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcDJtX3R5cGVfdCB0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vz
c190IGEpCiB7Ci0gICAgcGFkZHJfdCBhZGRyID0gZ2ZuX3RvX2dhZGRyKHNnZm4pOwogICAgIHVu
c2lnbmVkIGludCBsZXZlbCA9IDA7CiAgICAgdW5zaWduZWQgaW50IHRhcmdldCA9IDMgLSAocGFn
ZV9vcmRlciAvIExQQUVfU0hJRlQpOwogICAgIGxwYWVfdCAqZW50cnksICp0YWJsZSwgb3JpZ19w
dGU7CkBAIC04OTcsMTIgKzg5MSw3IEBAIHN0YXRpYyBpbnQgX19wMm1fc2V0X2VudHJ5KHN0cnVj
dCBwMm1fZG9tYWluICpwMm0sCiAgICAgYm9vbCByZW1vdmluZ19tYXBwaW5nID0gbWZuX2VxKHNt
Zm4sIElOVkFMSURfTUZOKTsKIAogICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8KLSAgICBj
b25zdCB1bnNpZ25lZCBpbnQgb2Zmc2V0c1s0XSA9IHsKLSAgICAgICAgemVyb2V0aF90YWJsZV9v
ZmZzZXQoYWRkciksCi0gICAgICAgIGZpcnN0X3RhYmxlX29mZnNldChhZGRyKSwKLSAgICAgICAg
c2Vjb25kX3RhYmxlX29mZnNldChhZGRyKSwKLSAgICAgICAgdGhpcmRfdGFibGVfb2Zmc2V0KGFk
ZHIpCi0gICAgfTsKKyAgICBERUNMQVJFX09GRlNFVFMob2Zmc2V0cywgZ2ZuX3RvX2dhZGRyKHNn
Zm4pKTsKIAogICAgIEFTU0VSVChwMm1faXNfd3JpdGVfbG9ja2VkKHAybSkpOwogCkBAIC0xMTk5
LDE1ICsxMTg4LDkgQEAgYm9vbCBwMm1fcmVzb2x2ZV90cmFuc2xhdGlvbl9mYXVsdChzdHJ1Y3Qg
ZG9tYWluICpkLCBnZm5fdCBnZm4pCiAgICAgdW5zaWduZWQgaW50IGxldmVsID0gMDsKICAgICBi
b29sIHJlc29sdmVkID0gZmFsc2U7CiAgICAgbHBhZV90IGVudHJ5LCAqdGFibGU7Ci0gICAgcGFk
ZHJfdCBhZGRyID0gZ2ZuX3RvX2dhZGRyKGdmbik7CiAKICAgICAvKiBDb252ZW5pZW5jZSBhbGlh
c2VzICovCi0gICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldHNbNF0gPSB7Ci0gICAgICAgIHpl
cm9ldGhfdGFibGVfb2Zmc2V0KGFkZHIpLAotICAgICAgICBmaXJzdF90YWJsZV9vZmZzZXQoYWRk
ciksCi0gICAgICAgIHNlY29uZF90YWJsZV9vZmZzZXQoYWRkciksCi0gICAgICAgIHRoaXJkX3Rh
YmxlX29mZnNldChhZGRyKQotICAgIH07CisgICAgREVDTEFSRV9PRkZTRVRTKG9mZnNldHMsIGdm
bl90b19nYWRkcihnZm4pKTsKIAogICAgIHAybV93cml0ZV9sb2NrKHAybSk7CiAKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9scGFl
LmgKaW5kZXggNTQ1YjBjOGYyNC4uYzIyNzgwZjhmMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9scGFlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9scGFlLmgKQEAgLTIxOCw2
ICsyMTgsMTUgQEAgVEFCTEVfT0ZGU0VUX0hFTFBFUlMoNjQpOwogI3VuZGVmIFRBQkxFX09GRlNF
VAogI3VuZGVmIFRBQkxFX09GRlNFVF9IRUxQRVJTCiAKKy8qIEdlbmVyYXRlIGFuIGFycmF5IEB2
YXIgY29udGFpbmluZyB0aGUgb2Zmc2V0IGZvciBlYWNoIGxldmVsIGZyb20gQGFkZHIgKi8KKyNk
ZWZpbmUgREVDTEFSRV9PRkZTRVRTKHZhciwgYWRkcikgICAgICAgICAgXAorICAgIGNvbnN0IHVu
c2lnbmVkIGludCB2YXJbNF0gPSB7ICAgICAgICAgICBcCisgICAgICAgIHplcm9ldGhfdGFibGVf
b2Zmc2V0KGFkZHIpLCAgICAgICAgIFwKKyAgICAgICAgZmlyc3RfdGFibGVfb2Zmc2V0KGFkZHIp
LCAgICAgICAgICAgXAorICAgICAgICBzZWNvbmRfdGFibGVfb2Zmc2V0KGFkZHIpLCAgICAgICAg
ICBcCisgICAgICAgIHRoaXJkX3RhYmxlX29mZnNldChhZGRyKSAgICAgICAgICAgIFwKKyAgICB9
CisKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KIAogLyoKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
