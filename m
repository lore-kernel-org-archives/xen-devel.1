Return-Path: <SRS0=iCHD=JZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA19C433ED
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 16:53:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871C861400
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 16:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871C861400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119493.225986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnRH-0001vN-VN; Wed, 28 Apr 2021 16:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119493.225986; Wed, 28 Apr 2021 16:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnRH-0001vG-SM; Wed, 28 Apr 2021 16:53:27 +0000
Received: by outflank-mailman (input) for mailman id 119493;
 Wed, 28 Apr 2021 16:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IcpV=JZ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lbnRG-0001vB-Gq
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 16:53:26 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57342018-1a9b-46a9-b2a9-212fe78e5c6e;
 Wed, 28 Apr 2021 16:53:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 12so100009725lfq.13
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 09:53:25 -0700 (PDT)
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
X-Inumbo-ID: 57342018-1a9b-46a9-b2a9-212fe78e5c6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVXPPNqMC7N1jiFQWqYQF+nR/MNLUt8azTiplue1Zoc=;
        b=iUmy5r3jYCUtyIZQKiT8gey3l7muLBcQVSO9toPRT7R7PrHZTb2xex0K/1eqld7Lv2
         FA6O2G9aLfzYFnwcO4oWqwNLfF8vNm3dFcABdOeEV+c4xOEuKjNmJGeR3j8kyqJILGEe
         bHGYWPKXebS6GJLmyT999f4ZWJAGGf3iGW1ORKZ8KDdLSm9xRY8KJAaag6N1CBX1/mFz
         v/GT++WY9L4/sAVbiDH0BDJmveCQkopxiwPnWg1Q14NH5y2WlTzY2Rxe10zi/9hIpATi
         bC5Hami+ULR6GAAVtsJOwLG6RtiAbc5yMDaPRvjZGE1opUUwnX2UB3IGkPmB40qK4Uxb
         4rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVXPPNqMC7N1jiFQWqYQF+nR/MNLUt8azTiplue1Zoc=;
        b=XoMCJhjjO447NmLda7XQDb+vrjyO/F0MmVByzxd9Fv1NPLvFFLuGkj2yAgOrzwZVCZ
         wmpNrXQEq5PZpJYi1xIUyilqoNYXmvaxfZS+DlalXbzUp8+d0B4ppa67z6HKlxIieB0m
         WD+xXMy7lhdzTpxYWH79OmlkcSgYSk+5oiuqsaIqznJ06VsPhwWEZik2XLc4RmcLfHZz
         30wFLUZ+pHRPNjUzHfIrspeJ3MUa8ZFe51USzTMsbXbb6WgrqyCu+fVrYNqxULwrbZEY
         eCXioCf4cfDiK5Ue/S0sYec+stuRg8LEtSGXCbS5eff74g2eZML7yjF0vVc6nZFlL7vB
         Vgvg==
X-Gm-Message-State: AOAM532juNJrkKt+2FbAVS30XGDPUJml1FsuYAw7rperSZ1aoResOs27
	mgP2c6zUJmVj4a+VLqhQta3gCv//MGhGKSZQkys=
X-Google-Smtp-Source: ABdhPJy5lEqqTi8pI6bq0RuBQi12wXaz/8xP6rvPjJdB8PEtg6UJefePHG8g+AW9jKt7tg6EkUeWRwM2a9vaXsnedFM=
X-Received: by 2002:a19:431b:: with SMTP id q27mr8040535lfa.226.1619628804485;
 Wed, 28 Apr 2021 09:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210423161558.224367-1-anthony.perard@citrix.com> <20210423161558.224367-2-anthony.perard@citrix.com>
In-Reply-To: <20210423161558.224367-2-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 28 Apr 2021 12:53:12 -0400
Message-ID: <CAKf6xpuDQuUbJ+Gn9OHNU6BXb2Rm+Bdv7hPNtMxcX1CA4d_aYA@mail.gmail.com>
Subject: Re: [XEN PATCH 1/8] libxl: Replace deprecated QMP command by "query-cpus-fast"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 12:16 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> We use the deprecated QMP command "query-cpus" which is removed in the
> QEMU 6.0 release. There's a replacement which is "query-cpus-fast",
> and have been available since QEMU 2.12 (April 2018).
>
> This patch try the new command first and when the command isn't
> available, it fall back to the deprecated one so libxl still works
> with older QEMU versions.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Notes:
>     This is v2 of '[XEN PATCH for-4.15] libxl: Replace deprecated QMP
>     command by "query-cpus-fast"' as the patch never made it into the
>     release.
>
>     changes:
>     - introduce a fallback for when the new command isn't available.
>
>  tools/libs/light/libxl_domain.c | 103 ++++++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 5 deletions(-)
>
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 5d4ec9071160..8c003aa7cb04 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -1740,6 +1740,35 @@ static int libxl__set_vcpuonline_xenstore(libxl__gc *gc, uint32_t domid,
>      return rc;
>  }
>
> +static int qmp_parse_query_cpus_fast(libxl__gc *gc,
> +                                     libxl_domid domid,
> +                                     const libxl__json_object *response,
> +                                     libxl_bitmap *const map)
> +{
> +    int i;
> +    const libxl__json_object *cpu;
> +
> +    libxl_bitmap_set_none(map);
> +    /* Parse response to QMP command "query-cpus-fast":
> +     * [ { 'cpu-index': 'int',...} ]
> +     */
> +    for (i = 0; (cpu = libxl__json_array_get(response, i)); i++) {
> +        unsigned int cpu_index;
> +        const libxl__json_object *o;
> +
> +        o = libxl__json_map_get("cpu-index", cpu, JSON_INTEGER);

Looks like qmp_parse_query_cpus_fast and qmp_parse_query_cpus just
differ by the key string.  So you could pass it in as an argument -
maybe with qmp_parse_query_cpus_fast and qmp_parse_query_cpus as
wrappers around a common implementation?

But if you prefer this separate function, it's fine.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

