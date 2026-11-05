Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E4606A32E
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P+RZyN6c
Received: from list by lists.xenproject.org with outflank-mailman.1474219.1681401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsrG-0003iX-6j; Thu, 05 Nov 2026 08:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474219.1681401; Thu, 05 Nov 2026 08:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsrG-0003i5-3M; Thu, 05 Nov 2026 08:30:06 +0000
Received: by outflank-mailman (input) for mailman id 1474219;
 Thu, 05 Nov 2026 08:30:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsrE-0003O9-DL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:30:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsrD-00Gy8f-Pk
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:30:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e88-e002-0a2a0a5209dd-0a2a4508e582-20
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:30:03 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e8b-f659-0a2a45080019-d1558036c583-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:30:03 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso11594235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:30:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572caf48bsm51599715e9.11.2026.11.05.00.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:30:02 -0800 (PST)
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
        d=suse.com; s=google; t=1793867403; x=1794472203; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhXOnhuaUWKhmke8QkcEhUz6ok1Jl2M1Ll7pGUPAnew=;
        b=P+RZyN6cg4FC36UYZkCndT2kdA+HPJFA5sjkXapYZdX5o3hUGxafWRO8TWvuqxL47A
         Aw0gxR/WjjGM1ZIKWVkzPUzyWeC4M32POOKWKKsT5LZ9skBpOcw3cjAnJkQC2Cg2VpRj
         dRyFcVDFw5ar7J2deYod8MG3hFFNfKMFTtecbZVP7uU7Eh7Ea5XIvfuEM8r4DhabzNwg
         DaVklEBrPNYycnip1TRumP3aEfkPFjFrrZ1TQDr5kCgWn4rT08g/jMMbmOm3wn08gpYG
         YN3R2id80h+ku4PJxF01KFn+DFcWVpuCjbxJ+/V2h3ZwHzOI+htU7UmGONTwHGGDIhHA
         m6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867403; x=1794472203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhXOnhuaUWKhmke8QkcEhUz6ok1Jl2M1Ll7pGUPAnew=;
        b=PNyQaq4bxjz4bZ67LiKvjDGNZsfmYgp6LlmoD1H2PNDq+RtCC+zoNJW4sx/9MMusAS
         0VTI39JmFbxzu9QjYSizz2CNz1/nbM4V1LiTOCJ+rO8WM1zjVxPRdou4osHCrMXR1tNM
         t3fPwaU5cxZINVuxtCpsXa+73RXbGJIQE2m5Fp6+DUDNofOcxKLpNO18bYaaC09Y/TwN
         iCtqc0uqFE700xv4RzOGs7qOB6nkXPeWItaFWqxgZ/mp/8esuqPAlnOpcyxmyAmXr5gQ
         wtvhY6xiSvD3gKFbVIKxwjvSNDAhB734OYYtY+5R0O4y6/tURmA3TC976gT++JTy+BDn
         U2FA==
X-Forwarded-Encrypted: i=1; AKwUvBwQSjpjyBvqrSwHjBy1KP7mH6pbfzHosZx6EFhTjEuDHSMtmGYeWvHHtlsIxa0LQYmH0hKFPmXxtFo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9c4Oi+c53uvyaAWq+ecvXZM9uTaA9VvS9qeB+URtoKSx9RB2Pa
	/kRLPqt25fOqxkSwxqyJ3u6TJ6x9176ELgYADjv+5tynKwVf1Ph6LVxXRvjVR1BIymNiyhVwXAz
	1GJNOgA==
X-Gm-Gg: AYBFou0dunDXzbOPtpThkPhUHQspcdhu2fFgpF331fcHkgr5oALoUofpEK2Ba0Cp0cJ
	xGw4VEfSmmJEphIBS4FiQO92ByWM/OT2s+ok3r1wenf4E87r8EEPdh8MDAUHJ/+huZ3PiR3mZd9
	cnD67UVOPmbrZLb2Az1fFi7T3+vQPN0gRpmKN2FTrkEY1xUb/5QcIro9pP7fiYg6fbw+hfumE/x
	3Fh/M1QCBBkq169Amnl5d52UrCaQAyh1Di2H/g7PP9Pk0ySxvh/tPIN92NpQDF061eO+beqKkx4
	+zjBkPdQZKQDekFj8mYgDtQf5+7qL2wSBnYBQqgnPpbC9FZ9gVKkI1A6KzGXvIdlTfHwTZe3w7E
	enI1EEMmVmrdWeBByGgM+BxljcBQRPUd5mAZn7tp8G1dENaOENxtZoB9i/qrhFX2g7fGaCjgajc
	6bogSEWxdqx2vvh24ZbaGv3I8OzMOZKwHQjhzSQrdvxoMKnOvDxLpNd/DbnIOGCSo3BDk0aC8Yj
	0yM2OYJyxRNear3G1/G6piRE3JLZVXa/BCBIkpwhoQXdNHFbHrP1vcKNp/CymhwzEKKCyCk6TKF
	VVgZHjCmJz/HJ5Yn7LxxEflATLLMtB5y9szx0CBwcFcE472bjpFBfkHufBFnUmH3yLWue5xXX30
	uCwaE4Vpfx/FUAPAy
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr315672795e9.24.1793867403236;
        Thu, 05 Nov 2026 00:30:03 -0800 (PST)
Message-ID: <421bbdc7-400d-4ed8-b000-2d845ab88e9c@suse.com>
Date: Thu, 5 Nov 2026 09:30:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/28] x86/hvm: fix hvm_emulate_one_vm_event()
 definition
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-10-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-10-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793867403-CC37587B-0760CABA/10/78276251493
X-purgate-type: spam
X-purgate-size: 180
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add empty definition for !CONFIG_VM_EVENT case.

Which is needed because of?

Jan

