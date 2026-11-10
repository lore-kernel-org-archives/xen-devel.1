Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525F606A325
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OvX5mWo+
Received: from list by lists.xenproject.org with outflank-mailman.1481489.1685375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQj0D-0000mL-Bs; Tue, 10 Nov 2026 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481489.1685375; Tue, 10 Nov 2026 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQj0D-0000mE-99; Tue, 10 Nov 2026 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1481489;
 Tue, 10 Nov 2026 10:22:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQj0C-0000kT-0j
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:22:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQj0A-00AcHe-6X
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:22:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2f077-2eae-0a2a0a5409dd-0a2a4505e2e2-46
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:22:54 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2f07d-4cb1-0a2a45050019-d155dd2ce135-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:22:54 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1180829f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:22:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4989a2a505asm2666450f8f.13.2026.11.10.02.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 02:22:53 -0800 (PST)
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
        d=suse.com; s=google; t=1794306173; x=1794910973; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBR2wZLecGrFbVs64gK9K3aryez+kLEYz5irsQEY5MI=;
        b=OvX5mWo+38xVs411mvKjif2JkVxOdLut6dK78lKAP8f96XJllQ3nmbSXS/5dsSqCU9
         oF47jwKS5d8z6CM/BF87iVrHQUB/9BFauxG2vnV4mEOt7pkJTnx1LTzT4z+WCsESRcpK
         1KiFOU5WMvwcgqHyVvu31EKOABCrz0lVBXqsm/XJCjvh/O1RvzAHTI1jjg55w22q995w
         +ae5LSDDKx/A452uRIX583qfzwOl7A4RlomN1VAbDIpI4Of8fshjlcyDZF91vl7q0n32
         88je3As2CmbrkNEGoMem4eGj1tmgyIAEWWaEAx535sHuapnljkMxWeczUi3nvU3/etIC
         D2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306173; x=1794910973;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBR2wZLecGrFbVs64gK9K3aryez+kLEYz5irsQEY5MI=;
        b=qs2TPhD+vpy58PLKRVxxuftskpyQdu+eJxRzKdVK/M+seCdsBPqEjHAVu9l+j8m8jw
         01bFsDeRE6hVQvo1ayvtFh/ivf3TlGifPh6Wy92jq7MRjx3KuG/T9NkEJQnEFThXgWU0
         w7BDO5R/YAQIdZbXsGBMUAyxsrhBZ9eKOGpsq3hZlq2kGdkeqvWU84BFP03MnQJq5RIJ
         X+52UOejDkddZOQkTRdXKDn0FKlHyR3F0RVuCGHE/FKigdheJGjx4MWFs3fq36uoJcHd
         R6q48p2/XP8NSf19IGlv/TQKMlPUvgVPEsCe37NM2bVPZzDgQw9JURK4pjcF+PxrFdla
         2YXA==
X-Forwarded-Encrypted: i=1; AL+hErH41qNb5XeBV6jqzkUFRPhX7I0ssS/ug/ZwqW7O18OPoqUeZu1r2ZIn4MpBQZhRcgiJ+cad3rdJmxE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+l8pnypUJxOrg/LpsQFf8ekjDkZFbGU74fJgkmHQxNe3vfkeUx
	tExNCOircy8KiL4Wc7+Q+R0/RNl9lhtng7D/WaCE/CLlWtWEUfQtoVmOZtdbv+beeA==
X-Gm-Gg: AYBFou0pi2KWUAkxqcpyBPOXBvE8ovOPT9hFDCQbGrd/9sZAh04Zm0t6z6cS7K3zYs+
	01MhR8JF1U5/eJbL6A9ER7SvuAsdcd4TRfdyW8crNxszVE/DaPuM26CPzcDh4CeDVWy172pt7gB
	CCTw0ARHziTe+vwt70eU+TcWcwqfy2+bh5USzg9PmmruuNFxmk57fMRLX/yvhWIsg+GU0vCogRn
	sbY6bTqO5tH3edE8tnWcfyr5DVEQxTa547OWBQ9GBZ8cnXb+T4IcMq4EwlkHR6rQgurC4wx3LDZ
	PBI3SYyyVD5/5tgnP8eLMlQCpJuj0PpBbfxtmsbamiSUt0aKw9gAQooXPNXBrOw76Ety+urUrTr
	zlWQBlMGz1HF7XrPf5VaWscve2b4vjvRmFNbYZCqOqX071Jfwxup5rh4Hmfn48lJBblU8awpXYW
	ddQPXhyH//CjKW6LNmKpSBRfZjeQ7SXR1yWZx5/Yow5bvO2ldDh2cdNM2rvMU9qfFzITV7fyH8v
	13j6uWz98M7qkbvUJ/JgXKe/awr3ueuOPXB9nzGMYWV2ooH4ixkC4r/e5jnbFhScNG0r/qz1L3/
	0iEWF5nqO1TFjQQlCU4DTuoV6KNJtg9YD9Y41zeMYP9JMv7tOzJ20QHhR3NXiSH7I1WWX/8Z5ei
	NC3AeIVIat4Q/EjwK
X-Received: by 2002:a05:6000:2411:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-4982b1957f0mr4079100f8f.7.1794306173563;
        Tue, 10 Nov 2026 02:22:53 -0800 (PST)
Message-ID: <d2ef64c7-0587-4fb1-b119-bbd11b987c3a@suse.com>
Date: Tue, 10 Nov 2026 11:22:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: wait for QEMU exit before restarting a domain
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794306174-730B22A1-4C90FC61/10/78276251493
X-purgate-type: spam
X-purgate-size: 1206
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 11:02, Jiaqing Zhao wrote:
> The PID-based device model destruction path returns immediately after
> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
> port because the old process still holds it.
> 
> Wait for QEMU to exit in a child process after signaling it for at most
> 10 seconds. If waiting fails or times out, log the error and retain the
> existing domain destruction behaviour.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> ---
> v2:
> * Share the fork, error handling and child exit handling between UID and
>   PID-based destruction paths.
> * Reduce the device-model stop timeout from 60 to 10 seconds.

As per my v1 comments I continue to question this.

> * Handle unexpected errors from kill(pid, 0) explicitly.
> * Fix misspelled "signaling" in commit message.
> * Coding style fixes against tools/libs/light/CODING_STYLE.
> ---
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Roger Pau Monné <roger@xenproject.com>

You will want to use a correct address here (.org rather than .com).

Jan

