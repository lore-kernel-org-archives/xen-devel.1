Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDFBC433ED
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 15:53:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60587613E7
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 15:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60587613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118655.224858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ1r-0005Fl-JG; Tue, 27 Apr 2021 15:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118655.224858; Tue, 27 Apr 2021 15:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ1r-0005Fe-G6; Tue, 27 Apr 2021 15:53:39 +0000
Received: by outflank-mailman (input) for mailman id 118655;
 Tue, 27 Apr 2021 15:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbQ1p-0005FZ-Ks
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:53:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 668b3bfd-540f-4270-9bdf-fbff76833bfd;
 Tue, 27 Apr 2021 15:53:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D648AB121;
 Tue, 27 Apr 2021 15:53:35 +0000 (UTC)
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
X-Inumbo-ID: 668b3bfd-540f-4270-9bdf-fbff76833bfd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619538815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AAWmYpCtZQ6byRIs0y9Gyaj9Nudnugd7FEFyoyoGH0=;
	b=mAHhxuVP67Xc1c1J2NiFPnVsb0T3vaiffWBzQNXo1uL2FJci0noI3tjW9HKxgpuLNtfAR1
	ir+2VlakDnJGILA3Wc5Z0ZnpmZK+xLGH/VVRjO+r+jADj7XnOM1WG4+VXmDW5pxhlQ3WBH
	B3V0oNYey49dGG1ogWI+u/zCRapqqS0=
Subject: Re: [PATCH 2/3] x86/svm: Enumeration for CET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5d73b34-8200-ae0c-6c91-252ad2812f3d@suse.com>
Date: Tue, 27 Apr 2021 17:53:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426175421.30497-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 19:54, Andrew Cooper wrote:
> On CET-capable hardware, VMRUN/EXIT unconditionally swaps S_SET, SSP and

Nit: S_CET?

> ISST (subject to cleanbits) without further settings.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one question:

> @@ -497,7 +501,9 @@ struct vmcb_struct {
>      u64 rip;
>      u64 res14[11];
>      u64 rsp;
> -    u64 res15[3];
> +    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
> +    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
> +    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
>      u64 rax;
>      u64 star;
>      u64 lstar;

Any reason for the leading underscores, when none of the neighboring
fields have such? Did you perhaps mean to add VMCB_ACCESSORS()
instances for them? (Ack remains in effect if you decide to do so.)

Jan

