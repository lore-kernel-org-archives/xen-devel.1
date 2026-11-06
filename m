Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB87606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NOg8Eg3t
Received: from list by lists.xenproject.org with outflank-mailman.1476268.1682425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPDyc-0002Mc-VH; Fri, 06 Nov 2026 07:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476268.1682425; Fri, 06 Nov 2026 07:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPDyc-0002MV-RO; Fri, 06 Nov 2026 07:03:06 +0000
Received: by outflank-mailman (input) for mailman id 1476268;
 Fri, 06 Nov 2026 07:03:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPDyb-0002MP-W7
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 07:03:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPDya-00GKEv-DV
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:03:04 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aed7b99-8faa-0a2a0a5109dd-0a2a4503b4ec-46
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 08:03:04 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aed7ba7-fae8-0a2a45030019-d1558031cd69-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 08:03:04 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso3058185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:03:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e28cce1fsm41203345e9.15.2026.11.05.23.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 23:03:02 -0800 (PST)
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
        d=suse.com; s=google; t=1793948583; x=1794553383; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQ2ROWRTdO/pxyulQSAwumhYJ9F4gvlCfIGw8Dy5YSU=;
        b=NOg8Eg3t9n7oKn6yymbtNOrgU6cjDobpFOmZuMkabIceIPlAK1WrZDUFikvAXUHY4T
         owcCyyCCOHGQyLpqanEX379U2VwYlWudP3ve4TGKSsWCT+Vc19cePB6kZ8lhj8upq/DD
         Z9xidIt7JRn1dBT52lzy9QkeeKthefx3q6W9110ozGdNs+X94/0rr+sib5TTAZYGsKkO
         6eM/F+hOqp3vEeTgEJexIooryr1jTFM5GHWQGvPsn/XrHIg0+sWXvvHoFvlCTGloPR1T
         i+WHESMS+CEaiOgYFl6DcvYsVuA9EkHL+xBp24W5Qj8N30U7h2HT6wQWf8uyuQJvUigA
         JLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948583; x=1794553383;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQ2ROWRTdO/pxyulQSAwumhYJ9F4gvlCfIGw8Dy5YSU=;
        b=flRx+X2NHZ1Ge31icJnzKYnI1TU2D6BmAn6c2+TRUoX8GKV7AN4yJS5DOJ2wEUG176
         mSvGhZVa95rM4NgA9t0ryTt0ekK+e/ekkh2mYVG08IyNdgS9mF9PJXgRF98OufRjNJ38
         Ouyj/CqxAXtOU7HH3E2pCqf4/XEHqVMFPxJTZEl+kFnd55ov+bt0FI98Jk6j61q42nQo
         pxKcVXs8OlzyLwCev4sDYWSE029rOzG9f9UZNSKI802rhtMomwc6D16xU0Sxby4Kq5O2
         EsV47HB0BUDO+Y+gGjXVu/j6/Df89D+ZEPWtydnMHJ918qmG/3dOS4x3gXaducISnba3
         6XWA==
X-Forwarded-Encrypted: i=1; AKwUvBzXBsvFPvfS++0m1bnS0w5MgFTBZDQZbE7tCdPB1+n8A0z6xji2MUhKTcErwLcoditQf3H3UrdyhJE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z92AlMVw1MA2W9RQiiV/po2VrzzswgSGw2ZZ1UJCAjCEuBzuleT
	/xxambl/6ujfpVgQBTiZSOrpKR0yU6F0tAbGx7iGIkjr/FTCKGVMFifuHl0kYBXTpA==
X-Gm-Gg: AYBFou2uSUF8vNmLpwKrg93B7A6I0sYdHXkpfXPov5n2LO9935dYDgqYv+fKa0s154r
	K+RUVdZeJ4x47cnLxM3MhoWmegCieCUptd7a6J8fyYduyi7KtHQfpjywf5GpP3vUaf5Mi3sL+2I
	Se9f3703pxw1xL6kSSnWJnxkl5W6bvP4cjxYIkWAo0SS9rczhYimeRz/yvVP8PzZn6DYjQ/Lfce
	cR45pkMkvhn8aWZtyTLuxHJD2DFObgKivlhE6IqEycl+aPxiqHPsyqQ+VktdBfil05ijrQQMdER
	y6RMmyWyP6RC4cFz5r2W7ZGuf4MGprtwcHYaJqaugVOtl00mRIxJg/wNJihEPADisI1dvTYn8cz
	l/kaOrmwSIeMzACYRCItZq09WDJo45HgusyBLJH+ucNWg1AjZ5u4IcSPVab0uHB08Ve+whXiI/4
	MaFG/ucWcxTMlFsgRqDHlaH370FTO4O6Cj5Wkzo6ipMr7qLZ8OsUOukVdUrSJr93/ey3vgDVax3
	jO5Fe1UMPEOfjX1QDKkf6G0MJ8+mFPlRFUoaG6ghZemu7qXEthJ5MS5kPGINoWK7zFDrDr9tWV1
	n8qrW09/8ilP0xpa+XH+gPQFzIkIJDt9bAyASPj23/eI/wTwew0o4Bhlxkh8XVBE7Ua0sliejN+
	x0hyCEFv9QqB1H1E=
X-Received: by 2002:a05:600c:3b29:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4b6db4a5d89mr23798075e9.4.1793948583441;
        Thu, 05 Nov 2026 23:03:03 -0800 (PST)
Message-ID: <da90f205-a2ac-4e39-a359-79a3408c0d12@suse.com>
Date: Fri, 6 Nov 2026 08:03:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 26/28] docs: add coverage for svm_avic=
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-27-dmukhin@ford.com>
 <70db6d7a-5e48-4a39-8553-4718f7ccdf73@suse.com> <auzlbS6B2k0yJJOF@kraken>
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
In-Reply-To: <auzlbS6B2k0yJJOF@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793948584-6C8DD4E9-C6041596/10/78276251493
X-purgate-type: spam
X-purgate-size: 1627
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 21:22, dmukhin@ford.com wrote:
> On Thu, Nov 05, 2026 at 09:24:09AM +0100, Jan Beulich wrote:
>> On 05.11.2026 02:33, dmukhin@ford.com wrote:
>>> @@ -2673,6 +2673,27 @@ On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
>>>  `ibpb-alt=` option can be used to switch to the alternative mitigation for
>>>  Intel SA-00982.  Intel suggest that some workloads will benefit from this.
>>>  
>>> +### svm_avic (x86)
>>> +> `= true | false | nodoorbell`
>>> +
>>> +This option configures Advanced Virtual Interrupt Controller (AVIC), which
>>> +is an extension of AMD Secure Virtual Machine (SVM) to virtualize local APIC
>>> +for guest VM.
>>> +
>>> +This parameter is experimental and for expert configuration only.
>>> +
>>> +Xen has mitigatations for the following AVIC hardware flaws:
>>
>> Nit: mitigations
>>
>>> + * AMD Erratum 1235. A hardware flaw affecting certain AMD Family 17h and
>>> +   Hygon Family 18h processors where the CPU hardware reads a stale
>>> +   `IsRunning=1` bit during Interrupt Control Register (ICR) write emulation.
>>> +
>>> +Limitations:
>>> +
>>> + * AVIC in x2APIC mode is not supported.
>>> +
>>> + * AVIC in nested virtualization setup is not supported.
>>> +
>>>  ### sync_console
>>>  > `= <boolean>`
>>
>> This wants to be part of the patch where the option is introduced. New options
> 
> I introduced 'svm_avic=nodoorbell' later in the series, after 
> svm_avic= appears for the first time. So my thinking was to document
> all new options in one patch...

Please do this as (sub)options are being added.

Jan

