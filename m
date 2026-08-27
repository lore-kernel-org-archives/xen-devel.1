Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C10BC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 18:24:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401361.1637070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzelv-00024l-2S; Thu, 27 Aug 2026 18:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401361.1637070; Thu, 27 Aug 2026 18:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzelu-00024e-Vl; Thu, 27 Aug 2026 18:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1401361;
 Thu, 27 Aug 2026 18:24:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wzelu-00024Y-6G
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:24:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzelt-003mjq-JS
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 20:24:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a9080cb-e002-0a2a0a5209dd-0a2a4503b486-8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:24:17 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a9080cf-fae8-0a2a45030019-888fbc3352a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:24:17 +0200
Received: by mx.zohomail.com with SMTPS id 1787855044478593.1115095426314;
 Thu, 27 Aug 2026 11:24:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1787855046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qa/5Nzk7KEkvNWU1rvfiM7/mAzlk1eM8tpzXPlCMrcu6QuVZZY4dwcOZvec73PE9D4cMNRmVikWsy9rgRW/S84q4UxvIupa/Yu+sEfeCTgaPDH96+00ICiw54zaswPS2LRkVWoOak3359KED+ls61lcqUj0X8BQNudI9Kp5VNVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787855046; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WgcjQHF8Gc4sAyKfmHIZHaXXMFKX771lzyhe2NzUA64=; 
	b=cMEsZXlSFFTNa2H+owvl8j1W4VOCGg3qSA9C/lmX9Yt5Vt5qbya/P4s+V95inkfXvzvH4kEmRQd9OkWSfAz8Z7dryDN9NycqWX1O5Q/eVZ+1hl4N0EyI1swJOM8CGOBGEwUYWgQJRj3uc5o8uSNpaO+ShZ1U1+JBNda/X6TRJxs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787855046;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WgcjQHF8Gc4sAyKfmHIZHaXXMFKX771lzyhe2NzUA64=;
	b=QTjl1/aAjjdYRf6blaW+uzMbjPf86dQ7VHPRnh5VXrPq/Tl37+864PkXJFOzSOcx
	4cC0tqbtDgTiWpIbsGMz0avcIRWENXZOChUVaN279yhJdc7L9KwPrqyodEvrBWvvGCj
	jHrX7gWj2hSHMjcUqwtUct5HPwnbv3ybSNPfUZF0=
Message-ID: <3bca5ff9-cabb-40d2-b1fb-49ddeb810815@apertussolutions.com>
Date: Thu, 27 Aug 2026 14:24:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <e73894ff-7ef7-4db0-9d91-45870b0d3c83@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e73894ff-7ef7-4db0-9d91-45870b0d3c83@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1787855057-764FC4E9-4E92EF66/0/0
X-purgate-type: clean
X-purgate-size: 559

On 8/17/26 4:53 AM, Jan Beulich wrote:
> For whatever reason they didn't have an xsm_default_t first argument (to
> cope with XSM=n mode), making it impossible to (easily) cover them in
> xsm/hooks.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2: Drop uses of current->domain from dummy handlers. Move const-ification
>      in xsm_default_action() to a separate patch. Re-base over re-ordering
>      of series.
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

