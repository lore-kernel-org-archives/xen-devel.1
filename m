Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F401CC71155
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:29:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8751C20872
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8751C20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42570.76584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkORP-0004RK-Vf; Wed, 02 Dec 2020 09:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42570.76584; Wed, 02 Dec 2020 09:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkORP-0004RD-Sk; Wed, 02 Dec 2020 09:28:51 +0000
Received: by outflank-mailman (input) for mailman id 42570;
 Wed, 02 Dec 2020 09:28:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkORP-0004R8-3p
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:28:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f37dbe1e-6121-4853-85cc-5e58da556245;
 Wed, 02 Dec 2020 09:28:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78D17ADA2;
 Wed,  2 Dec 2020 09:28:49 +0000 (UTC)
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
X-Inumbo-ID: f37dbe1e-6121-4853-85cc-5e58da556245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606901329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjDGImZh8q7OUTE/8K7S0r4PTqQZWnnkUTanEAf10KA=;
	b=jNYTfDnoFxwV2ZKSVrPGKD8fwFG96NHLRqxYVhu0c9fYY6IGjX24Ozwaw2nWpkMXaVdyzX
	eaC6p7kqfEWklZBL7erpdD4N++AcmfLKv56ktYKlmSEyQ5DStmKGe68rSRQC/mIO5J3dNn
	WDg/8OGtPopKN9YkauTUYZfHzrzxKWk=
Subject: Re: [PATCH v4 01/11] viridian: don't blindly write to 32-bit
 registers is 'mode' is invalid
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201202092205.906-1-paul@xen.org>
 <20201202092205.906-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f95b237e-31d3-08c8-4dab-ee273f10b585@suse.com>
Date: Wed, 2 Dec 2020 10:28:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202092205.906-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.12.2020 10:21, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> If hvm_guest_x86_mode() returns something other than 8 or 4 then
> viridian_hypercall() will return immediately but, on the way out, will write
> back status as if 'mode' was 4. This patch simply makes it leave the registers
> alone.
> 
> NOTE: The formatting of the 'out' label and the switch statement are also
>       adjusted as per CODING_STYLE.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Wei Liu <wl@xen.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v4:
>  - Fixed another CODING_STYLE violation.

Partly:

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -692,13 +692,15 @@ int viridian_hypercall(struct cpu_user_regs *regs)
>          break;
>      }
>  
> -out:
> + out:
>      output.result = status;
> -    switch (mode) {
> +    switch (mode)

There are also two blanks missing here. Will again record this as
to be taken care of while committing, once an ack arrives. (And
btw, the earlier of the two "is" in the subject also wants to be
"if".)

Jan

