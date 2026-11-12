Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9760606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KhxCAZsp
Received: from list by lists.xenproject.org with outflank-mailman.1485736.1688874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRToG-0005dy-57; Thu, 12 Nov 2026 12:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485736.1688874; Thu, 12 Nov 2026 12:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRToG-0005dr-1h; Thu, 12 Nov 2026 12:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1485736;
 Thu, 12 Nov 2026 12:21:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRToE-0005dl-UZ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:21:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRToE-0072eG-4D
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:21:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5af42-2eae-0a2a0a5409dd-0a2a4507cfb8-46
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:21:42 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5af55-b4ea-0a2a45070019-d155802de1ac-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:21:42 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so51368455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 04:21:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498361f6bacsm16905828f8f.35.2026.11.12.04.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 04:21:41 -0800 (PST)
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
        d=suse.com; s=google; t=1794486101; x=1795090901; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4ShMyBPQKWmQvT1Qil1aqabqL+vJ1Au85n1s1OJynE=;
        b=KhxCAZspZ5xFvUkE6eiswXmaU8JLMlfv0lDyJ1YNHailtKqjFCuhAOgwt/Z8ne9llL
         OGCNXXUasMAUc8lriqzOFj0Mrc0JueHHQ8Nci6bgf8r7ZMXJ7BpoeoJIAa4oLxwF6IGG
         LHWxxY42yjBZbY7QeKIdetN2/WTuzN5d6wOq5aBW3heSR6I4/3QRDTjWxkMIbdv9OX2o
         NGAlA79PUX694xBaEfneif7eDTZt06mqdS5/+FaxgcGGzepJ8auN6ppIkj6gX3nhiRZz
         ma5X1kc696vwujosTIPdwwd8excyZiGVVU48DrpHvP8jFlIPsZIugYMU2ToJStU9bGwB
         4WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486101; x=1795090901;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4ShMyBPQKWmQvT1Qil1aqabqL+vJ1Au85n1s1OJynE=;
        b=ue7EpnPaR3/dSg5sutTEnKFqY5Yl6j7OXkEActcJsNqzLKv1sFTw2VIhLJOD3NQzNN
         QmHIVe+g2I+YvAge/tdj2Nr6xhAjuTbMt/JtikKIms/JoH15NQV00hrapUSeNUBzTfHK
         0In0yUmEszzio4NiW48JTs3SJb/d2knmtBIvmWh5BS3cW80KHTUFRFBIWLfcG4qHq0zZ
         pP0t109dAYWL4xnCzKw2IVJbS1bAJUs9K8qLdsI/b2y0mZi5kRDR+1IUbu3v9WK8xbi5
         3mBeI2ZzsYoUJR4e1W6H+PeaKOJKsSaZVhouro5waDFjkfTVSLZOy97jEnsKSbivmiPQ
         NgSQ==
X-Forwarded-Encrypted: i=1; AL+hErHhKYZPoFwslRv6OOKt7A+Tt12DKn9mNJ9Ma0UfI2Jk7XOFuwxchalQTq0RLll6a91xjbjEiztJP1E=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9ntivETpcWXwmZfhHDjgNqavkWkw+3yTtIYLeHnh5N9x6gvxM3
	947RLgs8Lm6xtiWqNGGdHmZ9TH3eFkbRujStfTk1oDJaNp8By4YHGfGuASmrMJ7bGQ==
X-Gm-Gg: AYBFou3BuBhbmbYQnBQjBdbU0ldi3X9f6cxdYbTLuNdaSD7w7l0msl8ChzC9gmAkV6U
	xL64nH5JP80c6bmeXQhBjAExylat3IeAdlloL/lUhqbfEol69V+ODjFS2RzeUBZzw93jlI7gtVZ
	V7/+seNaDisVxbH/t3XvH2xbS4zuVtpYl0w8Uxp//AHpiwWUzvOtOJ6AqJaCCJ6xoMDKp+NvAx7
	lJFjN29NpQL6r+Nu+8Xij+yuRnsbXJCqcnU1CGWeeYTOWHAq1NeU4tQbebGK/Ta5aS3yCAX5zhS
	n36YXyDWu8LxaZrm9KwXx036lHRziS2ZjHxSWq4qJjj1OUB6PM3gl7vZNgoT4vEw6q2vq0/YBum
	GaaEMqiqp3lK+RqEM01S4NYF8UOFCbQhc/oDTdjWdMfkKDGkXtxplFt+j9opEYF5Qv5KGKulQXC
	dLzHZKv5pZyztU+K1gzO6vklM+I4KxIOffvqtSyKE14VfycCYOZ7ExZzLyop+86ehl91hN7smae
	Nzk+h17t7p5xDL/Wzz9jSNB+MNKLYqPszgNLxy2MMazogXGzCRCQcb9ATwSZkDH9+eIcHa+j3ki
	7W0c8nNrVojIxiHxLmaAuZj2LjNzrn/ACKywLBMZrPvwhkqgOGi4L/8Are5Sa0B6fOqn+HSCdAE
	Qx+NMx+CglhtfXQsJKw==
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba09376d2dmr97352705e9.11.1794486101539;
        Thu, 12 Nov 2026 04:21:41 -0800 (PST)
Message-ID: <6e606aa8-67d1-4f88-8b42-ad33ce20ab85@suse.com>
Date: Thu, 12 Nov 2026 13:21:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: add cf_check to vcpu_imsic_{init,deinit}()
 declarations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261112114647.229806-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261112114647.229806-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794486102-376D2AE4-DD1958A4/10/78276251493
X-purgate-type: spam
X-purgate-size: 623
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 12:46, Oleksii Kurochko wrote:
> vcpu_imsic_init() and vcpu_imsic_deinit() are indirect call targets, as
> vAPLIC's vcpu_init and vcpu_deinit callbacks, and are defined cf_check
> accordingly. Their declarations in asm/imsic.h lack the attribute,
> though, while cf_check is to be present on the declarations as well.
> 
> Add cf_check to the declarations, so that they match the definitions.
> 
> Fixes: 9164a97efbeb ("xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


