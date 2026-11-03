Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D2606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZlyJ5OXH
Received: from list by lists.xenproject.org with outflank-mailman.1470262.1678993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHnM-0005ky-Nb; Tue, 03 Nov 2026 16:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470262.1678993; Tue, 03 Nov 2026 16:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHnM-0005kr-L4; Tue, 03 Nov 2026 16:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1470262;
 Tue, 03 Nov 2026 16:55:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHnL-0005kj-Kh
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:55:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHnL-00F1Sg-1D
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:55:35 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea1201-e002-0a2a0a5209dd-0a2a450acc68-10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:55:35 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea1206-f2d2-0a2a450a0019-d155dd30e97b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:55:34 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so2211507f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 08:55:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80333sm28244051f8f.32.2026.11.03.08.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 08:55:33 -0800 (PST)
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
        d=suse.com; s=google; t=1793724934; x=1794329734; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkSu1uTuGxIFX9vkCe+s9NklS2Szxf9aeza+uibxjbA=;
        b=ZlyJ5OXHMuEjtfUzbjQLGIg1yVcouEjBS5iusPGTN+OrugGbub1Gwq1RQhvaub99co
         9soKY8dm7Cg9R7vSr/vxid9iHFJ6fTi7uGvWUtVj7HqyghdS/N7xehXCbwfRnfjo5AWY
         qyglG0nomBZ2NswH9W3yWBT9bpfhgYIonN7LdoncsMtY/6YWvdVKve/2kfzOysOPI9NX
         xQCI31zrb0g2z1es55jrmZOC2o+1FCIXXCEBI+3qFj46V07vWvILp+kFzXonZ9Dc9zen
         lIVUdyEebkLDG7aLlFOwPqnx7PATMQkd+5bP5+pWJa749iBB0SGdRuc+lTf5iRe0svZI
         x/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724934; x=1794329734;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkSu1uTuGxIFX9vkCe+s9NklS2Szxf9aeza+uibxjbA=;
        b=QOqX7EblZ3JyhFbwpOAPbNa2nt+d3+nYz8juSs6pdd/EiJJT0kQfSrxZltQx3Chc5j
         ouTtvi4siDaDXW40XAiKFj+h3zDgHtv/BGoP1eFCbKaEWHiOePOiNEVpGVcLLomn3Mvq
         YA4kaTCv+4D11IaNPPB8tjkZ/MkTKNCF4GY/IQumGSrnJRMsYu+7glB409HIjD30ZUvR
         nkK4jhTXS5lfIiC2BAnZqxGSvn8hRTKnxF5unKl5J6qweGIvOwnsxe0YX4vhaKOQLUIn
         iX+8gbWBFEy3qSVWr36wOz6IONf8TPvIvX3F2jpLLFC0oMkPnavHVWxZo3myruv67DYN
         NSZg==
X-Forwarded-Encrypted: i=1; AKwUvBzyNChewFqQKekAiUnw7deWa2O+Se1RKDcK29BSDyrZmG8Wn+8HUrlpopevEg0Ekf1LJlI1r25svSo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9r60vqbdghVcrzrMwsVF6wcj3ogV6PwwrtmLB20B144CfnwX/1
	+EMPAEg0N26tZR+lZMeLRU1k3NebH+x0dmN3OAyNEz+BMgbw8rGmnlw7YSs5n+IdoQ==
X-Gm-Gg: AYBFou0zPFcvkSNx0HJ8iyTBtBH1aM/y60A/sofJ2oKQuFxa7BGf1xo/LPE4XLeqRnL
	sKj6WN7/RgCh+yXMR2BfzRqHm5dNcTAeXT2vm6ERFIpvbze4amiDNCay8oR2FAjAc/+YF7zEHuh
	KT7wth2NPGxChpp7aKoR1rdE5GO4FmkxMoQnJbMYh4aeUJyChzyvcLyoY9azxmVWWQ6xte0zDSE
	8gbCZ62jyIJsS26vvw21bIVr94Am2+jO1Q+ZmaKxbNF0yEHc02gR331OvoGWtb+wR8ZubuOHWpc
	H3AgMwZ3dAj6D3NWXKx/w3xe8Us2of/Jmk1VIIxL8xz1ffMPjDIS8vogUrVoWeNEf1HJ2NtdZTo
	LBstKIANBNQMtBT+MnGqNwJSOrYusEX0ZrASSMMcvW55NO3lMwz9sR+8Y9Nid6MZwsKC7hPgen1
	6UsrLX8Nmep4DM8kvRnQugOmbu0rfyX0r9c4IN9D7BvHFsGHPJPzaNjatZqNSrNPPFWmzYbkMj8
	WjrYKjbR1gWyNttzzLQwaGwZfQwAPPPErH0tMgXQ91W6i586gUEFYrDizTVuVTrLJm2SpnaWXZu
	3SUix/7r8XkWMQsL33TRqGYiILXx7pLmizbew4CLPooZv9AereFc9iDM1Ph7ZwWv5qkx2SLk6VU
	wrDSRYjNPkq7lEgW0
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id ffacd0b85a97d-48e6e305b9emr32767730f8f.34.1793724933883;
        Tue, 03 Nov 2026 08:55:33 -0800 (PST)
Message-ID: <5d918906-f3bd-487a-be69-ae73e2ff0600@suse.com>
Date: Tue, 3 Nov 2026 17:55:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen/gnttab: Document how _cache_flush() works
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261103152928.2142176-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793724934-5A3DCCFC-707EB2C6/10/78276251493
X-purgate-type: spam
X-purgate-size: 150
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 16:29, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


