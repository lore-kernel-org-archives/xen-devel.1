Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341BCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447046.1663200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb3V-0005Cy-HU; Tue, 13 Oct 2026 11:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447046.1663200; Tue, 13 Oct 2026 11:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb3V-0005Cr-Dm; Tue, 13 Oct 2026 11:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1447046;
 Tue, 13 Oct 2026 11:52:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGb3U-0005Cl-N6
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:52:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGb3U-0010G8-3s
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:52:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace1b73-8faa-0a2a0a5109dd-0a2a450ba9c2-38
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:52:28 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace1b7b-b7e8-0a2a450b0019-d155dd2ee9d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:52:27 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1674924f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:52:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc51c1sm4673046f8f.46.2026.10.13.04.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:52:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1791892347; x=1792497147; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mg8gq59D07iMmlfoqNuyO9BPROaJRpOjbqvOhXjy8uA=;
        b=fK9PWkF1CdhRVLj8Fls0hgGfz5xarj97Dw4WDluuy2oWqZEuark6RRHFsLPdoyK7o4
         2PoH6usBQoCQOaKhMplYYNX1FuHIEIK3DMn4nITFHCDn6gp3U59jwvLSBCckEryNCqHN
         o1q34/CQjBBxNqOcMUNTqjl0Y2m2d2A+r2UNlxtg2P1g9NfQxp35mqIoXy0bMgbojxl4
         569/6M5CSp5Fe5G2Nim/lLP9ag7fLogKL9wPZXmCL+GWHMvUO7AmnZc2EBxTsW8IOsAS
         JrOZa2H8AOwDrEYVkHHsjU40X1uPb0pa5ng0HBNTZg9c8rwN1m7Z72R0o9yK7maNlTNY
         R22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892347; x=1792497147;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg8gq59D07iMmlfoqNuyO9BPROaJRpOjbqvOhXjy8uA=;
        b=QJ+YFxcmcrzRVCmwexyjPTx6nrDGgwiU7PHpKog2Ky68GR5bcFDoJMesW9NLuVf8yN
         P/iZHdXjWtR0neatiK7xcb+lmim2zFJV3czymo73Yb8am52eUwjefsnyYxSFGX73AmzL
         qyItV+1gPW/AAX374xipWAj/2JptxhEaTsCMYQR4GBx2mZu7ALhmwKfar6qkpoUkd1Ez
         nIJC62v59D2InMGU+Dpto2SJKbrH8+Xu7IR2OTwhi1KU8zIFUO94jdIHiHPwe2Aq0xWc
         fhfH5f3DGr6wQ1SUT+4DGSUAnnjFAkMhrdDYdXUfFhAgl1VsaQmaMWxJQK1ZK7o3hJe5
         Lg/g==
X-Gm-Message-State: AFq9FYJvbfeM6zn/WvRn2C22a5dxMER8N7ooSyKzEJJwRzPsz5Ui87AJ
	9uyvLPHmS0bvoUXckKWkQxoNzz7FFDk36IQsZTxU0KrNWl1l+jjDqbXWT0EcaArlMg==
X-Gm-Gg: AYBFou11Qbxb1G6CMMoHU8zifL/sOPGbW7BfKHJxzTTDafcV2K7KTQVCVOxbOXd2kCz
	vB7Psdsmr61YHeBA+Gb0qLLpl6Ff7zrg3VyRU9jgaqQWUghx5wq1CvVUPCHKvOq3V10U/Xzp2J9
	cJ7kzmkx6V/U7qSJLBYpdLQnM2wokRGfhW34Qe377IFNiXik199OqSmKNUQQz7Xvu+OIL11FcCK
	o/9M8dtYF6rMIbwxViYc5AElVMBiMcZ0B7kUxQCbBG6+asPhaH3F4ZX5vwlpXcN/SuRBgBsiYBt
	Dt7odNJfnNTtg8ppWBf2XkigAJFBzc4zTepS2WmhG9419P/6qv1Pcm2fpe+8bSybUqu1aKPSp9S
	vjohWST5Ydp8HkF9hGQhxLs+fkL+bMo6ZEFkHis83s16RO+A3baoEk4IEQ34Y2vKHPOWhjwfWH0
	np2kcAn42Xq9PYtCEl/MgyipQOhkJ0nW4CEOT3kf7mGbs8wArTTe4Yf6xlZEiE/4UvXZzLe/GE4
	HznoxkyowsVcrgI7xHDFodACvLfwVwoDVAPRdRVcz0vQ5UR61ZFhyGbiRpVpw==
X-Received: by 2002:a5d:5888:0:b0:48d:df2c:64fe with SMTP id ffacd0b85a97d-48ddf2c6c20mr6947785f8f.41.1791892346437;
        Tue, 13 Oct 2026 04:52:26 -0700 (PDT)
Message-ID: <9e587bff-7fb9-416e-a4b6-6cb13ec39a6a@suse.com>
Date: Tue, 13 Oct 2026 13:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: replace this_cpu() uses in
 mapcache_current_vcpu()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
 <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com> <as4Ev_8NGq-dyK-2@Mac.lan>
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
In-Reply-To: <as4Ev_8NGq-dyK-2@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791892347-ABCD79EA-5EFEA39B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3043

On 13.10.2026 12:15, Roger Pau Monné wrote:
> On Tue, Oct 13, 2026 at 11:06:27AM +0200, Jan Beulich wrote:
>> We have accumulated three of them, plus a hidden similar 4th construct
>> from smp_processor_id(). Latch the result of the latter into a local
>> variable and use the slightly more efficient per_cpu() instead.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Oh, so that's kind of what I've suggested in the previous patch.
> 
>> ---
>> A 5th such construct is "current", yet to replace that we'd need to open-
>> code both it (i.e. get_current()) and then also smp_processor_id(). I
>> wasn't quite sure whether that would be deemed acceptable.
> 
> See below, we can reorder and use the processor ID value stashed in
> current?
> 
>> Like indicated in the earlier patch, this similarly leads to the function
>> actually being inlined (and hence generated code size actually growing) in
>> gcc16 debug builds. In release builds (with older gcc) the function is
>> being inlined no matter what. Overall, having looked at generated code
>> differences, I'm not quite sure anymore whether the earlier observed
>> inefficiency with repeated this_cpu() really is much of an issue (here or
>> maybe even more generally).
> 
> I think we sometimes focus too much on this kind of
> micro-optimizations when the cost of the operation itself is orders of
> magnitude bigger than any performance difference the optimization
> might cause.

Well, any improvement we can reasonably (and safely) make counts. Even
if not measurable performance-wise, it may still make a difference
(also in power consumption) when accumulated over long enough a period.

> In this case I don't think the resulting code is bad or harder to
> read, so I don't mind adjusting the logic.  But that's a question of
> taste, if someone else has a preference for the original form I
> wouldn't change it.

I'll give it some time for comments to that (or any other) effect.

>> --- a/xen/arch/x86/domain_page.c
>> +++ b/xen/arch/x86/domain_page.c
>> @@ -20,7 +20,8 @@
>>  
>>  static inline struct vcpu *mapcache_current_vcpu(void)
>>  {
>> -    const struct vcpu *v = this_cpu(pgtable_vcpu);
>> +    unsigned int cpu = smp_processor_id();
>> +    const struct vcpu *v = per_cpu(pgtable_vcpu, cpu);
>>      const struct vcpu *curr = current;
> 
> Maybe you can reorder the variables here:
> 
> const struct vcpu *curr = current;
> unsigned int cpu = curr->processor;
> const struct vcpu *v = per_cpu(pgtable_vcpu, cpu);

The use of curr->processor in the remark in patch 1 was safe afaict.
I'm not fully sure the one here would be safe: It would require
thorough auditing of scheduler code to be sure, I think. (I don't
_think_ ->processor would be altered from a remote CPU, but I'm not
entirely certain.)

> So that we avoid two smp_processor_id() calls (ie: the hidden one in
> current).

Strictly speaking there's none hidden in current. That accesses a
different cpu_info field.

Jan

