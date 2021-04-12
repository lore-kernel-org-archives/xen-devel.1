Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B394C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 10:49:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B201C61241
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B201C61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.108946.207902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu7f-000822-W7; Mon, 12 Apr 2021 10:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108946.207902; Mon, 12 Apr 2021 10:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu7f-00081v-TI; Mon, 12 Apr 2021 10:48:51 +0000
Received: by outflank-mailman (input) for mailman id 108946;
 Mon, 12 Apr 2021 10:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVu7e-00081q-SD
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:48:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8198930-7b0d-4f47-b907-57d1506d51f1;
 Mon, 12 Apr 2021 10:48:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0238AAE20;
 Mon, 12 Apr 2021 10:48:49 +0000 (UTC)
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
X-Inumbo-ID: d8198930-7b0d-4f47-b907-57d1506d51f1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618224529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRSp+hgqLVD0lRIs4YzDAObTfBAXs1lI0EUNcz4xaPA=;
	b=ZYV0+kJQrtEhdSulvqh2+vzu1v7HL0qh9eLjqMy/sQ94XGiWoOx+2SZsaeG1TpfGlvI2Aq
	EIOeIutDVzrU/pV7vx6GBjDxWU5SR2COKOszJLqCkmsPW1AdXNXzQTMcgMUPKQEJHWK75M
	lpTyhqMVBi7tLiOCBWQo6VIsrQ1q4vk=
Subject: Re: [PATCH] x86/cpuid: Advertise no-lmsle unilaterally to hvm guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210412102247.2118-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb2a13bc-29aa-d27f-16a5-2ee272a3c122@suse.com>
Date: Mon, 12 Apr 2021 12:48:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412102247.2118-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 12:22, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -456,6 +456,12 @@ static void __init calculate_hvm_max_policy(void)
>      __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
>  
>      /*
> +     * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
> +     * hardware and allocated a CPUID bit to indicate its absence.
> +     */
> +    __set_bit(X86_FEATURE_NO_LMSLE, hvm_featureset);

Why only for HVM? And shouldn't the LM: entry in the dependencies
table be adjusted such that !LM implies this bit clear?

Jan

