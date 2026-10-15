Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D9CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 07:55:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449970.1665482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGIp-0000d8-E1; Thu, 15 Oct 2026 07:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449970.1665482; Thu, 15 Oct 2026 07:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGIp-0000d1-AV; Thu, 15 Oct 2026 07:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1449970;
 Thu, 15 Oct 2026 07:55:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHGIo-0000cv-1t
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 07:55:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGIn-00710T-7p
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:55:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad086c8-e002-0a2a0a5209dd-0a2a4508d8ae-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:55:01 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad086c9-f659-0a2a45080019-d155802dbc76-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:54:49 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so30956435e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 00:54:49 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs367967.centertel.pl. [37.47.68.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd68585csm33483945e9.4.2026.10.15.00.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 00:54:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050889; x=1792655689; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v0VaYa6VgM5i5nyb3FRlwabJ6a/tr5PRWYVlVFU0uI=;
        b=tL4edTBKNXU1fZ4FizMQjw76OPCCtCVk+RGQ2Hl7Uo9aBX+qf4iyrl/Y4gOzK7vnll
         FsULb12aR5p3dRD2ax03Bco1l8RoBNP2oafo4S/m/3itYCu9FURKsHTfHwbzrCSuA273
         IsfDN0v/fPO7p/XmTrSzlDvfHgQ3BokAkVRFcSW/FR5Benj1XKpvqT7paQYSKiAGVohe
         o7JFuk6PfyJxR5TcxnNC8g00YOM14c7QYTXhGfufHDZY/AcyDvWnAzmZncwIQA3IPejz
         OQKDx7aL3yY1KWFmnxrJJVToG96THINqMR0Y86R7K+bd1QGxZE7pL0Lb6LTxzzz7IuBr
         TSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050889; x=1792655689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v0VaYa6VgM5i5nyb3FRlwabJ6a/tr5PRWYVlVFU0uI=;
        b=FlQC6gmRYOE34N4jVoWC2dS7H0V6KSKIY6WoMaAdsi/p54Ky3HHT736qtVnS9TnyBP
         jJUHhY9OMxgfjORukGu+0ni01ycr2iOq77K53EfKksmzs+zPv44NV+fpSOaQB+lGdw/D
         gfZKRwRMRcRVelP89H5stmmD5KmXmd3n62k2zngOYCrro/fV5YYNtGX1ONFhliPhut35
         utlyz3uz3D94rqB/+sA2icXL8lhIPz6lgir1vAlUGU0TAqdzZ2AEEJoZpeKXciv76Zaf
         62bzh2fDbLB6PjTYd5mGvApxb1L/Pm5kyPoXloQxolmIxUGrybDLcKB8zw4q4/DYHL/4
         bMPw==
X-Gm-Message-State: AFq9FYIGThoOkkhxy1JGW7weYQesPexNpFwcmUngm+LvDJacurl99xXi
	5lbblo+NJWLydmw9n6z7k+EyDjO2hq4iggDaCytoRwFXfgRUeYcU38sq
X-Gm-Gg: AYBFou2picscnlHrQzCKFJc4BCHpmjv9w61bwhPMtusKdUmvn32LVEOD787Qu/+74Sq
	Bzgpucpy6HEaHkKRh7oum5ci4Bf/sl0AZ5Fkf5KHU81XsMEB4+G2WTj+l9Cve32Bw0oIAeLdX2R
	M1QFnO4yR62+olhW3/t+CbZMAcV6r4MAbAcj0N25UQRjeH2tWq0nZumvIWVqqNO66EujFwLWBcy
	CMN9RZKOz/6jM0kB+WuV0zY4qBXBXy3VrNmaT/poFafc9mVt0N3UZRb8y7FHisFvxS79/A1BUc7
	R19tIQIlShwkYpWdJuhoHGcphFxYaSSfL/a3GFKHrLitjoEA0VNRsI736gnLvTb3BhHAMhZzPaS
	v+vjJ7Mbk/jCIWX76Ny8vAP7IZAsy5UVZZWr53pmaRy6WJYrn2EeIbw6FjZqlmut5bPeNK/Ks3T
	jjTvqpNgIa52YIlX+oZ5jJKwrib5+gvusun63thmHBvTcOMUXJZG0fmOEePJv+RPMgDXd6kzKuv
	A5cJ0XogBo17I/LOskKWGoGYp6XoS84UiHtVmk=
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a18e4aa057mr370501985e9.17.1792050889005;
        Thu, 15 Oct 2026 00:54:49 -0700 (PDT)
Message-ID: <f7dd6f51-ac42-4487-9f9f-cf0d3ba64455@gmail.com>
Date: Thu, 15 Oct 2026 09:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com> <atB2HqxU_D481PBk@iscas-ws>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <atB2HqxU_D481PBk@iscas-ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1792050889-CC57487B-ACC55FD1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2074



On 10/15/26 8:44 AM, Zhang Zheng wrote:
> On Mon, Oct 12, 2026 at 12:20:50PM +0200, Oleksii Kurochko wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c

[...]

>>> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
>>> +        cpu_relax();
>>> +
>>
>> IMO waiting for TEMT rather than THRE is the right choice: besides
>> resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
>> LCR, which would corrupt a character still being shifted out. (Linux
>> waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
>> already implies THRE.)
>>
> Yes, I followed the Linux implementation, which waits in an unbounded loop
> and theck UART_LSR_BOTH_EMPTY like you said:
> 
> for (;;) {
> 		status = serial8250_early_in(port, UART_LSR);
> 		if (uart_lsr_tx_empty(status)) /* checks UART_LSR_BOTH_EMPTY */
> 				break;
> 		cpu_relax();
> }
> 
> So I didn't have timeout handling
>> The unbounded wait can hang early Xen boot if the UART never reports TEMT
>> for some reason(?). Bounding the wait would make console initialization more
>> robust, allowing boot to continue when the UART is unavailable
>>
>>      for ( i = 0; i < 50000; i++ )
>>      {
>>          if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
>>              break;
>>          udelay(10);
>>      }
>>
>> would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
>> separate patch would be needed for that. On x86, udelay() doesn't delay
>> yet at this point (cpu_khz is only set by early_time_init()), so there
>> the loop would just be an iteration count. Perhaps someone has a better
>> idea of how to implement a timeout here.
>>
>> ~ Oleksii
>>
> Leaving aside the unavailability of udelay() at this point, is a timeout
> considered necessary here?

In the way Jan B. mentioned here: 
https://lore.kernel.org/xen-devel/20261010031406.2057735-1-zhangzheng@iscas.ac.cn/T/#meaf24c3bb039dc6aaecffab752d2b107581816e0

I think we still can have timeout check.

~ Oleksii

