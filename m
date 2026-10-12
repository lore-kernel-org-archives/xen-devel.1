Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAA0CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:26:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446322.1662428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG2K-00040k-Lf; Mon, 12 Oct 2026 13:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446322.1662428; Mon, 12 Oct 2026 13:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG2K-00040d-Ig; Mon, 12 Oct 2026 13:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1446322;
 Mon, 12 Oct 2026 13:25:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGG2K-00040V-1r
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:25:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGG2J-004cIm-1R
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:25:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accdfcf-bab6-0a2a0a5309dd-0a2a45068df8-48
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:25:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accdfde-195a-0a2a45060019-d155802da524-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:25:50 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a166199820so11913405e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:25:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e48db03sm407940865e9.3.2026.10.12.06.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:25:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791811550; x=1792416350; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9+MB/Z1Xmt/uUTQiiC8cla9bqudcNF/hHQ9kFRjU+k=;
        b=WvkztLeIOEJ4ucfa0Yvh+fIPKJM9QKhMe686Bz0I9Ow5Faj5OFaRDUHXy0wrk/kdni
         c1r7CXZB9bdCLHGbbwxxDvu4l0JACuSvv10+l5yEFuNl/rPpnPETResiAGL2I3Ada9Py
         I6CBmEDe5qX0C6J6s7F5ZOXUUlzzFN3BXA5YpSkzzdf1ckCD8b/rlOnNXl8qVaiBWs24
         eQlI7R2f60GT7z9dlHL/+HmU6i8lsnb/tnV1ZtrvwxHeso+1qnbnQnnqfWE4U09g8MH7
         JR++VVJUfypFq6hOJVAKeRq0Yy3MyQGcNjClLyAlh37R7xktMnH+T1J+6QE1G/oa4iEA
         Fb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811550; x=1792416350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9+MB/Z1Xmt/uUTQiiC8cla9bqudcNF/hHQ9kFRjU+k=;
        b=DCnYVsycQVR5oz8ZdiEILZ9bW3reuXgOc3fru5mZfaJSTclhbHLVu/tVzVKILfT6Hf
         GFOROoEr6TfYhF+4Y3RM7LoNbH5NLZTpNsscoG6jIu2oMmMTq5ss43dcxHTopXDhRkMl
         VZrhOocuRS9nWqW86Z309H6J+RJ4ROPHm/i2dVmnKJL8UX025+FR4WQ9hNq4nR+Nb/yB
         pgTHvEHTNmTot8QhlQyIET1XS/jxnFu9ppSGg5BI/kqXCkxhBIyGrz5hXKQ527k3kllv
         rJX/qhuCh+4UvQQb94Dyv4QQFmIYvqlE93v4a4Wwk1V20LBWeYHArUlfq4T3bZhNPHwx
         i+bA==
X-Forwarded-Encrypted: i=1; AKwUvBwb5ukRsius8LvtpDBk54b0VyAnbGXcBwbttaNMFbXyOXEM3Ixl/7nBIaeVL13Twpw1dS40I3ppIJM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLIZwMCfaen3AnhuJatdN/+HDDPGd9NB/yqCEzsfDPvT/zUHJYi
	do6smjntu1hvk8h0qB9bxUrxd0RefmPQANxMolqYTsgDyOT43P1HnnYU
X-Gm-Gg: AYBFou2DlDTvyVROTUWukoWqtd5Xk4M2OokLpinMwfsaiVzWY7qyW87+0STd7w7v0pH
	VWWnZzmBPmq8Svwz5O+eQWhAfUMMQgx21w/VXhDKuZc+/NhVHGgbqQ/JKyT+OTggMPRJTMM6qNT
	27ZSVvanrHcT6CoLKeSQaJxJn+rfBsa0Y0CKiXZ++flYY5MjMlUgJ7WtAUCZVtzyYXCqehTM9OZ
	Plb3tAuL6sfqUx8ImWisGPxeOV54hB9maM7fnfLcbZQBqN7NuKhq+uQTU72PnPUgpB4JxhKCHJT
	MI8z0vPF9vuGNTZ76/qsqpbRIasQRkW94LoT7BXZsvpxyPruTcqhRqplHj1lQ1u2aIY6r1FYDOL
	inDmYAJNc8rkNLqMlM58T4O6R+pjOWnr6WlkEI53/vC1tyszkNyDVTTL73g6p2FD1F5LTIR4lbT
	HhbsvndUTbuRb8Mq+ugKSzt4Jf+ZsLPc08NUIW9A/kcVtFXqlQZtb2z7YuDOwagwX7ggyUWYX3y
	GtVmuL8M/a72FDt1ShXjUWezuJ3tAzut5fR+sj5k1R/vgFFu41Apouy6Nt0
X-Received: by 2002:a05:600c:c10e:b0:4a1:93fd:913 with SMTP id 5b1f17b1804b1-4a193fd0ad6mr95790335e9.10.1791811550198;
        Mon, 12 Oct 2026 06:25:50 -0700 (PDT)
Message-ID: <a68d7699-4efc-498e-92d8-538370cb0f09@gmail.com>
Date: Mon, 12 Oct 2026 15:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
 <be9c9f29-e211-4b84-a3b1-fd65f3b52315@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <be9c9f29-e211-4b84-a3b1-fd65f3b52315@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791811551-FD80D77B-37CD3DDC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2280



On 10/12/26 2:56 PM, Jan Beulich wrote:
> On 12.10.2026 12:20, Oleksii Kurochko wrote:
>> On 10/10/26 5:14 AM, Zhang Zheng wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -427,6 +427,10 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>>>    #endif
>>>        }
>>>    
>>> +    /* Preserve output queued by firmware before taking over the UART. */
>> я'
>> Could the comment say why the wait is needed at this point? Something
>> like:
>>
>>       /*
>>        * Output written before ns16550 takes over (e.g. by firmware or the
>>        * early console) may still be in the transmitter. Let it drain before
>>        * ns16550_setup_preirq() reprograms the line settings and resets the
>>        * FIFOs.
>>        */
>>
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
>> The unbounded wait can hang early Xen boot if the UART never reports
>> TEMT for some reason(?). Bounding the wait would make console
>> initialization more robust, allowing boot to continue when the UART is
>> unavailable
>>
>>       for ( i = 0; i < 50000; i++ )
>>       {
>>           if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
>>               break;
>>           udelay(10);
>>       }
>>
>> would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
>> separate patch would be needed for that. On x86, udelay() doesn't delay
>> yet at this point (cpu_khz is only set by early_time_init()), so there
>> the loop would just be an iteration count. Perhaps someone has a better
>> idea of how to implement a timeout here.
> 
> Whatever it is, it's going to be more or less crude. See e.g. Marek's
> solution for a similar issue (yet to be committed):
> https://lists.xen.org/archives/html/xen-devel/2026-10/msg00439.html

I am perfectly okay with the way suggested by Marek.

~ Oleksii

