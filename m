Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9974C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:04:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9317320652
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9317320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hExia-0006vj-GI; Fri, 12 Apr 2019 15:03:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o30B=SO=citrix.com=prvs=99869dea8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hExiY-0006va-PM
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 15:03:50 +0000
X-Inumbo-ID: 2d714b91-5d34-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d714b91-5d34-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 15:03:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,341,1549929600"; d="scan'208";a="83447852"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23728.43204.197457.496929@mariner.uk.xensource.com>
Date: Fri, 12 Apr 2019 16:03:32 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190412100325.11699-1-wei.liu2@citrix.com>
References: <20190412100325.11699-1-wei.liu2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] xl: handle PVH type in
 apply_global_affinity_masks again
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412150332.WYeA67CWbvR8EHu4iXkYHK0ABUuD3bwvalLnz6d4mD8@z>

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIHhsOiBoYW5kbGUgUFZIIHR5cGUgaW4gYXBwbHlfZ2xv
YmFsX2FmZmluaXR5X21hc2tzIGFnYWluIik6Cj4gQSBjYWxsIHNpdGUgaW4gY3JlYXRlX2RvbWFp
biBjYW4gY2FsbCBpdCB3aXRoIFBWSCB0eXBlLiBUaGF0IHNpdGUgd2FzCj4gbWlzc2VkIGR1cmlu
ZyB0aGUgcmV2aWV3IG9mIDQ4ZGFiOTc2Ny4KPiAKPiBSZWluc3RhdGUgUFZIIHR5cGUgaW4gdGhl
IHN3aXRjaC4KPiAKPiBSZXBvcnRlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
