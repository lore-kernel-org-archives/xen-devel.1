Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E472606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cUHprqkE
Received: from list by lists.xenproject.org with outflank-mailman.1502232.1698216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBLL-0000D6-4r; Wed, 25 Nov 2026 11:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502232.1698216; Wed, 25 Nov 2026 11:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBLL-0000Cz-18; Wed, 25 Nov 2026 11:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1502232;
 Wed, 25 Nov 2026 11:39:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWBLJ-0000Cs-RJ
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBLJ-0052Aw-01
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:39:17 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06c8db-8faa-0a2a0a5109dd-0a2a4509df7a-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:39:16 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06c8e4-be1a-0a2a45090019-d155802ac44f-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:39:16 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so49481185e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:39:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm730670175e9.13.2026.11.25.03.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:39:16 -0800 (PST)
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
        d=suse.com; s=google; t=1795606756; x=1796211556; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE/IBZLj5qvk18HG4pOBOi9WO3RaF5PdSm2fbebEK80=;
        b=cUHprqkEOD+g6SHCmBBKqpcz5+nML2qKJrxUHGC5tpjkx2j6gfDlJ24iVbEvVE6kUF
         5+tda5Lz3iSwdXPrDrwkdjaXYTgUdygnwJGVukiL58LCI7KMFbG+detQC2srxYo3MrT9
         5/SouxXDGHF7O7spqBLz43lXzW7DA7BUR7XEtsZ+g/KGeypUomKHxhWXYySuFlbj/Mbk
         E7tl1e13OPh3zkI9STgtLSRR7p1l8vpSAzcM5KvqTA4vKrJjdTKGKruw6V0C1JTVEQMi
         RB1CYW/kIUPrbjwsndPLr5USovVpHVnLP8HOiVSvTF4KobXZJ9s91jA76dQ0GO7HNE7R
         5+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606756; x=1796211556;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE/IBZLj5qvk18HG4pOBOi9WO3RaF5PdSm2fbebEK80=;
        b=tUAbWp8zTmeNAKyh615CNiFYkMgfrtb6uAd/Is2w/KP0mYcpr+OUVK4W74bq/UBuVq
         6cD/Zx15v5riEbI93likrH1qNH3eqxzRIsGryNNH7E4b2PrIjWeCbqBXXc2ekH6pBsz+
         wXlnmjb4YRZXMuubVZ6sKDvKT9qJs8B4kjjNAY3h2AROhl662yIwmAWu//2WOojgQA/q
         XGQucMFM3NRAr3uj8PYIRZCdI449HeR2ouP3JL6KBYw82Lbp4ZsWatTH98w+Poeioh1R
         V4lruFmWC26eQi5kaofih/WURUCB2Tp4nJzT5qfMbbuBe8+ONcvV3PYvDYSgeDOW3XLL
         XQbg==
X-Forwarded-Encrypted: i=1; AL+hErGUoVsYQRblcYDB9j+BAC6jPmawl6ggx3LrZPkesmeUfzF0NzKsJ88NrYWpLzmhqwjhasGjbcJ59kw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8NzxFrUQFCwUdK4O5Q2CnVnep5hCIs9sc/XqdBx37fovZxr7WX
	y/iOwL34gaGZ4GqmXNwqrJien+Wclh9FMi9G1B/hI1gKMG/SXGR7u5XtsVZ6/AkhUQ==
X-Gm-Gg: AZFdTZdDcpl4I6GUGREiNUmdI5IW4xhP+vmUPgTmFlafF8XieEHHtTIxpR2Mpoff9Ol
	ZXU+uBNiH9arUe4txmAFb6NIq9doggbirzV0vt/5odkvLV/l93v0+8EQKvsRaUsgiQ2YHi/hNKv
	bkieXfKNB1Lk4wQ8+uI20nXu0QDWFjl9JkAIPOgkQwwFSjpoe2VjI5J+jkPIRlzVUMfndPZhh9D
	llgJigEEFjSNe9gO95FbcRjkUKLpSK3a+eLPCoLw329cTACJB0pWq4D6vCauVhFbKLiTkKCgIrD
	Jjvm2y8T2tP1ZDxw6pzh1UCsL3eo/P5D7+KbtZdBaC6GtotWoq32swTl/ZV8eOzE5Jn3BhVq80N
	xUMzVYCcdnbVgxYNEGnmRYuWOw3cklJGYVZmJxlLNarYcp6tbdvq0bMOpszhDNKBzgrVCXKvGIK
	TUxATahGjtWUB21asO0ltqhch80AJxNnFH7y4lVhaQf6IyeOdVfjHsGMzxKlH+ARTPwAKBA8vpv
	eiz7O1xSQUdZc74Z6yF/wqrl7unsFY9Ot8E1o6745/28AP0iaUrVzJk1YPf7EXfBhjaeyK5A3at
	xr1gj3REbMLORdPHiK6KVgvExPoRn3cgk5CkejaZo9jJY6F8lG+f+8jCIkUqnob79BnLHkJLSQZ
	SMSeqDfmuaJ0BJme1
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr376601495e9.17.1795606756237;
        Wed, 25 Nov 2026 03:39:16 -0800 (PST)
Message-ID: <fcbf4390-f373-4678-9591-442174879b2d@suse.com>
Date: Wed, 25 Nov 2026 12:39:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] vpci: use a local variable for the BAR rangeset
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1795603723.git.mykyta_poturai@epam.com>
 <120db6e2975ba145cebfee8ac71d7e0c678ca621.1795603723.git.mykyta_poturai@epam.com>
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
In-Reply-To: <120db6e2975ba145cebfee8ac71d7e0c678ca621.1795603723.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795606756-3BED6034-D4F2C63D/10/78276251493
X-purgate-type: spam
X-purgate-size: 662
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.2026 12:23, Mykyta Poturai wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> In the BAR (un)mapping paths latch the rangeset of the BAR being
> processed into a local variable, instead of dereferencing struct
> vpci_bar on every use. Preparatory work for moving the rangesets out
> of struct vpci_bar.
> 
> No functional change.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v4->v5:
> * change SOB order

And now From: and first S-o-b: don't match. Who's the original author?

Jan

