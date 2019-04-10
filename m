Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DE7C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB1420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB1420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAT-0006lu-2S; Wed, 10 Apr 2019 14:25:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAN-0006XU-K1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:31 +0000
X-Inumbo-ID: 7e98607e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e98607e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227709"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:41 +0100
Message-ID: <20190410142408.22848-36-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 35/62] TestSupport: Move
 `target_somefile_getleaf' earlier
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
Message-ID: <20190410142341.jL4uRRkWZLCpTlN9InfeRVfIfRjh51fnktfdA-e5SC4@z>

V2UgYXJlIGdvaW5nIHRvIG1ha2UgbW9yZSB1c2Ugb2YgdGhpcyBpbiBpbnRlcnZlbmluZyBjb2Rl
LgoKUHVyZSBjb2RlIG1vdGlvbi4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAxOCArKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0KaW5kZXggY2UzNDYwOTcuLjRlMmYxMjBhIDEwMDY0NAotLS0gYS9Pc3N0ZXN0
L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAgLTUwNCw2ICs1
MDQsMTUgQEAgc3ViIHJlbW90ZV9wZXJsX3NjcmlwdF9kb25lICgkKSB7CiAgICAgISQ/IG9yIGRp
ZSAiJHRoaW5nLT57V2hhdH0gJD8iOwogfQogCitzdWIgdGFyZ2V0X3NvbWVmaWxlX2dldGxlYWYg
KCQkJCkgeworICAgIG15ICgkbGxlYWZfcmVmLCAkcmRlc3QsICRobykgPSBAXzsKKyAgICBpZiAo
IWRlZmluZWQgJCRsbGVhZl9yZWYpIHsKKyAgICAgICAgJCRsbGVhZl9yZWY9ICRyZGVzdDsKKyAg
ICAgICAgJCRsbGVhZl9yZWYgPX4gcywuKi8sLDsKKyAgICB9CisgICAgJCRsbGVhZl9yZWY9IGhv
c3RuYW1lcGF0aCgkaG8pLiItLSQkbGxlYWZfcmVmIjsKK30KKwogc3ViIHNzaHVobyAoJCQpIHsg
bXkgKCR1c2VyLCRobyk9IEBfOyByZXR1cm4gIiR1c2VyXEAkaG8tPntJcH0iOyB9CiAKIHN1YiBz
c2hvcHRzICgpIHsKQEAgLTU5MSwxNSArNjAwLDYgQEAgc3ViIHRhcmdldF9pbnN0YWxsX3BhY2th
Z2VzX25vcmVjICgkQCkgewogICAgIHRhcmdldF9ydW5fcGtnbWFuYWdlcl9pbnN0YWxsKCRobyxc
QHBhY2thZ2VzLDEpOwogfQogCi1zdWIgdGFyZ2V0X3NvbWVmaWxlX2dldGxlYWYgKCQkJCkgewot
ICAgIG15ICgkbGxlYWZfcmVmLCAkcmRlc3QsICRobykgPSBAXzsKLSAgICBpZiAoIWRlZmluZWQg
JCRsbGVhZl9yZWYpIHsKLSAgICAgICAgJCRsbGVhZl9yZWY9ICRyZGVzdDsKLSAgICAgICAgJCRs
bGVhZl9yZWYgPX4gcywuKi8sLDsKLSAgICB9Ci0gICAgJCRsbGVhZl9yZWY9IGhvc3RuYW1lcGF0
aCgkaG8pLiItLSQkbGxlYWZfcmVmIjsKLX0KLQogc3ViIHRwZmNzX2NvcmUgewogICAgIG15ICgk
dHB1dGZpbGVmLCRobywkdGltZW91dCwkZmlsZWRhdGEsICRyZGVzdCwkbGxlYWYpID0gQF87CiAg
ICAgdGFyZ2V0X3NvbWVmaWxlX2dldGxlYWYoXCRsbGVhZiwkcmRlc3QsJGhvKTsKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
