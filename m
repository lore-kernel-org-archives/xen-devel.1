Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAA5C4707F
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 15:04:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D8061005
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 15:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D8061005
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133553.248887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHYB-0002WA-V3; Thu, 27 May 2021 15:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133553.248887; Thu, 27 May 2021 15:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHYB-0002W3-S9; Thu, 27 May 2021 15:03:55 +0000
Received: by outflank-mailman (input) for mailman id 133553;
 Thu, 27 May 2021 15:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmHYA-0002Vx-HL
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 15:03:54 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5545120-af40-4aaa-86f4-36c1496d1953;
 Thu, 27 May 2021 15:03:53 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D23011FD2E;
 Thu, 27 May 2021 15:03:52 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id B8C6C11A98;
 Thu, 27 May 2021 15:03:52 +0000 (UTC)
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
X-Inumbo-ID: a5545120-af40-4aaa-86f4-36c1496d1953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622127832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOt4l9d9iMF6Oaid7J1bJSViGCYSYwUECToINe9lubI=;
	b=r4ia2xp9eP80L/0Bxwm8A9jXFddSOtZwm7sOmYFgedsUXWFs1XRrQ2iIsEpCZNJb+uvpvf
	SyAw+B2xrtOegqycUuZcIgZhKDXNdB3UfnVN2pNk2M8G6NtXLFBU7j+8hUz84kuKkXEH8K
	CBa81A31vodm/8YA+TTm8yt7vqkqNCI=
Subject: Re: [PATCH 1/3] x86/cpuid: Rework HLE and RTM handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97d2924e-d312-7f02-2203-77f1bed0df33@suse.com>
Date: Thu, 27 May 2021 17:03:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527132519.21730-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 15:25, Andrew Cooper wrote:
> The TAA mitigation offered the option to hide the HLE and RTM CPUID bits,
> which has caused some migration compatibility problems.
> 
> These two bits are special.  Annotate them with ! to emphasise this point.
> 
> Hardware Lock Elision (HLE) may or may not be visible in CPUID, but is
> disabled in microcode on all CPUs, and has been removed from the architecture.
> Do not advertise it to VMs by default.
> 
> Restricted Transactional Memory (RTM) may or may not be visible in CPUID, and
> may or may not be configured in force-abort mode.  Have tsx_init() note
> whether RTM has been configured into force-abort mode, so
> guest_common_feature_adjustments() can conditionally hide it from VMs by
> default.
> 
> The host policy values for HLE/RTM may or may not be set, depending on any
> previous running kernel's choice of visibility, and Xen's choice.  TSX is
> available on any CPU which enumerates a TSX-hiding mechanism, so instead of
> doing a two-step to clobber any hiding, scan CPUID, then set the visibility,
> just force visibility of the bits in the first place.
> 
> With the HLE/RTM bits now unilaterally visible in the host policy,
> xc_cpuid_apply_policy() can construct a more appropriate policy out of thin
> air for pre-4.13 VMs with no CPUID data in their migration stream, and
> specifically one where HLE/RTM doesn't potentially disappear behind the back
> of a running VM.
> 
> Fixes: 8c4330818f6 ("x86/spec-ctrl: Mitigate the TSX Asynchronous Abort sidechannel")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


