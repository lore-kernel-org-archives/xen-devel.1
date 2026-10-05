Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF6CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 15:11:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440951.1658489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDkLN-0001EH-0R; Mon, 05 Oct 2026 15:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440951.1658489; Mon, 05 Oct 2026 15:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDkLM-0001EA-Ti; Mon, 05 Oct 2026 15:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1440951;
 Mon, 05 Oct 2026 15:11:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDkLL-0001E4-HR
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:11:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDkLK-00CvyS-8B
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 17:11:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3be0a-2eae-0a2a0a5409dd-0a2a450793e0-0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:11:06 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3be0a-b4ea-0a2a45070019-4a7de18dd294-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:11:06 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so12216035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 08:11:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62270739sm4294765f8f.11.2026.10.05.08.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 08:11:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1791213065; x=1791817865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNMYef8VKjw2gIAPgxNBQ5UA4NVBwCa0myjmxKu3q/E=;
        b=N+5pVJSQecCZDzSHl3eycH7tQG6Qr7SLyweArg/pQsrPA7vz5A18ncNtlgcRIK1w04
         re2nIBj6Cdrk9IgibUVdnEtTPSC+gPIaF8IDaxutQoVrZpYkraylcTGDEL0pXDmeiObJ
         GMMxiZn0buMSb/C+Z5Nsg2smFwhyghf7PWMujCJ8EI044sZf9A+P3KZiTQh5WXlAOaQ2
         3JOmUuWpDXKfuuxlslyRRWmvlzocNCqMQJVLbFBWHQd+PdgW9B/aCiT0stsgC3nThCCW
         70h+F2nOA1CN00y/mCRYCbbkLW5mavVuvvv5JFQ1GZuBuX9EAitVLQUOyPPjnPt4dj/E
         ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213065; x=1791817865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNMYef8VKjw2gIAPgxNBQ5UA4NVBwCa0myjmxKu3q/E=;
        b=1CuSe/KwZ5E+JIpZo/XO2fQ3Fi2fvEYtmf9aqcaZOilKCyIJJyk1pwnBhSoes5edY7
         OtYgkJYuVuUC6LUOGWI/F3Iez7X1fulqK56ss14ZcMFYg3HgZtl63McnhQw5go1p5clb
         lfTecLPttcLmQTA4biXlD6yrGNDiH6or8w7jgA8PdYH2sYZQCAo+PtmwKfh2uOe4vUF3
         YDlUY7XHyHeay+FJiTCKxi5pjfLnCIsrj4WE7GsgbyqNVOMCRAP82X9UyhOGw1KadGe4
         nEnNEDzA5Rqk0PAIAyKb6hivyQKPJp7V2rRzDRAYJKYGaj4Fr0JmnHvshIvOxZ7jg4JA
         7JcQ==
X-Forwarded-Encrypted: i=1; AKwUvByQokiabW2H9gTDdOE4cTo8oEYwjBJFvfUUtIrNSu9PJRDS2p4QXweoK2kSlu33bWSANGTbqzr/cOM=@lists.xenproject.org
X-Gm-Message-State: AFuF++n4K5jwefxNicwQ2rBfF0Tbevgaawrvh+XXanLOOtnrSnLOpNEu
	270jepQdLzxEKAaApU+BVbi1hZfnrpxAeY2sFzE5xZMTf53xy1q1FNFgdZT20198DA==
X-Gm-Gg: AYBFou3IqgNRk917hwtU73UBCWfin5H3vFGj+DV1EFcpvhx6MNhrQbME9VjNn67e+jX
	TqD6u6Vm8Q0ncO8DFfD/K+vlPXA0X8rWdwc285fqNI2QNN9xI2bIYI+2dMXKUULHyOSnKWkMi2y
	TsM8Ld28f8QO7tAjSjMFH99T8XkSNC18DmyV5o/8ls4pCSXISzctfAt3o9zcUk5AfFSs3TH2hHT
	mO948AOyo4Lwi7LV2bG2N2fWqGLyMhbcyqutnjUDJHds4ovFfjE+Heav1mxrsxeBa/fIbU9vlgb
	5LbLOY4nuj+zehSYwYUHtCN0WpfzvmnkQjggIUmdSnmi1xFIStC8ZLCuHFW16jn2OrA7FG/0Li3
	ej1mFXM/Uquj5ZmeD5hiTwkhRE2yvVFSQdCmBeIzGy5NHb/kqOUtB6xmpCNtUgQwOYzJcbc4X4H
	tSgRPdLPAr7Bd972O6PWwCyuqvQHxQnjEWb7mge5tqqhmgwqp451i22+103dXI0ZZzb/cumwOAc
	1O1DS67vvzWUbyhnhknNQz5X0vF/8ZgcNd0wKu9RVogUrMsRA==
X-Received: by 2002:a05:600d:6444:20b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a1773def4cmr12153435e9.2.1791213065240;
        Mon, 05 Oct 2026 08:11:05 -0700 (PDT)
Message-ID: <5058c588-662b-4435-b205-52ee3ab01ab8@suse.com>
Date: Mon, 5 Oct 2026 17:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shim: Report -ENOSYS instead of -EOPNOTSUPP
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1791211375.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@vates.tech>
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
In-Reply-To: <1791211375.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791213066-A76D2AE4-5024137B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1143

On 05.10.2026 16:41, Teddy Astie wrote:
> Main Xen reported -ENOSYS if the operation is not implemented, however,
> shim errorneously reported it as -EOPNOTSUPP, potentially confusing the
> guest.

I question "erroneously". -ENOSYS has, according to my understanding, exactly
one valid use case: A top-level hypercall (normally: syscall) function which
is not implemented. Unknown sub-ops etc shouldn't be using that error
indicator, or else callers can't tell one from the other.

That said, it may still be legitimate to make the change here, as making the
change in do_grant_table_op() and do_event_channel_op() can be viewed as an
ABI change, which then we cannot easily do.

> Make shim more consistent with Xen by reporting -ENOSYS instead.
> 
> Fixes: 49f79fe03dfe ("xen/pvshim: add grant table operations")
> Fixes: 368ae9a05fee ("xen/pvshim: forward evtchn ops between L0 Xen and L2 DomU")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reported-by for yourself is pretty unusual, btw.

Jan

