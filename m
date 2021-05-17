Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F97C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 18:16:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C978611BE
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 18:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C978611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128459.241168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihmf-00070D-Rq; Mon, 17 May 2021 18:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128459.241168; Mon, 17 May 2021 18:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihmf-000706-Ow; Mon, 17 May 2021 18:16:05 +0000
Received: by outflank-mailman (input) for mailman id 128459;
 Mon, 17 May 2021 18:16:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lihme-0006zz-Rm
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 18:16:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihmd-0001NY-Km; Mon, 17 May 2021 18:16:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihmd-0000oG-FJ; Mon, 17 May 2021 18:16:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZuiPfTS7JrllEztYBNswa8Awq4uj96P9deDzQaJ70xQ=; b=H1OgAjPjw2a6F6HSOCjev6/ih2
	iE3A2yHOkrIBjyRb6+siGDaVHxRhX0iCZbqNfgX7XUJvxGAtu/vbXc7Vq1sVqLidqOhi6KeI6FeuU
	n7eaKsrqRiatIdHo25oCCYIFKacLP7RclThnpAW0u8/HReajIQjkSLo16i23PUJpFgxo=;
Subject: Re: [PATCH v3 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition
 error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <b1e87eb24dfde3b1f11c5a14a4298531b4a308ad.1620633386.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <5603464e-2ef5-9358-d039-cfb1f93340d3@xen.org>
Date: Mon, 17 May 2021 19:16:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b1e87eb24dfde3b1f11c5a14a4298531b4a308ad.1620633386.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Costin,

On 10/05/2021 09:35, Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror. This
> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
> confusion between control domain page granularity (PAGE_* definitions) and
> guest domain page granularity (which is what we are dealing with here).
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> ---
>   tools/libs/gnttab/freebsd.c | 28 +++++++++++++---------------
>   tools/libs/gnttab/linux.c   | 28 +++++++++++++---------------
>   tools/libs/gnttab/netbsd.c  | 23 ++++++++++-------------
>   3 files changed, 36 insertions(+), 43 deletions(-)
> 
> diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
> index 768af701c6..e42ac3fbf3 100644
> --- a/tools/libs/gnttab/freebsd.c
> +++ b/tools/libs/gnttab/freebsd.c
> @@ -30,14 +30,11 @@
>   
>   #include <xen/sys/gntdev.h>
>   
> +#include <xenctrl.h>
>   #include <xen-tools/libs.h>
>   
>   #include "private.h"
>   
> -#define PAGE_SHIFT           12
> -#define PAGE_SIZE            (1UL << PAGE_SHIFT)
> -#define PAGE_MASK            (~(PAGE_SIZE-1))
> -
>   #define DEVXEN "/dev/xen/gntdev"
>   
>   int osdep_gnttab_open(xengnttab_handle *xgt)
> @@ -77,10 +74,11 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
>       int domids_stride;
>       unsigned int refs_size = ROUNDUP(count *
>                                        sizeof(struct ioctl_gntdev_grant_ref),
> -                                     PAGE_SHIFT);
> +                                     XC_PAGE_SHIFT);
> +    int os_page_size = getpagesize();

Same remark as for patch #4. This at least want to be explained in the 
commit message.

Cheers,

-- 
Julien Grall

