Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA010C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:23:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376048.1623023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5BT-0007wm-UW; Wed, 29 Jul 2026 14:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376048.1623023; Wed, 29 Jul 2026 14:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5BT-0007wf-Rc; Wed, 29 Jul 2026 14:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1376048;
 Wed, 29 Jul 2026 14:22:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wp5BS-0007wV-7r
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:22:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5BR-007w2n-L2
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:22:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0cbe-2eae-0a2a0a5409dd-0a2a4508cdd8-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:22:57 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0cc1-f659-0a2a45080019-d155802bc89b-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:22:57 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4956869750eso7377985e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:22:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d70144sm61478225e9.2.2026.07.29.07.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 07:22:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1785334977; x=1785939777; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5sy5tb8lJxpKIWFOrAAHUJ7CEmiDdIQXC53riAXdtU=;
        b=Xmt7CZSkOQqKb/KlUvW7jlueAKk8rlg/sNIZbKuixIsSvgTwTKdK9l/VFIkVMOG2km
         1tKztiDsSeHEmP+V5fTCoFxQsEgLDDEWP8uXs3QocWiQoAjkClf75U6d58DqFEO3WM+x
         iTa4uJDMoF4ciDjJo5NM4CH9BI3+6vi9Oj4jOcgeiBsZBL6yRopR3pVtUJFQYJPGJdCS
         N3OExiPmTkabAJkl8sCLOPbMlvHq6hSeGoRhMtNKjMKj/PFDkuCMNIJ73Lm1NtjWnHxx
         kZFl9+ELAgUYh8FudO+fT0lDUULV1rN30f0OltiriJ5WTKiWzq6XOtgyuD5VdZgkGO4j
         tuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334977; x=1785939777;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5sy5tb8lJxpKIWFOrAAHUJ7CEmiDdIQXC53riAXdtU=;
        b=BWPP02iBfvgfrcImxzPMYgr3ovYWQfP/MZ/ZrWpR6f98tkK30IInw71dLjcT+X1gaw
         sqKA4hijARGNBSv5MSz1+fv6DtI8Ss3Ol34bPlaLlmlcU5rYEziTx0LNaeKw7z6q5a+Q
         11vus+488Ojqzs3DmGqUhpKgoj0N/XFIbj+cpxdByLbRgjW3Kn1EDqWSflehqvh3rHfd
         y5QP3MiH7iIa/DBzXbmyQrUBM/EUWjXzGE3HMtdKTV5TQrNuKAj8g/c19oQ4kfe5CBdb
         wbgfw2FrKO6TeWNvhIQwnonNXoPMgsHF4G5GnyUJeT/ALvUNFCisTTtBdk2TRB8p5cad
         BxSg==
X-Forwarded-Encrypted: i=1; AHgh+RrenRhF0aiUUoxoNSle9P7kkHCH0vwofk/V5WfmwzZp8vgIvycxjTUOeQHP3oDaaGaqIhdcN8YyNP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9T1vK9voKv+RRvm11vCSeNAG4gXvh0HjrcytODdM04GRGWW19
	WuURL9GcCUyxEF1uLkKMV9HbUDyWhW7aFMxIoWSaWKTNob1kuhn0GdvepjjOOmszZQ==
X-Gm-Gg: AR+sD12gy3HlHC0qENwA6MaEY14BWxgxLcosTY7WxtJ6BpBxFbD/LffwZu1VvSfmb1Z
	0Nnt3pn6/fqD1xPHemWgJz72nseyntQ6eYViakgaVqZ/Wo6N0lXAFjphK3YrgucceHEK2uB2Ot0
	fa6K3dfPKS5uNZjIGp1w1CBZNAZWdltDEYt/x9oLxJtQULfVMqJLYyV0r8Pkk0P5+C6hHkdRVis
	QtfFTEKGd5Zflb6hOiLw19a4D/LjGhHrMmMElEWyZXJSl1E0nsdLu+BakTGUAVlJCcP2kf6Q6Gv
	iAL74H7u91Ri5ph4YobxVu765pFJNy7G9Lv6qJ6vjGyfHfgfY5UqYXYiGXpcEI3QOnMwn7wTGuo
	Ov2C4up1EUeOUuZY663Qo/tT5NudooENCF9OrEQ0B7skIQYNK2uylsbCOQmc8Awo5TTKfuT1zbT
	cpbRjy3diQuiE7zTFyouV7yP4DIqgL8A8BsKoQaGZNki4zOEJ07hmdTiBK/OzQ+UAUfyWOOV1jX
	emT2tHr0CNd8tfTKp3sTA9kOQrOLlvyJsjpuVta+VZDQDHqVCMq
X-Received: by 2002:a05:600c:1c27:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-496c643c6f9mr81334045e9.16.1785334976854;
        Wed, 29 Jul 2026 07:22:56 -0700 (PDT)
Message-ID: <ab05fe35-1017-49ce-be3d-69afe3ffb62b@suse.com>
Date: Wed, 29 Jul 2026 16:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/evtchn: fix wrong usage of array_index_nospec()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260729141254.345989-1-jgross@suse.com>
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
In-Reply-To: <20260729141254.345989-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1785334977-D574B87B-BBCF2B76/0/0
X-purgate-type: clean
X-purgate-size: 1051

On 29.07.2026 16:12, Juergen Gross wrote:
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -71,11 +71,10 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>       */
>      smp_rmb();
>  
> -    p = array_index_nospec(port / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE,
> -                           d->evtchn_fifo->num_evtchns);
> -    w = port % EVTCHN_FIFO_EVENT_WORDS_PER_PAGE;
> +    p = array_index_nospec(port, d->evtchn_fifo->num_evtchns);
> +    w = p % EVTCHN_FIFO_EVENT_WORDS_PER_PAGE;

I don't see why the calculation of w would also need to change - whichever way
it is, w is bounded by EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (and hence safe).
Preferably with that undone (can do while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> -    return d->evtchn_fifo->event_array[p] + w;
> +    return d->evtchn_fifo->event_array[p / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE] + w;
>  }
>  
>  static void cf_check evtchn_fifo_init(struct domain *d, struct evtchn *evtchn)


