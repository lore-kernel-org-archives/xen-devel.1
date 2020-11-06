Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F4BC2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 07:23:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2C420825
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 07:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jgVG/WCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2C420825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20437.46354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaw5B-0004n5-2h; Fri, 06 Nov 2020 07:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20437.46354; Fri, 06 Nov 2020 07:22:49 +0000
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
	id 1kaw5A-0004my-Vy; Fri, 06 Nov 2020 07:22:48 +0000
Received: by outflank-mailman (input) for mailman id 20437;
 Fri, 06 Nov 2020 07:22:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaw59-0004mt-U6
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:22:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90a72d2f-16d8-4ae7-a3db-8ae9fea34963;
 Fri, 06 Nov 2020 07:22:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41198ADE8;
 Fri,  6 Nov 2020 07:22:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaw59-0004mt-U6
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:22:47 +0000
X-Inumbo-ID: 90a72d2f-16d8-4ae7-a3db-8ae9fea34963
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 90a72d2f-16d8-4ae7-a3db-8ae9fea34963;
	Fri, 06 Nov 2020 07:22:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604647366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCE71nMImlouxTtVXgPf9Pv6jy5BLSqDSuAjU88BoVE=;
	b=jgVG/WCWVMNJFudDaC9xj2DnWq15vw8C70I50bz2/UwUtTSwe5WqCdHls27L+l9QlSlWIr
	ail5FA/IcFL2VICIb6R9L0qWH3JkBCFlfESOP1lhaiCfa9+eyhvdxLx8dhIFxD5IhgSaxX
	/Ieznda3BtEZsq17/4W9PNRRsoMBwpc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41198ADE8;
	Fri,  6 Nov 2020 07:22:46 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/xstate: re-size save area when CPUID policy
 changes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
 <b951615e-c879-40fb-3f4d-ebaf26a01d13@suse.com>
Message-ID: <4a3d4494-5b9f-d16f-b643-6a7082d99436@suse.com>
Date: Fri, 6 Nov 2020 08:22:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b951615e-c879-40fb-3f4d-ebaf26a01d13@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 08:13, Jan Beulich wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -541,6 +541,41 @@ int xstate_alloc_save_area(struct vcpu *
>  
>      return 0;
>  }
> +
> +int xstate_update_save_area(struct vcpu *v)
> +{
> +    unsigned int i, size, old;
> +    struct xsave_struct *save_area;
> +    uint64_t xcr0_max = cpuid_policy_xcr0_max(v->domain->arch.cpuid);
> +
> +    ASSERT(!is_idle_vcpu(v));
> +
> +    if ( !cpu_has_xsave )
> +        return 0;
> +
> +    if ( v->arch.xcr0_accum & ~xcr0_max )
> +        return -EBUSY;
> +
> +    for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
> +    {
> +        if ( xcr0_max & (1ull << i) )
> +            size = max(size, xstate_offsets[i] + xstate_sizes[i]);
> +        if ( v->arch.xcr0_accum & (1ull << i) )
> +            old = max(old, xstate_offsets[i] + xstate_sizes[i]);
> +    }

This could be further shrunk if we used XSAVEC / if we really
used XSAVES, as then we don't need to also cover the holes. But
since we currently use neither of the two in reality, this would
require more work than just adding the alternative size
calculation here.

Jan

