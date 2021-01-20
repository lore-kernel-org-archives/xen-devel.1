Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FDDC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 16:22:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D9D233E2
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 16:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D9D233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71609.128350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GEc-0004Pm-L1; Wed, 20 Jan 2021 16:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71609.128350; Wed, 20 Jan 2021 16:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GEc-0004Pf-HL; Wed, 20 Jan 2021 16:21:30 +0000
Received: by outflank-mailman (input) for mailman id 71609;
 Wed, 20 Jan 2021 16:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2GEb-0004Pa-8J
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:21:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93f6bcf7-658f-42d7-81cb-f86044084aaf;
 Wed, 20 Jan 2021 16:21:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9ABA2B805;
 Wed, 20 Jan 2021 16:21:27 +0000 (UTC)
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
X-Inumbo-ID: 93f6bcf7-658f-42d7-81cb-f86044084aaf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611159687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JW55xmASWjRXetCJ9YiPD6Oh37dIkyG+xcdu/d/lBfU=;
	b=mRyjyzFEcvd6RAfllAhSzdB8hy5MWqhDQycYQ8EFxyuzhsfXQo/vXBCzHtGgxC/usPPXic
	vn6y7phMh0d0NQAnosyQtXVY0mXd5ofaA6WugO7lJP1+zvh/hBc0pCIrEqEu3cGHpeSwOB
	6CFf2uJL4k3xDO8e1TWPhr1bUlAdK4s=
Subject: Re: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op
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
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <016657f8-371f-eba6-60ce-29741f0823b7@suse.com>
Date: Wed, 20 Jan 2021 17:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves the IOREQ related dm-op handling to the common code.
> 
> The idea is to have the top level dm-op handling arch-specific
> and call into ioreq_server_dm_op() for otherwise unhandled ops.
> Pros:
> - More natural than doing it other way around (top level dm-op
> handling common).
> - Leave compat_dm_op() in x86 code.
> Cons:
> - Code duplication. Both arches have to duplicate do_dm_op(), etc.
> 
> Also update XSM code a bit to let dm-op be used on Arm.
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Assuming the moved code is indeed just being moved (which is
quite hard to ascertain by just looking at the diff),
applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

