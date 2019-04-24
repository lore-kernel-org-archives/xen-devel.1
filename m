Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 09:21:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE19E20656
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 09:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE19E20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJE5L-0004B3-C7; Wed, 24 Apr 2019 09:20:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJE5K-0004Ax-0z
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 09:20:58 +0000
X-Inumbo-ID: 43bdc57d-6672-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 43bdc57d-6672-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 09:20:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549929600"; d="scan'208";a="84274778"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 24 Apr 2019 11:20:37 +0200
Message-ID: <20190424092037.72003-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/include: propagate python interpreter path
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424092037.KYsm824TBjJW8Jij7kilo9s6urKIX9QTx809vRlUoxc@z>

VG8gdGhlIE1ha2VmaWxlIHRoYXQgZ2VuZXJhdGVzIHRoZSBjcHVpZCBwb2xpY3kuIFdpdGhvdXQg
dGhpcyBmaXggaWYKdGhlIHRvb2xzIHB5dGhvbiBpbnRlcnByZXRlciBpcyBkaWZmZXJlbnQgdGhh
biB0aGUgZGVmYXVsdCAncHl0aG9uJyBpdAp3b24ndCBiZSBjb3JyZWN0bHkgcHJvcGFnYXRlZC4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9pbmNsdWRlL01ha2VmaWxlIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZSBiL3Rvb2xzL2luY2x1ZGUvTWFrZWZpbGUKaW5k
ZXggZDY5MzgxMDA1My4uNzE1MzhlMWNlMiAxMDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9NYWtl
ZmlsZQorKysgYi90b29scy9pbmNsdWRlL01ha2VmaWxlCkBAIC0zMiw3ICszMiw3IEBAIGVuZGlm
CiAJdG91Y2ggJEAKIAogYWxsLSQoQ09ORklHX1g4Nik6IHhlbi8uZGlyCi0JJChNQUtFKSAtQyB4
ZW4vbGliL3g4NiBhbGwgWEVOX1JPT1Q9JChYRU5fUk9PVCkKKwkkKE1BS0UpIC1DIHhlbi9saWIv
eDg2IGFsbCBYRU5fUk9PVD0kKFhFTl9ST09UKSBQWVRIT049JChQWVRIT04pCiAKICMgTm90IHhl
bi94c20gYXMgdGhhdCBjbGFzaGVzIHdpdGggbGluayB0bwogIyAkKFhFTl9ST09UKS94ZW4vaW5j
bHVkZS9wdWJsaWMveHNtIGFib3ZlLgotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
