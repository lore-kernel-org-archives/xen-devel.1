Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3C9C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:10:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2E1561040
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2E1561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105686.202130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgmx-0004Zy-BO; Tue, 06 Apr 2021 08:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105686.202130; Tue, 06 Apr 2021 08:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgmx-0004Zr-8W; Tue, 06 Apr 2021 08:10:19 +0000
Received: by outflank-mailman (input) for mailman id 105686;
 Tue, 06 Apr 2021 08:10:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgmv-0004Zm-Ua
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 08:10:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd38c486-1bed-4ecc-8e17-37e36dcf9d49;
 Tue, 06 Apr 2021 08:10:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 947A3B0C6;
 Tue,  6 Apr 2021 08:10:16 +0000 (UTC)
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
X-Inumbo-ID: bd38c486-1bed-4ecc-8e17-37e36dcf9d49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617696616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG0LLFY+tU19ClXuT00E9c31o4nZ1CrujqJZ8DUtc0Q=;
	b=tRl8/dkbVx72x0a8/dlPu1xHnnwq4ckascB1ByFNVO1rVtDG+xg1rqcaaLAGSRAgaDZU/Q
	hXNfTS+h/xfLzeAmEFq1Ir0mMifuWbcHxjj7G6urT520cjJ4McSG59A0DgZ3TSUBgXuqcZ
	1Do3ByDFQ1P7Q2oGbZTCTF1to3b5R6c=
Subject: Re: [PATCH 04/14] xen/char: console: Use const whenever we point to
 literal strings
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <507452bf-9a9c-a48c-d8f5-cba99ac2e646@suse.com>
Date: Tue, 6 Apr 2021 10:10:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.04.2021 17:57, Julien Grall wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -168,7 +168,7 @@ static int parse_guest_loglvl(const char *s);
>  static char xenlog_val[LOGLVL_VAL_SZ];
>  static char xenlog_guest_val[LOGLVL_VAL_SZ];
>  
> -static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
> +static const char *lvl2opt[] = { "none", "error", "warning", "info", "all" };

If you add any const here, then I think you should go to full way
and also add the second missing one. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Arguably the array should also be local to xenlog_update_val().

Jan

