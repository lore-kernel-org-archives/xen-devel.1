Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB3AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634AE218FE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634AE218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFi-0007n2-CT; Wed, 24 Apr 2019 17:00:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFh-0007mw-4e
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:09 +0000
X-Inumbo-ID: 69ae0bec-66b2-11e9-9840-9b0330304ec4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 69ae0bec-66b2-11e9-9840-9b0330304ec4;
 Wed, 24 Apr 2019 17:00:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38C5E15BE;
 Wed, 24 Apr 2019 10:00:07 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E1143F557;
 Wed, 24 Apr 2019 10:00:05 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:45 +0100
Message-Id: <20190424165955.23718-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 02/12] xen/arm: mm: Rename create_xen_entries()
 to xen_pt_update()
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
Message-ID: <20190424165945.x8Ag-LjiOOKIbZ5Ni_TAxsuyGUL2pgVqCvehGPWIrAY@z>

Y3JlYXRlX3hlbl9lbnRyaWVzKCkgaXMgZG9pbmcgbW9yZSB0aGFuIGNyZWF0aW5nIGVudHJpZXMu
IEl0IGNhbiBhbHNvCm1vZGlmeSBhbmQgcmVtb3ZlIGVudHJpZXMuCgpSZW5hbWUgdGhlIGZ1bmN0
aW9uIHRvIG1ha2UgY2xlYXIgd2hhdCB0aGUgZnVuY3Rpb24gaXMgYWN0dWFsbHkgZG9pbmcuCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhl
bi9hcmNoL2FybS9tbS5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBkNjE1N2MzNWQ2Li5kZjJlYzNhMzZi
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpA
QCAtOTY1LDExICs5NjUsMTEgQEAgZW51bSB4ZW5tYXBfb3BlcmF0aW9uIHsKIAogc3RhdGljIERF
RklORV9TUElOTE9DSyh4ZW5fcHRfbG9jayk7CiAKLXN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRy
aWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1m
bl90IG1mbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJf
bWZucywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykK
K3N0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2aXJ0LAorICAgICAgICAgICAgICAg
ICAgICAgICAgIG1mbl90IG1mbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIG5yX21mbnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdz
KQogewogICAgIGludCByYyA9IDA7CiAgICAgdW5zaWduZWQgbG9uZyBhZGRyID0gdmlydCwgYWRk
cl9lbmQgPSBhZGRyICsgbnJfbWZucyAqIFBBR0VfU0laRTsKQEAgLTEwNjIsMjUgKzEwNjIsMjQg
QEAgaW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAogICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBucl9tZm5zLAogICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGZsYWdzKQogewotICAgIHJldHVybiBjcmVhdGVfeGVuX2VudHJpZXMoSU5TRVJU
LCB2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShJ
TlNFUlQsIHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOwogfQogCiBpbnQgcG9wdWxhdGVfcHRf
cmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiB7Ci0gICAg
cmV0dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhSRVNFUlZFLCB2aXJ0LCBJTlZBTElEX01GTiwgbnJf
bWZucywgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmlydCwgSU5WQUxJ
RF9NRk4sIG5yX21mbnMsIDApOwogfQogCiBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWdu
ZWQgbG9uZyB2LCB1bnNpZ25lZCBsb25nIGUpCiB7CiAgICAgQVNTRVJUKHYgPD0gZSk7Ci0gICAg
cmV0dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhSRU1PVkUsIHYsIElOVkFMSURfTUZOLCAoZSAtIHYp
ID4+IFBBR0VfU0hJRlQsIDApOworICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFTU9WRSwgdiwg
SU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBtb2RpZnlf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCiB7CiAgICAgQVNTRVJUKHMgPD0gZSk7Ci0gICAgcmV0dXJuIGNyZWF0ZV94ZW5f
ZW50cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJRlQsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CisgICAgcmV0dXJuIHhlbl9wdF91
cGRhdGUoTU9ESUZZLCBzLCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZULCBmbGFn
cyk7CiB9CiAKIGVudW0gbWcgeyBtZ19jbGVhciwgbWdfcm8sIG1nX3J3LCBtZ19yeCB9OwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
