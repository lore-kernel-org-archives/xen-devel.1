Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA3FC282DD
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7693F2186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7693F2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xK-00021e-Gt; Thu, 18 Apr 2019 16:32:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xJ-0001zr-Gk
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:09 +0000
X-Inumbo-ID: 828dba8c-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 828dba8c-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913773"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:50 +0100
Message-ID: <20190418163158.11408-14-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 13/21] TestSupport: Make "broken" set
 the step state too
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
Message-ID: <20190418163150.WF1BqqNiqDKIJgod3-BvfyVu6n0NjCKgdT7KVt6hcGA@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0g
Yi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGUyMThmZjM1Li44ZTIwMjQ0ZCAxMDA2NDQK
LS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBt
CkBAIC0yMzUsNiArMjM1LDE3IEBAIHN1YiBicm9rZW4gKCQ7JCkgewogICAgICMgbXVzdCBiZSBy
dW4gb3V0c2lkZSB0cmFuc2FjdGlvbgogICAgIG15ICRhZmZlY3RlZDsKICAgICAkbmV3c3Q9ICdi
cm9rZW4nIHVubGVzcyBkZWZpbmVkICRuZXdzdDsKKyAgICBldmFsIHsKKwkjIFRoaXMgaXMgbm90
IGFsd2F5cyBlZmZlY3RpdmUsIGJ1dCB3aGVuIHdlIHJlYWxseSBjYXJlIGlzCisJIyBzaXR1YXRp
b25zIHdoZXJlICRuZXdzdCBpcyBub3QgYGJyb2tlbicgKGVnIGBzdGFydmVkJykgYW5kCisJIyB3
ZSBhcmUgcnVubmluZyBpbiBFeGVjdXRpdmUgbW9kZSB1bmRlciBzZy1ydW4tam9iLCBhbmQgdGhl
bgorCSMgdGhpcyB3b3Jrcy4gIElmIHdlIGFyZSBydW5uaW5nIHVuZGVyIHNnLXJ1bi1qb2IsIHNn
LXJ1bi1qb2IKKwkjIHdpbGwgc2V0IHRoZSBzdGVwIHN0YXR1cyBpZiB3ZSBkb24ndCBtYW5hZ2Ug
aXQuCisJbXkgJHRlc3RpZCA9ICRFTlZ7J09TU1RFU1RfVEVTVElEJ30KKwkgICAgfHwgZGllICJP
U1NURVNUX1RFU1RJRCBub3Qgc2V0IjsKKwkkbWpvYmRiLT5zdGVwX2ZpbmlzaCgkdGVzdGlkLCAk
bmV3c3QpOworICAgIH07CisgICAgd2FybiAiZmFpbGVkIHRvIHNldCBzdGVwIHN0YXR1cyAkbmV3
c3Q6ICRAIiBpZiAkQDsKICAgICBkYl9yZXRyeSgkZmxpZ2h0LCdydW5uaW5nJywgJGRiaF90ZXN0
cyxbcXcoZmxpZ2h0cyldLCBzdWIgewogICAgICAgICAkYWZmZWN0ZWQ9ICRkYmhfdGVzdHMtPmRv
KDw8RU5ELCB7fSwgJG5ld3N0LCAkZmxpZ2h0LCAkam9iKTsKICAgICAgICAgICAgIFVQREFURSBq
b2JzIFNFVCBzdGF0dXM9PwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
