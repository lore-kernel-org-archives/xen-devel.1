Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FDF606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=R0owN+3Z
Received: from list by lists.xenproject.org with outflank-mailman.1461118.1672076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIW5-0006SD-Qw; Mon, 26 Oct 2026 11:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461118.1672076; Mon, 26 Oct 2026 11:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIW5-0006S6-OS; Mon, 26 Oct 2026 11:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1461118;
 Mon, 26 Oct 2026 11:05:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIW4-0006S0-3z
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:05:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIW3-002qxv-Gl
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:05:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf33e8-2eae-0a2a0a5409dd-0a2a4509e9ca-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:05:23 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf33f3-be1a-0a2a45090019-d1558033cd6e-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:05:23 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso29306665e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:05:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a574088sm173363975e9.9.2026.10.26.04.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:05:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1793012723; x=1793617523; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRd9NLigJ/Lfv+mIBIIn60b6XHzhKUKIv5UMPZtc1vo=;
        b=R0owN+3ZboIZ6CDaIbYczzyvuGL4DOvig8VNShcSclTEjPVtfFAZ1BmOIdmJAahm6Q
         apiHZUDy3XQaSPeU/9Sl3+okw31pCHMI4hSFW34KKE4FVk1B3NnAkqOCky9Xfk/T2GSw
         k2TDcbcItjwcd788XSvqrjpY0R2J2F3fz/S3atbis2Ox6Ua+CYNwozNXRbiI5dLRj1Fo
         b/JzESOcYQrCR0GtZ7yTJIfWesxt4cYqqxX7OBgCcl4fL+jolhKaoOZqPI46nd5Ppub1
         VDlnCTqNLF/+RY3G8/VHxTBeukAvwRKOcXdnSPK2rMPgBtSkXiJoDA5UQzXCb0ozgFNa
         stQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012723; x=1793617523;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRd9NLigJ/Lfv+mIBIIn60b6XHzhKUKIv5UMPZtc1vo=;
        b=2XtOeGi7OettNGT3J4S2UqoZn1s1m+FVw+VOsrR3qSg2bip3f91mwMIohiiWQUTd3s
         Bkr5dJLVzBODRsdFDO6O2ihfdfMNd/h2YQPko7FCcnrjmjSLc73he9XlkALsUHjZwSDn
         cAmiUPeCqd3IN+2rx8sgZPUOcKz4j55l2qEmpbBjIoNmvoWHccc8k5f86SYU41XnNLB6
         Vf/0icdtbKg/PqE4zE4t2Nzv3do/pNbr8qPxLRO3SCSJnSKkASZxtcqv112PzkGtllKl
         7jpx0sMPYW5DSjumejD9o0z05/L5N9/GKgECPpDcbcA+Ftbrsp1UH+C0Fy47RVxwMRtV
         bapQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUgF/XMnz4Woz1sYElvN9u1bZp3DLzva2reuf0WWDPl049zsH6El+24yPpcqJY3DgJtI7eIz1ruuA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIjQXylJWFfz6wGaEBmr1mE9AIswn9gOY33/n8NMWpsSMpOx928
	93zIFw4x+hj0iuH7jUYTgIGZs/wRtoB8G36UT3ICxiDj09t766J+8Ow8z2pgVqyfHw==
X-Gm-Gg: AYBFou2XD0LEjGewoAoBjOvz2NxIsMR0pJBVI76oBslxWJUjbLx0CGYu/JxvuQ0P0pM
	I6SuhPIm6K2tTMoeR8HKR1D7Hd9MxaCty/N7Eme9X2W7foWu17Arw34A/4E2/YyrqVT9FIJIrh7
	2cPeGmse7CX0s4jGgsBcyrFSYTPP5wTBgbGcgC2eT6xXlfvynL/KuF0ujerR7kFoz/HpO7DyhZB
	3AEumFaGOywQdbAeisPPv5P4cwk2MZtcXyjuXeXrAG6HWhbNQaznX5AQYZUcgfr8N5bnuN7V0l2
	b+YoH+anxZLAJb9AUsgXm0+X1GTwMMAwDi4Tgx62695niXyNnbtAaSCgSNs2d3Zbyhzgmoyjie/
	oxi4fvrwwNKpuyLRkI1sA2xy9kyWUuxT0obEdToPvSfLcDCwVT8or7gFFMr9Rop7sqqZH5g4PLj
	5eUfmGYeXWkmBhSvkOkAN7AB/R3fx7nKfo+5KFGxDTSAAAx+pdvs8Iy26ZGStgpK1a9yM4J89mC
	Cwudt7RyeXHeyAivPeDOC5vkM7elepZ6Kt2B55drqPvtnhnrMo12ewxNO35gMOOqhvZNukUWTv8
	pCG0gU/tyDFGaRjiH9DRhI4zt5fdytp1KnXYbmqOGVVBGc/90ZkwKHhvHZv7pWsV
X-Received: by 2002:a05:600c:3d92:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4a35aca3f99mr113389125e9.20.1793012722177;
        Mon, 26 Oct 2026 04:05:22 -0700 (PDT)
Message-ID: <aa7e04ee-d640-4067-8739-eb5b374a4426@suse.com>
Date: Mon, 26 Oct 2026 12:05:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] automation/eclair: generalize the noreturn
 function-pointer deviation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0af5523cf21dc3d8da6cf0e765fb34a664f7f1c.1792399445.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <d0af5523cf21dc3d8da6cf0e765fb34a664f7f1c.1792399445.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793012723-BE6DA034-B1C3890A/10/78276251493
X-purgate-type: spam
X-purgate-size: 839
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 10:51, Dmytro Prokopchuk1 wrote:
> The R11.1 safe cast only matched void noreturn (*)(void *). Accept a
> conversion where noreturn is omitted and the signature is otherwise
> compatible. canonical() covers typeof destinations, and
> compatible_deep_unqualified keeps the parameter and return types aligned.
> 
> Discarding noreturn does not change the calling convention. Code after
> the call is unreachable when every possible callee is noreturn. Leaving
> that code in place is a tolerated Rule 2.1 violation. The full rationale
> is in docs/misra/deviations.rst.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # docs/misra/*.rst

I'll be happy to drop the scope restriction upon seeing an A-b / R-b from
Nicola for the .ecl change.

Jan

