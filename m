Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E151C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 11:27:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6B82073C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 11:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MO9UCYPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6B82073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.35774.67417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khWTc-0004QP-6p; Tue, 24 Nov 2020 11:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35774.67417; Tue, 24 Nov 2020 11:27:16 +0000
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
	id 1khWTc-0004QI-3m; Tue, 24 Nov 2020 11:27:16 +0000
Received: by outflank-mailman (input) for mailman id 35774;
 Tue, 24 Nov 2020 11:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khWTb-0004QD-1d
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:27:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbc1b030-4a85-4299-8b30-2ae4b2c244da;
 Tue, 24 Nov 2020 11:27:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B7A8AC2D;
 Tue, 24 Nov 2020 11:27:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khWTb-0004QD-1d
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:27:15 +0000
X-Inumbo-ID: fbc1b030-4a85-4299-8b30-2ae4b2c244da
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fbc1b030-4a85-4299-8b30-2ae4b2c244da;
	Tue, 24 Nov 2020 11:27:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606217233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aWKri1K+oKGMkeVg9gsz4JY50xsphKOgWyMVtRlIQE=;
	b=MO9UCYPtbmBp8wgfjo2Umi3qS3n6FWUNKqk/bV99wRdSXfmpabgfN8rFjsN0a/v39pj/TT
	mRVKqyDhyPBySg6ivBlk4hRxFIomZaLtr9jZzf8AAAxOM0XF+IYRkCKmVKjDCOt+wa4g6U
	6Deyb6dyfBf7PSGbSeX8O9yQ+Fk3b1Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B7A8AC2D;
	Tue, 24 Nov 2020 11:27:13 +0000 (UTC)
Subject: Re: [PATCH v2] xen: add support for automatic debug key actions in
 case of crash
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201120131306.24388-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7cc6511-d741-c7dd-5c35-ab9cf031d4b5@suse.com>
Date: Tue, 24 Nov 2020 12:27:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120131306.24388-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:13, Juergen Gross wrote:
> @@ -507,6 +509,42 @@ void __init initialize_keytable(void)
>      }
>  }
>  
> +#define CRASHACTION_SIZE  32
> +static char crash_debug_panic[CRASHACTION_SIZE];
> +static char crash_debug_hwdom[CRASHACTION_SIZE];
> +static char crash_debug_watchdog[CRASHACTION_SIZE];
> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
> +static char crash_debug_debugkey[CRASHACTION_SIZE];
> +
> +static char *crash_action[CRASHREASON_N] = {

Considering the sole use below, I think there can be two "const"
added here. With this single use I also wonder whether this
array wouldn't better be private to that function.

> +    [CRASHREASON_PANIC] = crash_debug_panic,
> +    [CRASHREASON_HWDOM] = crash_debug_hwdom,
> +    [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
> +    [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
> +    [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
> +};
> +
> +string_runtime_param("crash-debug-panic", crash_debug_panic);
> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);

This one probably wants a CONFIG_KEXEC conditional around it,
such that requests to set it won't appear to be "okay" on !KEXEC
builds. At which point the doc probably also wants to mention the
conditional availability of this option.

> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
> +
> +void keyhandler_crash_action(enum crash_reason reason)
> +{
> +    const char *action = crash_action[reason];

In order to avoid cascade problems when the system's already in
trouble, maybe better to bounds check "reason" before using as
array index and, also with the CONFIG_KEXEC related adjustment
requested above in mind, ...

> +    struct cpu_user_regs *regs = get_irq_regs() ? : guest_cpu_user_regs();
> +
> +    while ( *action )

... perhaps also better to check action against NULL before
de-referencing?

Jan

