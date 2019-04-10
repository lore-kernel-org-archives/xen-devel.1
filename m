Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF3CC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626F420854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626F420854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAJ-0006Oe-0j; Wed, 10 Apr 2019 14:25:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAG-0006Iz-7G
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:24 +0000
X-Inumbo-ID: 79c14eb4-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79c14eb4-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227695"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:32 +0100
Message-ID: <20190410142408.22848-27-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 26/62] persistent-net: Add overlay in
 installer >= stretch
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
Message-ID: <20190410142332.lP9bU04B1TCB5cmLK-rXGBHLkZ1zT3uxy--Tq9XF9zQ@z>

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdGhpcyBpbiB0aGUgaW5zdGFsbGVyIHNvIHRoYXQgdGhlIGlu
dGVyZmFjZSBuYW1lcwpmcm9tIHRoZSBpbnN0YWxsZXIgZW52aXJvbm1lbnQgYXJlIGNhcHR1cmVk
IHNvIHRoYXQgdGhleSBjYW4gYmUgdGhlCnNhbWUgb24gdGhlIGhvc3QuCgpUaGlzIHByZXBhcmVz
IHRoZSBncm91bmQgZm9yIHR1cm5pbmcgb2ZmIG5ldC5pZm5hbWVzLiAgVGhlIGFjdHVhbApydWxl
cyBhcmUgZ2F0ZWQgb24gbmV0LmlmbmFtZXMgc28gcmlnaHQgbm93IHRoZXJlIGlzIG5vIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHRzLWhvc3QtaW5zdGFsbCB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFs
bAppbmRleCA5YWIzZGU2Mi4uOGVhODFlMjQgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAor
KysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTE4OCw2ICsxODgsMTMgQEAgc3ViIHNldHVwX25ldGJv
b3RfZmlyc3Rib290KCQpIHsKICAgICBzeXN0ZW0gcXcocm0gLXJmIC0tKSwiJGluaXRyZF9vdmVy
bGF5LmQiOwogICAgIG1rZGlyICIkaW5pdHJkX292ZXJsYXkuZCIgb3IgZGllICIkaW5pdHJkX292
ZXJsYXkuZDogJCEiOwogCisgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL3doZWV6eXxqZXNzaWUv
KSB7CisJbXkgQGNtZCA9IChxdyhjcCAtZFIgb3ZlcmxheS1wZXJzaXN0ZW50LW5ldC8uKSwKKwkJ
ICAgIiRpbml0cmRfb3ZlcmxheS5kLy4iKTsKKwlsb2dtKCJ1c2luZyBwZXJzaXN0ZW50LW5ldC1n
ZW5lcmF0b3I6IEBjbWQiKTsKKwlzeXN0ZW1fY2hlY2tlZCBAY21kOworICAgIH0KKwogICAgIG15
ICRpcGFwcGVuZCA9IDI7CiAgICAgbXkgJHdhbnRwaHlzaWY9IGdldF9ob3N0X3Byb3BlcnR5KCRo
bywnaW50ZXJmYWNlIGZvcmNlJywnYXV0bycpOwogICAgIGxvZ20oIkZvcmNpbmcgaW50ZXJmYWNl
ICR3YW50cGh5c2lmIik7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
