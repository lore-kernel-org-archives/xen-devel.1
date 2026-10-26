Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E517606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdKL39Dx
Received: from list by lists.xenproject.org with outflank-mailman.1461515.1672540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMYy-0000lE-Sb; Mon, 26 Oct 2026 15:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461515.1672540; Mon, 26 Oct 2026 15:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMYy-0000l7-PB; Mon, 26 Oct 2026 15:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1461515;
 Mon, 26 Oct 2026 15:24:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMYx-0000l1-LU
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 15:24:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMYw-001BgA-R2
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 16:24:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf70ae-e002-0a2a0a5209dd-0a2a4505ea64-22
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 16:24:38 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf70b6-4cb1-0a2a45050019-d155dd2ba838-3
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 16:24:38 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so10793f8f.0
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 08:24:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a5822a7sm208618255e9.11.2026.10.26.08.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:24:37 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793028278; x=1793633078; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LInYRTx0Us5Xo7p6ZCOOB9+2275ARbSTj2x2CtbVzGI=;
        b=AdKL39DxnKCbzZvEmFdmblRzgHyghgPEEv6C7Npwvcp2SullbUQ70g+PPBPTvbm+mR
         hqagClZGEO8SF9ydwGHwF8a/T0DfwNgEE8WNngZ4TDGlyEXG9QZtX34jHkh1An9DxXtP
         gmOCxj2AUld3jc0XpDGkb2tHWl0uu9OFXv1Udp2sNxBRMkohuruItNM/q0M8xv0MEUBo
         3lsRzVyuhnRn7xDJBHajz6dXwAveuhYf35EnWC1+vCHFJk5M+DMWQvXMaYp3+Km3cV+y
         m+jxUAhRNlKvJ3mI7qyuJ53SETPx+fupPSwJ+ptLgBde8Z74HP/1CpItUET72eBdQo5O
         pk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028278; x=1793633078;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LInYRTx0Us5Xo7p6ZCOOB9+2275ARbSTj2x2CtbVzGI=;
        b=LPyVV147C4rSL/RAOmmcktilqGclIFateh4g+0Ff/dUX9TIDh4VdObV0YCv4LHScjP
         2jiqfP7rh12TC3348Hrnfs8XEgx5dC3d/tIav0+as6kzMElE+Qrsm07+gaeSPiWVuqhU
         d+w6y68Q3KG00yNF+LU4sH9YT5tYecvZX1olzAtNyChFfKpJ12iy+GO7EfiYC+P5WXwA
         06vVURKxC/06HIXf3/jQNqPkYdpDDe3UbSM7s071dwy+KK3G6nMrTTozNTvPAYBOe7u6
         3g6Lu9zbwPkTB+/ryIItU0xuczIDoHpjjX3HPyhvfKJCeNo0mLCGOfHTl3IGJcuGtmQS
         RPDA==
X-Forwarded-Encrypted: i=1; AKwUvBy4weOyJvSL5lXFK8dw+4pcZaVJpkz86X285kD7RbTw30irEat8sp9pp4lYCGHUlwRXhOhnaPMJxs0=@lists.xen.org
X-Gm-Message-State: AFq9FYLdOm8gWY8Q7oE0bCoCr/J+BTHeqm4hP5uPWZcoe588mj3JCbZo
	F14RBhhkmTxE9ScYHTIu9wvC3ixkAD5k4ci2k+heQFvo3UylaaFsuz0U2SvTE8Mh/Q==
X-Gm-Gg: AYBFou1a5OukRtSc1O9GoOnEZ5zaDsiM637UN1FlleVtblGbia3otLai983PiYfIKOB
	U+1I52/s/Q9gnmRMwe95eRegztOxfqO+l5trR0Btpqhc657uV3p+WgDUjwv70V9b491cq4wJMIp
	LJ4keiVtGk4HeL6XMziWY4O6ORXNoJMsVJHqFhN/f4iLymYqF46553nrlpIPcPOLs5qjPq+v6av
	SUjm6lDawcIaRHcXpHsY0chLJVpQKVKfQSaZ33gdwvPqfPzfkiCZlKFyjk2OoE3tK6IeGwiAtvj
	Egr1OGUpHSVTPc4w/u/kQUNM9B2t2L8wNkGFDNOqIIKQ1j7yKcs6QUaLI5HNglTASkKvO3cBW7B
	7fZZFE6quipgk6LWeTaw50xbbH6XDLqbsjrtPPbvr7PvrCnX9N1scl4h7/Jxk/s3LVokBwmClz6
	36dAwJGHjbKjFnkdjqrMG35WgwbybcUykjAKYwPBk3pvqfLkuPhwEGhxKqq3Dzb/2EOeDf2Jb1t
	KeaXQebz494dcUd8AJsOqlM+D9obDeorJbC2rzWr6Lk+Nj2tshOWIo3u+hb/eLkMqejUs7gU0bT
	my8K4oCmHHC4pPNZN4QXhQQyZ72sDE0zKlhBGsPYGJfW
X-Received: by 2002:a05:600c:a318:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a7c0b3f6c2mr35275e9.8.1793028278084;
        Mon, 26 Oct 2026 08:24:38 -0700 (PDT)
Message-ID: <ecfac9d0-eb72-4bb4-8aab-879cfa5dffd9@suse.com>
Date: Mon, 26 Oct 2026 16:24:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
 <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
 <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
 <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
 <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793028278-2491C2A1-6075BB4B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3498
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 15:48, Peter Deggendorfer wrote:
> Am 26.10.2026 um 11:53 schrieb Jan Beulich:
>> On 25.10.2026 13:32, Peter Deggendorfer wrote:
>>> Regarding the output of /dev/mcelog: if my decoding is right, three
>>> things stand out. MCi_STATUS is zero, i.e. these banks are reporting
>>> nothing at all -- no error, no garbage value.
>> Well, things can't quite be that way: If MCi_STATUS was zero, the first
>> check in mc_amd_recoverable_scan() would prevent mc_ec2type() from
>> being reached in the first place. Its caller also checks MCi_STATUS_VAL
>> to be set.
>>
>> What I find puzzling is this:
>>
>>      errorcode = status & (MCi_STATUS_MCA | MCi_STATUS_MSEC);
>>      ectype = mc_ec2type(errorcode);
>>
>> With errorcode (and mc_ec2type()'s parameter type) being uint16_t, what
>> use is it to include MCi_STATUS_MSEC in the mask? (Yet that's likely
>> unrelated to the issue at hand.) Considering how mc_ec2type() works, I
>> see no reason why status couldn't be passed to it directly (with the
>> parameter type widened to uint32_t). Then the BUG() there could perhaps
>> become BUG_ON(errorcode).
> 
> You're right, my conclusion was wrong.
> 
> One more data point, from an hour ago:
> 
> (XEN) [2026-10-26 13:13:42.050] MCE: unknown AMD error code 0x1000
> 
> So it isn't always 0. The uint16_t truncation might explain the first
> (MSEC bits dropped), but 0x1000 is a non-zero code that still matches
> none of MC_EC_BUS_TYPE / MC_EC_MEM_TYPE / MC_EC_TLB_TYPE.
> 
> /dev/mcelog right afterwards showed three records, banks 17, 14 and 16,
> all CPU 2 (status zero, as above). Banks seen so far across panics and
> log lines: 10, 14, 16, 17, 23.
> 
> With the BUG() dropped, the host has now logged this twice with no
> panic, no wedged CPU and no hung guests. Everything is running
> normally.
> 
> Regarding passing status as uint32_t and BUG_ON(errorcode): with
> today's 0x1000, bits 0-31 are non-zero but none of the type bits is
> set, so that BUG_ON would still trigger. So unless 0x1000 is a known
> type that mc_ec2type() should handle, I think the poller shouldn't BUG
> on an unclassifiable code at all.

I disagree. That code, aiui, is to decide whether something the hardware
reported as uncorrectable can still be recovered from. Seeing an error
code of unknown type therefore has to be treated as fatal. Whether that
is by keeping that BUG() or by some other means is secondary; continuing
to run Xen is putting all of the system's data at risk, even if in your
particular instance(s) you didn't observe further anomalies.

>>> Both records are again
>>> from CPU 2, and bank 23 is one of the banks that appeared in the
>>> panics, bank 16 is new.
>> Isn't it possible that the lack of 532988dccc19 ("x86/mcheck: fix
>> mca_allbanks updating") simply hid the issue previously?
> 
> That is exactly what I suspect. This host, and 10 more with identical
> hardware, ran for years on Xen 4.17 without a single incident. The
> first panic came within days of upgrading this one to 4.20; the others
> are still on 4.17 and still fine. If no bank was being collected
> before, nothing could have reached mc_ec2type() -- so the condition
> may well have been there the whole time, just never looked at.
> 
> Would it help if I logged the full MCi_STATUS of the first read, i.e.
> in mcheck_mca_logout() right after the MCi_STATUS_VAL check, together
> with CPU and bank number?

Yes please.

Jan

