Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A7DC433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:57:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44CF613B7
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44CF613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105669.202107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgaU-0002CC-JM; Tue, 06 Apr 2021 07:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105669.202107; Tue, 06 Apr 2021 07:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgaU-0002C4-GF; Tue, 06 Apr 2021 07:57:26 +0000
Received: by outflank-mailman (input) for mailman id 105669;
 Tue, 06 Apr 2021 07:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgaT-0002Bw-Dn
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:57:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b37bdff3-65e0-4534-aad8-72b7a68e097e;
 Tue, 06 Apr 2021 07:57:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC57CB12A;
 Tue,  6 Apr 2021 07:57:23 +0000 (UTC)
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
X-Inumbo-ID: b37bdff3-65e0-4534-aad8-72b7a68e097e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617695843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOsNinbCvHtgx2zCpCcQBiUJ0C9jVc1IKprXgBnJ0Z0=;
	b=HykimJKD4vBf8e7D8flZmBDMyTYStHylthGMsgfZbAFOtX0yCbJRsNbQ8lDMvS0kGttj3n
	EgU8ikQ1lUvtrX5PL9iuDKgec7rcMyMnVPlU4RTadLqVoBeDdySxbgK3AgUBVrKhH9b+iv
	ds8iZFPvjetPcn32d+ZYD/+HuSzQgoY=
Subject: Re: [PATCH 01/14] xen: Constify the second parameter of
 rangeset_new()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b318ba40-a38a-4120-496d-5adef66c827a@suse.com>
Date: Tue, 6 Apr 2021 09:57:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155713.29754-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.04.2021 17:57, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The string 'name' will never get modified by the function, so mark it
> as const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -421,7 +421,7 @@ bool_t rangeset_is_empty(
>  }
>  
>  struct rangeset *rangeset_new(
> -    struct domain *d, char *name, unsigned int flags)
> +    struct domain *d, const char *name, unsigned int flags)
>  {
>      struct rangeset *r;

Remotely along these lines the function also has no need anymore to
use snprintf() - safe_strcpy() very well fits both purposes. But
quite likely for another patch.

Jan

