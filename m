Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BB8C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C4D20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77C4D20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEB6-0008PI-Hc; Wed, 10 Apr 2019 14:26:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078p-EN
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
X-Inumbo-ID: 874a9861-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 874a9861-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227756"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:57 +0100
Message-ID: <20190410142408.22848-52-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 51/62] dm restrict audit: always install
 (some) chiark-scripts
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
Message-ID: <20190410142357.bqEEj-VZ0gyzYh9MQEixL5vztShwKZ8u5DEvNt2xlX4@z>

SW4KICBkbSByZXN0cmljdCBhdWRpdDogaW5zdGFsbCBuZXdlciBjaGlhcmstc2NyaXB0cyBmb3Ig
ZmlzaGRlc2NyaXB0b3IKYXJyYW5nZW1lbnRzIHdlcmUgbWFkZSB0byBpbnN0YWxsIHN1aXRhYmxl
IGNoaWFyay1zY3JpcHRzIGZvcgpmb3IgamVzc2llIGFuZCBzdHJldGNoLgoKRm9yIGJ1c3RlciBh
bmQgbGF0ZXIsIHRoZSBtYWlubGluZSBEZWJpYW4gdmVyc2lvbiBvZiBjaGlhcmstc2NyaXB0cyBp
cwppbmRlZWQgc3VmZmljaWVudCwgYnV0IG5vdGhpbmcgaW5zdGFsbGVkIGl0LiAgRG8gdGhhdC4K
ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgot
LS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0
ZXN0L0RlYmlhbi5wbQppbmRleCA4ZDUzYmJlMS4uOWQ3ZDE1MTggMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvRGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC05OTcsNyArOTk3LDcgQEAg
ZC1pIGFwdC1zZXR1cC9hbm90aGVyIGJvb2xlYW4gZmFsc2UKIGQtaSBhcHQtc2V0dXAvbm9uLWZy
ZWUgYm9vbGVhbiBmYWxzZQogZC1pIGFwdC1zZXR1cC9jb250cmliIGJvb2xlYW4gZmFsc2UKIAot
ZC1pIHBrZ3NlbC9pbmNsdWRlIHN0cmluZyBvcGVuc3NoLXNlcnZlciwgbnRwLCBudHBkYXRlLCBl
dGh0b29sLCBjaGlhcmstdXRpbHMtYmluLCB3Z2V0LCAkZXh0cmFfcGFja2FnZXMKK2QtaSBwa2dz
ZWwvaW5jbHVkZSBzdHJpbmcgb3BlbnNzaC1zZXJ2ZXIsIG50cCwgbnRwZGF0ZSwgZXRodG9vbCwg
Y2hpYXJrLXV0aWxzLWJpbiwgY2hpYXJrLXNjcmlwdHMsIHdnZXQsICRleHRyYV9wYWNrYWdlcwog
CiBkLWkgZ3J1Yi1pbnN0YWxsZXIvZm9yY2UtZWZpLWV4dHJhLXJlbW92YWJsZSBib29sZWFuIHRy
dWUKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
