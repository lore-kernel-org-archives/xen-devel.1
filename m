Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5702AC4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:11:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CE1206DB
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CE1206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54381.94442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCuv-00014s-CY; Tue, 15 Dec 2020 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54381.94442; Tue, 15 Dec 2020 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCuv-00014l-88; Tue, 15 Dec 2020 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 54381;
 Tue, 15 Dec 2020 16:11:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCuu-00014f-7h
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:11:12 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088da368-8401-4249-8868-31ef8191303b;
 Tue, 15 Dec 2020 16:11:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c133so5361356wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:11:11 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z11sm39199208wmc.39.2020.12.15.08.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:11:09 -0800 (PST)
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
X-Inumbo-ID: 088da368-8401-4249-8868-31ef8191303b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tk04yatt8pcAr2KqRJUeNudOQt102sFCS7Ucr7jZCsg=;
        b=TbLqtXtQ8klLP569xI5R6fP9i5AK8X8FwI9Ul/UA5QxlrHxlYlNt3wO0SoNQlO+N25
         0HmhL6nUqcSTQzgydtJmZKZGaW0Z/UWfLh4kx0rycUWb43WzOcugF2lOj5jC/WElDW9/
         4jzfZhTXNlrzBm0PTNS6WE9GbKvgWB0zT8PTyso0UoluG4xzvKCGtrtBL68dHVnqFZh9
         qrzDVTLWeyK6RNJusQWyQ6P8angapde12L8+Ba/rH6GK2UQ5EDgJN6nYS/m2hRU8CRJf
         y6u5a85TeYIfxJVGcjpXVOkENBpZyjdihS6tbZEX31dFAzKg5Yl8Magxs77o7P6x5Usm
         bNCQ==
X-Gm-Message-State: AOAM53050GTXYFKM/9uZDlQKOvoBFNDip+7plIhfACg3hXtnVn5SeW+t
	FDWAEHdfM5ybsd3e1w7v2jg=
X-Google-Smtp-Source: ABdhPJyO27aFWo3trYWQ9joXKAjSmIn8RTpBZsPp7118xQJLyyvsOhINIoC2wXiZ7KC+4njwh+Wa+Q==
X-Received: by 2002:a1c:e042:: with SMTP id x63mr33984009wmg.68.1608048670637;
        Tue, 15 Dec 2020 08:11:10 -0800 (PST)
Date: Tue, 15 Dec 2020 16:11:08 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 1/3] tools: allocate bitmaps in units of unsigned long
Message-ID: <20201215161108.7irspc5rtl72r57o@liuwe-devbox-debian-v2>
References: <20201209155452.28376-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209155452.28376-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Dec 09, 2020 at 04:54:49PM +0100, Olaf Hering wrote:
> Allocate enough memory so that the returned pointer can be safely
> accessed as an array of unsigned long.
> 
> The actual bitmap size in units of bytes, as returned by bitmap_size,
> remains unchanged.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

I can see where you're coming from. This (internal) API's returned
pointer is being assigned to unsigned long *.

> ---
>  tools/libs/ctrl/xc_bitops.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
> index 3d3a09772a..d6c5ea5138 100644
> --- a/tools/libs/ctrl/xc_bitops.h
> +++ b/tools/libs/ctrl/xc_bitops.h
> @@ -21,7 +21,10 @@ static inline unsigned long bitmap_size(unsigned long nr_bits)
>  
>  static inline void *bitmap_alloc(unsigned long nr_bits)
>  {
> -    return calloc(1, bitmap_size(nr_bits));
> +    unsigned long longs;
> +
> +    longs = (nr_bits + BITS_PER_LONG - 1) / BITS_PER_LONG;
> +    return calloc(longs, sizeof(unsigned long));
>  }
>  
>  static inline void bitmap_set(void *addr, unsigned long nr_bits)

