Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDBFC2D0C3
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:58:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA36227BF
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 12:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA36227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYtr-00021I-Al; Wed, 18 Dec 2019 12:57:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sbub=2I=arm.com=mark.brown@srs-us1.protection.inumbo.net>)
 id 1ihYaf-00085Z-Rk
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:38:09 +0000
X-Inumbo-ID: 39f4df2e-2193-11ea-88e7-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 39f4df2e-2193-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 12:38:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03A0B30E;
 Wed, 18 Dec 2019 04:38:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 766853F6CF;
 Wed, 18 Dec 2019 04:37:59 -0800 (PST)
From: Mark Brown <broonie@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Wed, 18 Dec 2019 12:37:56 +0000
Message-Id: <20191218123756.41363-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:57:57 +0000
Subject: [Xen-devel] [PATCH] arm64: xen: Use modern annotations for assembly
 functions
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
Cc: xen-devel@lists.xenproject.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gYW4gZWZmb3J0IHRvIGNsYXJpZnkgYW5kIHNpbXBsaWZ5IHRoZSBhbm5vdGF0aW9uIG9mIGFz
c2VtYmx5IGZ1bmN0aW9ucwppbiB0aGUga2VybmVsIG5ldyBtYWNyb3MgaGF2ZSBiZWVuIGludHJv
ZHVjZWQuIFRoZXNlIHJlcGxhY2UgRU5UUlkgYW5kCkVORFBST0MuIFVwZGF0ZSB0aGUgYW5ub3Rh
dGlvbnMgaW4gdGhlIHhlbiBjb2RlIHRvIHRoZSBuZXcgbWFjcm9zLgoKU2lnbmVkLW9mZi1ieTog
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgotLS0KClRoaXMgaXMgcGFydCBvZiBhIHdp
ZGVyIGVmZm9ydCB0byBjb252ZXJ0IGFsbCB0aGUgYXJjaC9hcm02NCBjb2RlLgoKIGFyY2gvYXJt
NjQveGVuL2h5cGVyY2FsbC5TIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L3hlbi9oeXBl
cmNhbGwuUyBiL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCmluZGV4IGM1ZjA1YzRhNGQwMC4u
MzA1YzIyNzRiOGViIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUworKysg
Yi9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUwpAQCAtNTYsMTEgKzU2LDExIEBACiAjZGVmaW5l
IFhFTl9JTU0gMHhFQTEKIAogI2RlZmluZSBIWVBFUkNBTExfU0lNUExFKGh5cGVyY2FsbCkJCVwK
LUVOVFJZKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCQkJXAorU1lNX0ZVTkNfU1RBUlQoSFlQRVJW
SVNPUl8jI2h5cGVyY2FsbCkJCQlcCiAJbW92IHgxNiwgI19fSFlQRVJWSVNPUl8jI2h5cGVyY2Fs
bDsJXAogCWh2YyBYRU5fSU1NOwkJCQlcCiAJcmV0OwkJCQkJXAotRU5EUFJPQyhIWVBFUlZJU09S
XyMjaHlwZXJjYWxsKQorU1lNX0ZVTkNfRU5EKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCiAKICNk
ZWZpbmUgSFlQRVJDQUxMMCBIWVBFUkNBTExfU0lNUExFCiAjZGVmaW5lIEhZUEVSQ0FMTDEgSFlQ
RVJDQUxMX1NJTVBMRQpAQCAtODYsNyArODYsNyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7CiBI
WVBFUkNBTEwyKHZtX2Fzc2lzdCk7CiBIWVBFUkNBTEwzKGRtX29wKTsKIAotRU5UUlkocHJpdmNt
ZF9jYWxsKQorU1lNX0ZVTkNfU1RBUlQocHJpdmNtZF9jYWxsKQogCW1vdiB4MTYsIHgwCiAJbW92
IHgwLCB4MQogCW1vdiB4MSwgeDIKQEAgLTEwOSw0ICsxMDksNCBAQCBFTlRSWShwcml2Y21kX2Nh
bGwpCiAJICovCiAJdWFjY2Vzc190dGJyMF9kaXNhYmxlIHg2LCB4NwogCXJldAotRU5EUFJPQyhw
cml2Y21kX2NhbGwpOworU1lNX0ZVTkNfRU5EKHByaXZjbWRfY2FsbCk7Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
