Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9E2C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C2220850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C2220850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAz-00085D-As; Wed, 10 Apr 2019 14:26:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAb-00075Y-5R
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:45 +0000
X-Inumbo-ID: 860fa03f-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 860fa03f-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227740"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:00 +0100
Message-ID: <20190410142408.22848-55-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 54/62] ts-debian-hvm-install: Honour
 linux_boot_append target var
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
Message-ID: <20190410142400.WW_HxlqTVLQVj-7LaJ-DEqtjPQFQdDjutjw83xDjHGQ@z>

VGhpcyBsb29rcyBmb3I6CiAgPGd1ZXN0Pl9saW51eF9ib290X2FwcGVuZAogIGFsbF9ndWVzdF9s
aW51eF9ib290X2FwcGVuZAoKTm90aGluZyBzZXRzIHRoZXNlIHlldC4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWRlYmlhbi1o
dm0taW5zdGFsbCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdHMtZGViaWFuLWh2bS1pbnN0YWxsIGIvdHMtZGViaWFuLWh2bS1pbnN0YWxsCmlu
ZGV4IDU0ZDVkMWMyLi5lZDg4MDNlZCAxMDA3NTUKLS0tIGEvdHMtZGViaWFuLWh2bS1pbnN0YWxs
CisrKyBiL3RzLWRlYmlhbi1odm0taW5zdGFsbApAQCAtMTI5LDYgKzEyOSw5IEBAIHN1YiBnY21k
bGluZSAoOyQpIHsKIAkJCQkJICAgIFByZXNlZWRTY2hlbWUgPT4gJ2ZpbGUnKTsKICAgICBwdXNo
IEBkaWNtZGxpbmUsICRleHRyYSBpZiAkZXh0cmE7CiAKKyAgICBteSAkYXBwZW5kID0gdGFyZ2V0
X3ZhcigkZ2hvLCdsaW51eF9ib290X2FwcGVuZCcpOworICAgIHB1c2ggQGRpY21kbGluZSwgJGFw
cGVuZCBpZiAkYXBwZW5kOworCiAgICAgcHVzaCBAZGljbWRsaW5lLCAiLS0iOwogICAgICMgU2Vl
IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9NzYyMDA3
IGZvcgogICAgICMgd2h5IGNvbnNvbGU9IGlzIHJlcGVhdGVkLgotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
