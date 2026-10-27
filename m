Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E16606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gR9dlFIF
Received: from list by lists.xenproject.org with outflank-mailman.1462100.1673175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLfg5-000404-Gx; Tue, 27 Oct 2026 11:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462100.1673175; Tue, 27 Oct 2026 11:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLfg5-0003zx-E1; Tue, 27 Oct 2026 11:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1462100;
 Tue, 27 Oct 2026 11:49:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLfg4-0003zr-QU
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLfg4-007ayf-08
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 12:49:16 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08fae-e002-0a2a0a5209dd-0a2a4509901a-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:49:15 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08fbb-be1a-0a2a45090019-d155802ba95e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:49:15 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so5233975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 04:49:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a59d238sm250462765e9.14.2026.10.27.04.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 04:49:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1793101755; x=1793706555; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJsryMwUXNjp1wqMYv8rG+hvdO+kdmsn+noLtH+2PCs=;
        b=gR9dlFIFbFI8O/hDGNDA2rnTS+ikNyxvxsDafWpkSHQYUszzSdlXXVlKpNAEyL2kKr
         s975N7htqpuRp4fF8OBrl5Onzpn6+IwgE8s3I1q5RjWJTCayCkWFbCUyN33fDsJfIhW7
         jox1dE+VfVMcgH1uOdtuanNLeG9g93byKWA3/WZyh/5TvKL53Exm98gdyhaa3Qq2AE24
         ExVQF/Fu8BrdST2vWegFWkBMPgBo9EagIbwf4ZLuCzrR92xcYE+AWylbgYKymlbGH97K
         3qoY+Nkp3nD7JbdBxfUzYur9bpqCJ92NrrtrxlOkLj5+KRI6PJUNcuM4EaGsmxY0v+D6
         LV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101755; x=1793706555;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJsryMwUXNjp1wqMYv8rG+hvdO+kdmsn+noLtH+2PCs=;
        b=k/8Pi1CNji9Kfg9eKnspr5QynSB2nJTEnUxs+LjV2VGLlUwFQUa7NrvSnDwRhIv2lN
         rED+YtE+pqEGTxQQuFGs40oZIjz9jW6p5k07F0oXU6EI577js89AQcGl6Hk0lYF4E9Sh
         ipjx+MMKzZl/X8MRH9zLh7c/IRClxely9g9UNAsKbmTfuQg7N4o15LIi/ABtiKcb1mYa
         GfpYGQSTtxK2VKHnEVNBHizsIIBWGqpvkr7v/E7hjy4cvWsiJcUhPqGWUNruWtvwZWAd
         0PYqUF+/Oy/lvagYhKqB0c+Yn2bTsc528xv6VAjU+nwtVwWsH561DbjFD40GjjkGnwZD
         QQKg==
X-Forwarded-Encrypted: i=1; AKwUvByQX8KXVIiSDk0jRcks6LwNysdlMAhkWQN23tlv8QcH4y/0lOUev8A09OsfHiJvclkunrMoP7Zn0Hw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKi4HQQBbWY4fisjHU+rD/nIcj/1MTL0lf5chRGs5+y952BPN3S
	Fi/vlgFnh+BPHhQ24yy9mU6+6MkiFNRkM2RNOMEyObT0zvRNAaSfXyrMQYvyJBmfnb0b6kKVn9T
	i5Ftm7w==
X-Gm-Gg: AYBFou3bRddtELDK3Mcxamry8L9qXWr3HYSc+R7bieDaJPCmwqiJECiB9SivJ9Goeu8
	TjZvulsGRW/a9Iym/PHVkeaD2KTXuFFsMbI+t8c0kJuc/A3jLKz8YVU7uIkIIYEFILeKy1eAvOa
	Ndcohel2xdS5HX9Hrqww9C2L/z9PYx8vtzu0TtP7JZU6Y2BYeqDbxtmzt3vHP5DC6E4EWmKjlLR
	jW0UmJd4qNK0aMW4DrZLcnoVRTArJKE7whzqXLdKzwkctkyIy8F+4/1IWF7FIxwa+ucjSkl+icb
	VDEv/KD8g+IKCq/3OUF3thqr5Nw0hT141V4pJuh4Qm6JH8jmp/TdjIxVASBPVrgnkBbKTW8a/8y
	BiXvS3lDlQTQhJSMd3Mc7Z/mkUMt0FmLF8Nq6mtxvQKLCXZFWwJ8VbqNbGaekTALUd3bA/JuUrp
	8S3G3xgBm7eXY1Q91qDh0bJOj03IzFGv6eZ822qJWy3zGmXN188kM3T65HhkkU5gM5aXeyId6hD
	aeXxDSsWj+LrCC4kq2fsyY151z/VR9MYRQUYVGSgM1lYd6jntb9a/ZHt1HYAWCQoCDZikTkq1iz
	mxx6yNR/cZvyNq2QQNatYx7hVMRJ5rOvWAzL2nwC21dv
X-Received: by 2002:a05:600c:a117:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a7c1f63e7amr36279485e9.17.1793101755325;
        Tue, 27 Oct 2026 04:49:15 -0700 (PDT)
Message-ID: <bd24e700-ebbf-45b4-9b06-c85beae458c7@suse.com>
Date: Tue, 27 Oct 2026 12:49:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mcheck: keep the banks past the end of the CMCI map
 polled
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 jason.andryuk@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261027001315.2614976-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261027001315.2614976-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793101755-3ACDF034-940A5F29/10/78276251493
X-purgate-type: spam
X-purgate-size: 848
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 01:13, Stefano Stabellini wrote:
> bitmap_copy() copies whole words, so in set_poll_bankmask() it clears
> the banks past the end of the CMCI map that bitmap_fill() had just set,
> leaving them neither polled nor reported by CMCI.  Set those bits after
> the copy instead.

May I suggest

"bitmap_copy() copies whole words, so in set_poll_bankmask() it may clear
 banks past the end of the CMCI map that bitmap_fill() may just have set,
 leaving them neither polled nor reported by CMCI.  Set those bits after
 the copy instead."

> Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Acked-by: Roger Pau Monné <roger.pau@amd.com>

No further tags needed, as it looks.

Jan

