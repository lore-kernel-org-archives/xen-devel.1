Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3137AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 18:12:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C43320652
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 18:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C43320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJMN1-00064x-0H; Wed, 24 Apr 2019 18:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPtL=S2=citrix.com=prvs=0106169aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJMMz-00064h-Cl
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:11:45 +0000
X-Inumbo-ID: 6af740c3-66bc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6af740c3-66bc-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 18:11:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,390,1549929600"; d="scan'208";a="84328015"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 24 Apr 2019 19:10:58 +0100
Message-ID: <1556129458-11418-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
References: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] xen/arm: Misc improvements to
 do_common_cpu_on()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424181058.aqdpPFMvlGvic48llbw-hYR-e214z-w2mfrq7eg4k9I@z>

ICogVXNlIGRvbWFpbl92Y3B1KCkgcmF0aGVyIHRoYW4gb3BlbmNvZGluZyB0aGUgbG9va3VwLiAg
QW1vbmdzdCBvdGhlciB0aGluZ3MsCiAgIGRvbWFpbl92Y3B1KCkgaXMgc3BlY3RyZS12MS1zYWZl
LgogKiBVbmxvY2sgdGhlIGRvbWFpbiBpbW1lZGlhdGVseSBhZnRlciBhcmNoX3NldF9pbmZvX2d1
ZXN0KCkgY29tcGxldGVzLiAgVGhlcmUKICAgaXMgbm8gbmVlZCBmb3IgZnJlZV92Y3B1X2d1ZXN0
X2NvbnRleHQoKSB0byBiZSB3aXRoaW4gdGhlIGNyaXRpY2FsIHJlZ2lvbiwKICAgYW5kIG1vdmlu
ZyB0aGUgY2FsbCBzaW1wbGlmaWVzIHRoZSBlcnJvciBjYXNlLgoKTm8gcHJhY3RpY2FsIGNoYW5n
ZSBpbiBmdW5jdGlvbmFsdGl5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgot
LS0KIHhlbi9hcmNoL2FybS92cHNjaS5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
dnBzY2kuYyBiL3hlbi9hcmNoL2FybS92cHNjaS5jCmluZGV4IDlmNGU1YjguLmMxZTI1MGIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92cHNjaS5jCisrKyBiL3hlbi9hcmNoL2FybS92cHNjaS5j
CkBAIC0zMyw3ICszMyw3IEBAIHN0YXRpYyBpbnQgZG9fY29tbW9uX2NwdV9vbihyZWdpc3Rlcl90
IHRhcmdldF9jcHUsIHJlZ2lzdGVyX3QgZW50cnlfcG9pbnQsCiAKICAgICB2Y3B1aWQgPSB2YWZm
aW5pdHlfdG9fdmNwdWlkKHRhcmdldF9jcHUpOwogCi0gICAgaWYgKCB2Y3B1aWQgPj0gZC0+bWF4
X3ZjcHVzIHx8ICh2ID0gZC0+dmNwdVt2Y3B1aWRdKSA9PSBOVUxMICkKKyAgICBpZiAoICh2ID0g
ZG9tYWluX3ZjcHUoZCwgdmNwdWlkKSkgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiBQU0NJX0lO
VkFMSURfUEFSQU1FVEVSUzsKIAogICAgIC8qIFRIVU1CIHNldCBpcyBub3QgYWxsb3dlZCB3aXRo
IDY0LWJpdCBkb21haW4gKi8KQEAgLTgyLDE0ICs4MiwxMiBAQCBzdGF0aWMgaW50IGRvX2NvbW1v
bl9jcHVfb24ocmVnaXN0ZXJfdCB0YXJnZXRfY3B1LCByZWdpc3Rlcl90IGVudHJ5X3BvaW50LAog
CiAgICAgZG9tYWluX2xvY2soZCk7CiAgICAgcmMgPSBhcmNoX3NldF9pbmZvX2d1ZXN0KHYsIGN0
eHQpOworICAgIGRvbWFpbl91bmxvY2soZCk7CisKICAgICBmcmVlX3ZjcHVfZ3Vlc3RfY29udGV4
dChjdHh0KTsKIAogICAgIGlmICggcmMgPCAwICkKLSAgICB7Ci0gICAgICAgIGRvbWFpbl91bmxv
Y2soZCk7CiAgICAgICAgIHJldHVybiBQU0NJX0RFTklFRDsKLSAgICB9Ci0gICAgZG9tYWluX3Vu
bG9jayhkKTsKIAogICAgIHZjcHVfd2FrZSh2KTsKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
