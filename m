Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2540C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 13:51:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E96061279
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 13:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E96061279
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104495.199905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxj7-0008Sk-6E; Thu, 01 Apr 2021 13:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104495.199905; Thu, 01 Apr 2021 13:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxj7-0008Sc-37; Thu, 01 Apr 2021 13:51:13 +0000
Received: by outflank-mailman (input) for mailman id 104495;
 Thu, 01 Apr 2021 13:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRxj4-0008SP-V6
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:51:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1052f36f-ff96-451d-9cef-c8c195c899cb;
 Thu, 01 Apr 2021 13:51:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5612EAF23;
 Thu,  1 Apr 2021 13:51:09 +0000 (UTC)
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
X-Inumbo-ID: 1052f36f-ff96-451d-9cef-c8c195c899cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617285069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fi8NRkLY2Xl21wSHVt+bFfZAgzXGbvhBo/c7Ah+W9Qc=;
	b=iqIRxM9FnyjkHG49s9M2j24tBxnPIIXOZJEumTejx5BnR1qcPgFnBFYcoM+6mKtOgRM1SD
	+a8VBpXolZKFTXMEC2/hNkLQpDo1NN11ZaDjpqLw3bxoK1M0AVV90mWFrdC86XFSbj10Un
	1rfE6Lx227RcAjWdAgICAbsmjG6assQ=
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
 <dae6b91d-e8d1-6d7a-514a-00ec8d201843@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a558450d-9426-079f-dce9-1bbb7e22a1e3@suse.com>
Date: Thu, 1 Apr 2021 15:51:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <dae6b91d-e8d1-6d7a-514a-00ec8d201843@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 14:01, Andrew Cooper wrote:
> On 01/04/2021 10:44, Jan Beulich wrote:
>> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
>> least 2.36 would silently truncate the (negative) difference when a
>> section is placed below the image base. Such sections would also be
>> wrongly placed ahead of all "normal" ones. Since, for the time being,
>> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
>> .comment has an entry in /DISCARD/ already anyway in the EFI case.
>>
>> Because of their unclear origin, keep the directives for the ELF case
>> though.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> It's certainly odd that we have stabs section entries in the script, but
>> no Dwarf ones.
> 
> Its not odd in the slightest, given the heritage and lack of anyone
> touching the linker file unless something is broken.

Heritage? Was stabs debug info ever used in any build of Xen?

> We've got dwarf symbols in xen-syms, have we not?

Yes, and that's why I mention the oddity: We have Dwarf debug info (and
hence .debug_* sections) in xen-syms without mentioning them in the
script, and we don't have stabs debug info in xen-syms yet we mention
the sections.

Jan

