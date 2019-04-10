Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C26AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458C620850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458C620850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAH-0006M1-Pn; Wed, 10 Apr 2019 14:25:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAF-0006Ht-MD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:23 +0000
X-Inumbo-ID: 79674924-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79674924-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227694"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:31 +0100
Message-ID: <20190410142408.22848-26-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 25/62] persistent-net: Add overlay on
 installed systems >= stretch
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
Message-ID: <20190410142331.JgkZ1wJYLiBO1pwUnY83YgVDuWunAs5dCOUbbwj4MFs@z>

VGhpcyBwcmVwYXJlcyB0aGUgZ3JvdW5kIGZvciB0dXJuaW5nIG9mZiBuZXQuaWZuYW1lcy4gIFRo
ZSBhY3R1YWwKcnVsZXMgYXJlIGdhdGVkIG9uIG5ldC5pZm5hbWVzIHNvIHJpZ2h0IG5vdyB0aGVy
ZSBpcyBubyBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDcgKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBt
IGIvT3NzdGVzdC9EZWJpYW4ucG0KaW5kZXggNDE0Y2Q4OTcuLmUyNDZjMDEyIDEwMDY0NAotLS0g
YS9Pc3N0ZXN0L0RlYmlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpAQCAtNzk4LDYgKzc5
OCwxMyBAQCBzdWIgZGViaWFuX292ZXJsYXlzICgkJCkgewogICAgIH07CiAgICAgbXkgJHN1aXRl
ID0gJGhvLT57U3VpdGV9OwogICAgICRtYXliZS0+KCdvdmVybGF5Jyk7CisKKyAgICAjIEluIHN0
cmV0Y2ggYW5kIGxhdGVyLCBuZXQuaWZuYW1lcz0xLCB0aGUgZmRvLXN0eWxlIGBwcmVkaWN0YWJs
ZQorICAgICMgbmV0d29yayBkZXZpY2UgbmFtZXMnLCBpcyB0aGUgZGVmYXVsdDsgYnV0IGl0IGlz
IGFueXRoaW5nIGJ1dAorICAgICMgcHJlZGljdGFibGUsIHNvIHdlIGRpc2FibGUgaXQuICBJbnN0
ZWFkLCB3ZSByZXN0b3JlIHRoZQorICAgICMgNzUtcGVyc2lzdGVudC1uZXQtZ2VuZXJhdG9yIG1l
Y2hhbmlzbSBmcm9tIGplc3NpZSBhbmQgZWFybGllci4KKyAgICAkbWF5YmUtPigib3ZlcmxheS1w
ZXJzaXN0ZW50LW5ldCIpIGlmICRoby0+e1N1aXRlfSAhfiBtL3doZWV6eXxqZXNzaWUvOworCiAg
ICAgJG1heWJlLT4oIm92ZXJsYXktJHN1aXRlIik7CiAgICAgJG1heWJlLT4oJGN7T3ZlcmxheUxv
Y2FsfSwgJ292ZXJsYXktbG9jYWwudGFyJyk7CiAgICAgJG1heWJlLT4oIiRje092ZXJsYXlMb2Nh
bH0tJHN1aXRlIiwgJ292ZXJsYXktbG9jYWwtJHN1aXRlLnRhcicpOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
