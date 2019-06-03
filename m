Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92B5C04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 13:01:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72CE27FA6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 13:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72CE27FA6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmZj-0007dN-HE; Mon, 03 Jun 2019 13:00:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXmZi-0007dI-Q8
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:00:30 +0000
X-Inumbo-ID: 90254a80-85ff-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 90254a80-85ff-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 13:00:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 07:00:28 -0600
Message-Id: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 07:00:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603130025.Ia3nlfYWpZKKnlRI7r8B4X7dChxS5Gb7bK6G_iaxezo@z>

VGhpcyByZXZlcnRzIGNvbW1pdCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVkNTZmOTJh
YjI1LiBUaGUgY2hhbmdlCndhcyByZWR1bmRhbnQgd2l0aCBhbWRfaW9tbXVfZGV0ZWN0X29uZV9h
Y3BpKCkgYWxyZWFkeSBjYWxsaW5nCnBjaV9yb19kZXZpY2UoKS4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2luaXQuYwpAQCAtMTAyMSw4ICsxMDIxLDYgQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxs
b2NhdGVfcHByX2xvZyhzdAogCiBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUo
c3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCiB7Ci0gICAgcGNpX2hpZGVfZGV2aWNlKGlvbW11LT5z
ZWcsIFBDSV9CVVMoaW9tbXUtPmJkZiksIFBDSV9ERVZGTjIoaW9tbXUtPmJkZikpOwotCiAgICAg
aWYgKCBtYXBfaW9tbXVfbW1pb19yZWdpb24oaW9tbXUpICE9IDAgKQogICAgICAgICBnb3RvIGVy
cm9yX291dDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
