Return-Path: <SRS0=nVJm=AN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF2CC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2020 09:01:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD312088E
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2020 09:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="WEOpWT3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD312088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqv5X-00078Y-Co; Thu, 02 Jul 2020 09:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqv5V-00078T-JH
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 09:00:57 +0000
X-Inumbo-ID: 89a459ba-bc42-11ea-87ea-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89a459ba-bc42-11ea-87ea-12813bfff9fa;
 Thu, 02 Jul 2020 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593680456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=u/OOQ7QEogZlO8NIoN1DS/EdDXM56LmhZLHwVl9cVBs=;
 b=WEOpWT3hpCjyXVQpTvqDXEIW0L6dwK43ZCwTat2N/uF0S5okjkigKXHO
 wIxoKtI6v8yWqnjnKbPRC6dAP3NwgHxwS5xCCMKnwRgjzJ8xb4kKWsjHq
 YwDQDjZ0SFmw2824MqgBex8grkXJk1f2JFgdyiRmhXxwQYENfu+Y8tdD3 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: by4ASU/LdoqsYGCBXHu/F+KIfFHDaFiWCruCDUIDIlUofFeGWPhMXON5a4xiAJ1I+vf/gqk5zf
 en91MWrvUWecEk06jfJWCQEbgseK5xR6d8RvEWEsNE0ZqmnSUS3hdDx3KdSOJ/8jT3K/6fZHRO
 fflFNGDfBOwOpyDmTEWEHs2ecY6BYERXYtqArhEgnMICXqiWcxNm1yXEYxYyZx6jxpUpaNrm0u
 9O8FRCKrr8hGC2CQz9QubPvKZWAG4fckiod3lam302H6PBH2dgUi1A0zgoSs+7THZ4QOPSE6BO
 r6o=
X-SBRS: 2.7
X-MesageID: 21461513
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,303,1589256000"; d="scan'208";a="21461513"
Date: Thu, 2 Jul 2020 11:00:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200702090047.GX735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com, Jan
 Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 59bdc28c89..7b8289d436 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> +    uint8_t vmtrace_pt_order;

I've been thinking about this, and even though this is a domctl (so
not a stable interface) we might want to consider using a size (or a
number of pages) here rather than an order. IPT also supports
TOPA mode (kind of a linked list of buffers) that would allow for
sizes not rounded to order boundaries to be used, since then only each
item in the linked list needs to be rounded to an order boundary, so
you could for example use three 4K pages in TOPA mode AFAICT.

Roger.

