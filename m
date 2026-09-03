Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF018C624D4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 06:06:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406394.1639702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x20aG-0000oW-5y; Thu, 03 Sep 2026 06:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406394.1639702; Thu, 03 Sep 2026 06:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x20aG-0000oL-1b; Thu, 03 Sep 2026 06:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1406394;
 Thu, 03 Sep 2026 06:05:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x20aF-0000oF-Cx
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 06:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x20aE-004w65-MF
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 08:05:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a990e2b-e002-0a2a0a5209dd-0a2a4508c4b6-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:05:58 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a990e46-f659-0a2a45080019-d155802ee556-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:05:58 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so13395945e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 23:05:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm207632905e9.0.2026.09.02.23.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 23:05:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1788415558; x=1789020358; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7fGb8I7IseYzuo6BTFI8ud86YzLworwvgMhQm/zQd8=;
        b=HwgH1qXn4TSSimPjlqsTNghdYeiifInSgJR/Mpx7fL0hSWirD/vcV/oG315kaQAzD8
         JQwfYWUYPnYU6a/4rFjPJr/JoO1cUpYQLqB9RELceX9vy6kaXVVmfhUa2fx/PJX25Cby
         ZD1ZAbh+CVRIBm8GLcC5GanGzJ353Y5SGteQXRnQdAYKrmC3mFOlZ/G9yIpexX88sF0Q
         2diNUCzyyKATslHtGMzeLwe+ALhuy91THbeBlpmaTTsrsqTHHhd6tExoeANOtnSna6Ii
         ljKl1y5mudTUr6jiZDAPUSnA60KaXo26GnsLttFvBXGLnXiI/nIjL9mUfOpgm9kRsILV
         PNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788415558; x=1789020358;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7fGb8I7IseYzuo6BTFI8ud86YzLworwvgMhQm/zQd8=;
        b=AHToZChS+XF01Eoy1+zre4zYHhouUKew90ZcaHFiHDVZvVob85BSPOgZlsVfbpBr7B
         UxESR4wo1zPDwaoBhVG0DzKQhyYV4Wt7nReqKRgW2lJOBZdwTUVtEW1N5JWgNHxGKENN
         zB87rGNx9ieTlJZqxydEyoQWt0ZZFSn3Xi3nhc06rI34JUumx4u6NvJmhGV9Exhg9Hmw
         9/UFp65tw90mbNIgP4lGA4ghE3Wf+d0dDUwmiS/DfrXmSpN7HVE4UTU9qLizU61ystV8
         2rs2qBAzjOwCpjKoTTBimz15bn55HzcNXbJkmOiWsOrTzAnm7OGnN0DTrz/z3Z3azVg5
         aC8w==
X-Gm-Message-State: AFuF++mjpUSLsQwkepeKCDevVajb/kmlyM+ZsLnLJfyErICsMOto/FYw
	ltnGvcEqXHyUjgNYjQbiD13NpnJXMCPvQevjzRxIurbmg2yckVAdm7V7QZQRlZ7WVg==
X-Gm-Gg: AYBFou2YbZTUWaVbBtSwOvi0mnGf5PwWWaouEIohSX/Zyu5ej3CIuMcmnY0lwJsJNK+
	7T3eGoDEMVrmXKjRDctvkUyKWyMi1JlJSrAAC5h2YDPHkXVSvh3nEY8zLkbQbhG8WtoZX1qocDm
	gqrMPWIt8oQZDdQmJTp1X14ekkbkhTuxzmg9r2gfYhcnAwF/BJDvyx162REnjADqZTqcS1gEiGI
	XM+gEVed82TkeGB90siOLmi2FnvtUwb2wk1YJRQwFmn99Bm1HS24SFEx8ipT+OR7AkZgmg743s/
	lVxMoTizKqTQ35/qH2SUTYH76uJ5gjkdBlJUwQz9O0qDW9E+TFb8jgSVVkGmYgubsH4l/6A15s+
	C5oO59C9pA4jmXDfWD4vB1tCjdrvKvgse6vqOIVLKuzAsd+J98JN7aIA6oKZ07oMAM1ZBkct59Y
	vA/9+QHJ9VDa/XKixRybKNaKI5jGshGJbNJtSxIhTylVtOWVCI5ascCeZi+DxtCA+W42DdTBuFE
	vMFh95U/D3tDRA6hUuK/OJpsSOvjtUnDGGNmCDTxCjGcIt0M3AS2arqisOeQ3o=
X-Received: by 2002:a05:600c:1914:b0:49c:d294:41e5 with SMTP id 5b1f17b1804b1-49ce581acaamr146419415e9.8.1788415557929;
        Wed, 02 Sep 2026 23:05:57 -0700 (PDT)
Message-ID: <c2dfeadb-2459-423d-8a97-5b06a3f32fe4@suse.com>
Date: Thu, 3 Sep 2026 08:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] passthrough/PCI: rework (s,b,d,f) init of struct
 pci_dev
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <baa05f9c-6787-44c3-9d53-e3adc0509140@suse.com>
 <apgaJh5ezRTmmyz2@macbook.local>
 <52dcd7cd-52db-4b59-90ef-f7cde79cf5bc@suse.com>
 <apg7pFeYsPXt9lPX@macbook.local>
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
In-Reply-To: <apg7pFeYsPXt9lPX@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788415558-D715E87B-627D8DAB/0/0
X-purgate-type: clean
X-purgate-size: 1532

On 02.09.2026 17:07, Roger Pau Monné wrote:
> On Wed, Sep 02, 2026 at 02:53:58PM +0200, Jan Beulich wrote:
>> On 02.09.2026 14:44, Roger Pau Monné wrote:
>>> On Wed, Sep 02, 2026 at 08:36:27AM +0200, Jan Beulich wrote:
>>>> Right now we're casting away const-ness, to initialize the individual
>>>> elements despite the field(s) being declared const. Eclair validly
>>>> recognizes this as a Misra rule 11.8 violation. Hide this by switching to
>>>> the use of memcpy(), deriving the destination address from the (mutable)
>>>> struct pci_dev * which we hold in hands.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Subsequently we may want to further leverage the sbdf local variable we
>>>> now have in the function. Yet of course the primary question is: Is this
>>>> an okay game to play in the first place?
>>>
>>> I've wondered the same, while this might be obfuscated enough for
>>> Eclair to complain, aren't we still violating the spirit of the rule?
>>
>> We do, but what do you do without dropping that "const" (which I'd really
>> like to keep), and without C++ concepts of initialization?
> 
> Is it possible to "tag" this with a comment?  Noting we are aware of
> the MISRA violation, but the result of the field being const outweigh
> the violation.

Surely we could make up a SAF comment for this, just that SAF comments
aren't liked by everyone either (personally I consider them ugly, but
kind of tolerable).

Jan

