Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F445C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 12:32:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371663.1619145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKV9-0007Gb-SN; Mon, 27 Jul 2026 12:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371663.1619145; Mon, 27 Jul 2026 12:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKV9-0007GU-Op; Mon, 27 Jul 2026 12:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1371663;
 Mon, 27 Jul 2026 12:32:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woKV7-0007GO-Tl
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:32:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woKV6-00BdIA-Mg
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:32:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674fbd-bab6-0a2a0a5309dd-0a2a4507e916-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:32:08 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674fc2-b4ea-0a2a45070019-d1558036bccc-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:32:03 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so18401105e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 05:32:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm317860385e9.3.2026.07.27.05.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 05:32:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1785155522; x=1785760322; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOBLruOjWVa15LATPjQeGrS7AXROMCpYrldYgMQZ5PI=;
        b=cPfiSj15pGjvjUfYMIyd6gumN6X5IdRhpwhS9son0VWL8gyJYXn93BtF7k4tnBi9MQ
         Mp0zPbd6ikceU0qAtpfsyOnjugd0RYPkEAq+kPR+NggcGdfnJERXzYzkAuKfH5bagWo+
         sFf4iZoXeKuT+/XNJMjtP4T3VrQHCSKpNvWBRVoRMYhoZ+1y5u1GVPxiU8PnF4us77Dm
         mDeNVMvtUoDo5czT1PNUBPIvNKokM2UJ4EsCu71E1oFj/aySiFM71ChXhWeiZC9YKup5
         PhqSAiwLFN8R6qxWZtqqO8hzNo5X2j2Rh3Nd7Aau/iPBirl6nMA8sz1/ARPSP5w6rBSL
         C4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155522; x=1785760322;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOBLruOjWVa15LATPjQeGrS7AXROMCpYrldYgMQZ5PI=;
        b=B6+/MDRd7l6fC4V2o9Vv52QRUbLy5HjEUMUzxI3TO28qsxNeoYQCTtqCyF4HzMYKrC
         COLevzCF01QBkXgk1yaDJuJjz41gRcRquH4LJ9Dw855jkpa0DDeWlhtPymA4bG7XxNoN
         kSHKYppJKKdrxS3yfeagSHAgCDUq7neRi6rAvfcnAMdlNHzQlg7yW4MWDax2wH8Iq9NZ
         Bc11tlzOM81+skbBxvk2jCvZYQ+0MsHRIjrgdIa5QBdJQM03xecL0iL1OM0GCJexoen7
         voOJY4Ir1c+1qNeGpTJglwzmXtja41wV1Q2W5sz7P3gsxzboS09A+NSWJ6ksZbjtBFoz
         49wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqsm6evxrYpj+CO47CJYIEjofXOH23AcHZlqJsMZArYIq4VxJZwXpDfebeEZr68ytJgg8sSn8Ck8Fc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyprTuS7UIMb9kvbTUbOvXlWrGavkz4/Fhrmx/H99MDAsL2x694
	wOum3CK5WVy6JQsrlVhjCIZkDnxjepzrwvjkdc+e/FvBX4jfNfe1TsxewkCnaKkIHQ==
X-Gm-Gg: AR+sD107vU33hl2Rp12jiCal0CYg6QnNsikHGeYa5MCoVEMLaFFQgr8pEI5GSu6ZqrN
	VpGIdKZ0YZS2UalfQCPicjdqJbnd3Hp15DqBYajhCR+g9f+krLdg49lt55TkH4zTYU6RezG+W60
	9W0X+/sXHb6Mq2DpS0iTqag2IAK/0TW0z3j3ihNReJ4Pf7HSTdcKGhHJMg1ph0hB6pTkaUo5Xmr
	wBqBFpTnXcaJDnOcJ9I72qHsPcka8zoqt/CWwv3Vd5V1XRIi5ZZ50gdZTthKIwaAlUu9IlcHQE3
	iWYdgEQ62FK53/oiYWvpmqAEVcPa8aTC7pMyB9nXAtHt6whDAhZZOQ81Jqu7+UXHSvBNVL8irHS
	YVG26Mu7JZmMg/fWeTm3ctykAmr3DuS8H47m2DiW5DtuQOepfnuMca25roy4TwLvJa5INv7bAHE
	UNqWRXCxb/TSTnYZgw5+nP4fFbRlbH0HxPpVnp5MrBC3wYkEh60FGEquvSa/4EX/ve7mAxk+0rk
	6rk
X-Received: by 2002:a05:600c:190b:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-496b570dbb0mr104579715e9.20.1785155522528;
        Mon, 27 Jul 2026 05:32:02 -0700 (PDT)
Message-ID: <8f8d902a-b464-4e18-bec4-90b45edae4c8@suse.com>
Date: Mon, 27 Jul 2026 14:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] vpci: allow queueing of mapping operations
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-9-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-9-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785155523-A5EC6AE4-D19ED8F7/0/0
X-purgate-type: clean
X-purgate-size: 952

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> +static struct map_task *alloc_map_task(const struct pci_dev *pdev, bool map,
> +                                       bool rom_only)
> +{
> +    struct map_task *task;
> +    unsigned int i;
> +
> +    task = xvzalloc(struct map_task);
> +    if ( !task )
> +        return NULL;

Just one remark here, as generally I'm trying to stay away from this: From what
Stefano said on earlier occasions (more generally, and not on any vPCI-specific
thread) new runtime allocations want avoiding for the purposes that you have.
How come such a crucial one, required for correct operation at potentially any
point in time, is then deemed acceptable? Even more so as, from the description,
only single items will be queued right now anyway, i.e. this apparently being a
step towards worse overall behavior? This aspect imo needs explicitly discussing
and justifying in the description.

Jan

