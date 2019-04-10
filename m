Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47A3C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CDC820854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CDC820854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEEA-0003tx-Je; Wed, 10 Apr 2019 14:29:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEE9-0003tA-Bz
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:29:25 +0000
X-Inumbo-ID: 7d0c1dd5-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d0c1dd5-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227703"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:37 +0100
Message-ID: <20190410142408.22848-32-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 31/62] persistent-net: Set net.ifnames=0
 in di_installcmdline_core
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142337.taDPjqdK4ywIdXKXLWb6BRNxYiQ0WOQCIHw9xrFSlsw@z>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0
L0RlYmlhbi5wbSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDYz
MDliMjQ2Li5hZmY1YWNkNSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3Nz
dGVzdC9EZWJpYW4ucG0KQEAgLTgxLDYgKzgxLDExIEBAIHN1YiBkZWJpYW5fYm9vdF9zZXR1cCAo
JCQkJCQ7JCkgewogICAgICAgICAka29wdCAuPSAnICcuJHRhcmdrb3B0OwogICAgIH0KIAorICAg
ICMgaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvU29mdHdhcmUvc3lzdGVtZC9QcmVk
aWN0YWJsZU5ldHdvcmtJbnRlcmZhY2VOYW1lcy8KKyAgICAjIEluIGZhY3QgdGhlc2UgYXJlIGFu
eXRoaW5nIGJ1dCBwcmVkaWN0YWJsZS4gIFdlIHVzZSB0aGUgc2NoZW1lCisgICAgIyBmcm9tIERl
YmlhbiBqZXNzaWUgYW5kIGVhcmxpZXIsIHBlcnNpc3RlbnQtbmV0LWdlbmVyYXRvciBldGMuCisg
ICAgJGtvcHQgLj0gJyBuZXQuaWZuYW1lcz0wJzsKKwogICAgIGZvcmVhY2ggbXkgJGhvb2sgKCRo
b29rcyA/IEAkaG9va3MgOiAoKSkgewogICAgICAgICBteSAkYm9faG9vaz0gJGhvb2stPntFZGl0
Qm9vdE9wdGlvbnN9OwogICAgICAgICAkYm9faG9vay0+KCRobywgXCR4ZW5ob3B0LCBcJGtvcHQp
IGlmICRib19ob29rOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
