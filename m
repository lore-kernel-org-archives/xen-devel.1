Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2265CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:01:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446866.1662972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZJx-0002Yp-AG; Tue, 13 Oct 2026 10:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446866.1662972; Tue, 13 Oct 2026 10:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZJx-0002Yi-6s; Tue, 13 Oct 2026 10:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1446866;
 Tue, 13 Oct 2026 10:01:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZJw-0002Yb-LR
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:01:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZJv-007MuN-Uo
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:01:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0169-2eae-0a2a0a5409dd-0a2a4508e124-32
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:01:19 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace016f-f659-0a2a45080019-d1558031f16f-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:01:19 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso31703265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:01:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a198c80cb3sm167750445e9.3.2026.10.13.03.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:01:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1791885679; x=1792490479; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIv2XFtlpp6kdQOhPGZBJOWTybPv3CvTi9JYIWsAtpg=;
        b=Ibj0Tv2/beFBDNJiJ/9+Bohcgiav8+VbIib5cVbHV7Bo04MAhaunpH6RpVFTL3RzBs
         p63gNAaK36mBa6M7fLuCRSyS2rV9QdO44uVJ5Kqfi5nE1bA9+dDYwTl63xpY6fNsEsfo
         PbTLIgZU3U/gM3ySzCHz9DdjXfO5C75rf1LXX0DyhaP6B0ujG2DUWmXh7zglap0FYVyz
         kQa/00AB2t56kkjHXO6aP5Zyk0nUsN9ntxeqxPGOb6pqeDq6feXYzYzRMLuBHGTP4Rra
         MtBXHHf/x2FmDaVKFIi3vlBlnsuBsQoctwoqOUftUcOJdzech/VoYxK6Eiz3BjVDpizr
         ZWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885679; x=1792490479;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIv2XFtlpp6kdQOhPGZBJOWTybPv3CvTi9JYIWsAtpg=;
        b=x7iLBzuDMA++ZZDeKzRwCIhbierjOc6fMT4ZKccckc/noOGoN+gl7VwRX2ACGa8OZi
         NwjVRL5qY6xvLYJzeV1JhHknBfNQu3j4LLkJuJWVZq4EgGHWHCdKag7DStY3Fm7QxaJP
         CEMX8fLjwjC9DB0i/G/IW5evW7dg5iLYJA2uTIY9ZW2DYO6nfP5zqwe/UNyAKeyUiLM6
         5GUOquodIheTc543k6kKiyC6AQpDP4jV9ZfWSSK8hQvrW5sINUCt3ERrYELWVn1piPJg
         jqvQg/3SEGkU1vbETyh7xqRWSkGuUm/FsFZmKTzmIZBrCKbYyCOT7518NStNHoM9qeRO
         pbiA==
X-Forwarded-Encrypted: i=1; AKwUvBzW4gbipKIERn5RrPV1vIGhaXMTv4OclDemEEDxktOkeTLNznKW3UcTogFZZk7TLoMmnBQ47TsnRy0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ5bD/szsONKjX35QKG61W6RaZgmSOrs9n0r9pD4b69O/Jw7EAp
	o+vSBzPiSWSYI/bKFL9yKKoJ8MLwS5ywnlaPJb0w2i9JCvYvlOWRsAoHno1UkFHQTw==
X-Gm-Gg: AYBFou3l7euX8yzpL7wz13b0s0FOes7nicut/6V5UGfsWGH7/yr2UMQZuVNETiRhA9a
	PTZ0hcUz0NzsQ9mRoiKRvtFf2tQe2gfa5JxELqKy+F500EjvpjdzoJb1K2wHY1agLDeMkuimGGJ
	0z0Kv8zOwHW6EHz9+DpXtxbZgxpAN3w4iHKfPyW7iyzqv//+qJJXNqJptW4/xpj0CtTscSxvKOL
	398jhwF/qNx/ic5McUEraS+koVFBBvBqci3Rn2XS9ZbJ3Nw9xEK/8fuJtwAkW6gUqhcTKxsV8zJ
	86gqTBalWx70zt5ShEMO6WCuxKY6NmeV/VDVDAQILgJDCid09qADMI+y0IH3nKpq9GYIkZa8uGY
	RX5yj6IxO9qPskXQ68XGtjxWwdrTP2aloKFPL84BQQbbMMgC1RN09QTn4A/LxrN3LT/T5de6iMT
	2c0u2iNxtQmMwqHknPvcWLZQ7Sib8F2nLV0d+n5uWjH4uJjDiYetdQCg6KxK/H7+lBeHUk5zYgH
	BP4OEeu3btfQfIkrcDLy8719xle4SpSYkx4UNfkIqid7DyIJLeTiuDx1Nh4gg==
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a18e49886amr265964215e9.10.1791885679143;
        Tue, 13 Oct 2026 03:01:19 -0700 (PDT)
Message-ID: <775b1f5a-ec70-41e6-9926-2c817c0e0521@suse.com>
Date: Tue, 13 Oct 2026 12:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and
 N_CR3 during VMEXIT to L1
To: chunjie.zhu@citrix.com
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech,
 stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
 <a3e8db38ebb9cb6cfcf06c26e93522b3b95e7566.1791625578.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <a3e8db38ebb9cb6cfcf06c26e93522b3b95e7566.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791885679-D674387B-FC8A72E6/10/78276251493
X-purgate-type: spam
X-purgate-size: 588

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> As per the VMRUN pseudocode in APM Vol 3 3.38, the VMCB's NP_ENABLE and
> N_CR3 fields are not set during a VMEXIT so don't do this when updating
> VMCB(1-2). At the same time, cleanup the somewhat bogus and irrelevant
> comments. Not clearing N_CR3 does not introduce a security hole as
> stated since L1 can set it regardless and it is never used directly when
> running L2.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Where did Teddy's R-b go? 

