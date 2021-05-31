Return-Path: <SRS0=m+yb=K2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26FC47082
	for <xen-devel@archiver.kernel.org>; Mon, 31 May 2021 07:21:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0E26100B
	for <xen-devel@archiver.kernel.org>; Mon, 31 May 2021 07:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0E26100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134479.250174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lncEs-00072m-DS; Mon, 31 May 2021 07:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134479.250174; Mon, 31 May 2021 07:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lncEs-00072f-AX; Mon, 31 May 2021 07:21:30 +0000
Received: by outflank-mailman (input) for mailman id 134479;
 Mon, 31 May 2021 07:21:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lncEr-00072Z-TB
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 07:21:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e354651-da27-4db1-a19a-8011f6e29a20;
 Mon, 31 May 2021 07:21:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 500891FD2F;
 Mon, 31 May 2021 07:21:27 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CFC5F118DD;
 Mon, 31 May 2021 07:21:26 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Q7WDMXaOtGBuFAAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Mon, 31 May 2021 07:21:26 +0000
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
X-Inumbo-ID: 2e354651-da27-4db1-a19a-8011f6e29a20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622445687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnUkhMnbahQ+gLAChDjtDb3gGewkxqS5oqBPL8xt238=;
	b=a7p1KFDMbAjZUfoeYF/svLrSDYr8ladOlnSPFs53UBsUZUPOx/5+0tVMoMcvAl7566EyQj
	MpwBn45PRiAcMzQ1Hvibf46DBigBycgmrUzXv195/6GaY3OV4UuywuXn1n/A3Oal5m/iqP
	7FxIKp/59lXPSDehOiensAVCeOJkGAo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622445687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnUkhMnbahQ+gLAChDjtDb3gGewkxqS5oqBPL8xt238=;
	b=a7p1KFDMbAjZUfoeYF/svLrSDYr8ladOlnSPFs53UBsUZUPOx/5+0tVMoMcvAl7566EyQj
	MpwBn45PRiAcMzQ1Hvibf46DBigBycgmrUzXv195/6GaY3OV4UuywuXn1n/A3Oal5m/iqP
	7FxIKp/59lXPSDehOiensAVCeOJkGAo=
Subject: Re: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3aeb303-760b-fe6a-d51e-6271eaf37d80@suse.com>
Date: Mon, 31 May 2021 09:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528173935.29919-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: imap.suse.de;
	none
X-Spamd-Result: default: False [0.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[]

On 28.05.2021 19:39, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -487,11 +487,12 @@ static int ept_invalidate_emt_range(struct p2m_domain *p2m,
>  }
>  
>  int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
> -                       unsigned int order, bool *ipat, bool direct_mmio)
> +                       unsigned int order, bool *ipat, p2m_type_t type)
>  {
>      int gmtrr_mtype, hmtrr_mtype;
>      struct vcpu *v = current;
>      unsigned long i;
> +    bool direct_mmio = type == p2m_mmio_direct;

I don't think this variable is worthwhile to retain/introduce:

> @@ -535,9 +536,33 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
>          }
>      }
>  
> -    if ( direct_mmio )

With this gone, there's exactly one further use left. Preferably
with this adjustment (which I'd be fine to make while committing, as
long as you and/or the maintainers agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> +    switch ( type )
> +    {
> +    case p2m_mmio_direct:
>          return MTRR_TYPE_UNCACHABLE;

As a largely unrelated note: We really want to find a way to return
WC here for e.g. the frame buffer of graphics cards, the more that
hvm_get_mem_pinned_cacheattr() gets invoked only below from here
(unlike at initial introduction of the function, where it was called
ahead of the direct_mmio check, but still after the mfn_valid(), so
the results were inconsistent anyway). Perhaps we should obtain the
host MTRR setting for the page (or range) in question.

As to hvm_get_mem_pinned_cacheattr(), XEN_DOMCTL_pin_mem_cacheattr
is documented to be intended to be used on RAM only anyway ...

Jan

