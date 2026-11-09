Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965C606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KvefuuVt
Received: from list by lists.xenproject.org with outflank-mailman.1480082.1684026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPFA-0005Er-9G; Mon, 09 Nov 2026 13:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480082.1684026; Mon, 09 Nov 2026 13:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPFA-0005Ek-5n; Mon, 09 Nov 2026 13:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1480082;
 Mon, 09 Nov 2026 13:17:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPF8-0005EF-W5
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPF8-00EjSF-99
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:17:02 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c7c8-8faa-0a2a0a5109dd-0a2a450692a4-28
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:17:02 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c7ce-195a-0a2a45060019-d155dd2dbc7a-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:17:02 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4922dbcee23so436683f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:17:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-495b90701c7sm12346989f8f.10.2026.11.09.05.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:17:01 -0800 (PST)
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
        d=suse.com; s=google; t=1794230222; x=1794835022; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieHRxlDlyFdh38OSj+4230Tq/jvsP+VKfp8Ury5pRHk=;
        b=KvefuuVtb/3lB6y5jYVV1B2oFmDBFvTlyjnXBSKMk/GYoY1YTMFsVg/hxTYmZQSQHU
         DPJ0Tz96I8lr2xLLRkxch/GtfgtmkV2sTfyILmDKfXj0B6tIlGdvmPgfvt4AQ4Ezi8sa
         s9ccxyhg4AJv5rbmy44Cn20mBAU+UkcRp+q7R5PW0UU4ks14dGfnNUDy8BxBM1fV6yrl
         jSMBc7Qp3hAEU8NYd+Dqc83aHC5LoAS27dOnFicEFEVV2/nZgLdt/P82MCO5HQ04hA49
         R+wKMh8ij5EkH+GGBXpcbjfNpGL1l1OOcAOBzYArj9LG/Ji0+ewCV0GTVPnJ0T8zug+u
         dL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230222; x=1794835022;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieHRxlDlyFdh38OSj+4230Tq/jvsP+VKfp8Ury5pRHk=;
        b=0JQYa43FZQucliKJP8e+JTd57VAg9wBu48sWqXyODszRbcMv8xY/s/QwCuE8FRXnoR
         TIIU2tiuGAOStIRbuqfnofOVDIOBJZQd4SVnV5mealeiZRMoSJjOQqwp7oes187zqcfx
         Rg6f4wC9Mu3iyePsQMJBP39g/NeW117MQSfFlQ5Lv6wYc0jJg2xB0VBoG9HFn95uw/4X
         p+A/tGCFMKNOnXpeY3iRONPrMJeXOLw/CNDsgr2YQKyr8klgCaGJOiYAo4wO7q4v76Ga
         5yEeC/bulqawnShHUXowiVboRkpfGiCDs3PJe3WFS8clYCAsmtWEBE5oM3uTebQzOMgD
         hH6Q==
X-Forwarded-Encrypted: i=1; AL+hErGWyUOxVX4Gq5yg9t1g0mcSrSWvYAjRQ+xjXxttvZ1JeHmfTKU81EKxt6thbYow2tSvEWq5a++Acy4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9tzI/wA/R3JNzeckAPCLsPhRdfneB83j7R2J82PDJGxVnoyHhY
	ytTXMXT0Z9upYqeXxGOgn06c4h2IDC0ChX6w4UMOiIUBKSdLfWmTLhMsneYwZTxx3A==
X-Gm-Gg: AYBFou3YHCan3Elkt5sCYfSY6QQbiKbZKPPoJKHgd0R9AzwAALxIF+gpUmiBUrae8Mz
	gQQ/lCNM9xlcckRn8I8Pcp3xu3c7T6nSWnHQloP0eSjRonR3vwJVUvokkS0O5NMNlcr/DXCWJMj
	Icp/ZL9zTocGe6U16jG5EPMWuRDb7M/Wqs4B2sgY3L2sxwaGjzud7fZ6vtj0wRAVUwCe1CnQGA1
	5EQkhU52RMtAuxdgNMnWE7LCyYvGSBIHEe17JUrIQQGGCEXyRnidIW1LW02Vj1KQem4/rK8lDjJ
	oXuQznzPVQNpfHHTodhFw8+ve5Qq6ZwsAGfM+hn0YrtNcbC0g9r7mEb6dcnvsZhtql+dg1Yz2L0
	hRC3VLdUNiMlfY0GXdPR+wiHnPt48+FfFdsIg0rFroGvhC1abc3Cfoo5gX8tAR1GLLnZUoCsw+v
	UYCRrMkd7SA0liOogZkIWlN6ybsaysRKPWj8vuZqjlQkOqg7wYASbUZNdSdTxKOT0S2HilfyKQE
	52yOpWuRr+imzbWxSo8ADDjyG10Q13RQAd1a+s146Xql3OndunSTnIvRpKFfTUutUS8EXkjZlLg
	n8pDhctzi2l9niUs6lrgUK6RrMDXDbqg5MoEYgtVSyxwSvD+fShcl5zHgs842mRTmRwA8Y2KEE7
	Q+koxestB7s8e+zvH
X-Received: by 2002:a05:6000:1884:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-49583b0a5bcmr8109512f8f.37.1794230221617;
        Mon, 09 Nov 2026 05:17:01 -0800 (PST)
Message-ID: <893e0793-22a2-471d-a1f3-c20bab97cfd7@suse.com>
Date: Mon, 9 Nov 2026 14:16:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/riscv: fix the base ISA checks in
 riscv_isa_parse_string()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
 <20261109124937.78186-2-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261109124937.78186-2-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794230222-FDC0F77B-6D97AD56/10/78276251493
X-purgate-type: spam
X-purgate-size: 697
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 13:49, Oleksii Kurochko wrote:
> riscv_isa_parse_string() is meant to reject a riscv,isa string which
> doesn't start with "rv32" or "rv64" (depending on Xen's bitness), but
> the checks are written with && instead of ||, so a string is rejected
> only when both characters of a pair are wrong. As a result, e.g.
> "xv64i" or "rv62i" is accepted on RV64. Also, for a string as short as
> "rv", isa[3] is read past the terminating NUL.
> 
> Use || so that each character is checked.
> 
> Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


