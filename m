Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9889FC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 12:47:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425BB60201
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425BB60201
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93240.175972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnOG-00040v-LT; Thu, 04 Mar 2021 12:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93240.175972; Thu, 04 Mar 2021 12:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnOG-00040o-Hg; Thu, 04 Mar 2021 12:47:40 +0000
Received: by outflank-mailman (input) for mailman id 93240;
 Thu, 04 Mar 2021 12:47:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHnOF-00040i-AF
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:47:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e509575-c425-4e39-a4ed-959bfb4e90dd;
 Thu, 04 Mar 2021 12:47:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAADEAAC5;
 Thu,  4 Mar 2021 12:47:37 +0000 (UTC)
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
X-Inumbo-ID: 1e509575-c425-4e39-a4ed-959bfb4e90dd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614862058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tTcjsmmM/8/WzrDjWgvW5PTrsiWd7E1gB3Q1G5DCak=;
	b=jsv3FWf8evLTgq5HYo0Xo0GBrfokr7Iu3HVtMxYLCIO1KmxZy7X7PqUmmLx1v92gamLClQ
	1VC4LYhEDofa0/y2wmQznD2xFerM1MQvkEcwctSQNjySQBUo/iAktFX/33Cu0r5icXOQxZ
	bNpIZtGuFt1b2sx5WkiPlxeMp/qWCcg=
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
To: Ian Jackson <iwj@xenproject.org>
Cc: Charles Arnold <CARNOLD@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
 <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
 <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
 <24640.49856.639416.385729@mariner.uk.xensource.com>
 <027e1854-1500-306a-eac8-8571e09df71c@xen.org>
 <24640.54646.699914.490087@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16b56df5-ab56-f09d-89c0-218eac3d556e@suse.com>
Date: Thu, 4 Mar 2021 13:47:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24640.54646.699914.490087@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.03.2021 13:41, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
>> On 04/03/2021 11:21, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
> ...
>>> It has been idiomatic in some codebases for a long time to write
>>>      const unsigned char[]
>>> as a formal parameter for an array (of whatever size).
>>
>> AFAICT, this is not what GCC is trying to warn about. It is complaining 
>> that the prototype and the declaration doesn't use the same signature.
> 
> Oh!  I would have to check whether that is legal (I would guess
> probably it is UB because the C authors hate us all) but I agree that
> the warning is justified and the code should be changed.

May I translate this into a release ack then?

Jan

