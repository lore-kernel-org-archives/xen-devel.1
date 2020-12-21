Return-Path: <SRS0=3GnW=FZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA59EC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 08:47:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE5D22C7E
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 08:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE5D22C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57328.100300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGqr-0008E1-CW; Mon, 21 Dec 2020 08:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57328.100300; Mon, 21 Dec 2020 08:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGqr-0008Du-7o; Mon, 21 Dec 2020 08:47:33 +0000
Received: by outflank-mailman (input) for mailman id 57328;
 Mon, 21 Dec 2020 08:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGqp-0008Dp-J5
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:47:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8efa608-741b-4492-8b87-2eb1be8f1a12;
 Mon, 21 Dec 2020 08:47:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1F21ACF5;
 Mon, 21 Dec 2020 08:47:29 +0000 (UTC)
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
X-Inumbo-ID: d8efa608-741b-4492-8b87-2eb1be8f1a12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608540450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwBrUMrCjWnUCYAEqEZmf/fMzxY8EPZLf1RdIQD/7gk=;
	b=Ut3Drzid7UtcJDORhaXbV9Q6J7sWtXXPaJE+6FTnbuBUEEkq4IsTOmUJ9KynYsoZOdJU8o
	Zl4adUv+YjNWxCeMvSs/+IgcTczpq43rtaFV94fzu9W7hKK2nnk1gNflI/XmL0XbsI4ulw
	Y3wkYraQBBIa129fCLF05MEFggAlncs=
Subject: Re: [PATCH v2] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20201218133054.7744-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec94b6ae-2386-221a-ec01-bc4650e799a8@suse.com>
Date: Mon, 21 Dec 2020 09:47:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218133054.7744-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.12.2020 14:30, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> So far, our implementation of WARN_ON() cannot be used in the following
> situation:
> 
> if ( WARN_ON() )
>     ...
> 
> This is because WARN_ON() doesn't return whether a warning has been
> triggered. Such construciton can be handy if you want to print more
> information and also dump the stack trace.
> 
> Therefore, rework the WARN_ON() implementation to return whether a
> warning was triggered. The idea was borrowed from Linux
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

In particular to clarify my prior concerns have been addressed:

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

