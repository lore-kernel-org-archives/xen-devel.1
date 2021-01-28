Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C27C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 10:52:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC77E64DDA
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 10:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC77E64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76886.138930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54uo-0006ZY-OO; Thu, 28 Jan 2021 10:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76886.138930; Thu, 28 Jan 2021 10:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54uo-0006ZR-LW; Thu, 28 Jan 2021 10:52:42 +0000
Received: by outflank-mailman (input) for mailman id 76886;
 Thu, 28 Jan 2021 10:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l54uo-0006ZM-0Q
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:52:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71bd44a0-5442-4682-b827-cc0849d34abd;
 Thu, 28 Jan 2021 10:52:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 484F7ABC4;
 Thu, 28 Jan 2021 10:52:40 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 71bd44a0-5442-4682-b827-cc0849d34abd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611831160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KAow84qLD8N+zr7OzF+7p0tjdPl8yb3IS2nvpzuhb0M=;
	b=BkSsncyWPb2G/6E2+bpC4MwzeIdBZgEXOqOkwe/ZyOnBcplu0CThKJxmqByuRxsIm/f6Ln
	tl3eN9X0NNjB/940jLaJOH9Ntm3jn2mSBnfINfOLurAJPl74vYB0NM37S8tNcYa/7JttxI
	OLtx5J36zLxuK3VmIaf6dR/XVlTGc3U=
Subject: Re: [PATCH V5 09/22] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d83c0736-c5cb-23e1-1cb3-fefe6907f091@suse.com>
Date: Thu, 28 Jan 2021 11:52:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
> --- /dev/null
> +++ b/xen/include/xen/dm.h
> @@ -0,0 +1,41 @@
> +/*
> + * Copyright (c) 2016 Citrix Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_DM_H__
> +#define __XEN_DM_H__
> +
> +#include <xen/sched.h>
> +
> +struct dmop_args {
> +    domid_t domid;
> +    unsigned int nr_bufs;
> +    /* Reserve enough buf elements for all current hypercalls. */
> +    struct xen_dm_op_buf buf[2];

So this is then the patch where the public header needs including,
to satisfy this use of a struct declared there independent of what
xen/sched.h includes. In fact public/xen.h needs including here
as well, I think, for domid_t. Otoh I can't see why you include
xen/sched.h.

My previously given ack applies only with this properly sorted.

Jan

