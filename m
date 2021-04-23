Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20CC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 12:54:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D49F611AE
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 12:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D49F611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116310.222000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvK0-0001VN-Fj; Fri, 23 Apr 2021 12:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116310.222000; Fri, 23 Apr 2021 12:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvK0-0001VG-CP; Fri, 23 Apr 2021 12:54:12 +0000
Received: by outflank-mailman (input) for mailman id 116310;
 Fri, 23 Apr 2021 12:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZvJz-0001VA-92
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:54:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dfa893e-bab0-4199-b3b4-e9abfc6472d5;
 Fri, 23 Apr 2021 12:54:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB567AF49;
 Fri, 23 Apr 2021 12:54:09 +0000 (UTC)
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
X-Inumbo-ID: 4dfa893e-bab0-4199-b3b4-e9abfc6472d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619182449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzspcMHk3swWJcK1dZoDy35sP+1K7F1C2+/JWgbylxA=;
	b=JhsNAmsS++WbiMQ4IoVTjz3uAb3Siy/xwhhdmyHYhhNQ2nz6PJdWlT6cHZXmf68w2P/VS5
	R16zcXg+TVeNz5QF02giawWCsqrdV42vlQkWDNzK18+1R9vLp4k6XpdP/eYw5b0T/ij72/
	QKgL3bSgvid8l/i8xAZOHbiHFO4L3zo=
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20210423123509.9354-1-roger.pau@citrix.com>
 <148bd895-17bc-188d-e2e6-c1604400c5a3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea669904-a7f4-fdc7-80c0-6a88d61e655e@suse.com>
Date: Fri, 23 Apr 2021 14:54:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <148bd895-17bc-188d-e2e6-c1604400c5a3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 14:51, Andrew Cooper wrote:
> On 23/04/2021 13:35, Roger Pau Monne wrote:
>> Remove the unneeded usage of the compat layer to copy frame pointers
>> from guest address space. Instead just use raw_copy_from_guest.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Just build tested. Note sure I'm missing something, since using the
>> compat layer here was IMO much more complicated than just using the
>> raw accessors.
> 
> Thankyou, and yes - I agree.  The logic was unnecessarily complicated.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Needs a fixes tag, but can be sorted on commit.

Fixes what?

Jan

