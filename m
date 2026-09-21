Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBEEC982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:35:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427434.1650134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dF9-00017E-L6; Mon, 21 Sep 2026 12:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427434.1650134; Mon, 21 Sep 2026 12:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dF9-000177-ID; Mon, 21 Sep 2026 12:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1427434;
 Mon, 21 Sep 2026 12:35:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8dF8-000170-90
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:35:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dF7-00DnJf-6H
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:35:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1248b-bab6-0a2a0a5309dd-0a2a4502a8ac-30
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:35:33 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab12494-6ca4-0a2a45020019-4a7de18cdc26-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:35:33 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso7736145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 05:35:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd090f0csm296990095e9.15.2026.09.21.05.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:35:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1789994132; x=1790598932; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw8g040qgQwYAeyUufOKDezHhqEpig8j5wfPO/OZbIA=;
        b=HO+s7a41wm+VJl4qYJPc8g1bszrKmtPhJaSebjpG/CyHfDFPS23raR7fXsMs0CtUAz
         nvjWQFVt+k/vooDve05b2vhZPdbc72Ymg0i0V/PdHMjGGpN9zK1DA4igWArzfjQeSCmW
         +3ta1G0sZbEdBfV3LcSN1oyjDyDtjl7BP5sVFnJdQrLeNRdKciu7cR8QXsu+8r75b97Y
         CN6SsxrcdImW0Zo5drl4jBeG7TiUXzJoVexu8LMnzR/mr6vb0/73OVB1zPAwxZr6NMvu
         nk8LKDKoWmncoqsZg4ijjQOA7lsfB5N6Fa006pe3iPncNogf5qcyDrOYtVQPJGsAdc85
         s82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994132; x=1790598932;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tw8g040qgQwYAeyUufOKDezHhqEpig8j5wfPO/OZbIA=;
        b=y5atuwk8ZwLBao/4mDLlhLMpOJC2G7apToRzeKKWyHgFO8NLBrxUTC/aBPOxlhzNJy
         4gke/Z5bo1M00cJIN5Bi0LnD696CncPaOR76hrUiHgtxCCwaovzI+0KGGO2f9+YAvMgx
         MPg/+yRSrqvjAV5/mk9Og1p5djTAik7BUHzeiWVZ0uYJne3i6SaDbP0vT+8C49GC3kzN
         INRU+uZAh6WIYNpZmI6tMG8RzdD4+yPFpRMP/bY1URQAAtO5JJtQGUS1gIOPjeOtnzUP
         xNhZXZbtxzBBTj6Fo6FItGJC4YCICDO+WQcMiDQ3LNSA9srZNch3qaJcwlm/nFLVRKXj
         nvkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+8OZRcLOiRftoPRI57gfl9hMsU3NQdDxKGJNZiG4zYZlrJnaXGgA6kutnYcuzJsFKSbaU3rp8+7E=@lists.xenproject.org
X-Gm-Message-State: AFuF++kPR7M551vIfaveVMZRNUyIqjtvi6xjWW1nlc2U3dVVD3gVtENB
	ESDac2i0/CXhjaX50d795mpoTF9zjCYBVV/ZwMEE6P3cYW1teu0O80nTyN7cCKlryA==
X-Gm-Gg: AYBFou1CiP8ZjfraUyuE63eRt2PTbanIUL86bEVI1HLva3cWHaKqznd/+uh19UWtyWN
	ItpPLJuNf6mEODx2ShteO55g4SwWZ1yZ2ZfqgLQkhpOlQ8AVgrv2qjOQeAil9iqLSxaoH1+yddj
	9NVVii19mR9dAarE+uXuc0PeXAHRiQZZLA0pRw76KPeSpYNNwuckeXcPBaw88K085Pxd3NT9S8E
	5sILcHsyDNnaFZeGNb7MbxyJ0Dq8byrSXxT5Sj44bq0/d5rA8n/CNn6cmG9m/n7BBuzKwjRvuY5
	tZw4CJQAXZm9RrCwt1flkMPOv60JmfJipxNzmf/u3JOmjDQyUy5xXXWsPg1WiN7JNmnzG6TkWct
	2+aTXVmVMQ30UUKSVj9hoIn9Sjj9+ukiQDOvHL4m2DO4GsNlyp/OSLz4JbQt+FA3mz2Yi3ztGWf
	+/snI+y3xb2L97rWuLmiK+PPfrAPd813AEarQJot5qMgSdWIqaYYc5OXm2G14YPSWD5/X93nWka
	2KHjIy8mNICvxK1rQZqkqdIAsBJMtoF2ZMeYFPgWksuxWbGbJKZRZ1DF76GJeo=
X-Received: by 2002:a05:600c:1990:b0:49f:c1fd:60e1 with SMTP id 5b1f17b1804b1-49fc500c5c8mr165498215e9.15.1789994132466;
        Mon, 21 Sep 2026 05:35:32 -0700 (PDT)
Message-ID: <9203f2b1-ed6d-48b3-b89f-da4b6058dec6@suse.com>
Date: Mon, 21 Sep 2026 14:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/svm: require VMSAVEvirt for nested virt
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
 <20260921052910.580298-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20260921052910.580298-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789994133-309C32AC-19522F49/0/0
X-purgate-type: clean
X-purgate-size: 1140

On 21.09.2026 07:29, Stephen Cheng wrote:
> Virtual VMLOAD/VMSAVE lets an L1 guest execute VMLOAD and VMSAVE
> without intercepts.  Without it, Xen has to map the L1-provided VMCB
> and re-execute each instruction in L0, handling a complex,
> security-sensitive subset of state on the way.
> 
> Make VMSAVEvirt a hard requirement for nested SVM.  The
> cpu_has_svm_vloadsave test in svm_nested_features_on_efer_update() is
> then redundant, as nested virt now requires the feature, and is
> dropped.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
> ---
> Changes in v3:
>  - Rebase onto staging.  No functional change from v2.
> 
> Changes in v2:
>  - Keep the VMLOAD/VMSAVE handlers rather than removing them; the insn
>    emulator will need them wired up regardless of older parts (Jan).
> 
> Jan - v2 dropped the handler removal you objected to, but got no
> response.  Resending rebased in case it was missed.

No, it wasn't missed. I'm hesitant acking certain nested-virt changes, at
least without giving in particular Andrew ample time to comment.

Jan

