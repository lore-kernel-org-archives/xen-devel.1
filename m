Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F00C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3960A2183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3960A2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xM-00023s-HJ; Thu, 18 Apr 2019 16:32:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00021p-O7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:10 +0000
X-Inumbo-ID: 82e37e41-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82e37e41-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913774"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:51 +0100
Message-ID: <20190418163158.11408-15-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 14/21] tcl/JobDB-Executive: Do not
 squash "starved" status
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
Message-ID: <20190418163151.NfVfxhmIQic7RMxlrF_zJg-Bp4m6fEyLtEbibWv5ZeU@z>

dHMtaG9zdHMtYWxsb2NhdGUgaXMgZ29pbmcgdG8gc2V0IHRoZSBqb2Igc3RhdHVzIHRvIGBzdGFy
dmVkJwpzb21ldGltZXMsIGFuZCB0aGVuIGRpZS4gIGBzdGFydmVkJyBuZWVkcyB0byBiZSBhZGRl
ZCB0byB0aGUgbGlzdCBvZgpqb2Igc3RhdHVzZXMgdGhhdCBzZy1ydW4tam9iIGxlYXZlcyBhbG9u
ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHRjbC9Kb2JEQi1FeGVjdXRpdmUudGNsIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90Y2wvSm9iREItRXhlY3V0aXZlLnRjbCBiL3RjbC9K
b2JEQi1FeGVjdXRpdmUudGNsCmluZGV4IDU3ZGVkMDI1Li40ZjM0MDlhOSAxMDA2NDQKLS0tIGEv
dGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wKKysrIGIvdGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wKQEAg
LTU1LDYgKzU1LDcgQEAgcHJvYyBqb2Itc2V0LXN0YXR1cy11bmxvY2tlZCB7ZmxpZ2h0IGpvYiBz
dH0gewogCSAgICBVUERBVEUgam9icyBTRVQgc3RhdHVzPSckc3QnCiAJCVdIRVJFIGZsaWdodD0k
ZmxpZ2h0IEFORCBqb2I9JyRqb2InCiAJCSAgQU5EIHN0YXR1czw+J2Fib3J0ZWQnIEFORCBzdGF0
dXM8Pidicm9rZW4nCisgICAgICAgICAgICAgICAgICBBTkQgc3RhdHVzPD4nc3RhcnZlZCcKICAg
ICAiCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
