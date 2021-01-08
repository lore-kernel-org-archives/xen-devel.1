Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12C4C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 15:24:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBC8206E9
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 15:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FBC8206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63632.112928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtcT-0004Ls-6w; Fri, 08 Jan 2021 15:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63632.112928; Fri, 08 Jan 2021 15:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtcT-0004Ll-3p; Fri, 08 Jan 2021 15:24:05 +0000
Received: by outflank-mailman (input) for mailman id 63632;
 Fri, 08 Jan 2021 15:24:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtcR-0004Lf-93
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:24:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 120c05c9-136f-4fe1-af19-10b0459b1d2e;
 Fri, 08 Jan 2021 15:24:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CC66AD57;
 Fri,  8 Jan 2021 15:24:01 +0000 (UTC)
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
X-Inumbo-ID: 120c05c9-136f-4fe1-af19-10b0459b1d2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610119441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WuNqjUTmLgsDoLN2ut50AAbcShjp9t2LvR3QzsgA79I=;
	b=R9AGcEkLfiDFbW+Ls6Zlg5eZMZpyucA7Jn/QkqDp/snmMHguhaSLDJG0sXSJCdZdKWwYcp
	8HvWEPNSfEKh2R8qmdz0L5lEshBb1kO/CwRoqAGDYQvQbRYAaaXVKkjRoNmwS7vUQl1pjy
	DOEnQYz4v9pnmEHHX0gwKNVTpF+2LIk=
Subject: Re: [PATCH] x86/hypercall: fix gnttab hypercall args conditional
 build on pvshim
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210108144123.58546-1-roger.pau@citrix.com>
 <26f9456f-6741-1bc0-053c-9cb4733515e5@suse.com>
 <20210108151127.k5esycwouj2k57kx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cadf4328-0421-e9c0-5523-cb107d71457d@suse.com>
Date: Fri, 8 Jan 2021 16:24:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108151127.k5esycwouj2k57kx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.01.2021 16:11, Roger Pau Monné wrote:
> On Fri, Jan 08, 2021 at 04:01:52PM +0100, Jan Beulich wrote:
>> On 08.01.2021 15:41, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hypercall.c
>>> +++ b/xen/arch/x86/hypercall.c
>>> @@ -47,7 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
>>>      ARGS(xen_version, 2),
>>>      ARGS(console_io, 3),
>>>      ARGS(physdev_op_compat, 1),
>>> -#ifdef CONFIG_GRANT_TABLE
>>> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>>>      ARGS(grant_table_op, 3),
>>>  #endif
>>>      ARGS(vm_assist, 2),
>>
>> This is correct when a shim-enabled build runs as shim, but
>> not when it runs as normal hypervisor. Just like the hypercall
>> handler gets patched into the hypercall table (in
>> pv_shim_setup_dom()), the argument count will also want
>> updating there, I think.
> 
> Having the argument count set when the hypercall handler is NULL is
> fine, as Xen won't get into processing hypercall_args_table if the
> handler is NULL.

Oh, good point.

> While it's true that can be fixed at run time in the
> same way that we patch the handler it seems more cumbersome, that's
> why I went for this IMO simpler fix.

Agreed:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

