Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C45C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882D620850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882D620850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAp-0007fA-30; Wed, 10 Apr 2019 14:25:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAY-0006z0-Bp
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:42 +0000
X-Inumbo-ID: 85083628-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85083628-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227741"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:01 +0100
Message-ID: <20190410142408.22848-56-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 55/62] make-flight: shadow test: Disable
 kpti in guests
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142401.djioFUIaZWtGfQG-KUDxJe07VOdH-xvuxtHvJ0xJK_Y@z>

U2luY2UgU3BlY3RyZS9NZWx0ZG93biwgc2hhZG93IGhhcyBiZWVuIGEgbG90IHNsb3dlciwgZXNw
ZWNpYWxseSB3aXRoCktQVEkgaW4gdGhlIGd1ZXN0LiAgRW1waXJpY2FsbHksIHRvbyBzbG93ICh3
aXRoIHRoZSBrZXJuZWwgZnJvbSBEZWJpYW4Kc3RyZXRjaCkuCgpDQzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWFrZS1mbGlnaHQgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1m
bGlnaHQKaW5kZXggMTUxYjE0MzUuLjFlM2ViZDVjIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAor
KysgYi9tYWtlLWZsaWdodApAQCAtNDkzLDYgKzQ5Myw3IEBAIGRvX3NoYWRvd190ZXN0cyAoKSB7
CiAgICAgICAgICAgICAkZGViaWFuX3J1bnZhcnMgYWxsX2hvc3RmbGFncz0kbW9zdF9ob3N0Zmxh
Z3MKIAogICBkb19odm1fZGViaWFuX3Rlc3Rfb25lIGRlYmlhbmh2bSB4bCBzZWFiaW9zIGZhbHNl
ICcnIC1zaGFkb3cgXAorICAgICAgICAgICAgICAgICAgICAgICAgIGFsbF9ndWVzdF9saW51eF9i
b290X2FwcGVuZD1ub3B0aSBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgInhlbl9ib290X2Fw
cGVuZD1oYXA9ZmFsc2UiCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
