Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BCCC282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67383214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67383214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc95-0005ST-Dx; Mon, 22 Apr 2019 16:50:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc93-0005PI-NF
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:17 +0000
X-Inumbo-ID: b4acb2b2-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b4acb2b2-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 703B4374;
 Mon, 22 Apr 2019 09:50:16 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60CF43F557;
 Mon, 22 Apr 2019 09:50:15 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:36 +0100
Message-Id: <20190422164937.21350-20-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 19/20] xen/arm: Pair call to set_fixmap with
 call to clear_fixmap in copy_from_paddr
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
Message-ID: <20190422164936.ImMwPyULtU5dLi9Rc3Z3hS_ZVverRlofalr1Pv2ULoQ@z>

QXQgdGhlIG1vbWVudCwgc2V0X2ZpeG1hcCBtYXkgcmVwbGFjZSBhIHZhbGlkIGVudHJ5IHdpdGhv
dXQgZm9sbG93aW5nCnRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVz
dWx0IHRvIFRMQiBjb25mbGljdCBhYm9ydC4KClJhdGhlciB0aGFuIGRlYWxpbmcgd2l0aCBCcmVh
ay1CZWZvcmUtTWFrZSBpbiBzZXRfZml4bWFwLCBldmVyeSBjYWxsIHRvCnNldF9maXhtYXAgaXMg
cGFpcmVkIHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2tlcm5lbC5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0va2VybmVsLmMgYi94ZW4vYXJjaC9hcm0va2VybmVs
LmMKaW5kZXggZTNmZmRiMmZhMS4uMzg5YmVmMmFmYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2tlcm5lbC5jCisrKyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwpAQCAtNTgsMTMgKzU4LDEyIEBA
IHZvaWQgX19pbml0IGNvcHlfZnJvbV9wYWRkcih2b2lkICpkc3QsIHBhZGRyX3QgcGFkZHIsIHVu
c2lnbmVkIGxvbmcgbGVuKQogICAgICAgICBzZXRfZml4bWFwKEZJWE1BUF9NSVNDLCBtYWRkcl90
b19tZm4ocGFkZHIpLCBQQUdFX0hZUEVSVklTT1JfV0MpOwogICAgICAgICBtZW1jcHkoZHN0LCBz
cmMgKyBzLCBsKTsKICAgICAgICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKGRzdCwgbCk7CisgICAg
ICAgIGNsZWFyX2ZpeG1hcChGSVhNQVBfTUlTQyk7CiAKICAgICAgICAgcGFkZHIgKz0gbDsKICAg
ICAgICAgZHN0ICs9IGw7CiAgICAgICAgIGxlbiAtPSBsOwogICAgIH0KLQotICAgIGNsZWFyX2Zp
eG1hcChGSVhNQVBfTUlTQyk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBwbGFjZV9tb2R1bGVz
KHN0cnVjdCBrZXJuZWxfaW5mbyAqaW5mbywKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
