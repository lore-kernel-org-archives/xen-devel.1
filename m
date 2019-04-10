Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCEDC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D1720850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D1720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAO-0006Yu-0k; Wed, 10 Apr 2019 14:25:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAK-0006Rf-J8
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:28 +0000
X-Inumbo-ID: 7c82804c-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c82804c-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227702"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:36 +0100
Message-ID: <20190410142408.22848-31-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 30/62] persistent-net: Include initramfs
 script to copy to target
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
Message-ID: <20190410142336.A3iAh5FhYXflFtt6xMjJ_wGqWK21LqrLjAXQ_Egj_Y0@z>

VGhpcyBpcyB0aGUgcGllY2Ugd2hpY2ggYWN0dWFsbHkgY29waWVzIHRoZSBpbnN0YWxsZXIncyBu
ZXR3b3JrIG5hbWVzCnRvIHRoZSB0YXJnZXQuICBJdCBzaG91bGQgbm90IGFwcGVhciBvbiB0aGUg
aW5zdGFsbGVkIHN5c3RlbSwgc28gaXQncwpub3QgaW4gb3ZlcmxheS1wZXJzaXN0ZW50LW5ldC4K
ClRlY2huaWNhbGx5IHRoaXMgaXMgb25seSB1c2VmdWwgd2hlbiB0aGUgaW5zdGFsbGVyIGhhcyB0
aGUKb3ZlcmxheS1wZXJzaXN0ZW50LW5ldCBpbiBpdCwgd2hpY2ggaXMgZG9uZSBvbmx5IGluIHRz
LWhvc3QtaW5zdGFsbAphbmQgbm90IGluIGFsbCB0aGUgcGxhY2VzIHdoZXJlIHNldHVwX25ldGJv
b3RfZmlyc3Rib290IGlzIHVzZWQuCkJ1dCB3aXRob3V0IG92ZXJsYXktcGVyc2lzdGVudC1uZXQg
aXQgaXMgaGFybWxlc3MsIGFuZCBpdCBpcyBtb3N0CmNvbnZlbmllbnQgdG8gcHV0IGl0IGhlcmUu
CgpUaGUgbGl0dGxlIHNjcmlwdCBmcmFnbWVudCB3YXMgY29waWVkIG91dCBvZiBhIGplc3NpZSBk
ZWJpYW4taW5zdGFsbGVyCmluaXRyYW1mcyBlbnZpcm9ubWVudC4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFu
LnBtIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4
IGUyNDZjMDEyLi42MzA5YjI0NiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIv
T3NzdGVzdC9EZWJpYW4ucG0KQEAgLTg0OCw2ICs4NDgsMTkgQEAgaWYgWyAtZiAvdGFyZ2V0JGdy
dWIgXSA7IHRoZW4KIGZpCiBFTkQKIAorICAgICMgU2VlIGNvbW1lbnQgaW4gZGViaWFuX292ZXJs
YXlzIHJlIG5ldC5pZm5hbWVzPTEKKyAgICAkaG8tPntTdWl0ZX0gPX4gbS9qZXNzaWV8d2hlZXp5
LyBvcgorCXByZXNlZWRfaG9va19pbnN0YWxsc2NyaXB0KCRobywgJHNmeCwKKyAgICAgICAgICAg
ICcvdXNyL2xpYi9iYXNlLWluc3RhbGxlci5kLycsICcwNXVkZXYnLCA8PCdFTkQnKTsKKyMhL2Jp
bi9zaCAtZQorCitSVUxFU0RJUj1ldGMvdWRldi9ydWxlcy5kCisKK21rZGlyIC1wIC90YXJnZXQv
JFJVTEVTRElSCitjcCAvJFJVTEVTRElSLzcwLXBlcnNpc3RlbnQtKi5ydWxlcyAvdGFyZ2V0LyRS
VUxFU0RJUiAyPi9kZXYvbnVsbCB8fCB0cnVlCisKK0VORAorCiAgICAgZGViaWFuX292ZXJsYXlz
KCRobywgc3ViIHsKIAlteSAoJHNyY2RpciwgJHRmaWxlbmFtZSkgPSBAXzsKIAlwcmVzZWVkX2hv
b2tfb3ZlcmxheSgkaG8sICRzZngsICRzcmNkaXIsICR0ZmlsZW5hbWUpOwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
