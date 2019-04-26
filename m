Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146F5C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44D620693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44D620693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3up-0008DE-Nq; Fri, 26 Apr 2019 16:41:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3uo-0008Bj-54
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:34 +0000
X-Inumbo-ID: 24ca6f70-6842-11e9-809e-b371eaf24b5c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24ca6f70-6842-11e9-809e-b371eaf24b5c;
 Fri, 26 Apr 2019 16:41:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519715"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:56 +0100
Message-ID: <20190426164002.22381-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 09/15] arch replumbing:
 ts-debian-di-install: Use $gho->{Arch}
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
Message-ID: <20190426163956.KGax_vsfN0PIXfxuEKWviztROOlXkLYH5-Wd4F-FqbE@z>

VGhpcyBpcyBqdXN0IHRpZHlpbmcgdXAuICBUaGUgb25seSBlZmZlY3QgaXMgdGhhdCBub3cgdGhl
c2Ugd291bGQKaG9ub3VyICRye2FsbF9ndWVzdF9hcmNofSBhcyBhIGZhbGxiYWNrLiAgQnV0IHJp
Z2h0IG5vdywKJHJ7R1VFU1RfYXJjaH0gd2lsbCBhbHdheXMgYmUgc2V0LCBhbmQgdGhhdCBpcyB3
aGF0IGVuZHMgdXAgaW4KJGdoby0+e0FyY2h9LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZGViaWFuLWRpLWluc3RhbGwgfCAy
ICstCiB0cy1kZWJpYW4taW5zdGFsbCAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1kaS1pbnN0
YWxsIGIvdHMtZGViaWFuLWRpLWluc3RhbGwKaW5kZXggNWNiM2QzNWQuLjlhYmI0OTU2IDEwMDc1
NQotLS0gYS90cy1kZWJpYW4tZGktaW5zdGFsbAorKysgYi90cy1kZWJpYW4tZGktaW5zdGFsbApA
QCAtMTc0LDcgKzE3NCw3IEBAIEVORAogfQogCiBzdWIgZ2luc3RhbGwgKCkgewotICAgIG15ICRh
cmNoPSAkcnsiJGdoby0+e0d1ZXN0fV9hcmNoIn07CisgICAgbXkgJGFyY2g9ICRnaG8tPntBcmNo
fTsKICAgICBteSAkbWV0aG9kPSAkcnsiJGdoby0+e0d1ZXN0fV9tZXRob2QifTsKIAogICAgIG15
ICR0bXBkaXI9ICIvcm9vdC8kZmxpZ2h0LSRqb2ItZGkiOwpkaWZmIC0tZ2l0IGEvdHMtZGViaWFu
LWluc3RhbGwgYi90cy1kZWJpYW4taW5zdGFsbAppbmRleCA1YmJhZWFkMC4uZjA3ZGQ2NzYgMTAw
NzU1Ci0tLSBhL3RzLWRlYmlhbi1pbnN0YWxsCisrKyBiL3RzLWRlYmlhbi1pbnN0YWxsCkBAIC00
Nyw3ICs0Nyw3IEBAIHN1YiBwcmVwICgpIHsKIH0KIAogc3ViIGdpbnN0YWxsICgpIHsKLSAgICBt
eSAkYXJjaD0gJHJ7IiRnaG8tPntHdWVzdH1fYXJjaCJ9OworICAgIG15ICRhcmNoPSAkZ2hvLT57
QXJjaH07CiAgICAgbXkgJGFyY2hhcmc9IGRlZmluZWQoJGFyY2gpID8gIi0tYXJjaCAkYXJjaCIg
OiAnJzsKICAgICBteSAkZ3N1aXRlPSBkZWJpYW5fZ3Vlc3Rfc3VpdGUoJGdobyk7CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
