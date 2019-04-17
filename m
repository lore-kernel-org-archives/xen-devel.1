Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48977C282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F79C2173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F79C2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnZR-0005At-O6; Wed, 17 Apr 2019 16:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZQ-0005Ah-GU
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:00 +0000
X-Inumbo-ID: 27f3f3fc-612f-11e9-81a0-c3374dea2f6c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27f3f3fc-612f-11e9-81a0-c3374dea2f6c;
 Wed, 17 Apr 2019 16:37:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83816804"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 17:37:49 +0100
Message-ID: <20190417163752.994-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417163752.994-1-ian.jackson@eu.citrix.com>
References: <20190417163752.994-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 2/5] mg-repro-setup: Allow,
 and advertise, ^ for unsetting runvars
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
Message-ID: <20190417163749.L1OTM0Iznw-tetVXpDGR2rXoInlVXEcNlNhBChb2xIA@z>

VGhpcyBhdm9pZHMgYW55IHBvc3NpYmxlIHByb2JsZW1zIHdpdGggc2hlbGxzIG1pc2ludGVycHJl
dGluZyAhIGFuZCBpcwpjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIHJlY2VudCBjaGFuZ2VzIHJl
cGxhY2luZyAhIGZvciBuZWdhdGlvbgp3aXRoIF4uCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDggKysr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbWctcmVwcm8tc2V0dXAgYi9tZy1yZXByby1zZXR1cAppbmRleCBhYTkzYzBl
YS4uMzdjY2I1OWQgMTAwNzU1Ci0tLSBhL21nLXJlcHJvLXNldHVwCisrKyBiL21nLXJlcHJvLXNl
dHVwCkBAIC0zNyw3ICszNyw3IEBAIHVzYWdlICgpIHsgY2F0IDw8RU5ECiAgICAtLXJvZ3VlICAg
ICAgICAgICAgICBieXBhc3MgcXVldWluZyBzeXN0ZW0gYW5kIGFsbG9jYXRlIG5vdwogICAgLS1j
YXB0dXJlICAgICAgICAgICAgZG8gbm90IHN1cHByZXNzIGxvZyBjYXB0dXJlCiAgICAtcjx2YXI+
PTx2YWx1ZT4gICAgICBzZXQgcnVudmFyCi0gICAtciE8dmFyPiAgICAgICAgICAgICBkZWxldGUg
cnVudmFyCisgICAtcl48dmFyPiAgICAgICAgICAgICBkZWxldGUgcnVudmFyCiAgICAtQjxibGVz
c2luZz4JCWRlZmF1bHQgaXMgJ3BsYXknCiAgICAtRS4uLiAtZi4uLiAtUCAgICAgICBhcyBmb3Ig
bWctZXhlY3V0ZS1mbGlnaHQKICAgIC0tYXV0b2FsbG9jLW5vZnJlZSAgIGFsbG9jYXRlIGhvc3Rz
IGFzIGZvciBwcm9kdWN0aW9uLCBidXQga2VlcCB0aGVtCkBAIC03Nyw3ICs3Nyw5IEBAIHdoaWxl
IHRydWU7IGRvCiAJLS1jYXB0dXJlKQlza2lwY2FwdHVyZT1mYWxzZQkJOzsKIAktLWF1dG9hbGxv
Yy1ub2ZyZWUpIGF1dG9hbGxvYz10cnVlCQk7OwogCS1sKikJCWxvZ2ZpbGU9JHthcmcjLWx9CQk7
OwotCS1yISopCQlhZGp1c3RzZXRzKz0oIiR7YXJnIy1yfSIpCTs7CisJLXJeKnwtciEqKQlhZGp1
c3RzZXRzKz0oIiR7YXJnIy1yfSIpCTs7CisJIyBeIHR3byBwYXR0ZXJucyBiZWNhdXNlIHRoZXJl
J3Mgbm8gd2F5IGluIGJhc2ggdG8gd3JpdGUKKwkjICAgYSBnbG9iIGNoYXJhY3RlciBjbGFzcyB3
aGljaCBtYXRjaGVzIGV4YWN0bHkgXiBvciAhCiAJLXIqPSopCQlhZGp1c3RzZXRzKz0oIiR7YXJn
Iy1yfSIpCTs7CiAJLS0pCQlicmVhawkJCQk7OwogCSopCQliYWR1c2FnZQkJCTs7CkBAIC0xMDUs
NyArMTA3LDcgQEAgYWRqcnVudmFyICgpIHsKIAogZm9yIGFyZyBpbiAiJHthZGp1c3RzZXRzW0Bd
fSI7IGRvCiAJY2FzZSAiJGFyZyIgaW4KLQkhKikJZGVscnVudmFyICIke2FyZyMhfSIJCQk7Owor
CSEqfF4qKQlkZWxydW52YXIgIiR7YXJnIz99IgkJOzsKIAkqPSopCWFkanJ1bnZhciAiJHthcmcl
JT0qfSIgInskYXJnIyo9fSIJOzsKIAkqKQliYWQtYWRqdWlzdHNldC1wYXR0ZXJuCQkJOzsKIAll
c2FjCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
