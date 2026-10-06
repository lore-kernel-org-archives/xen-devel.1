Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5459CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 06:29:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441247.1658805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyfR-0006wg-53; Tue, 06 Oct 2026 06:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441247.1658805; Tue, 06 Oct 2026 06:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyfR-0006wZ-1g; Tue, 06 Oct 2026 06:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1441247;
 Tue, 06 Oct 2026 06:28:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDyfP-0006wT-NF
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 06:28:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDyfN-00FSwg-1d
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 08:28:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac49513-bab6-0a2a0a5309dd-0a2a4503d59e-24
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:28:44 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4951c-fae8-0a2a45030019-d1558031e15b-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:28:44 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso21012375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 23:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff3cab2sm155172255e9.2.2026.10.05.23.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 23:28:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791268124; x=1791872924; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F+iustYzRPuMgMSqd8JF+omEDt/F392IeN1bSYlGH+o=;
        b=apN48vuH4RhKWBVZ3hpiebjUoS1QqC7BXpYzyEM2Kfc/KRiPELrfKwTbjpbVTClHB4
         mhjbB+/dYUzZ4U1WwzuUvPiTdPXto0cU16dgd3MqhjorEryCK/ZyDPrIIAHVzpZZnwbJ
         UMQThR+WxBhWLA4KMx9c61SVxabVLeoVfNJvAkSN3iyeejgh5/qwo5w8hLX5gpm3q61C
         HJsgXg+lV/ftHQzNT2u7KVpvo8ClntoI0q2mZxF5h1dfeNmEQxD5TEwAIizUgIRDLder
         arrGiuGBYqKU30LyKXelbvxSpNlNziGTpSYd0vRRYJ9gUMNTb1ngWTVY6ZoS9pscGE4h
         KBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268124; x=1791872924;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F+iustYzRPuMgMSqd8JF+omEDt/F392IeN1bSYlGH+o=;
        b=IAxSEgDGRl8dkruc7ydxf0PXbyRy94QeheMvdhHyoBCVCcQf0+O1UzwqIwLV6m7Bt9
         FKSHb/cXDXCr6l9y+6ALGNoCoBFAm3otYJU5FRWvbD8ReFI4zopVezmiCyhwZW+nZRf0
         8cpNZxARBd6XkZMKCgSZQ9cqOlfUNvQ/K+a+k2SZUenUckhdnouDo37IshfFSzZEVc8+
         5TeNswWzbUVWbUZOEkyr6iTHN1vX0RAm61RHqQycjho4/h8bR7+utjrNMi3tW77ZNUMU
         bFogLlPCgPE0c1H4/+r8Tm76c/1yVw/plfIbI72cZL3mc2ZuN18qxcK7s7BQOc+i1Sth
         cRCA==
X-Gm-Message-State: AFuF++mgBNeTuequSyzxuNwtWXE3ZH+zpGEWIGOknz8dtzEt5VZ1rZ71
	BP61moQaC6WkC5DXf9EOhJ/ZJe62P7CfiTBwbmbfk9yqbb10w+V5BcseMDRXDKXoJA==
X-Gm-Gg: AYBFou3698bmakCKYBv/bSAapG5zkNk6Q/qY7izuLkrdRhWL6KG3lImML5u1ADTBpPx
	905Iqfi0VqpbrWLRMn4yElvHKvv9bFZXRikYbs6ATDHtgrxHhGjbkB0w8YLry+/kn9VtmpvcT2Q
	791MS2Z3mi31KAX1MD/hKHi6Zm7wC0iPwvKCOpx9JexTrri57K7tLw33LQo8zCipg2AR1I1wJV7
	TaQPbaGOqB9RCXCKX970k47uKwSJ3UFTQNlNxjYJdUGFNzQuJebJni8TduRTdz7+U2A6t7SjvEh
	otA6L+YR5m0MNMeo6FJtPeTeTuYh0ShSgTIPgnKymQvpi50k3bePu+tB0gfNJrcp75F2+2J/v0K
	vixBoXrSRXHr957vInKb1JM6grua/YuGNnQ5Prsjm7+rLLPRnHFqm0IagQJkQyEIAGEqV9B4p6+
	0PGGUutzqmxj7dBEd8bT5m0FAA4QzXkkKgd7jbi3BP4VmYI5NRUd196WKtoUapx+QCPptZPmpMp
	9aF6B0EKg5jE3zmfNOxFCN5/hrK91vfHTZbAuERscZjJ3wPiGxMmqE7SLi0AQ==
X-Received: by 2002:a05:600c:b8a:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a1680f4052mr147330935e9.28.1791268124150;
        Mon, 05 Oct 2026 23:28:44 -0700 (PDT)
Message-ID: <d0a8cfec-ee9d-4c76-8471-7ca40214b010@suse.com>
Date: Tue, 6 Oct 2026 08:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] gnttab: don't cast away constness
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <1f55b457-c8cc-4ef9-ba5a-96e52b95fbbe@suse.com> <asPXWmwRpzWtHXR9@Mac.lan>
 <46943494-89be-4d72-943a-dfc28b96cbf9@suse.com>
Content-Language: en-US
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
In-Reply-To: <46943494-89be-4d72-943a-dfc28b96cbf9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791268124-6DED24E9-9068E2F8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1008

On 06.10.2026 07:59, Jan Beulich wrote:
> On 05.10.2026 18:59, Roger Pau Monné wrote:
>> On Wed, Sep 02, 2026 at 08:35:47AM +0200, Jan Beulich wrote:
>>> While _set_status_v2() indeed doesn't alter the grant_entry_header_t it
>>> is handed a pointer to, _set_status_v1() does. Drop the const from the
>>> parameter of the latter (and then necessarily also from _set_status()'s),
>>> while adding const to the local variable of the former.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Roger Pau Monné <roger@xenproject.org>
> 
> Thanks.
> 
>> Could we also use a union in the functions themselves to avoid the cast?
>>
>> union {
>>     const grant_entry_header_t *shah;
>>     uint32_t *raw;
>> } grant = { .shah = shah };
> 
> Possibly. However, irrespective of us using such all over the place, it
> still is - strictly speaking - UB.

Then again we already have union grant_combo, which may want leveraging here.

Jan

