Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0877CC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43612173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43612173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnZT-0005BQ-9z; Wed, 17 Apr 2019 16:38:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZR-0005Aw-Vd
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:02 +0000
X-Inumbo-ID: 2a355f15-612f-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a355f15-612f-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 16:38:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83816817"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 17:37:47 +0100
Message-ID: <20190417163752.994-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 0/5] Debian stretch HVM guest
 workarounds
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
Message-ID: <20190417163747.3N5rdmzwMC5tncLim2CJBTpaMjVtJ6Aeb2eu7vticr4@z>

VGhlIERlYmlhbiBIVk0gdGVzdHMgYXJlIGJyb2tlbiB3aXRoIDMyLWJpdCBndWVzdHMsIGR1ZSB0
byBidWdzIGFuZAppbmZlbGljaXRpZXMgaW4gc3RyZXRjaC4gIFRoaXMgaXMgYmxvY2tpbmcgdGhp
bmdzLiAgRml4IGl0LiAgSSB3aWxsCnB1c2ggdGhpcyBzZXJpZXMgdG8gb3NzdGVzdCBwcmV0ZXN0
IHJpZ2h0IGF3YXkuCgpJYW4gSmFja3NvbiAoNSk6CiAgZGViaWFuaHZtIHRlc3RzOiBSZS1wZXJt
dXRlIGd1ZXN0IGFyY2hpdGVjdHVyZQogIG1nLXJlcHJvLXNldHVwOiBBbGxvdywgYW5kIGFkdmVy
dGlzZSwgXiBmb3IgdW5zZXR0aW5nIHJ1bnZhcnMKICB0cy1kZWJpYW4taHZtLWluc3RhbGw6IFVz
ZSAtLS0sIGFuZCBubyBsb25nZXIgZHVwbGljYXRlICRnY29uc29sZQogIHRzLWRlYmlhbi1odm0t
aW5zdGFsbDogRGlzYWJsZSBuZXQuaWZuYW1lcyBmb3IgRGViaWFuIEhWTSBndWVzdHMKICBEZWJp
YW46IFdvcmsgYXJvdW5kIERlYmlhbiBzdHJldGNoIGJ1ZyB3aXRoIGRpc2sgZGV2aWNlIG5hbWVz
CgogT3NzdGVzdC9EZWJpYW4ucG0gICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwogbWFrZS1m
bGlnaHQgICAgICAgICAgIHwgMTEgKysrKysrKystLS0KIG1nLXJlcHJvLXNldHVwICAgICAgICB8
ICA4ICsrKysrLS0tCiB0cy1kZWJpYW4taHZtLWluc3RhbGwgfCAxNCArKysrKysrKysrLS0tLQog
NCBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
