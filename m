Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E94606A334
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lybex5wh
Received: from list by lists.xenproject.org with outflank-mailman.1496178.1694836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0cV-0004YS-MB; Thu, 19 Nov 2026 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496178.1694836; Thu, 19 Nov 2026 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0cV-0004YL-Id; Thu, 19 Nov 2026 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1496178;
 Thu, 19 Nov 2026 11:48:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU0cU-0004YF-Sw
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:48:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0cU-005eb9-9B
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:48:02 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afee1ed-2eae-0a2a0a5409dd-0a2a4505d168-22
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:48:02 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afee1f2-4cb1-0a2a45050019-d155dd30b9cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:48:02 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-491846221ffso1717580f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:48:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65541f3b3sm10259499f8f.23.2026.11.19.03.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 03:48:01 -0800 (PST)
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
        d=suse.com; s=google; t=1795088882; x=1795693682; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+sYYCGukNvMwfwJei0TtMl+oONevivp4nKBhSMlh5s=;
        b=Lybex5who6/jQ6wmHt5Xkx3ZcQFT5hZhmDPWahMf35CfCwi2ZL1Z0fUOC0zNlgqV0l
         0ISSqIvYuB5h9psjYJto0fyM4+ZVMnUN5F0Z3SxB8ISWzr9o6cLg/BLwpbZdmG4nDSuG
         zfXpzkazgz+z1BLdiQeZ3h7y20s2o3fqG1mG8sPBbGXNaqL7zE1bmJiGPRTjsCQCfCna
         DPVhp6U+Ym4y6ekdOfJRNSdYUIrkPeiRgCav3v9eB4HmV/OePBDakCThO8mezVw57gdg
         CeiNVQUSzL/ULALfxwa31wFoReEH+xOX712sFGsXLzRLJ8skkL2i9N2kjJH51kVhxIlx
         Yvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088882; x=1795693682;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+sYYCGukNvMwfwJei0TtMl+oONevivp4nKBhSMlh5s=;
        b=DYq5qcNQtzmothPxQOWqmrsjs+5Tv5q3DgLrt9hKjZblpcvHboIrov97isrqPRrktK
         C32KggwkvMwVUof5s6rK1VaMSFzZMAB9Y8RTw4Dfm3YO6+GTIEZZkVAaS+UMM60jpGcG
         NeCUwR0Zlj5LCBLK0KJ/rJxdN+xxd9sllrfULu+dr7ZhjBgsDAnvVsD2SQ3Ntf4qH0Vj
         HPvpUsiykJKcecyLbWzUXoVabFMi3zElOhK2n03A+UqmHSTmW9ZAfHwt/0Vru58BakWH
         PLOtEvBLPIq+UmijtCgiaCHD+6TH3MmwFP8q3nDZbm6fykaCJjSamaeLUikJqoBOxCXW
         PQjg==
X-Forwarded-Encrypted: i=1; AL+hErEopHiJAVCZDZwMOZUsPoKANxAcao24BhhDh1rwV3Yjf+qLZ9BEebD82ZRMEAXsGzpNqJBmib3Bcog=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8icv59MA1CYR8BXrd4JXwd0TXIN0toS6FRqisxRC+2cDi6sYZE
	KLsI7JvbCKTBF4MNtfy6s0rKK9DBKLY7wJx5lKSRIMLbNMW10GEGsAz0v0g7HCTvXQ==
X-Gm-Gg: AZFdTZe9r5B+BCEIfkioY7Z6mQozUk2nhlzXFLtR+TZEiCtD44InmPQnr3jOrWCgu+9
	DpPhoGLpLg+7NxqoTSwTrGOT7GZRDW1o2tfJlgeF5/3PDE2PseM+EdblcSpp1EBxLine/hMKM1E
	VhWidvBkqUq2r+0/hE1Ws2Td8fzVV0rCY/N4mESvetLyAG4c1kDXu4OdiSBdTjL/beCR2jwtIO9
	B0L+hfklAu2T/6HgyaNJttOIqgJUGVpVkanQ4ze7CdY3cOj77A36hc80Mnn2pDnPDs8pZd6R3W4
	bXblANFOixSFmUeJ2tNUjjZKPHA8fadv9vRx1jPNyPb3cwoL3OMniTDJi0VOpYvEDYEeJ64AIdK
	8MrjiIvG6yxTvGfQoWuM9nUb/51eZy0vadT13PGGWvmJ4qlLbVSH1vrKD8AVCc71ZQt4KElEAcE
	3AxBXdb5UhpvTCe+dsIDZyfDrwCfsPJb2yRV3UhpCJ/1hHYPgBXIGFtkwpVooYd7cOTH/ffKdTB
	jX0TTfc6j9LcyjmAG9PdkYkPTAz7FkmblFYdThvc4RqUgkpxoWyQ0RefiMKPqt83vjDjMHwIvNT
	HaH3K8lCFfRnHX+CSqO9Zzry11YJ7+vzLZj1JdcdU5Xz5tfxTZ+08XCZg0ADocCn5cB8HUugV2h
	lhcSl9j/E5BWTu23A
X-Received: by 2002:a05:6000:454b:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-4a63c55e08cmr7741763f8f.43.1795088881667;
        Thu, 19 Nov 2026 03:48:01 -0800 (PST)
Message-ID: <440b744c-1b38-4bf8-acf0-148ad50ac3d0@suse.com>
Date: Thu, 19 Nov 2026 12:48:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apei: Fix up headers and MISRA deviations following
 code removal
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261119112523.36032-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261119112523.36032-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795088882-F62AB2A1-FD36BFC9/10/78276251493
X-purgate-type: spam
X-purgate-size: 266
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 12:25, Andrew Cooper wrote:
> Fixes: c6bd6cd2db1e ("x86/apei: Fully remove dead code")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


