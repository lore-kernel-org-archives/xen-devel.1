Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB827C4450F
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 06:35:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364668.1615685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcAL-0008TK-V4; Fri, 17 Jul 2026 06:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364668.1615685; Fri, 17 Jul 2026 06:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcAL-0008TD-QZ; Fri, 17 Jul 2026 06:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1364668;
 Fri, 17 Jul 2026 06:35:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkcAK-0008T7-4O
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 06:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcAJ-00A1X1-1Q
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 08:35:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a59cd23-e002-0a2a0a5209dd-0a2a45039fde-10
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:35:18 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a59cd26-fae8-0a2a45030019-d155dd30b4bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:35:18 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so6820184f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 23:35:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eeece9sm1087742f8f.37.2026.07.16.23.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 23:35:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784270118; x=1784874918; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i64y5Ylws3MCEM9Vm4wVilaHLyqkjcjnhA3fxTdiclM=;
        b=JMtfpMxk8/6kKTGiFS8y4NzDu2CgjWIm4jhoVQY7KyL1PRIySHlI0rzMo3TZNl5eo0
         rPmkrMTpIn7eVABuX1tM7PtNReOOroXlLQF41m2iqYc2jz8+1xwS3SzdDXnKrEWZGRZ0
         cJZjPBrjuMvORGnnSuKpr/0WKMamMoDwlMrOL4BTem8tYTzfR77sgG6pKAv/E6rEobPP
         pwvePuEyb+oraP96wcp81A0tK0nO+BVp//NRgxCaeOKtj314mVcQl+lA+nhN0pQKShq5
         YqTO6XffBhefLRwwdCMlykzu4xbw2YM9qYh7ATMWZijG9n9sS2Iz5z/tuE2bXsxgc3fI
         YOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270118; x=1784874918;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i64y5Ylws3MCEM9Vm4wVilaHLyqkjcjnhA3fxTdiclM=;
        b=LeIgjkXpyooR+wBm9gma9b37K01u6xkfq2VpvPO9Wzxj9VL1jJon0rEQIrEnyNev2v
         AwKc39VXh+m7VnlELoNfftT57hyUZa733WNKsWilPTkWiamDhDylMXGwzO7YSWeJLYcY
         tZXI6TNVtyf6gyU0oCt/6IJIit6f+saPOcE1C494b2bp/vjU9Q3T58LSyxDN9pWP8CP0
         F9hVc/MjoM/PyJFXg8zAkDfuBM9vBE/oRx1IsiwRn0hbdwuqndXKoqJuA26+yZhWlhbq
         KiqOMUPxoFAf4dtJERZVkAuitsFJ3QzY1dURJB6TzS1iuBu+61UZ2/uLotq/TkbNYQ5D
         96Ew==
X-Forwarded-Encrypted: i=1; AHgh+RpFww88KI1Y4kylAYJVkGACQ41w9QJnwBKJqIWXU298flOdKHXe1pFbWNqux9rH/EpWavcs0XUoTjM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywo/hKMNCVHSdqBHkK3KeD6fs7ZfgCLKQPhM2vfqPg6awP0xdkL
	nLroGew0E80XRxsn5krZnfuSlVzOH/Ef71fhOIrKe7qX8fgTMW/d0ZNP99s5PHVsHg==
X-Gm-Gg: AfdE7cnRIstNGi23ORPsPwn7AReiRMbeaVwNC/GjSEPgO06MyvxwKOO9sC3clmnmpla
	Ef/sRjXK623hBj+ZekZgFK1ryTIvBSYeYPi1lhFO5o7ZzCWaASQWhUjT5UVOsJZYpNhh9vYTejI
	xk9c1oWie0C1pJ19h/KuTQ97OYvfrDRBnYaD9iOmT0rN9VsgwrFR7gYShbSXcckPh71ggG61Ni5
	sMYwgtIwApfd2/116f9JnTjgDCh/S89WBh0fF51fCH5htSW2hK2Ts8jUUVNSvWxzsn7yoqy02Rj
	J8AeBBKl+4Sl2QFR82IITeOnpgEEii/hleztBHoE0b4DVVLRfuZDveSJMYEkNXwtcamU03+dcjw
	wArjDtlS90yBpDOaFTWbp66EBZYCBluwQvp4oK8xRTXSMh1DhG0vN2f5o/jfpIQdM/2UZKfDjaJ
	CEFTRK48nckvzH9g3uobizb4oAwUis28WohMJDnc0EetYmOiOkLYQWFRQGCYrOBVRb0A==
X-Received: by 2002:a05:6000:4201:b0:472:ec66:274a with SMTP id ffacd0b85a97d-47f6230649cmr1677474f8f.7.1784270118205;
        Thu, 16 Jul 2026 23:35:18 -0700 (PDT)
Message-ID: <0381fa54-8f7a-403c-99d7-59497f5e9850@suse.com>
Date: Fri, 17 Jul 2026 08:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] xen/console: use memcpy() in conring_puts()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-4-dmukhin@ford.com>
 <40223b4b-4cf4-4cd2-8085-5323784b2d33@suse.com> <alnJI+8Whp3ES3Hz@kraken>
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
In-Reply-To: <alnJI+8Whp3ES3Hz@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784270118-6CADC4E9-F7CE7232/0/0
X-purgate-type: clean
X-purgate-size: 1338

On 17.07.2026 08:18, dmukhin@ford.com wrote:
> On Thu, Jul 16, 2026 at 06:08:01PM +0200, Jan Beulich wrote:
>> On 13.07.2026 20:16, dmukhin@ford.com wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -360,12 +360,22 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
>>>  /* NB: Do not send conring VIRQs during panic. */
>>>  static bool conring_no_notify;
>>>  
>>> -static void conring_puts(const char *str, size_t len)
>>> +static void conring_puts(const char *str, unsigned int len)
>>>  {
>>> +    unsigned int src = likely(len < conring_size) ? 0 : len - conring_size;
>>
>> Isn't the attempt to handle strings longer than conring_size pretty much in
>> vain? Things look correct as far as the rest of the logic in the function
>> goes, but is this useful? It certainly warrants at least a brief comment imo.
> 
> Thanks for taking a look!
> 
> I don't think there ever will callers of conring_puts() with strings longer
> than conring_size... and I could not decide whether to keep the extra check
> or not.

Having though about this a little more over night, I actually wonder whether
e.g. len > PAGE_SIZE wouldn't already be indicative of an error. And which
hence may instead want flagging by a BUG_ON(). REST maintainers, thoughts?

Jan

