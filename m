Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FD606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gWzKY9rF
Received: from list by lists.xenproject.org with outflank-mailman.1461617.1672675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNu1-00058f-25; Mon, 26 Oct 2026 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461617.1672675; Mon, 26 Oct 2026 16:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNu0-00058S-VL; Mon, 26 Oct 2026 16:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1461617;
 Mon, 26 Oct 2026 16:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLNtz-00057l-6X
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNty-007maV-Jc
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:50:26 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf84ab-bab6-0a2a0a5309dd-0a2a4506e580-30
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:50:26 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf84d2-195a-0a2a45060019-d155dd34b8d7-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:50:26 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so2875238f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 09:50:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm17114713f8f.4.2026.10.26.09.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 09:50:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1793033426; x=1793638226; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBEMOmrN7MEm9XYrrW5HlBqeWVevPN52g4DT1cnFz3I=;
        b=gWzKY9rFCRb3ZZacqe0CZYFOaMYA0im2JgX0lPppD+4XDZjXCvZ4Q3ityY67zaCmDl
         Q5duR1lB8mn1ldJjFB+k1VBnbecR+gGK9mP+KKSCyaj9N7xeTEfmVPyiiXsZZ1+8qvEO
         IRJSJRFzd3bbOl6x5HUgCCkt008g31hRycSpS5EShf/KcB/aaARCf11Sb/rFEpH6Raku
         qsgsztGjC+lGxP5/ZgSvxSBNXA4TI4Mg037ye/hlFWifVXpA7oDYS6QfabVHYB1SVd8W
         6Cbn+y9umXXg6iycHvP7H/sLVjyyHFeCJxW+I4lhzt68oMB9N73pMxB2LbGxqS14B3iU
         9L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033426; x=1793638226;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBEMOmrN7MEm9XYrrW5HlBqeWVevPN52g4DT1cnFz3I=;
        b=IdZmKXtfcT4WNNB2/j/EfKEx9p09M8nP1Rz8gi8noz9Nk7/rPO/4zGs7u6X1i1kBbW
         QIWQIu+KCFgG4eqNw4lRUM/M3EsQW/XFwFVd5AEvTUngpTehGZaCJ1kQVpsf4YmsyVzI
         CZ46W8ddCHVymq4Dtx40CS9vG9AAp6u1JGk3sMasIIdQqkB4hZ7foTb2D3nDQZOIFCN6
         Nu6TN+v7hzMWX6TzRybqlBEUpTZRHner+277lhsoIT7HwKQbjD4job9s9902y9EqnAg1
         zdxBX2SxuxeJT4Gql8q6bpVyA9CwZ36UhjtREMpNbp8S72uT4ctOjZ61YAHaPwrH0rS7
         LH9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/U1JmrVR+iucoqfT4qiQ9GsyD8j/9QeKPNY0iIrSyW77xBZRm0HS019RcH+8mQOS/z2OK0DgewbI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIYywlsrTBlTT0ZiN3GsUH4o08RjdnVrMLvoN47k9srBvAASVhH
	Wqz+FcCKMFZbktsvF0d7Z1rSYJZpinoHkKcu51wBvFuSqx2RaXk6R8XFRvj1pJJgSQ==
X-Gm-Gg: AYBFou2TPBAb/8pI1xJ6WfirQ84oJkFnMFyUKiTSvVHkTCAe4ofNKgumGojMhwZdNcK
	4QGI+0kxV5ZXsCSz+9Yf1J0qGKLxwtchGKEBmIRoThyzRhawuvcAr3nYMrp+GLcXX5de59paio8
	VXHbzsuB59hJ9BSy+pzpnpHG0hhuQ5G/szE9TXsKX1evlwr9oj3XkIKrUjFgz+sjphoBBOQgZCs
	haJCTFpoWTj3xurp9PeVA7ndhToa8do7HgoL9cpnqrploRtAvYseybUna8JhgQ+uMZbXfxTQ0Sb
	spwXp1eAKcTC930FR6dRmcqjKga9XQDu/P307Eto9K6mNyfOswuQoPSioypIG4o0a7YTqmMRgeq
	3imYyPSHcIOTokALvduJ+18BZ5/9L+SgbDRnhVbA5RSgJs5m3saydV+nPmvQXlE+uzHcYvIZ4fE
	HBMe7J+stLheWSmKtzyT27mCrIhCzCKJPCimeYZFlrDEMWHMOyn4jD13WEOfhIzGJ8xA2rxJ6Fl
	drEfU//cF6Z+F+mBZeDRCBhTQNzdcMYQD1dHz1Akim4ulqPnaevP0TYIKNbpJtA0KDCnth+6+6Q
	UI69wYOFMvnf+X1wWtp2odD89AJxq4WNw55yedWpHtn96w==
X-Received: by 2002:a05:6000:4308:b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e3eb455a7mr13290843f8f.2.1793033425937;
        Mon, 26 Oct 2026 09:50:25 -0700 (PDT)
Message-ID: <8e1b5c97-c1b0-4982-aca4-d13def6590b4@suse.com>
Date: Mon, 26 Oct 2026 17:50:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] xen/riscv: look up the exception table for any
 trap taken in Xen context
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027684.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@vates.tech>
 <1cd34b77-95a4-4ed2-a200-6b6e914fe9d5@gmail.com>
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
In-Reply-To: <1cd34b77-95a4-4ed2-a200-6b6e914fe9d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793033426-F440377B-4312BC21/10/78276251493
X-purgate-type: spam
X-purgate-size: 2687
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 16:26, Oleksii Kurochko wrote:
> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
>> From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
>> which covers csr_read_safe() but not a probing access faulting with a page
>> fault cause: it would reach do_unexpected_trap() instead of its fixup.
>> There is no such access yet, the A/D update scheme probe will be the first.
>>
>> Move the lookup ahead of the cause switch, and only do it for exceptions
>> taken in Xen context. Both other cases must skip it:
>>
>> - Traps taken from the guest: sepc is then a guest address, which the
>>    guest can point at an address listed in the exception table, making Xen
>>    act on an entry fully under guest control. Entries are matched by exact
>>    address, so this needs no more than a numerical collision.
> 
> Nit: Identations here and ..
> 
>>
>> - Interrupts: an interrupt taken at an address listed in the table would
>>    otherwise be "fixed up" as if the access itself had faulted, silently
>>    skipping it.
> 
> ... looks incorrect a little bit. An extra space should be dropped.

Things are indeed off-by-1 in your reply, but in Baptiste's original mail
all looks fine.

>> Returning early skips check_for_pcpu_work(), which is correct: that only
>> runs for traps taken from the guest.
>>
>> Cache the "trap came from the guest" test in a local as it is now used
>> three times.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> [Baptiste: drop the parts depending on the vAPLIC/vIMSIC series, adapt
>>   the commit message]
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes since v7:
>> - new patch, needed by the A/D update scheme probe of the next patch,
>>    whose store page fault would otherwise not be fixed up. Taken from:
>>    https://patch.msgid.link/4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com
>> - commit message adapted to this subset: drop the hlv/hlvx and
>>    EX_TYPE_TRAP_INFO parts and the paragraph on the guest page fault
>>    BUG_ON(), whose code isn't taken; mention the from_guest local, which
>>    this subset introduces.
>> - apply my v3 review suggestion to the commit message: state up front
>>    that the lookup is only done for exceptions taken in Xen context and
>>    list traps taken from the guest and interrupts as the skipped cases.
>> ---
> LGTM:
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

