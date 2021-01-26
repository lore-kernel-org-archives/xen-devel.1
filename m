Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C1CC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:16:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93D6206E5
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 09:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93D6206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74672.134192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KS1-0004hx-HZ; Tue, 26 Jan 2021 09:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74672.134192; Tue, 26 Jan 2021 09:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KS1-0004hq-Eb; Tue, 26 Jan 2021 09:15:53 +0000
Received: by outflank-mailman (input) for mailman id 74672;
 Tue, 26 Jan 2021 09:15:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KRz-0004hl-St
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:15:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbcd273d-2be0-4931-b7fc-bb0718d39d03;
 Tue, 26 Jan 2021 09:15:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BF76B2C5;
 Tue, 26 Jan 2021 09:15:50 +0000 (UTC)
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
X-Inumbo-ID: dbcd273d-2be0-4931-b7fc-bb0718d39d03
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611652550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukZDcrCHahxAwFcetXyANyapzGMUJH+kMCl2CGjM00A=;
	b=N4fJagN1DgOMv21SuWrVaN2ANqR5DqkFd02HUEmKs6ssRbxTBZAWY9dwIrHLG8USrgebGK
	xVbTFrHV2BBdFBQw+fU5bxV/KJpLUtkgdclQQ2SJEXbsKnzvxiWT6k9ovsfaub1ZeJpo5o
	gSg5gwK6q9z1vcNU3eqdUt0eq++Iu0o=
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
Date: Tue, 26 Jan 2021 10:15:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/dm.h
> +++ b/xen/include/xen/dm.h
> @@ -19,6 +19,8 @@
>  
>  #include <xen/sched.h>
>  
> +#include <public/hvm/dm_op.h>
> +
>  struct dmop_args {
>      domid_t domid;
>      unsigned int nr_bufs;

How come this becomes necessary at this point in the series, when
nothing else in this header changes, and nothing changes in the
public headers at all? Is it perhaps a .c file that needs the
#include instead? Headers shouldn't pull in other headers without
clear need - as indicated in reply to a prior version, we have
way too many bad examples (causing headaches in certain cases),
and we'd like to avoid gaining more. (Oh, I notice you actually
have a post-commit-message remark about this, but then this
patch should be marked RFC until the issue was resolved.)

Jan

