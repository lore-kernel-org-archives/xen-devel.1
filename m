Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3800C43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 10:43:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8765620675
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 10:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8765620675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL3kW-0004KX-TS; Mon, 29 Apr 2019 10:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL3kV-0004KS-9A
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 10:43:03 +0000
X-Inumbo-ID: 8d83cce8-6a6b-11e9-9979-ab0760affa92
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d83cce8-6a6b-11e9-9979-ab0760affa92;
 Mon, 29 Apr 2019 10:42:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84627118"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 29 Apr 2019 11:42:34 +0100
Message-ID: <20190429104234.11970-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] TftpDiVersion_stretch: update
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429104234.rKrHeztz5xXdF6VwfvnfaeGvMBByqpVjLCKCY4nElm4@z>

V2UgbmVlZCB0byBrZWVwIHVwIHdpdGggYSBkLWkgdXBkYXRlIGJ5IERlYmlhbi4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHByb2R1
Y3Rpb24tY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcHJvZHVjdGlvbi1jb25maWcgYi9wcm9kdWN0aW9uLWNv
bmZpZwppbmRleCA1YjlmNWM4Mi4uODgyZGFiYzYgMTAwNjQ0Ci0tLSBhL3Byb2R1Y3Rpb24tY29u
ZmlnCisrKyBiL3Byb2R1Y3Rpb24tY29uZmlnCkBAIC05MCw3ICs5MCw3IEBAIFRmdHBOZXRib290
R3JvdXAgb3NzdGVzdAogIyBVcGRhdGUgd2l0aCAuL21nLWRlYmlhbi1pbnN0YWxsZXItdXBkYXRl
KC1hbGwpCiBUZnRwRGlWZXJzaW9uX3doZWV6eSAyMDE2LTA2LTA4CiBUZnRwRGlWZXJzaW9uX2pl
c3NpZSAyMDE4LTA2LTI2Ci1UZnRwRGlWZXJzaW9uX3N0cmV0Y2ggMjAxOC0xMS0yNworVGZ0cERp
VmVyc2lvbl9zdHJldGNoIDIwMTktMDQtMjkKIAogRGViaWFuU25hcHNob3RCYWNrcG9ydHNfamVz
c2llIGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMTkwMjA2VDIx
MTMxNFovCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
