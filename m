Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB66606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C4boDrDw
Received: from list by lists.xenproject.org with outflank-mailman.1461029.1671962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHUN-0004qd-Qr; Mon, 26 Oct 2026 09:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461029.1671962; Mon, 26 Oct 2026 09:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHUN-0004qW-No; Mon, 26 Oct 2026 09:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1461029;
 Mon, 26 Oct 2026 09:59:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHUM-0004qQ-Cp
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:59:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHUL-0058kQ-Pe
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:59:33 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2475-2eae-0a2a0a5409dd-0a2a4504ae38-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:59:33 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2484-b57f-0a2a45040019-d1558031e15d-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:59:32 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso24569525e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:59:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0bae01sm226954415e9.7.2026.10.26.02.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:59:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1793008772; x=1793613572; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AW/xpGGPAnmK3nHQv8mlURNxAldKG7tmwti3PO5CfB0=;
        b=C4boDrDwqprUZNtut+FQ/9cJxsgWSLsvQUbkq6xy5U+4rhiy8ZyYgMh0DGCPEijOC6
         x41/IsYIAKtDvZOP4D23vmmnJ4JzKBgnL6wfiXLKStEqz1B99//Q3GDLRr6aOdl4bbWN
         kcuiM5RMpkSLwi37CQFv9xjyK5ijwxifCMQFHRzPWB3p8g2gnI/IlHDwLfjmkyK5T0T8
         FijKV6gd2TYzFPDdpqLzGssEVmKmPotACA6ByYR3U6mJSEoagp7Cm1y7RUzdCD5fpdCY
         jj0BK0g/WcN5q2y0v2FKR+dyhFybGKBVB7PWUbGZ1Hit0UJOc3ikPriHdKBE3P95xWZD
         qkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008772; x=1793613572;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW/xpGGPAnmK3nHQv8mlURNxAldKG7tmwti3PO5CfB0=;
        b=YSLvOhcnKdxYCM9zw1+NZC12FriupbGbWZrF/J228HD4zN/HTV8ll4aEFoRN7GlCHQ
         JEPPydunAMuVo/9K3OXUX2KDlBycsV9jiHZ6VPD8M/aUBb3JKxrhMeWfC4Ha/la3kBOC
         gw0rVyaNhWQsfJH24cZg1iXZb9djNILdb1mOCaoPYbBaMzAaZYKoydJV9Ab2tVH6q/tD
         PDGRlGng86/3MgzX22UuKfCJTjyPiPxtJdMrz4v7yJBjCTRZgAbwAv5hiPWt1O6evY7P
         iTrcKPE4tJDyuxCgCqhY+4yPs6xCylmmEZn4sQ3otT+/hlwuv9+NmwYYOCG/nJ76KeyG
         bE6A==
X-Forwarded-Encrypted: i=1; AKwUvBx5EPCmEBUajkwwV0FVXO/ROQi3Wi3AhpAaDwr4WOs4mJvTmrGPBmf27RY/XQVF3ahAItiebVAhrMI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKKJTbZfowlPz6RXbM1CMO/4UjdJOcFWDNqoAV/B6ADS5a9oFUj
	Aq6WqnpIjkVJDaAEDXfmHDU6cOs1olRVZog0fZr3OIZErRRw8zbg/is3EDViPBIbMg==
X-Gm-Gg: AYBFou0iWsa6zHCdggdqrmGQCvIOsbMa9GhXMtg0A/9Ed0/dN4X+b79kkZBIYAeJtMy
	bdiHEWlITlwNJJ2C+f0GENSaEOlbus9KwT+63HmEftDdMA/PAVNm+jcRYTkoRyU6EjUWAHK8JQT
	qqbCmUqc0oVjgtjF6qvWe6h4FOFEFrv0epkUUSNaFSgaxGPmJi09Zdq0t5hUS0NRzYNv4CIzvrl
	v4earDSoWmpegXm6OqILHlNaVrC0P5w7Vl5IW0DQnwNTVCtBXtD3WXQWkpATvB2KH8WqKSjDGd+
	aNZwbTNEnPrTiJQAPpTr054575OaqHsUD2OjREZQ6/vkgNN0MvBbCQhIwlo6KV19ODjrr/tMECJ
	rjRJkQFPet2Gu2NsdIbVPBC0USkH4OUDdbJisM1N+1cu+H8k1G32ZjWexnLo+zFlLk0v1MQ0LTq
	HHuzrt2DtxtrCYHTO09Hy1dG83J45RwAs/J4poLLoI6ERkrq4k1Ljw7VlO43H7xVEvFCoVdfCJh
	MzRJbI9GbBHHfDyJS3wE7shtFDEIZEhp8f9Eag/oW1xm/UAky5J4FZSvvNQC58UZkdAwMalwrP0
	QLJotiyMyckfa8nXg3Svt1GEtYt/coo8716qoPgUJcxi
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr112596445e9.8.1793008772497;
        Mon, 26 Oct 2026 02:59:32 -0700 (PDT)
Message-ID: <af41ece3-3e5b-473e-8c44-db391c7890db@suse.com>
Date: Mon, 26 Oct 2026 10:59:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86/hvm: Propagate emulated CR2 writes to the VMCB
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261020213315.3641133-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261020213315.3641133-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793008773-512DCB50-B78DED77/10/78276251493
X-purgate-type: spam
X-purgate-size: 629
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 23:33, Stefano Stabellini wrote:
> hvmemul_write_cr() updates guest_cr[2] but, unlike every other writer of
> it, doesn't call hvm_update_guest_cr(). On SVM, CR2 is loaded from
> the VMCB, so the emulated write never reaches the guest, and the next
> VMExit overwrites guest_cr[2] with the stale VMCB value.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Especially as this looks to affect not just (or even not at all) nested,
I think there should have been a Fixes: tag here. I see the change was
already committed without, but I think this wants backporting nevertheless.

Jan

