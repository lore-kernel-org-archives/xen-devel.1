Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89846C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:39:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412138.1642631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wyY-0008FQ-Qi; Tue, 08 Sep 2026 14:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412138.1642631; Tue, 08 Sep 2026 14:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wyY-0008FJ-Nz; Tue, 08 Sep 2026 14:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1412138;
 Tue, 08 Sep 2026 14:39:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3wyX-0008F7-5i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:39:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wyW-004N4E-Cl
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:39:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01df5-bab6-0a2a0a5309dd-0a2a45089d02-30
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:39:04 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01e07-f659-0a2a45080019-d155dd31bced-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:39:04 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so3339353f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:39:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfdf6sm37621260f8f.34.2026.09.08.07.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:39:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1788878343; x=1789483143; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u73mHx95QTyprz2OlvWoAsMRAPhleXlRiwoawDxfZog=;
        b=LN+SBbZY4zPtWjPb8RQkQ7Q97WehNpfjogmq7wqezRZK+Qo7tUoaJFMeBnlDKYieEC
         3syA2ZuDthatUtn0i1sIq1dkK9nDWRxVH/8nKdn6YL1Tb8a4jCHLZo6wRXFSkLhY2uOW
         K5/jsV1wwNdmpy/ciJg9iwBcv7dxg6V/6pV1avWGSzMKOsS6S7Y5hkOa1yrJeV9PM6/w
         /DMchc/rjBpZn2m2JjYK5hQl7ZPML88WyGhXZ1aI56RyxvMKVvGspME2zSkIDFh1NGhE
         YX6I7MSLyAfI0VyY0S5s1s9nV482jgJDKxWH3XowWfi/2TqwFqAf9bbobz2L38OdGwm5
         aQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878343; x=1789483143;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u73mHx95QTyprz2OlvWoAsMRAPhleXlRiwoawDxfZog=;
        b=f8TzZtkeg8rsthOZhmNOQG2fQiUIooBtY4Kjy+vzkxqXncS6nwjdH0pJWg9VcJgIQD
         EnWG3pmd+rEk27zJfiOhbzqCEwBsUw7q//tyJ3TtLvVIy/p+VbebP3iGJH8LHeNeFfSs
         wk6EQEKBCOu0t7cGweMBg2qujVN0qgmUuJOj3W2dpEq7+mCMXSrAWkg5kLdBQnwmbJ3A
         uERMmuIYmjmO5v2tnJTiYuIHUpSETu7elPkAOssGLBaV/7M2iTa+pM0E4CdCBwk8SsAs
         Itq6JIiWFNOv2ixeU5kjrMdV404M5lme3eODhSUqUzFdF/lgLlEKcvLOCPgSKD7ihRRV
         mD+g==
X-Forwarded-Encrypted: i=1; AKwUvBzlO3Zk9P2Bu/M5Qja/geCCiT5oNHaYoPeZl8R9QjW28wtsVgE5OWWR+gvZ/LfdWYqfsyKAWgMhdQw=@lists.xenproject.org
X-Gm-Message-State: AFuF++n3rddzSedY+co/JJCR5+09jrfiIWpXqvStZilmu+JMgYSAQyeK
	F757vRujShDyXzgCJL+/3xv4z5pywEQ6L08N3Ob8DFJRas9J79YRI+/gZKvgxcnT5g==
X-Gm-Gg: AYBFou0k1fLqyE30OyFFmB1ZLjpq8lMF77ZKJuMP1SHrO7FNjvFb8/aC0T/SpypouHj
	Ej63k+0oUjQ/m7JjbyPDCWzdXvDY2++y9S3z81PhqdyD0VFc2x+e5u20kLT/bzTHH3raytlLcQo
	DyLf2bikjzrcsv0VMXj//3fkBqkDb6vsetIA4rOXOnl8HrfXflQvgAhlELZdBUxDzLh7zELtvkI
	ooZVy8QQ0IPm18O4UO5A1HH7Id6TygmTcsWPPliXsdecMauBkJdGB8Qu33XSmjjCrQo0uhM6qtj
	+5QKKSWjH+SwRL0sMgIFfYDkNk7gFNthdv+lPW3AD5JnRxnQpS1K2pfACAMTtFl36HROEtyVA+e
	+hS/nei4gLn8E6JwWGw1gcePmnREbAAneG4SFjiBc9bDmJUqP7ZyGeyePDgNgMRYpXQJDyv/Ugh
	d5xuUT6aJJXaavDC0Flokgch6mtDFFMiFJYwxIr8lu4trsiCTl4Lnn/JLcME89KCqrwqpSFty5E
	yTVNlDbiwsAHhh3QIToiHEFn2Es4ZWINJA/CVENfmh+cZjidLz+
X-Received: by 2002:a05:6000:4a16:b0:485:8a47:5b98 with SMTP id ffacd0b85a97d-4858a475d20mr27381493f8f.53.1788878343531;
        Tue, 08 Sep 2026 07:39:03 -0700 (PDT)
Message-ID: <6a2b153f-e823-454c-a449-9683c76aae9a@suse.com>
Date: Tue, 8 Sep 2026 16:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] x86/mm: simplify create_perdomain_mapping()
 interface
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-7-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-7-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788878344-D735D87B-22CE9049/0/0
X-purgate-type: clean
X-purgate-size: 2358

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> create_perdomain_mapping()'s interface is richer than any caller needs.
> The paging structure for the requested range is built to a depth
> selected by the pl1tab and ppg arguments, each of which distinguishes
> NULL from NIL() from a real pointer:
> 
>  - nr == 0: only ensure the per-domain L3 exists; nothing else is
>    allocated, and the other arguments are ignored.
>  - pl1tab == a pointer: allocate the L1 tables covering the range from
>    the *xenheap*, and return their (stable, direct-map) addresses in
>    the array -- the mode that existed to build the GDT/LDT stash.
>  - pl1tab == NIL(): allocate the L1 tables from the domain heap, and
>    return nothing.
>  - pl1tab == NULL: do not plumb L1 tables for their own sake (they are
>    still allocated on demand if data-page population requires them).
>  - ppg == a pointer: allocate and install zeroed data pages across the
>    range, and return their struct page_info pointers in the array.
>  - ppg == NIL(): allocate and install the zeroed data pages, but hand
>    nothing back; the pages are reachable only through the mapping.
>  - ppg == NULL: do not allocate data pages.
>  - both NULL, nr > 0: stop after the slot's L2; do not plumb L1 tables
>    at all.
> 
> Very few of these modes have users now.  The last user of the
> pl1tab capture mode was removed when we removed the GDT/LDT stash.
> The ppg capture mode never had any users.  Nothing uses the both-NULL
> L2-only mode with nr != 0.  What remains is exactly one bit of
> information: whether the caller wants the range populated with zeroed,
> area-owned data pages, or merely plumbed down to the L1 tables, ready
> for populate_perdomain_mapping() to install caller-owned pages.
> 
> Replace the two arguments with a boolean expressing that bit.  With the
> stashing mode gone the NIL()/IS_NIL() macros lose their last user, so
> drop them as well; and document the resulting interface.
> 
> No caller changes behaviour: every existing call maps onto the boolean
> exactly.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


