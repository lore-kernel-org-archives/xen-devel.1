Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A5606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wg3MugOj
Received: from list by lists.xenproject.org with outflank-mailman.1474183.1681365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsoT-0007PQ-UF; Thu, 05 Nov 2026 08:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474183.1681365; Thu, 05 Nov 2026 08:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsoT-0007PJ-RI; Thu, 05 Nov 2026 08:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1474183;
 Thu, 05 Nov 2026 08:27:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsoS-0007PB-MP
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:27:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsoR-00EwqB-SK
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:27:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3dcf-bab6-0a2a0a5309dd-0a2a4505bf38-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:27:11 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3dde-4cb1-0a2a45050019-d1558029bd1c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:27:10 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so15479895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:27:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56ea592fbsm40601365e9.4.2026.11.05.00.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:27:09 -0800 (PST)
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
        d=suse.com; s=google; t=1793867230; x=1794472030; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OD5MeTWOQNA/0unJRctIDKuVdl2OLNTcoi3pfsrCNP4=;
        b=Wg3MugOjm6s+Ju1MVkaG4vH0qj9YQBSTqTTTsA5JWWGOgNsXQ7qoUVU056dcFsLlFY
         BoUbwUlkUC2LIluBClnz7nz6vmiUVE44xYiEKrU4Bkd17Mw0sf3bTlDGDgkJxiuqlbDD
         eatrXUJeCRvR6mdHSbKUOLvZRtVG9zf6gCUAV4Bq1sGl7zfZaPMBdBnqcss6U0BC9dJb
         03hJOa7HTRydScSGldx50HkTS/tGRESartGtAaKKoVR3nktVMWbqYF2Ex3t9q5fpAbrI
         jNMqUYVF9m8rp0zoo/ZcXWacXOY2mPDQY9CFc1NV3NpY+mbHfWwZz1T8n1+1v57vJZce
         c4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867230; x=1794472030;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OD5MeTWOQNA/0unJRctIDKuVdl2OLNTcoi3pfsrCNP4=;
        b=W/l0s9FMjc8GRGJqdramx4aXDKnal1vHVKaj3v2wtiW2GHuc9F8SNlupWpzxOc+pok
         dlLRCrQ/dy+pfFhWyb2f/rfBJoid2xJEDfNIY1eJ3CtOcmLFXklp2hPTYwb2OuYIdfjO
         kwF+Qdh7C25Ofu/zomJGV4sak2JFtk+LZYpbtSYI1sLGyFyW7A1Gd14oJAZL7D+Ry+np
         0e9tcGNnpdM4MfTfM2um5PCMEncfABq9VQF+EuJfgOInmdp5OmqooLwbwtu5mwyxbHYK
         P382BnGPB3ZFlABOaI4gfV66wdwXZq3z34kMISj6S+zy4jbMtWUJiS9Z8ckcNVhFEy3N
         qXnA==
X-Forwarded-Encrypted: i=1; AKwUvBwA1vD1w4UN/XNJu5QiSQYIJGl81ZbTLvsSPxYs29YxXp1YzHxDD4cFhryyOeQ6fSBV3/SKLruFeTo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+eyfL543dFBGOBl0BxAVlLgw6ycJTFmBQ23iV7m8hhbUXia6HJ
	o4DhJ3t/55ePgyf1TqVo+ia77UqW6w5+bRkE7pmuyIhJeB1YtoI9VRP5oI0/4j19MBJLZ2EVdoT
	dE+prEQ==
X-Gm-Gg: AYBFou1EnC6BMztaA9dlFHvZiRE1siCmurosXdYnc533K/pwmn9IbiO2TA51T2+YWPB
	rsRErMV0LvOYZ4kCbFISR9aUGFip4abhMuOnCgM65JynuH+fy+HG/YNAXqjRSFwXvMCvLLaK0ZY
	+xbvzQ1ykxwHxXN590dG1rNgHbk1gVeRa5z2Fzos5uLeS1X2bpXf1fnkSp4OuUMvOkxRIdoV1Rw
	Zjwhmf2pkXd8KEabP+7ir5nnjZrmokMBgtM45PUQLcgOb+VE3CLT4j5sjHL0A+CishcFUbfW1FK
	w66cAAytuib9HV//PONuPTnTK+ImMBpRrzaQF+u69S1UarT4SR7t6DRRCooEicvARK+IgO889JS
	LHrKXISKMofP3BFlhck3ojQnYHx8j4EsSS+pXhVk4ue4fVDHZMvhzmp7e2Ig/jMPZO3EoTDDp4k
	PfmSYZwSImd2dplwWiDM4Y03T65Ch8ng3KnJF5R18GSvLtg2kq5WpFxqWAD7Nvw+bMOqmNm60JG
	W6W+WPRuitU3wBUX4k9jn8g33ULAQbI5BgU7vwMG9lM7gSpbLh9seAk4PUyZqTrKQFLhiiKFGqy
	/47Rlq8pFvGtBBSwjmgTpmtIjtKZX0hGYl8cOt4GPYYQ/p48QLyUiI7UEilugaqHQ891zntlQTy
	xgafnvKJ9z148J9p0
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr403393425e9.18.1793867230022;
        Thu, 05 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <981e549b-6445-4947-968f-644cca5f81b5@suse.com>
Date: Thu, 5 Nov 2026 09:27:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of
 open-coded 0
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-13-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-13-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793867230-243112A1-5ECDC4F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 425
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use the symbolic value in ack_APIC_irq() instead of open-coded 0.
> 
> Also, correct the EIO -> EOI typo in the constant name.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Looks like this is independent of the earlier 11 patches, and hence could go
in right away.

Jan

