Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A5DC388F9
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:37:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F55B206A1
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 15:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rTADTqky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F55B206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25079.52657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcsBK-0001mN-6J; Wed, 11 Nov 2020 15:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25079.52657; Wed, 11 Nov 2020 15:37:10 +0000
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
	id 1kcsBK-0001mG-1A; Wed, 11 Nov 2020 15:37:10 +0000
Received: by outflank-mailman (input) for mailman id 25079;
 Wed, 11 Nov 2020 15:37:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcsBI-0001mB-R5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:37:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c56a35c8-3d31-410c-b3a9-fd46b13f719f;
 Wed, 11 Nov 2020 15:37:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C438AC75;
 Wed, 11 Nov 2020 15:37:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcsBI-0001mB-R5
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:37:08 +0000
X-Inumbo-ID: c56a35c8-3d31-410c-b3a9-fd46b13f719f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c56a35c8-3d31-410c-b3a9-fd46b13f719f;
	Wed, 11 Nov 2020 15:37:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605109026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2huT31oFavBxTtGDAAuTREwbyBE6/Nk6AUYAiJly5aw=;
	b=rTADTqkya1JyXiVEGrw1dLL7Hyj84/3Q4DkHDdF8tv0alYlZENi033yFA8VL6KJAL2RJxb
	plHpsFjNqlW59OU/HrvEn+6D4uFmN2bAiKxMq2MjZarOdBFaE6g09WIbBssfwh806azgk2
	MmnKtXtSKLfFip1l46Cy3svIzgrc/d0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2C438AC75;
	Wed, 11 Nov 2020 15:37:06 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] xen/x86: add nmi continuation framework
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13e71151-e395-4da9-ce1e-60f02247c6b7@suse.com>
Date: Wed, 11 Nov 2020 16:37:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109095021.9897-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 10:50, Juergen Gross wrote:
> Actions in NMI context are rather limited as e.g. locking is rather
> fragile.
> 
> Add a framework to continue processing in normal interrupt context
> after leaving NMI processing.
> 
> This is done by a high priority interrupt vector triggered via a
> self IPI from NMI context, which will then call the continuation
> function specified during NMI handling.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further adjustment request:

> @@ -1799,6 +1800,24 @@ void unset_nmi_callback(void)
>      nmi_callback = dummy_nmi_callback;
>  }
>  
> +bool nmi_check_continuation(void)
> +{
> +    bool ret = false;
> +
> +    return ret;
> +}
> +
> +void trigger_nmi_continuation(void)
> +{
> +    /*
> +     * Issue a self-IPI. Handling is done in spurious_interrupt().
> +     * NMI could have happened in IPI sequence, so wait for ICR being idle
> +     * again before leaving NMI handler.
> +     */
> +    send_IPI_self(SPURIOUS_APIC_VECTOR);
> +    apic_wait_icr_idle();
> +}

This additionally relies on send_IPI_self_legacy() calling
send_IPI_shortcut(), rather than e.g. resolving the local CPU
number to a destination ID. I think this wants saying maybe
here, but more importantly in that function.

Jan

