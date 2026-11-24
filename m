Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61901606A321
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J0qkVsV+
Received: from list by lists.xenproject.org with outflank-mailman.1500918.1696961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqVG-00006W-Nn; Tue, 24 Nov 2026 13:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500918.1696961; Tue, 24 Nov 2026 13:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqVG-00006P-L1; Tue, 24 Nov 2026 13:24:10 +0000
Received: by outflank-mailman (input) for mailman id 1500918;
 Tue, 24 Nov 2026 13:24:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xVqVF-00006G-Le
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:24:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqVE-004Mib-J6
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:24:08 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6b058fee-2eae-0a2a0a5409dd-0a2a450aaa20-10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:24:08 +0100
Received: from [74.125.224.52] (helo=mail-yx1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6b058ff7-f2d2-0a2a450a0019-4a7de034cd0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:24:08 +0100
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-67db0791748so5027750d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:24:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795526647; cv=none;
        d=google.com; s=arc-20260327;
        b=rkus9qNjzNgBsJi+BWRIZov/RuiD0lejjucAinsBcZPmw6KoQSSxSKq11DxPbcKb90
         G2eSForMnyeNXAvc4stFEhvpKeMarvMDn27rubUkv/6/jhDd/tl1ibKONeLSZj9fiP4R
         dhIAlip/nPxy/rWKTb2rK9gwXJg/BM4vinNENQVKL1gymg4+0vsYF8BfBBnD6HwIZn51
         2MVmdmgL6W21QoJ72EhdL6NP0S6zBsLS4IR6zbo3xETkrFA201zZHQqEZQw6AY64J3ox
         vFINjv2scoX9E9hujWO91/0rVFZjndawsmaquY4uQbbnM9dUDQzLM4x0pqX8sYaHqRJk
         esRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1PIvKVm/9PMiiNfvrGshscRBFRehdozyDW1GHkg/J8Q=;
        fh=1qZLCUU5Fn6l+gRdTQRcYf8HOe3TXA3sR3e1Rf0T7Wk=;
        b=R9UFk7Lr7AgfGpDU5CyFPUI3e9xQI5FwzkeuBCXmMzXUmWGB+E/mxL6HIOWeDW6lFM
         5QoxmluASqp29m4cUq7Hc8WTZ8V+AsxVSysF9HfKsxb12HEZ0xvuJfs3hnUkpu0+VdDQ
         IBIng6z5OqUrOegnOpNntRDgUj8wjmCh/2qMPnhK4BPLD/Q/Q3+rOF67xQn6zxfDL36D
         gxvkmdGtJxemPGN9fNjCmVF0e7IzHuitQI3PaghXduXl2TUhJhC+Hj49qrVv/GH/lyzQ
         YrHcslkXsIpo8jbJRVUVDHjRRtsLMOKlJXIR88W6PLRNQ3qHzKxHLRTI8xPAhXc/bv+D
         cDvQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526647; x=1796131447; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PIvKVm/9PMiiNfvrGshscRBFRehdozyDW1GHkg/J8Q=;
        b=J0qkVsV+J3BpqAIXj4mAQKN0xPDJkOXSR8gRs1L1cifM0cKN7BFrsIW9GKFhjldGd1
         qkQ4De0vzZX+/YjvK6E+6moTi8yM9Ad0bfkNy4Bz2VKrq5FVjrHUxIuCCr6JO2tLRExY
         CW9CgcACeDnCbUIo8SL8EsZQq7KwcBMCRuv7kascA8UWIhsYH8RatwY9nw6YZbW5CGfd
         QQKjWw4CfaOjJrxk01ea9etlvgkf4IyjPnjcYw5DH8Li3eCHJfBKQLdMCl+wB/c042r4
         fKZZfKwdGfmXOg+PkkLVLEMexTWhc8lp5ssVYaBNfjVVf3u+d/dGfeBpgmE9i/464W6c
         VzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526647; x=1796131447;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1PIvKVm/9PMiiNfvrGshscRBFRehdozyDW1GHkg/J8Q=;
        b=zWHmKS+r1+Tz97BIKJ1mZaAo7Rk8GqNS2hwcomL6Gix5pGeHlwN0gJ4hulHqLO+9v6
         UZIzR7E+1eeaiszIMJCkb/VeUuK2B9PiO75qYzWbbFhzwQitRzaiR5wEFE4yuA6gwHDO
         vRmU3ZEgJm3yIYcMjrIiI0rsNcWj8v6vlnztKnTJz8ZeB2ON2OD9yFdQYAL4Xk4Qwwv7
         lOZHzYQkdB9RqHcXYLtAqNJ7Rj2oNEGypPTxSU6BnroxB10+TaCH6FvnFPgFDrN4nyg2
         rCpVElZec/uRNTe8uynGLR+wVy4Ii59fbKpu9w2h7mod2y8h1dyeVvZ7Gd7HJ+ygjmNr
         j7xg==
X-Forwarded-Encrypted: i=1; AL+hErHucaqA+Wp0KWgil4t2fsV1K7ynWrDP9l3QY6Fey9uEX6b8w+f5iIWUv6QDKaNLZjA8bgjBUE3nxcE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/DFD2izWgf40ODacPdeXWyeqCism0gKE5gO1qvIA6GNFvwoxMd
	Hg86u0Ll3uyDLuEqM7pqDJauLAUMkjHnY0etn0cv6fNOH7pZjXYBuJ5yKRH8EeL/6Hqiiu0PhgU
	7uPjTzdPTEP0sz4/gNAc+eVsl/r0CYrpSLAhXyUAAwA==
X-Gm-Gg: AZFdTZe60biVzTzawQGIgttyX5L89lNSgkZNgzaethlj+8XTIlEYBsatrk+NCBHT5B5
	VY5HVrPJIlcSSm4oDZrgmEEl9mPPt7kjzoACplSHJmJZ/eW2VQpuMLmkYdLDDKCGl+0S4nlZFWN
	I7LWNaSNEJMqAJ1m26ZOz/ZTCapshRLOCsgyGHa9S3MWbUUm5aVD7+P1BcKcO9sJAmMHiksrxUE
	nh9zW2TdROpPKyoRTtob8KEwvOmrVz5Q3eLSsGFJlNwZTKwx6UO+Iwj0WDGJZeyQeKMxCSofgip
	AyvFtXkzWdCPcMVCHivHUSoCMEtEJnkXj6TaiTKO2F9zaFM2uHrDGzg+bA5H6ZSEfBd/6iAOhsf
	/qibIlq2znCH2mOs8dHdCU4xLoNtQv338N4YLy6rUu9CUdJxPaRDFZQHL7FJ1mCPSsJiuC3G+Mz
	YBzXHCK7QUFFu1JU1xbBuuvop2MGHXW82td/ivVgGknA==
X-Received: by 2002:a05:690e:438d:b0:67c:2491:3754 with SMTP id
 956f58d0204a3-67df4457d52mr3617489d50.81.1795526646727; Tue, 24 Nov 2026
 05:24:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124114127.790173-1-alex.brett@citrix.com>
In-Reply-To: <20261124114127.790173-1-alex.brett@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2026 13:23:52 +0000
X-Gm-Features: Aa3M54pUTYlH43epoTVTtiQPmEalk4v3uzCkqNdy4-2GI9JZak7LgHEgEP72zI0
Message-ID: <CAFEAcA8FLcSkUtFvRF+mc6U1kjJBBVB-iLyfDgcpKBuDuP8hog@mail.gmail.com>
Subject: Re: [PATCH] xen-mapcache: Fix a build error with -fexceptions
To: Alex Brett <alex.brett@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1795526648-510C9CFC-B69BDDAC/0/0
X-purgate-type: clean
X-purgate-size: 1546
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 13:14, Alex Brett via qemu development
<qemu-devel@nongnu.org> wrote:
>
> When building with -Werror=maybe-uninitialized and -fexceptions, gcc can
> report:
> error: 'err' may be used uninitialized [-Werror=maybe-uninitialized]
>
> err gets assigned to g_new0() unconditionally, but under -fexceptions
> the calls to trace_xen_remap_bucket() or g_new0() might unwind, leading
> the g_autofree cleanup to run g_free() on an uninitialised err. Avoid
> the warning and any future issues by initialising it to NULL in the same
> pattern as other definitions.
>
> Signed-off-by: Alex Brett <alex.brett@citrix.com>
> ---
>  hw/xen/xen-mapcache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index e30c07c2ee..0a19cfdc1b 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -199,7 +199,7 @@ static void xen_remap_bucket(MapCache *mc,
>      uint8_t *vaddr_base;
>      g_autofree uint32_t *refs = NULL;
>      g_autofree xen_pfn_t *pfns = NULL;
> -    g_autofree int *err;
> +    g_autofree int *err = NULL;
>      unsigned int i;
>      hwaddr nb_pfn = size >> XC_PAGE_SHIFT;

Explicit init of a g_autofree pointer is the recommended pattern, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but why are you building with "-fexceptions" ? Trying to throw
a C++ exception through QEMU's C code seems like it's likely
to run into all kinds of problems and corner cases...

thanks
-- PMM

