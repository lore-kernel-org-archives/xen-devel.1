Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB72CD3423
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2026 09:29:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1299634.1574178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpcK-0004Gv-A4; Mon, 04 May 2026 09:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299634.1574178; Mon, 04 May 2026 09:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpcK-0004Go-6R; Mon, 04 May 2026 09:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1299634;
 Mon, 04 May 2026 09:29:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJpcJ-0004Gi-3I
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJpcI-008Egl-0V
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:29:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f866f3-e002-0a2a0a5209dd-0a2a4504e994-32
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:29:29 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f866f9-1dec-0a2a45040019-d1558029d133-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:29:29 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so30884935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 02:29:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8feee4d2sm76721535e9.26.2026.05.04.02.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 02:29:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777886969; x=1778491769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m7ir4sJX0R8COqJqp7hyIddCROBwbnpLjpkfB7ysk6s=;
        b=WIUbfZzf0jj+f2szI5dVlYX/+keNnqUMidbcNHqnUpM2KFo1LpFzMyosuEBqGKf9eS
         0f9lJuiWH6hF5rC+NLyTjQPlg7L7msEfOWo/IbzWYoMz2qRYiuhReXuS0nkG2R3rzWol
         JuX8I4tKApzaz6gTrVe7KMxeg58AVxcGMuc/mZhozw25aFh98gzXpZnpE+uHvlJZtOQB
         WT11MjvFz+ZyYsXx7Olr3QyBMSwZ1FXKRvu6XtquN1KvDk/0GlODeqj4nOqZJxyBAiTN
         9WvU/MvDZQ56KHDZn7D99ecKTuWkLTSzw3cNzUllqr2pQYDHxRyyxLR793TaZLn3RMRi
         60zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886969; x=1778491769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7ir4sJX0R8COqJqp7hyIddCROBwbnpLjpkfB7ysk6s=;
        b=NukAv5GsSsNQpRUf0s1uHI6M/nELY8/7CBSNHzRnYOxNUJj947iR4zOQVCr6Mc75ZC
         4IHkNTeL0ntdfcBbMvVUDdVEW1KOk74qEgkTrWmjfVSI8t9ReX5367U+dJY8W9gjiHwU
         QzXhAsblkHz9ngN8/Ueza4a04l9lxhWSKfncJjz1T631a4B6EVcgXcmUXf9aaFeRHywM
         n8tFXTT9w1x4gBoDh8gfyxrQ07kUEZamPBCzId+RtSeZtKCUBDDMlCeEs0BU6zHrAmsV
         G1odzKQ5TVnpK7qMXmVPSPtl40mj8xbKTZODXUg3yqwTrsXeTseLhQ5IEYXXX5Zrc6xG
         XrTg==
X-Gm-Message-State: AOJu0YzuUGoi4mTRcoeGS/1DYV9PGbZtPejIX0CQezVfzL46c8GKGGUV
	zLE93zv0rZZ0lMKt//fjF3nmQwZ5neObE2+84lEn5SadqnUE6nOme5dvYB1BJEDr7Q==
X-Gm-Gg: AeBDietNO5mYAYz55Zb+YdoM2Q/OzXDQNqYp4I5FiBRSYXFgTpPNmhN0+p9xozr1Jxz
	KuO6tewIeb5WnUl/rPhIPZAIoyJXUGmbIZliozKra911iUymcW81/VIJofxwm1PbNVWgKEpDFtt
	5u6aRlgbejhtZkEjA41j05dxs36z4PCCdBLNoLO0SlbNfT1tdBq/w8l4Y/5U9zX0WfKMt6kW8LP
	LabjucpaCYStjeajQTgYKPjkd7DyrVfVYNzM3JQTky3rtJjYRZAN6PJAZZ5b1OsBQNh53+YTsVI
	dejQLPvId7vrcO3sg/Z2TOdxjkSMOYxo9w6Be7N/Soxg7ETa1wGsGr4i+CG8V9zPSlj+mdX2py/
	n+Tk1e5uDiijTw/sapQ8zr2An68KYR4l8TjxgBLkJJ2fpThfFVViPW16T2qwuZ04zlLhMaDuUOZ
	Eq7qtz3PImS0LTCE/Jh9r4qZMgNrgr6LBiXVDKF2aS0Eu8sZLN1U+tPyH4jAX3SQNhMpFcehvcI
	JFERILjOJvWOelbL19Fw2Dk7w==
X-Received: by 2002:a05:600c:a118:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-48a9865f342mr100889455e9.19.1777886969173;
        Mon, 04 May 2026 02:29:29 -0700 (PDT)
Message-ID: <45103b7e-301f-4769-bfdb-1b8b5a4a4fb3@suse.com>
Date: Mon, 4 May 2026 11:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] x86/mwait-idle: Add cmdline option to adjust C-states
 table
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <addfdc9f-7f03-4b84-b998-1fdbef2edc78@suse.com>
 <aevALCPvNRlRf91N@macbook.local>
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
In-Reply-To: <aevALCPvNRlRf91N@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777886969-2AF653FF-B74C191C/0/0
X-purgate-type: clean
X-purgate-size: 4464

On 24.04.2026 21:10, Roger Pau Monné wrote:
> On Thu, Mar 12, 2026 at 05:57:53PM +0100, Jan Beulich wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1928,6 +1928,23 @@ Print boot time MTRR state.
>>  Use the MWAIT idle driver (with model specific C-state knowledge) instead
>>  of the ACPI based one.
>>  
>> +### mwait-idle.table (x86)
> 
> The .table suffix is kind of weird, as we don't use it elsewhere.  It
> might feel more natural given the naming of the existing command line
> options to use mwait-idle-table?

I thought it might be better to follow the Linux way of naming per-module
sub-options, when we "inherit" them. See also "mtrr.show".

>> +static void __init cmdline_table_adjust(void)
>> +{
>> +	char *args = cmdline_table_str;
>> +	struct cpuidle_state *state;
>> +	unsigned int i, state_count;
>> +
>> +	if (args[0] == '\0')
>> +		/* The 'mwait-idle.table' module parameter was not specified */
>> +		return;
>> +
>> +	/* Create a copy of the C-states table */
>> +	for (i = 0;
>> +	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
>> +	     i++)
>> +		cmdline_states[i] = icpu.state_table[i];
>> +
>> +	state_count = i;
>> +
>> +	/*
>> +	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
>> +	 * module parameter.
>> +	 */
>> +	while (args) {
>> +		char *fields, *name, *val;
>> +
>> +		/*
>> +		 * Get the next C-state definition, which is expected to be
>> +		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
>> +		 * fields as unchanged. For example,
>> +		 * '<name>::<target_residency_us>' leaves the latency unchanged.
>> +		 */
>> +		args = get_cmdline_field(args, &fields, ',');
>> +
>> +		/* name */
>> +		fields = get_cmdline_field(fields, &name, ':');
>> +		if (!fields)
>> +			goto error;
>> +
>> +		/* Find the C-state by its name */
>> +		state = NULL;
>> +		for (i = 0; i < state_count; i++) {
>> +			if (!strcmp(name, cmdline_states[i].name)) {
>> +				state = &cmdline_states[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!state) {
>> +			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
>> +			       name);
>> +			continue;
>> +		}
>> +
>> +		/* Latency */
>> +		fields = get_cmdline_field(fields, &val, ':');
>> +		if (!fields)
>> +			goto error;
>> +
>> +		if (*val) {
>> +			const char *end;
>> +			unsigned long n = simple_strtoul(val, &end, 0);
>> +
>> +			state->exit_latency = n;
>> +			if (*end || state->exit_latency != n)
>> +				goto error;
>> +		}
>> +
>> +		/* Target residency */
>> +		fields = get_cmdline_field(fields, &val, ':');
>> +
>> +		if (*val) {
>> +			const char *end;
>> +			unsigned long n = simple_strtoul(val, &end, 0);
>> +
>> +			state->target_residency = n;
>> +			if (*end || state->target_residency != n)
>> +				goto error;
>> +		}
>> +
>> +		/*
>> +		 * Allow for 3 more fields, but ignore them. Helps to make
>> +		 * possible future extensions of the cmdline format backward
>> +		 * compatible.
>> +		 */
>> +		for (i = 0; fields && i < 3; i++) {
>> +			fields = get_cmdline_field(fields, &val, ':');
>> +			if (!fields)
>> +				break;
>> +		}
> 
> This seems a bit arbitrary for my taste.  I would rather ignore the
> extra fields (and print a message about it), and proceed with the next
> state.

I think we want to stick to the original Linux behavior here. If you
think that wants adjustment, imo doing so would call for going through
Linux first.

>> +
>> +		if (fields) {
>> +			printk(XENLOG_ERR PREFIX
>> +			       "Too many fields for C-state '%s'\n",
>> +			       state->name);
>> +			goto error;
>> +		}
>> +
>> +		printk(XENLOG_INFO PREFIX
>> +		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
>> +		       state->name, state->exit_latency, state->target_residency);
>> +	}
>> +
>> +	/* Copy the adjusted C-states table back */
>> +	for (i = 0; i < state_count; i++)
>> +		icpu.state_table[i] = cmdline_states[i];
>> +
>> +	printk(XENLOG_INFO PREFIX
>> +	       "Adjusted C-states with data from 'mwait-idle.table'\n");
>> +	return;
>> +
>> + error:
>> +	printk(PREFIX
> 
> XENLOG_ERR maybe?

It's pr_info() in the Linux original, so ERR would feel like going too
far. And WARNING is the default anyway. I can switch to XENLOG_WARNING
if you think we want to make this explicit.

Jan

