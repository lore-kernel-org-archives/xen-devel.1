Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1B606A33A
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gacjujDk
Received: from list by lists.xenproject.org with outflank-mailman.1469800.1678557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEZ9-0007ld-QW; Tue, 03 Nov 2026 13:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469800.1678557; Tue, 03 Nov 2026 13:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEZ9-0007lW-Nw; Tue, 03 Nov 2026 13:28:43 +0000
Received: by outflank-mailman (input) for mailman id 1469800;
 Tue, 03 Nov 2026 13:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOEZ8-0007lN-Fn
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEZ7-008dgC-Sw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:28:41 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9e183-8faa-0a2a0a5109dd-0a2a4506aa22-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:28:41 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9e189-195a-0a2a45060019-d1558036b024-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:28:41 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso29895035e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 05:28:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a66caefsm274639575e9.5.2026.11.03.05.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 05:28:40 -0800 (PST)
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
        d=suse.com; s=google; t=1793712521; x=1794317321; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxcSiNayj7KvRCwrpKS7MARJcUKjMzXqCYh9tZM9V4s=;
        b=gacjujDkwH7N5yzn5zMOvsHzg+r92P8w1WTh2OaDJWe4w3Fd5yw+IkqZzdDPf7WbBd
         mQvtRFGjNu9xeBNAxBFksBo4lemvPmYqNl81GBygzSsB4pCDkFZmFsv6V6M5mSr3IVDG
         rTBcqncqDQns7CjrRGCaVTnAi54gHAbJm0oDTTznYMbuPAg6YUBurH5gWtqD/QqAAzoO
         EN7Y7WAjKeBdX3/TU4zNG0XS+brBL5t8+6WIG5AMxKP87rGWvkdUGjIBFMtp/zL1/GzR
         Vf6nU+z3wBQpH46jU1gSnAT9dQ4t8ztBVPSY/uV6s6C9hkQDfGYPmRlR9uHuMImGutYu
         T3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712521; x=1794317321;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxcSiNayj7KvRCwrpKS7MARJcUKjMzXqCYh9tZM9V4s=;
        b=Qi6/yPzU4yhvSHMtqIkYjHONVhw/zyWCLd1clwBMQQ316Zka7kPRw0WKtYtTXW+PJD
         YhX0NGu2hJBPv/Se2Fo5qEcUyJqflY0elbAGlDG0EILM5lvs+4d5M1HSwO6RIJSojqiT
         dAM5goE0QN4HzFIfycgOm3nBl+aiTG9rQdKfkzdAElb7Ul2Mwv9A65tGjV7U2UG6u7yq
         ctfLPRGgWn9+uyXQIJe/K14mIfPqWiZzs/V9CVDwjaGYoPgrXKgX4jxzPxkxOyJ6axPY
         +JNcc8wLvEDYBfZ1MZiwvO3NcPVnhGspIz16U04NwlFAcIh7fKE4CK0qWWjB81NO5vnT
         cHfg==
X-Forwarded-Encrypted: i=1; AKwUvBxt7GyRMDyGLI81e2DAYoh5iNxDJ48YxHitsFna3jdJO6/nbXvpOTeRWSfZhSAPa8vMqa8NPpXFLAY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z87befqNQLAYIATNxHpNH6pCNLdVw72a2Gq20s38T9Joj1xWkBs
	MgqQURxah3xj7UQ5MU+2m/touVSsB8t/V/zJ22zKS8WpqjK9p5K/kgqhvnlDMNEej6E5b4cMGI2
	zInxraA==
X-Gm-Gg: AYBFou3uYd8jqNOhOr0vB4JkAlgf9DCryIATbkZknreBTP+NF0zLp4E0X3SjG1VPALS
	ZWEFqvOaTENL37+AOBgZQfVx5GQCgQuLOrktqVLd4Krw6dG3TSg3kJlj0LhNQFUagtqpN1j4xF1
	6fBTV0Qr1FqDKpib8b8zS1K0LLnA9WoE+llU6o4dnF8bTXekjXCo5dTihWSxwOOmG5Ctw5U0pJI
	V71mTcDMZPV21CZIzYSxcxn8wnmd5uhB27Wqtfs6otnbWh8qfxAzrn+431JlXobvrmAOTFm4D2e
	Ek63lziO/qLqejiGRqIyA4F+1YOd/rn5oVUAuuroNodyZkmGpkOAYvwOQQ6Mkolz1xDZcEAMuh1
	YVJ+RGEKLVDGN6hglTAUPxldOREiUT8ZsduYqK7tMprAAKYJ9l0esz9JontRqsp3NVpRROdbrBl
	HGbhh9YxHna+C3unJaPl5gzRS5073U21YqxOXUEhSkzNC3GJ5CRVWOotZrU5EzPyybZPoaA0G8c
	0dgemKT59ZNvwHtSbHpOXHH7o7xOnYZ613wjktXor0VdEgjaWXR/n+RrZ0/g8MQ4xk4mP5rgwhL
	WFyKHgZYqx/0fpwF/3F8f1hwX5DFiasiTeNgNp8ZdIxyEV5vCawhMA0p/UyUcyG0srGIfgB9uDq
	oMmul9jt2dcerNcv6
X-Received: by 2002:a05:600c:800c:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4ac17753c13mr313485575e9.23.1793712521162;
        Tue, 03 Nov 2026 05:28:41 -0800 (PST)
Message-ID: <e640647e-522d-48dd-a8d3-619c5705d7b1@suse.com>
Date: Tue, 3 Nov 2026 14:28:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gnttab: Shrink struct gnttab_copy_buf
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261103130120.2020581-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261103130120.2020581-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793712521-FDC0F77B-DCAD8912/10/78276251493
X-purgate-type: spam
X-purgate-size: 1875
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 14:01, Andrew Cooper wrote:
> Move the booleans into earlier padding.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> On arm32, it's 40 bytes before and after.  Given that we can't reuse the
> tail-padding from struct gnttab_copy_ptr, I'm not sure there's an obvious
> improvement to be had:
> 
>   xen.git/xen$ pahole xen-syms-arm32-after -E -C gnttab_copy_buf
>   struct gnttab_copy_buf {
>         struct gnttab_copy_ptr {
>                 union {
>                         /* typedef grant_ref_t -> uint32_t */ unsigned int ref;          /*     0     4 */
>                         /* typedef xen_pfn_t -> uint64_t */ long long unsigned int gmfn; /*     0     8 */
>                 } u;                                                                     /*     0     8 */
>                 /* typedef domid_t -> uint16_t */ short unsigned int domid;              /*     8     2 */
>                 /* typedef uint16_t */ short unsigned int offset;                        /*    10     2 */
>         }ptr; /*     0    16 */
> 
>         /* XXX last struct has 4 bytes of padding */
> 
>         /* typedef uint16_t */ short unsigned int         len;                           /*    16     2 */
>         _Bool                      read_only;                                            /*    18     1 */
>         _Bool                      have_grant;                                           /*    19     1 */
>         _Bool                      have_type;                                            /*    20     1 */

Making these bitfields would help Arm32.

Jan

PS: Can we also get the other pending gnttab change sorted? As said,
feel free to post your patch, and I'll ack it. Alternatively an ack
on my variant would be nice.

