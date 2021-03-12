Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B507C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 17:01:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123176501C
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 17:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123176501C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97251.184682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlAP-0002Oo-EP; Fri, 12 Mar 2021 17:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97251.184682; Fri, 12 Mar 2021 17:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlAP-0002Oh-AX; Fri, 12 Mar 2021 17:01:37 +0000
Received: by outflank-mailman (input) for mailman id 97251;
 Fri, 12 Mar 2021 17:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKlAN-0002Oc-IC
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 17:01:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06094051-43f5-41f4-8075-c535e4242d14;
 Fri, 12 Mar 2021 17:01:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 076E7AF6C;
 Fri, 12 Mar 2021 17:01:34 +0000 (UTC)
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
X-Inumbo-ID: 06094051-43f5-41f4-8075-c535e4242d14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615568494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wf69Du+MLgMaQXV+2XCK++U9PYpPw4d/+aVude5uYdM=;
	b=huou5rQSqy1evNu3jQ4MJllsS6UTjgzrdKb7cae4uj0qXULCeZMrcJ8CrYcYZG4MYGTxiP
	8HCyjMLugPmU1uQ0GBmebDrRlUdYxCy9hBqI/9OhpQCCRfQ72Ms+isbWUTrc+HLRqbvjMX
	Vv8psU267oLe6PGIdEEQnlehyqE847E=
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5babc41-bbbd-5abc-ba24-089898746a2f@suse.com>
Date: Fri, 12 Mar 2021 18:01:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 16:24, Connor Davis wrote:
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -12,6 +12,7 @@
>  #include <xen/param.h>
>  #include <xen/serial.h>
>  #include <xen/cache.h>
> +#include <asm/processor.h>

Btw - changes like this one would better be split off, so
they would come with a justification / description. A file
like this one shouldn't really need to include processor.h,
so I'm curious what the requirement is.

Jan

