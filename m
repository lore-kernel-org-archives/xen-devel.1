Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19D8C4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 08:39:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C2D20797
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 08:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bxlksfai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C2D20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3342.9683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ4yv-0000HO-4p; Wed, 07 Oct 2020 08:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3342.9683; Wed, 07 Oct 2020 08:39:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ4yv-0000HH-1r; Wed, 07 Oct 2020 08:39:29 +0000
Received: by outflank-mailman (input) for mailman id 3342;
 Wed, 07 Oct 2020 08:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ4yt-0000HC-1W
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 08:39:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4d2a68b-c309-42a2-82aa-022277996cb2;
 Wed, 07 Oct 2020 08:39:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A534AFBF;
 Wed,  7 Oct 2020 08:39:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ4yt-0000HC-1W
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 08:39:27 +0000
X-Inumbo-ID: e4d2a68b-c309-42a2-82aa-022277996cb2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e4d2a68b-c309-42a2-82aa-022277996cb2;
	Wed, 07 Oct 2020 08:39:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602059965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wowmXOOwTLNaj/cvxmu6SpMhNLrBnqOIkTCROdZfRIU=;
	b=bxlksfaiGPlg8I+9lvlOBUQNMl7J4eP+AUjgC8gt/5Uht+wyRweMhw0pv/Qegqr8gIZHOs
	BfOHjJSz4H/r1OlMvmZknMZ+jhEEehfdvM1e6VreSKDnrTyrZjGhLzdijhTGrZ3NRJ7b5d
	RrNIXlxD/i56m6Jblz72i4DgOTEv4UU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2A534AFBF;
	Wed,  7 Oct 2020 08:39:25 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <bc191370356c300f84a16d10345d4a0d646f5bae.1601977978.git.bertrand.marquis@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <30a4ddc0-9443-ab02-341c-ae08af7fddea@suse.com>
Date: Wed, 7 Oct 2020 10:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bc191370356c300f84a16d10345d4a0d646f5bae.1601977978.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.10.20 10:28, Bertrand Marquis wrote:
> Use memcpy in getBridge to prevent gcc warnings about truncated
> strings. We know that we might truncate it, so the gcc warning
> here is wrong.
> Revert previous change changing buffer sizes as bigger buffers
> are not needed.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
>   Use MIN between string length of de->d_name and resultLen to copy only
>   the minimum size required and prevent crossing to from an unallocated
>   space.
> ---
>   tools/libs/stat/xenstat_linux.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index d2ee6fda64..0ace03af1b 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -29,6 +29,7 @@
>   #include <string.h>
>   #include <unistd.h>
>   #include <regex.h>
> +#include <xen-tools/libs.h>
>   
>   #include "xenstat_priv.h"
>   
> @@ -78,7 +79,13 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
>   				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>   
>   				if (access(tmp, F_OK) == 0) {
> -					strncpy(result, de->d_name, resultLen);
> +					/*
> +					 * Do not use strncpy to prevent compiler warning with
> +					 * gcc >= 10.0
> +					 * If de->d_name is longer then resultLen we truncate it

s/then/than/

> +					 */
> +					memcpy(result, de->d_name, MIN(strnlen(de->d_name,
> +									sizeof(de->d_name)),resultLen - 1));

You can't use sizeof(de->d_name) here, as AFAIK there is no guarantee
that de->d_name isn't e.g. defined like "char d_name[]".

My suggestion to use NAME_MAX as upper boundary for the length was
really meant to be used that way.

And additionally you might want to add 1 to the strnlen() result in
order to copy the trailing 0-byte, too (or you should zero out the
result buffer before and omit writing the final zero byte).

Thinking more about it zeroing the result buffer is better as it even
covers the theoretical case of NAME_MAX being shorter than resultLen.


Juergen

