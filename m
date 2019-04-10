Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF126C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E5520850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E5520850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAh-0007LZ-Lx; Wed, 10 Apr 2019 14:25:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAV-0006ro-Fp
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:39 +0000
X-Inumbo-ID: 82a2d16f-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82a2d16f-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227728"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:51 +0100
Message-ID: <20190410142408.22848-46-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 45/62] Debian: partman scripts: Run
 right away too
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
Message-ID: <20190410142351.sd3PuM8tS0EgAoTFOAE5Gcm03O-RV1cuDtRuNU-CCEU@z>

V2UgYXJlIHN3aXRjaGluZyB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZXNlIHRvIHBhcnRtYW4vZWFy
bHlfY29tbWFuZAp3aGljaCBydW5zIGFzIGEgcmVzdWx0IG9mIGEgL2xpYi9wYXJ0bWFuL2luaXQu
ZCBob29rLiAgVGhhdCBtZWFucyB0aGF0CnRoaW5ncyB3ZSBpbnN0YWxsIGRvbid0IGdldCBwaWNr
ZWQgdXAsIHNvIHJ1biB0aGVtIHJpZ2h0IGF3YXkgKHRvbykuCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5w
bSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmlu
ZGV4IGQxYjUyYjViLi45ZGVjMzIxZiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysr
IGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTExNTcsNyArMTE1Nyw3IEBAIHN1YiBwcmVzZWVkX2Ny
ZWF0ZSAoJCQ7QCkgewogICAgIG15ICRkX2kgPSAkaG8tPntUZnRwfXtQYXRofS4nLycuZGlfaW5z
dGFsbGVyX3BhdGgoJGhvKTsKIAogICAgIHByZXNlZWRfaG9va19pbnN0YWxsc2NyaXB0KCRobywg
JHNmeCwKLSAgICAgICAgICAnL2xpYi9wYXJ0bWFuL2luaXQuZCcsICcwMDBvdmVycmlkZS1wYXJ0
ZWQtZGV2aWNlcycsIDw8RU5EKTsKKyAgICAgICAgICAnL2xpYi9wYXJ0bWFuL2luaXQuZCcsICcw
MDBvdmVycmlkZS1wYXJ0ZWQtZGV2aWNlcycsIDw8RU5ELCAxKTsKICMhL2Jpbi9zaAogc2V0IC1l
eAogY2QgL2JpbgpAQCAtMTE3MSw3ICsxMTcxLDcgQEAgY2htb2QgK3ggcGFydGVkX2RldmljZXMK
IEVORAogCiAgICAgcHJlc2VlZF9ob29rX2luc3RhbGxzY3JpcHQoJGhvLCAkc2Z4LAotICAgICAg
ICAgICcvbGliL3BhcnRtYW4vaW5pdC5kJywgJzI1ZXJhc2Utb3RoZXItZGlza3MnLCA8PEVORCk7
CisgICAgICAgICAgJy9saWIvcGFydG1hbi9pbml0LmQnLCAnMjVlcmFzZS1vdGhlci1kaXNrcycs
IDw8RU5ELCAxKTsKICMhL2Jpbi9zaAogc2V0IC1leAogc3RhbXA9L3Zhci9lcmFzZS1vdGhlci1k
aXNrcy5zdGFtcAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
