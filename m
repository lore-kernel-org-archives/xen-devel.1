Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EDF606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ezA2r4XF
Received: from list by lists.xenproject.org with outflank-mailman.1503107.1698942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWTqV-0005PS-OU; Thu, 26 Nov 2026 07:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503107.1698942; Thu, 26 Nov 2026 07:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWTqV-0005PL-Lj; Thu, 26 Nov 2026 07:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1503107;
 Thu, 26 Nov 2026 07:24:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWTqU-0005PF-QQ
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 07:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWTqU-005G8y-2O
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:24:42 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07deb1-8faa-0a2a0a5109dd-0a2a4509b354-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:24:41 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07deb9-be1a-0a2a45090019-d155dd2ec4f1-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:24:41 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so5125279f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 23:24:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c4353d6sm37438178f8f.56.2026.11.25.23.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 23:24:41 -0800 (PST)
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
        d=suse.com; s=google; t=1795677881; x=1796282681; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkQHqHi14QEHX2AVv6OrLUKC9699MAhUX0LQZ+rpZLA=;
        b=ezA2r4XF911s4c4TS/KGUkc6SJk+nrX7mpAdAJjpOH5vUTL6Rcuu5sW9fTFmSNKhSa
         iaIEFUn/XnwaqLxxpwKW3/FTIrVKicObIfdZyyCAb8HnFetA5OEJdF3HSzCDo2qGlY5R
         AfmCt7LUx9/eOjBj9tZGenty5hcb+W5JcTd8WJ9fp5J01rDOZNRgGra0i2eHf7d+uJzZ
         hOYr2AwCR5I5duKokL1XS2NweusxNk/ElhgyITMVEBQ076ojO4aa9Y7Ta+xDX7S5ZXZU
         MJp07T4p8YDnQbIPU9Hyq4BQkVR69DAnfjkFowZgb9kpZJfWslQFubgDj1Qsb9JcFzni
         zhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677881; x=1796282681;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkQHqHi14QEHX2AVv6OrLUKC9699MAhUX0LQZ+rpZLA=;
        b=ZwALvESci9oHo1YtzmwAP1kDlWTtAR1MYZFqW9NZiUy2pHXg1ARu0xZgES/0e8dCJK
         G3vovSjmtAUFLBxDWLUEFE0sIbWmLLoNmj9eYT4eSa56ApyV1OWIwl9hCbs2O65VEigF
         iK9/9k91cm6NztFxV0dTjBJ++Ots4fthdSnJqO9HOApBH/jjgYHmU2FdB8gfPhoIUPGI
         8ALPG2LeALClvPGcAgodJn8Rz2OAasKF9SnR8irXNq0O3pzSzhXueEv+t1+w6bw4sel2
         zKS+WjKQ0bPbUZbY45GNMP8Dwgwrb5RhCVk4a1IrTtTkSmfUbw/DdlCGkSwoZmMjxHM1
         i3fQ==
X-Forwarded-Encrypted: i=1; AL+hErHtDRRdsD+8wa2oco52xeSz199tyMG2fxh/TtbUh4zctK6RTdPYPhSYUSkrKw+badQQDhMGSn7MHjk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8G3Wlg5GoeZodK6sv7tXZ0DuLa1yeSBx9X59roLspYK+y26SYN
	cXzBsYilxhirrZEpdxUDAqjRa+8oRE3zncSGOYP/G2B4TNWyN37DW57iMDB0/mJ3Eg==
X-Gm-Gg: AZFdTZed0ol8Qmgf9cvd0xdWA9QoDFjkjaRV5F+x7XPiGM5cCEjpUmYN+q3xG21ptxt
	tE60RleGjBhKRbT78jnb6ggx73s+cpVc3emOSgd3fEiWEHcPih4fGUXoV0URqGzR6otDT4A/k9v
	Kfqz1OuVhOc+kiCn+o7l27nKafmbz3FiDdz/tWa/s5PlKw6jl0ZF/mYN1BTslP0C6Z3XB+khkwr
	fhKUWhoGEucu8ZblflDWV+ZH/v4yjMzrejliP3TBOBPOMgFj6dWOPbUVFb0L2tGABcyF15r7JIc
	BZgQJ0V0xfMg3lihyRG2+z6t330buphwvhm0sg8GZlo45JLAONUvGpD56iU+oiipStbOA25qBZE
	PeqBhAHGhh1fe4By4285d8iRTpu9W06fklKtS2rSD3swghpAL78OGyO9jaMJnIsWg37Gl2NlJ+h
	2IG8OF9cyy0JIZQn3r673Jvvpb9Ue7kXsIzqFxCl6j+JLWq2meY8rAAs7cjAWKzbqaIE81x2PvP
	GSji5AuD8rcO0pZTSnWEeG2axmbPucS2t0KQaBbN4cwDd5SjnhbOHZXVvHTwWnY9pFbWysjqNYl
	veskepa5Z3+etQqo+aYIYMPxAMRC8xxAA3eSEhrRQEckVqxhZQ70OnJyb+OjgQQy+o7XPuEnnoj
	WhjXDuABZKlxB8ln5FqgXcpktESIePG9GffVUO0Y=
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id ffacd0b85a97d-4b780c1127cmr13241565f8f.35.1795677881291;
        Wed, 25 Nov 2026 23:24:41 -0800 (PST)
Message-ID: <b5f7029f-13d7-484e-93a6-eec873882901@suse.com>
Date: Thu, 26 Nov 2026 08:24:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Config.mk: record hash of SeaBIOS tag
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
 <0fc3eb31-1aac-4b0e-8f9a-ae947dabe81d@suse.com>
 <au_lyioQRMuKkoqJ@mattapan.m5p.com.>
 <6b07617a.985e8776.145007.9be0SMTPIN_ADDED_BROKEN@mx.google.com>
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
In-Reply-To: <6b07617a.985e8776.145007.9be0SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795677881-BCCCF034-BD1BC958/10/78276251493
X-purgate-type: spam
X-purgate-size: 1163
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.2026 23:29, Elliott Mitchell wrote:
> On Sat, Nov 07, 2026 at 07:00:26PM -0800, Elliott Mitchell wrote:
>>
>> The situation with Qemu is far more concerning.  Since
>> $(QEMU_UPSTREAM_REVISION) points at a branch on Xen's git server, every
>> time that branch moves you get a different build.  Since different
>> versions will have different bugs/features unless there is a public
>> record of where the branch was over time, older builds become impossible
>> to reproduce.  
>>
>> The favored solution to these problems would be to switch to using
>> `git subtree`.  This though would be a pretty major move.  I was hoping
>> this series would get a discussion started about option.
> 
> I suppose I should ask given lack of response to this statement.  Do you
> feel this is something which should be brought up during the Community
> Call?

I fear I'm the wrong one to ask, not the least because I wasn't even aware
of a "subtree" sub-command. Whether that's (meaningfully) better than
"submodule" I have no idea. One aspect which may matter is that in the git
version I'm using, for example, the sub-command isn't known.

Jan

