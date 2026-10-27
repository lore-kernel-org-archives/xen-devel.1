Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6708E606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HiJSB7P4
Received: from list by lists.xenproject.org with outflank-mailman.1462031.1673083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeJA-0005py-6O; Tue, 27 Oct 2026 10:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462031.1673083; Tue, 27 Oct 2026 10:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeJA-0005pr-2O; Tue, 27 Oct 2026 10:21:32 +0000
Received: by outflank-mailman (input) for mailman id 1462031;
 Tue, 27 Oct 2026 10:21:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLeJ8-0005pj-MI
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:21:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLeJ8-009t3x-2n
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:21:30 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae07b28-2eae-0a2a0a5409dd-0a2a4501c952-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:21:30 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae07b29-5984-0a2a45010019-d155dd2dad59-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:21:29 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so2294314f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 03:21:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd47basm23953227f8f.32.2026.10.27.03.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 03:21:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1793096489; x=1793701289; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgioH1x09sJmztOki28uCEJQQXiJJrrtGbmK3k9wkpc=;
        b=HiJSB7P4R67r5WpvfeT0XHFmoMuLFJvFE5dlj2HbwiawiTKyUMMiW/6OKRalmDXDdq
         mgvIGDwPsdiyIwS808q8DTBQcJ7pjPGD65i0RFZXyC3Wil7YI8JxRkIYHf6G/lUlksw9
         jQJozE7U4z8iU5JFUy2oeduYvsGxfpzrd/maVpviIaHTRUTRhww3opkmzZXSen3G672H
         E0Iykp+QUFc19ptjt+4tUM9Rup6E8rJs+OdZT2GKu1QHUioSpbrKclLcrEVixXCjb6VD
         tHM6azzecggpcPxVCKp4obxCgCDeBSC5RgiimQ7kMfBrAguAjDWEy9QXdcUfGmKcf4y0
         26ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096489; x=1793701289;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgioH1x09sJmztOki28uCEJQQXiJJrrtGbmK3k9wkpc=;
        b=eJIewPr6/LOGeBhdB3Kd56tUVdLFpjBz7nUtSZSeCXgPxVZDDn6gsCIu0Ctp0YmHiM
         JWLIJzdKED9pwHXPy8x5fIM3hC7Ef8i1ILQHea0c3ssukr++eA/Hb3t0QN13DmHz1Xo8
         m5yJY9i0Iwtx4teZbCXWIGJxuzv9AdIjZyfXVkN5WtpJcXcqmTlNkpup/eZIyMlY82WX
         F0zYmoIe4DIVDhJ8AstTS+vOdBrGYyivSIi4XlcLNAtmn8Ochm1oWEBXKdii+s2Mwaly
         GDmyljGRbhTzwwPakypXxj/iJecLPKTvnvzI73mmS7Bw902HohoUMiadwLe9sL0rze4+
         ly3A==
X-Forwarded-Encrypted: i=1; AKwUvBypruFY6401r4LLXSaKBXzuEB23i4sjMYVeVJgxsbTB0I1ndgvr218zXOMzSlNhAZzJgP6ndp4Yj6M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLAzGaZQx4cwY8IQVaJzO0pXfpCeZDW05YhDO86jJELxFNRET02
	NpGj7jCCcFDWl/6QNhjd7dSCmFyetwZMgsXMLJUEAg7G2vzhHXDvR5SOzAv8VHk9Cw==
X-Gm-Gg: AYBFou3D0MEeeV6HBBB5vKL7/o1mH4RD7MJ1QbFVNKfwVuh7oGRdJK/pxyjkPzbpvME
	vTcSXtjDJau/G/FLVuHHrFiy7GWb8S0WzIqFq+3GXfUSlErzObkQzJUrNmxlih7qQQZAvPcgzrd
	J+lsdhN8TWYtlhzyV0hw/rS06CR+CKJXWQ7FszvV6qMtQNM6Yv9Q1aI6ZUQqsrQESY3dnDMabRs
	A8BmD0MFQrjw/u8YM05bEHovuW9xC6R0RC/8iPior4/1sO7CIpUe1qnLTDl9x+MoadxSEd4M7Kw
	AQbfm+ogK9jkMfOs2FoegjCq/1fv15EhXGe316tCLfOeNECllL2SCzU2tN4VSFTENtJfg2fXNPW
	lqPvDL18HLQZ3NfbA/ebFRj48825l7UVvogh/W5kAU6COKsfQ3mzeXJLXCKReKCLUTPAEfIXtX9
	w+c1hVSEL6qz3/otYzvAhsU3HKdvR9Jj3/TNoxxWwqqW0xdlagbdID/bdtKcnzxuemoz/kZH6ce
	JZ0a9nZkhtTglXlmGLB/7mI3ZDnfDu2q3lobD2SrvgLa9MJ6c6EvmRb32pj7gF3k2Undq+R7JHk
	cIsMxGcmGUoJSynnzgMdHkKNEU8vJcPXWm198QxpxHZRh8l1XxYsdieujaUoJiM1ow==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e3eb247a8mr16833625f8f.8.1793096489354;
        Tue, 27 Oct 2026 03:21:29 -0700 (PDT)
Message-ID: <97a123f8-92e8-4ff8-bb3b-a48ad2fe1392@suse.com>
Date: Tue, 27 Oct 2026 11:21:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
 <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
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
In-Reply-To: <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793096489-1EA66757-B4882DFB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1064
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 10:39, Mykyta Poturai wrote:
> On 10/26/26 2:34 PM, Jan Beulich wrote:
>> On 26.10.2026 13:27, Mykyta Poturai wrote:
>>> This is preparatory work to make vPCI MSI-X functional on Arm. Split the
>>> vPCI MSI-X code so that intercepting the MSI-X table and PBA stays x86
>>> only,
>>
>> This likely is related to peculiarities of Arm's interrupt handling, yet
>> on the surface I can't see why not intercepting MSI-X table accesses
>> would be safe. Would it be possible to extend background here a little?
> 
> On Arm most of the work is done by the ITS, so the only thing the device
> needs to write to the doorbell register is the EventID. Interrupt
> translation is fully configured in the ITS; it will reject invalid
> EventIDs and also has a sideband DeviceID, so misconfigured devices
> cannot trigger each other's interrupts. Memory-wise everything is gated
> by the IOMMU, so a wrong doorbell address would not pose any risk either.

And a guest fiddling with the mask bits behind Xen's back isn't a problem
either?

Jan

