Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA69606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=BofY9OGN
Received: from list by lists.xenproject.org with outflank-mailman.1486897.1689352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRnPI-0002EZ-UM; Fri, 13 Nov 2026 09:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486897.1689352; Fri, 13 Nov 2026 09:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRnPI-0002ES-RN; Fri, 13 Nov 2026 09:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1486897;
 Fri, 13 Nov 2026 09:17:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xRnPH-0002EG-Fn
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:17:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRnPG-009TAw-SV
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:17:14 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6d597-bab6-0a2a0a5309dd-0a2a4505cefc-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:17:14 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6d59a-4cb1-0a2a45050019-d1558029d8f1-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:17:14 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so5186075e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 01:17:14 -0800 (PST)
Received: from [192.168.1.51] (host-78-146-248-75.as13285.net. [78.146.248.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5ba25b50sm6438765e9.14.2026.11.13.01.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 01:17:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:Cc:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794561434; x=1795166234; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC+UiBGV23Xn/Hm6cP/auad/ZppIxe+9WsNO8LTAWMQ=;
        b=BofY9OGNXHMpZKunr7Gw6loXhw+BFvCOynfVrE+CrsVz/VeCV56HNPq0VMA2Y+8PM5
         ZsYuKUhejuuW0c30nQcWEU6WtCSDJOrR8kBtetqLbPl/VzwlOl6lNHmUuEzAd8t7LlqZ
         JFHPJn/+fHHS52NuniqQg7jkQ0jQJgLjeUtVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561434; x=1795166234;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC+UiBGV23Xn/Hm6cP/auad/ZppIxe+9WsNO8LTAWMQ=;
        b=PCPOiqHNIIC6eHV5hvTLFypZ1K8yQwmdM9w6JWFgPwR7Xvy/EIjaMlmIJ2cMFoUjPO
         o8Y+ogd92pgrlxakefmkHgNy8eLcvetdu/1NsAejP8m3wo9+IW0ppQZn0FYpjeSfH1is
         XKRT0Ixsqb7SFHGvN6lK3hnwZ/52maocL+iV7ELavkl3WbI5+4y1xif5S+QHrUUtcJoz
         oZEgtxAFEFkeC3XU3HR5JNKtOt6sP6Ld7XEBFhe6GPbzBLv5Gi625f+yJI0QqvNdlDGk
         hXULNcgtJH+DFmSVLJkXF60Wt4Q4NMD9Ju8mTGTqoMbg2y9ySW1I9AZT8Gh81f4G3Qvt
         bbmA==
X-Gm-Message-State: APuU4Z9BZpPGE1/nQqXYE3NiCIJV3GK4O6ESFFxoMrP0rsJYKWg20mVQ
	Nlk6DPhokLHjtjkwp2LoDCnS+e98U4oU+aKh5cWHLTQbmi1v+EtF5cDTlZk0TTCF5z4=
X-Gm-Gg: AYBFou2F7Y2hqfPurIHf/TfLZRLezqCdK/2lIPeWCbyCHUF5PcLZ97j62f9iMhOufD9
	f6zZmm8NRVFD0ItBeFAsp/L3+JLBV74SzUUblGZrWx7/M/JORH4m9jKNIjXXTxksoxhIKSruhcE
	Hk5xt+p8oLPMpr0g6DGaZhb54XHUHAXbuy0nil6+2CYMXMm5ZqFbqhgt2IqTqWX31xh4Q6diap0
	RlN1vOYu7PTXopO5e7LpsfrEoPavSM76IB2g8T5W0lDXUgP2fKAXi3qyhPoToouse8wpyynU1Ax
	DlR0/a357Sf5Tc3QelJR8EzTcrvDr7L+urICbfwmEpR4/tk8W5FzfnZ33rfj0vMIPkF8Cyx2cE3
	m8acfNJpIwDV4nlv6IMowVfk8/ccTAY/bOTgW9X40Y+4hBKdLoGzc4dnnXuCOMx5E+AG95xRqYk
	TPn8Vxw3fnlqKDIy32A+qb3Lzaz5hlQwAAddJzAR7qB7h8xyR2baEsR5UzMV7yCFItIsq4Xt9HK
	ATqqHqqELdKW4zmcJX6WPZKSZeF3fD0lLSQ6+CpnCMExa09qK/smnZJO9xc4LB/RBHL0njOdsbd
	w/Z/hxBIIPuHXFbY0bXGNClRwY92vtO8bkltRDZQ3Oa0q5igXUkJsYdsvWjOe8EJfCNIVw==
X-Received: by 2002:a05:600c:3484:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4bb55ade83fmr34600175e9.30.1794561433936;
        Fri, 13 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <a1284cfa-b0e6-417a-8949-646cbbcab354@citrix.com>
Date: Fri, 13 Nov 2026 09:17:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
 <87pkw98qbd.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87pkw98qbd.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794561434-245122A1-A9BE066B/0/0
X-purgate-type: clean
X-purgate-size: 884
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 1:38 am, Volodymyr Babchuk wrote:
> Hi Andrew,
>
> Andrew Cooper <andrew.cooper3@citrix.com> writes:
>
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index d1bb6c62d208..8d0954c90afd 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -86,16 +86,14 @@ SECTIONS
>>        __ro_after_init_end = .;
>>    } : text
>>  
>> -  .data.read_mostly : {
>> -       *(.data.read_mostly)
>> -  } :text
>> -
>>    . = ALIGN(SMP_CACHE_BYTES);
>>    .data : {                    /* Data */
>> -       *(.data.page_aligned)
>> +       *(.data.read_mostly)
>>  
>>         HYPFS_PARAM
>>  
>> +       *(.data.page_aligned)
> A small question: why are you moving data.page_aligned? I don't think
> that this can cause issues, but I want to understand the reason.

Because HYPFS_DATA is read_mostly too.

~Andrew

