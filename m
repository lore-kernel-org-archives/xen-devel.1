Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0377DC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A5F20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A5F20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAE-0006GY-Sn; Wed, 10 Apr 2019 14:25:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAC-0006Cz-Ru
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:20 +0000
X-Inumbo-ID: 77e94521-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77e94521-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227681"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:21 +0100
Message-ID: <20190410142408.22848-16-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 15/62] ts-debian-di-install: use gho to
 pick d-i
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142321.gMKTGu5myc3XO3k-NIULcUt1wMKrPWN0aJBfLI3NWDQ@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBvcmlnaW5hbCBjb2RlIHVz
ZWQgaG8gd2hpY2ggZ2F2ZSB1cyB0aGUgaG9zdCBzdWl0ZSwgYnV0IHdlIHdhbnRlZAp0aGUgZ3Vl
c3Qgc3VpdGUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpB
Y2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMt
ZGViaWFuLWRpLWluc3RhbGwgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtZGViaWFuLWRpLWluc3RhbGwgYi90
cy1kZWJpYW4tZGktaW5zdGFsbAppbmRleCA2MDA3OTcxMi4uMzYxYTE3MTAgMTAwNzU1Ci0tLSBh
L3RzLWRlYmlhbi1kaS1pbnN0YWxsCisrKyBiL3RzLWRlYmlhbi1kaS1pbnN0YWxsCkBAIC0xNTIs
OCArMTUyLDggQEAgc3ViIHNldHVwX25ldGJvb3QoJCQkKQogCWRpZSBpZiAkcnsgIiRnaG8tPntH
dWVzdH1fbmV0Ym9vdF9rZXJuZWwiIH0KIAl8fCAgICAgJHJ7ICIkZ2hvLT57R3Vlc3R9X25ldGJv
b3RfcmFtZGlzayIgfTsKIAotCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9LicvJy4kaG8tPntU
ZnRwfXtEaUJhc2V9LicvJy4ke2FyY2h9LicvJy4KLQkgICAgZGViaWFuX2d1ZXN0X2RpX3ZlcnNp
b24oJGhvKS4nLScuJGhvLT57U3VpdGV9OworCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9Licv
Jy4kZ2hvLT57VGZ0cH17RGlCYXNlfS4nLycuJHthcmNofS4nLycuCisJICAgIGRlYmlhbl9ndWVz
dF9kaV92ZXJzaW9uKCRnaG8pLictJy4kZ2hvLT57U3VpdGV9OwogCiAgICAgICAgIGlmICgke2Fy
Y2h9ID1+IG0vYW1kNjR8aTM4Ni8pIHsKIAkgICAgJGtlcm5lbCA9ICIkZGlfcGF0aC92bWxpbnV6
LXhlbiI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
