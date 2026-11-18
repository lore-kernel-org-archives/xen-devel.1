Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B028606A33D
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IdeCFuGZ
Received: from list by lists.xenproject.org with outflank-mailman.1494759.1694099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThVR-0006Gn-3M; Wed, 18 Nov 2026 15:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494759.1694099; Wed, 18 Nov 2026 15:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThVR-0006Gg-0Y; Wed, 18 Nov 2026 15:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1494759;
 Wed, 18 Nov 2026 15:23:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThVQ-0006GY-8k
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:23:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThVP-0098L1-HJ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:23:27 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc2e8-e002-0a2a0a5209dd-0a2a4505cbb6-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:23:27 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc2ef-4cb1-0a2a45050019-d1558031b05f-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:23:27 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso8520055e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:23:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm148649965e9.11.2026.11.18.07.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:23:26 -0800 (PST)
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
        d=suse.com; s=google; t=1795015407; x=1795620207; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oPrm3ROMW2EOJFMdM8VT0OVLIZGoH7uAkILL0EAhPQ=;
        b=IdeCFuGZc2ostMqJat5Pza4WQ5aJ8/qeB1ZoWPkU9OWoJVPQ9CaWXyfx7oNfQ5XuA2
         U4TyBl5XDXutzfOdoRV4cpLJNy09PMJ06H4nsQuVosY1Z8DHQtLwYD9dbm8XmgUPzDdq
         DN+hTOWKWde//rie90Ww7FtdWq22+rb1nc16MVS/wcmCb1nYFs03fhQwFCWjpXXG2hjD
         F7Zrx+XM6jP9JSlLwbmlb2D/11c+0CW8qUF1UfJ/HQSe2CzwIMBv0ES1c0N7AzmpnIza
         Z7zjlBVl4gNpVm10HSMYGwf9Meh0Wg78lgsobEVDUHR83FU2rh0PWf1eeMT5QQANSuZd
         e1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015407; x=1795620207;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oPrm3ROMW2EOJFMdM8VT0OVLIZGoH7uAkILL0EAhPQ=;
        b=SI9J9Bg6ZRSEIElap5DYIVb9sGiDmP86UnF/IRhALvTVOjIjBHG1NW247k1ehXoQco
         m+qTg0iKTta00wm1KUNSZ4+Cxfb/vfZfmfV4xiKytrISiFHLKKSG0JAxDVZ0PJqxdtzz
         IzaW7P43QWpIxFTV7m+R+BM6E1VlKEqf5PlCCVhjrHJtRivo8wr6KwGZKRvIN8HeGoGb
         ppOPmwiDykkk5nCGy+27wc48Ba87vmzzxcFc08kIwWf5jQtWYgdognfSCv0EnObVOQ1k
         XP+oQUzrizgSlX24ULlCJ+y/NZ76srVrGsBRDQZISf+N8+2tNTnoHrKJOxW08iUBaSe1
         IoIQ==
X-Forwarded-Encrypted: i=1; AL+hErHE93lASLZBS0QhXhYS2EmqjDJG319hQaCEFiEtV3rI0eIFjOei+NX9Zo5sdE9uRYMwifw9OYedj6w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+mo2D0m93MUzzk85sL/QNFgNEUkT12ajOtlsbYSS7s+DIm2pdq
	hUhom5LX4feBKVwqXS4IwUALlMTLHWc6cs5Fbdq13V1yWSTjw9nLoUb/0q/Doo3New==
X-Gm-Gg: AYBFou159AyWnma4lYRAW3yQkWd7RSSf13nkflHyt07ChuyULeKb7lqfPD/dAK0N2Yz
	dCfWuxoIG2W65ytHtu9mUfJVRTv7+rnVb+b9llJ26PWAD7Yb6zdANnoPtIi+oN7TcF3UwopDKqT
	7OchLqf263znHJgNxSdr7k7Ui/OVcbHByKcaHD9vEzftCciXXqmt9Qm9iJf9fksWG7L8zdLtLPT
	LzkysOcws3o2tOqG8Ht6JivwomTCTCs9UJbIEqv6IkCCVYYzDz38l+nonmXJUQj2awPvNqviHRi
	JemkgVheEUdDN38nataq5XjrvaTIK8ethLY65Kq3CXzszCeXgQ5OBOtfUNcjV0C5Bx8UjBPiF55
	wcYhG4YUHXX0/VgAym8Lj1wxfM1DbdphyrVEW7u6Ci6n+gbu8wHPZq48nrd9Rc3WdvoABCXXTPN
	E8HOHLK3uJfoqZswDp0Do9ZCxAM1TY+uZCOGDnY7gjvlbH1tIytmUo5h6Nbhkz49mGT2oZY7htf
	LcOSYlUn9P96tHkzZJLIJCYks/svwjpZTqKQXRSfsJZtGOucy1OhVnDwuRC/fsAzxoBIV48O8M+
	1nCz6orRcz8uC2F6bzjXtbFLimRH9bUxsILd9BMsiHZzVgOSyFuDwpJ1RVykSI+evxX3wTy989p
	/XqhQrtZ4SkJavsUV
X-Received: by 2002:a05:600c:83ca:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb7da4bef8mr50055925e9.33.1795015406760;
        Wed, 18 Nov 2026 07:23:26 -0800 (PST)
Message-ID: <e446579d-75bf-4507-811d-d879092a3731@suse.com>
Date: Wed, 18 Nov 2026 16:23:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/28] x86/hvm: introduce vlapic_reg_read()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-7-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795015407-247132A1-78E76E27/10/78276251493
X-purgate-type: spam
X-purgate-size: 412
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
> Add vlapic_reg_read() for integration with components relying
> on emulated LAPIC accesses.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

This either wants introducing with at least one caller, or its intended
use wants outlining. What you have there is too vague to uses as a basis
for approval.

Jan

