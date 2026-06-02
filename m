Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C9CD6E60
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 15:14:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325168.1590679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQpO-0000Fs-FF; Tue, 02 Jun 2026 15:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325168.1590679; Tue, 02 Jun 2026 15:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQpO-0000Fj-CH; Tue, 02 Jun 2026 15:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1325168;
 Tue, 02 Jun 2026 15:14:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQpM-0000FT-MC
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:14:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQpM-00Cbmx-2S
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:14:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef365-2eae-0a2a0a5409dd-0a2a450cab30-8
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:14:48 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef367-62f1-0a2a450c0019-d155802cb03c-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:14:48 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490afc47455so8169585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:14:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e13eefsm71328525e9.2.2026.06.02.08.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:14:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413287; x=1781018087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20pr1Ho0BKGs90tFB0h2APkzbcen8lyZhRW8OoBAuhA=;
        b=hFG1ckAQJjpINVWP9gmjNtcXq7a3EQmPfyNzjNFvrv1/mcEtvg+Fotr1/I3u1dH2VQ
         RalChgIbaaEE6QlxxL0zxgz3phKdBWdRSh9YrQpMgq2u9qZPlUyQ9MdVb4EpxNBSW4BE
         G5isEPbWmOaHdiPzRHNT43lxYdPnPIQjl8BGs1OPQz/fd5GMM6vqMJH509gJDOPi4mR5
         k78iSQEz+ERwwFvaEf2K/Rb1aSKqdu8+N/AMxr0gPeWKJVmwNNvrKQCsTQIbB4UZQk8k
         Raqbjv+7Y2UrhjGuD3N2qe+GaquYov6e7+ZUWRnJOPnb2XEuEjffdB7hUHqkMVnXydU5
         MqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413287; x=1781018087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20pr1Ho0BKGs90tFB0h2APkzbcen8lyZhRW8OoBAuhA=;
        b=bOcdWrYoevPndQy3Nrgjgx2h7oIFSw0lM0STSq0IgNq2hc1nfm278MyqQZOWuBiydH
         ZO6CAaQ27nZd3nlmgi0l4wLfs0FmP49rLaNIf9TcDyBchZSP/xBBBLJIAJsg30eEx9+3
         bPEM5SVfhW+WGDhg53dtcoH22xUtD40/N31vSKaQxcRaf7YOoFrz6uCNhsAPgxlUOX/H
         1MY8HmvpX25JUUyUOeBnyeOP0elqiVzSkavvw+Is6Y8XuQCrNjnWZkK3XbzvE7jDr6Zq
         0S04d3tHTCZKuKHFg9QsCXXW82IquvP5/TfYk1j6OQDCPDvdhsb9kbaCEw22+7qk5wSy
         bWew==
X-Forwarded-Encrypted: i=1; AFNElJ9zoO2DMznLAEGsF7NG7ZE3A04fHVeF220qiS/WnNr7+G9budlgc8nxWYWcmtaoBosNmDbqGSMJWSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVkcl7CWr6W0tfsk1Kxc9GoU8q8G+LsrOQv2WLD2w9IFv7vGf7
	4ZTw8n4WqvN1+HawNO8cR/C43hM21UUXR3Oy5Oz2IZZRIRcnlzUd7YcRRBIGVw==
X-Gm-Gg: Acq92OFw9qLOIWjmQMRv2ZGMNAt4tvYCjJkm3ZOZen3vNpgHUYUAnLadhHX/DhWQlyX
	/BBz/ESx93rmSCEIetYZb0CKGhnOoXIkpHXFquQ21Ud9rVnO7HindV4RSEvmm2lb0Q104gD3o3u
	q52PUCkcZkKaNFg/WGnH8D83+IIeyddf/8WOgpYT4USaRsNrbKA+mgbhpqYH8Hipz/l7x15fUgr
	AKcsBbknPv8Z0pRMA4j4VxuuRCjUeyUwTzaVhOvp+b2FkebQp4tJT9upgV07pfmN+1cUzzEtR9e
	GmLdiGIOn4uScpepgPqxNR2WJyUKsWs0OSREDqmvXMQUNjePmyJfUPC0mQOxS+8SxBXOK8a5OBX
	iff5ZSbSQNQDTOmsqlTERDhEP0DhsVMnqUC5zSTskoNcKXQOLcMQ0zIPkQp9iBdPst7SaTptNoH
	Jf2VMfUms7R5miNmVtUZGnwlhh2oBAIA91vW920+y8L2t2EQIMCl1Xekmr+Ewn39uIVzLfRQj+O
	LZ2IUYupfYv6pCw
X-Received: by 2002:a05:600c:1382:b0:490:b1ce:1cac with SMTP id 5b1f17b1804b1-490b5082284mr2781725e9.14.1780413287439;
        Tue, 02 Jun 2026 08:14:47 -0700 (PDT)
Message-ID: <a409b476-c763-4858-a174-f50c751baa52@gmail.com>
Date: Tue, 2 Jun 2026 17:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/efi: Use blexit() instead of BUG_ON() in
 read_file()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Szymon_Aceda=C5=84ski?=
 <accek@invisiblethingslab.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260602122441.2961974-1-accek@invisiblethingslab.com>
 <979ceb84-f254-4cbf-a33c-8d4557a12b11@suse.com>
 <e20f4ceb-cacb-4dc2-8811-868204ebb818@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e20f4ceb-cacb-4dc2-8811-868204ebb818@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780413288-DAB74CF5-12906E35/10/73395122804
X-purgate-type: spam
X-purgate-size: 1113



On 6/2/26 3:10 PM, Andrew Cooper wrote:
> On 02/06/2026 1:34 pm, Jan Beulich wrote:
>> On 02.06.2026 14:24, Szymon Acedański wrote:
>>> Follow-up to 880e40b187aa ("xen/efi: Fix boot from a device without
>>> a file system"), which added a BUG_ON() guard in read_file().
>>>
>>> But as Jan pointed out, before ExitBootServices BUG_ON()
>>> is not functional. It results in a hang with no message.
>>>
>>> On the other hand blexit() prints a message and returns back
>>> to the bootloader.
>>>
>>> Link: https://lore.kernel.org/xen-devel/bb0f007e-697e-4501-97ea-3b59cf494ec6@suse.com/T/#m4725c8cbc0946a5533aea03fc240267ef139648d
>> While Linux uses Link:, as per sending-patches.pandoc we don't. It wants
>> to be Reported-by: instead, and there wants to be a Fixes: tag.
>>
>>> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
>> With the above properly sorted:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> CC Oleksi.  We're past RC1 now, so everything needs release acks.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

