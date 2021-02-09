Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B14C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 10:06:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B5964E8C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 10:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B5964E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83181.154221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Pum-0000AZ-CU; Tue, 09 Feb 2021 10:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83181.154221; Tue, 09 Feb 2021 10:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Pum-0000AR-8B; Tue, 09 Feb 2021 10:06:36 +0000
Received: by outflank-mailman (input) for mailman id 83181;
 Tue, 09 Feb 2021 10:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9Puk-0000AL-Kt
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 10:06:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35d98260-657a-4fd7-9db2-2e3128c60896;
 Tue, 09 Feb 2021 10:06:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 251B4AE3B;
 Tue,  9 Feb 2021 10:06:33 +0000 (UTC)
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
X-Inumbo-ID: 35d98260-657a-4fd7-9db2-2e3128c60896
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612865193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAdp+dgFr/1Fy+3hDJaJOcEodz3X7Lg/NImt0uIIEJw=;
	b=lldFJSVcoH11qByznRii7BSJBTm09rlpAMdZZUzOKpGoNpv2ZlhW6C4+uU6WLm4xo7lKPa
	1xgS3eqMS0x8HQV/wMgHs6GCu6OAhqYMGifDthS1QdiaggawfrG5k4s4zzXcDF+CcF1UX2
	U96G0RnN1Rql3PYOnqSWwG2TgHBDXFQ=
Subject: Re: [PATCH HVM v3 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <20210208200049.28571-1-nmanthey@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67bb7ba1-bacf-7884-f513-b47b7fe5b694@suse.com>
Date: Tue, 9 Feb 2021 11:06:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208200049.28571-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.02.2021 21:00, Norbert Manthey wrote:
> To prevent leaking HVM params via L1TF and similar issues on a
> hyperthread pair, let's load values of domains after performing all
> relevant checks, and blocking speculative execution.

I'd like to suggest "..., let's load values of domains only
after ...".

But there are other points open from v2; I'd like to further
suggest that you allow discussion on a prior version to first
settle, before sending a new one. Unless of course discussion
appears to have stalled.

Jan

