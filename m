Return-Path: <SRS0=t/ph=YK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25EDC4CECE
	for <xen-devel@archiver.kernel.org>; Thu, 17 Oct 2019 06:18:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B442054F
	for <xen-devel@archiver.kernel.org>; Thu, 17 Oct 2019 06:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85B442054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKz75-0005EF-Pb; Thu, 17 Oct 2019 06:18:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YAic=YK=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1iKz74-0005EA-9q
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 06:18:18 +0000
X-Inumbo-ID: e820ef6c-f0a5-11e9-a531-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e820ef6c-f0a5-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 06:18:17 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1iKz72-000NOe-2P; Thu, 17 Oct 2019 06:18:16 +0000
Date: Thu, 17 Oct 2019 07:18:16 +0100
From: Tim Deegan <tim@xen.org>
To: xen-devel@lists.xenproject.org
Message-ID: <20191017061816.GB89655@deinos.phlegethon.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: [Xen-devel] [PATCH] MAINTAINERS: drop Tim Deegan from 'The Rest'
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBoYXZlIG5vdCBiZWVuIGFjdGl2ZSBpbiB0aGlzIHJvbGUgZm9yIGEgd2hpbGUgbm93LgoKU2ln
bmVkLW9mZi1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUwppbmRleCA1MzNjZmRjMDhmLi5mNjBkNzY1YmFmIDEwMDY0NAotLS0g
YS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNTM3LDcgKzUzNyw2IEBAIE06CUph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KIE06CUp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+CiBNOglLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
CiBNOglTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci1NOglUaW0g
RGVlZ2FuIDx0aW1AeGVuLm9yZz4KIE06CVdlaSBMaXUgPHdsQHhlbi5vcmc+CiBMOgl4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKIFM6CVN1cHBvcnRlZAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
