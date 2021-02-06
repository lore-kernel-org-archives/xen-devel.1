Return-Path: <SRS0=r5xc=HI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64F8C433DB
	for <xen-devel@archiver.kernel.org>; Sat,  6 Feb 2021 09:10:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B6B864FA1
	for <xen-devel@archiver.kernel.org>; Sat,  6 Feb 2021 09:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B6B864FA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82099.151738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Jb9-0003tx-Ux; Sat, 06 Feb 2021 09:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82099.151738; Sat, 06 Feb 2021 09:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Jb9-0003tq-R5; Sat, 06 Feb 2021 09:09:47 +0000
Received: by outflank-mailman (input) for mailman id 82099;
 Sat, 06 Feb 2021 09:09:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l8Jb9-0003tl-DC
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 09:09:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8Jb7-000549-SD; Sat, 06 Feb 2021 09:09:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8Jb7-0001s9-Km; Sat, 06 Feb 2021 09:09:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oqP4xG7bM1foQTlDIS9+rLLoDK89o1h2rVe0nC9o5P8=; b=eJ0Xem+TaWtSQt42aNNSBlhhs6
	x2KqTrKpvZ7X200XQw27FAGyt4Zp9PeAKFpxTh2RcvcXVzhsTkGpvlGtowIJhgffsx941qEiqixPg
	5rrI1esqawmkEZwPRKSzVZHMCeJMUUoq/g1ETK0Mf1QLDJCPV0OLJ6rkUqR7bJ4hgFbc=;
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c2b857fa-a606-1795-3aaf-a69572c43951@xen.org>
Date: Sat, 6 Feb 2021 09:09:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/02/2021 14:56, Jan Beulich wrote:
> Going through an intermediate *.new file requires telling the compiler
> what the real target is, so that the inclusion of the resulting .*.d
> file will actually be useful.
> 
> Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Already on the original patch I did suggest that perhaps Arm would want
> to follow suit. So again - perhaps the rules should be unified by moving
> to common code?

Sorry I missed the original patch. The recent changes looks beneficials 
to Arm as well.

> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -241,7 +241,7 @@ efi/buildid.o efi/relocs-dummy.o: $(BASE
>   efi/buildid.o efi/relocs-dummy.o: ;
>   
>   asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h

On Arm, only asm-offsets.c is a pre-requisite. May I ask why you need 
the second on x86?

> -	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new $<
> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
>   	$(call move-if-changed,$@.new,$@)
>   
>   asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
> 

Cheers,

-- 
Julien Grall

