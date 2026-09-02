Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A1BC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:52:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405168.1638702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ep8-0004Hy-P9; Wed, 02 Sep 2026 06:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405168.1638702; Wed, 02 Sep 2026 06:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ep8-0004Hr-MN; Wed, 02 Sep 2026 06:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1405168;
 Wed, 02 Sep 2026 06:51:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1ep7-0004Hj-Cn
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:51:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1ep6-001fpS-C3
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:51:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c776-2eae-0a2a0a5409dd-0a2a4503c97c-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:51:52 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c788-fae8-0a2a45030019-d1558031bc05-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:51:52 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so6015565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:51:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce464aa32sm55240765e9.5.2026.09.01.23.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:51:51 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788331912; x=1788936712; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTJTlH0jzIOL1WrqVMZ4jOPbf7aE0JO3fKyodOySVHo=;
        b=SOuRstLKncZqih9Dn8ZRkoR0pr9pd0L3AWLhCiRpVPi/vbT/WfXryr0wvyxzZmfcTr
         B10PlSMmNJL0l0fS/bZlbbpqSKv3yZZlT4SEgqJ1Ky3KlD+Z1FZlNUrTHTsolS04ouhY
         sM/xAW3jfrYIdOVe8CcUJ0ydsRnyPqgWEvdKsU8cvxU8rWMDasnVSIRytcf5UJSfCWoX
         zPBLKo7nG2MijSEMO+j8acxCz0y9mdIMXsoDTHbJ+VQ8LyTz3MJtsEL4bym8y3+Eqp38
         laISClybrQ4fFzaT2tROQZ9d2rnSDq3qHqzgitHDa3ew/cRlh4jb1bwkC5xbOoz9mp3/
         vRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331912; x=1788936712;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTJTlH0jzIOL1WrqVMZ4jOPbf7aE0JO3fKyodOySVHo=;
        b=BijaH7Qg1YjnJ7xTvw7LYeIiQF7OgEI83/8dvyWZwUvIb2J3aYyL+Bm/vb7S/Uz6XL
         5qR9ykQGFByHVjhqfmM8Jhid73DFawL7285BtNDyM7hAnAMzEueYgRx123uOIy5zC14C
         p37CS45GnNiJ4uG8cUF2FvTfI3a8lMlP4dffi57o1qmKb/kPPKGXTO1DwtpL28DaHTH2
         M4vUdcWdpw/8NtKrb/l1JKkwK3t2p9kY85XR9DN36TJNElTXkt6S/tLgRVf/M8zdT7KH
         VBl2cRtuXLlw0ufFvHJ0KJjJURr7Ljran02dzR4y3KTU/XYoj1qkX6Hyy44J88HxqKwn
         Zu4g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5f/WE+7C1z/5lAXnp+b+Wh8Bo50MYMOPuzyyz/v/gdGFe8pqNzaN+Rvj6fIARGVxEfggr2EqExJM=@lists.xenproject.org
X-Gm-Message-State: AFuF++n3KLCRj0n9ZB+c58JOQghWzDc1S0RevTMhBK+xGuUrQdCZ+aha
	x18tJgva78krv4DgbbxwXsnDg5IrQTM8NJ7vCunfyirTIEDbhT5OVFRD8JpIczlcCg==
X-Gm-Gg: AR+sD10Si3l6Y24My2t06cfkoNHnlNSlB1Mgf5ISRpqlaUF1OZOv6T/KFhy9jL9F++1
	XVpk7g6bAgY15mcZISnGkc6KzYbsyg8fpu1vLHhqIkJuJx0JU2qGbWr5HCMVf7Zd6JguQpClef5
	jmtxnYi+n4qA8iRLwNnr0oCGnARibrW27lczQ7NYirhLxNqU6yCCYoVEW+yn3tClXpV8eZOJjPT
	Fy9V76D/njRUrC/sPDIghOauD9FeH4+98gc2G0wXHTFQdKL/87LbugCwJr8Kea6Lyke8wHeSYns
	9Vvc6r4+i5RZIUjS+2gWVDrUwNdlGoLDAAlfvfYCrkWL8PNHbGNjTbLT8tRl/7zPcqoAR//1yZl
	womTUiiIZpadfdQYnWo//0hfXQ0DOxJysKPDOLsAU2GGYWSmBMKMLAEMNuY83k3NNYH1NvrH9na
	AoJYMdNCp4tytF4iLSK0zm9E3suhSXlYY79/eCaBpmSSODUVYRfeAxrtU1I8gSg6014ju7TRCPk
	2GHTycTekElNgB3GwgameG5wsQfcDuCkKbcE/1yAsWS5qMXEhZC
X-Received: by 2002:a05:600c:8a17:20b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49ce5808d4dmr31349525e9.7.1788331911631;
        Tue, 01 Sep 2026 23:51:51 -0700 (PDT)
Message-ID: <579431f7-3df9-4a96-8a9f-1fc748a0aa4a@suse.com>
Date: Wed, 2 Sep 2026 08:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.23 planning: items for the release
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ad1588cc-3130-4ea6-a7cc-0210b507b7a4@gmail.com>
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
In-Reply-To: <ad1588cc-3130-4ea6-a7cc-0210b507b7a4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788331912-750864E9-9D5723C0/0/0
X-purgate-type: clean
X-purgate-size: 848

On 01.09.2026 18:05, Oleksii Kurochko wrote:
> As we are starting to plan for Xen 4.23, what items are you planning to
> work on during this release?

"Work on" isn't the right term there: Stuff which has been pending for, in part,
several releases should really finally make it in. AVX10 support to give a
concrete example, but there are many others (including things I couldn't
sensibly post ahead of other things having progressed at least some). And I
would strongly request that you or whoever else is going to be release manager
actually start pushing for this to happen. It is imo an unbearable situation
that work which has been done is getting pushed from release to release, just
because reviews don't get done and, where necessary, supporting parts which were
promised to be carried out aren't coming into existence.

Jan

