Return-Path: <SRS0=tVhX=W6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D47C3A5A5
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 07:23:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FDB2054F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 07:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FDB2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i53A6-00031y-5L; Tue, 03 Sep 2019 07:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8NHq=W6=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1i53A4-00031m-Rg
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 07:23:32 +0000
X-Inumbo-ID: bb7983c2-ce1b-11e9-951b-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb7983c2-ce1b-11e9-951b-bc764e2007e4;
 Tue, 03 Sep 2019 07:23:32 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.1 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1i53A2-000MtV-Fp; Tue, 03 Sep 2019 07:23:30 +0000
Date: Tue, 3 Sep 2019 08:23:30 +0100
From: Tim Deegan <tim@xen.org>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190903072330.GA87282@deinos.phlegethon.org>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902145014.36442-2-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
Subject: Re: [Xen-devel] [PATCH v8 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTU6NTAgKzAxMDAgb24gMDIgU2VwICgxNTY3NDM5NDA5KSwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+IFRoZSBmbGFnIGlzIG5vdCBuZWVkZWQgc2luY2UgdGhlIGRvbWFpbiAnb3B0aW9ucycgY2Fu
IG5vdyBiZSB0ZXN0ZWQKPiBkaXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4
ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
