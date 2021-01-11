Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2EAC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 11:30:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622BE22482
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 11:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622BE22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64797.114549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvP0-0005yB-NR; Mon, 11 Jan 2021 11:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64797.114549; Mon, 11 Jan 2021 11:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvP0-0005y4-Jq; Mon, 11 Jan 2021 11:30:26 +0000
Received: by outflank-mailman (input) for mailman id 64797;
 Mon, 11 Jan 2021 11:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyvOz-0005xz-7j
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:30:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 767665f2-482f-4a52-9416-3517046fc5c3;
 Mon, 11 Jan 2021 11:30:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47C32AB3E;
 Mon, 11 Jan 2021 11:30:23 +0000 (UTC)
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
X-Inumbo-ID: 767665f2-482f-4a52-9416-3517046fc5c3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610364623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvJQ0a6vEa6XZ7Ib2Dw8dirhPuR72sc06kY3MWt/rT0=;
	b=NwQFpGMIY+hZyVpiCmve11ekw+JLRbVphw8HkQLFhLIvSIvXpDTDfXCaAsi0DS4qvc92bh
	XAu40A94nqBmFd5UvWabFoe8Xlb1GczKkexbu8GV0Fba3DWZk0FixaClBIQF5hZ4fOo/ca
	jRGwOnbZ9ebSvTB1pqcyLThqfoLWoZc=
Subject: Re: [PATCH 2/5] x86/PV: fold redundant calls to adjust_guest_l<N>e()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <0199d771-a138-702a-2514-9139d0881175@suse.com>
 <20210111103648.qhe2pwspekxeizrs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <763f0ba8-3116-dd95-a2b7-637c293d1df7@suse.com>
Date: Mon, 11 Jan 2021 12:30:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111103648.qhe2pwspekxeizrs@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 11:36, Roger Pau Monné wrote:
> On Tue, Nov 03, 2020 at 11:56:44AM +0100, Jan Beulich wrote:
>> At least from an abstract perspective it is quite odd for us to compare
>> adjusted old and unadjusted new page table entries when determining
>> whether the fast path can be used. This is largely benign because
>> FASTPATH_FLAG_WHITELIST covers most of the flags which the adjustments
>> may set, and the flags getting set don't affect the outcome of
>> get_page_from_l<N>e(). There's one exception: 32-bit L3 entries get
>> _PAGE_RW set, but get_page_from_l3e() doesn't allow linear page tables
>> to be created at this level for such guests. Apart from this _PAGE_RW
>> is unused by get_page_from_l<N>e() (for N > 1), and hence forcing the
>> bit on early has no functional effect.
>>
>> The main reason for the change, however, is that adjust_guest_l<N>e()
>> aren't exactly cheap - both in terms of pure code size and because each
>> one has at least one evaluate_nospec() by way of containing
>> is_pv_32bit_domain() conditionals.
>>
>> Call the functions once ahead of the fast path checks, instead of twice
>> after.
> 
> I guess part of the reasoning for doing it that way is because you can
> avoid the adjust_guest_l1e in the slow path if get_page_from_l1e
> fails?

Possibly, but this is specifically the not generally interesting
code path (in particular not one where I'd consider performance
relevant).

> In any case, adjust_guest_l1e was only called once from either the
> fast or the slow paths.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

