Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056060A260B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d/fiiJQH
Received: from list by lists.xenproject.org with outflank-mailman.1482097.1685968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp59-0004qz-6a; Tue, 10 Nov 2026 16:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482097.1685968; Tue, 10 Nov 2026 16:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp59-0004qs-3q; Tue, 10 Nov 2026 16:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1482097;
 Tue, 10 Nov 2026 16:52:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQp57-0004pd-Nu
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQp56-00FNAx-Pa
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:52:24 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34bb7-8faa-0a2a0a5109dd-0a2a450b929a-44
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:52:24 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34bc8-b7e8-0a2a450b0019-d155dd35e0e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:52:24 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1175414f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:52:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284cce7sm6177531f8f.8.2026.11.10.08.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:52:23 -0800 (PST)
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
        d=suse.com; s=google; t=1794329544; x=1794934344; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/aqKJ8LuCV2Ec9sFVzM6cj0Bh5wtJypNuaHvhGUOEs=;
        b=d/fiiJQHTFcBEfIetpGXRpS48yC1/p+mt6V9SQow3TEPgE/ogzFGgctihrTdX8yZqp
         LCPi1Iu3K49vPZRHsLX31oc+I/Ravgvd6p/mi/crW8Vyrjo8NiOUJFeFkrP6uN8L09nQ
         MfM/Y4EiYtY169UV1w0dk5XhfMAr7VtlFBBFpUop8xTFuJo68AT5bI3DltE3wwCv14ew
         krnSmMmxszolg4qF0cpzsqoJ4c6ExRqPRHU+DihBS9yCfN4nwAJCref0FjlZ/Ybju+qL
         lCuJzAhIyp87m/SU3aQXfI9FHs29syDRrQW81DbL0iT90WB1CLRVxmmFjwO2LAgI7dIh
         R6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329544; x=1794934344;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/aqKJ8LuCV2Ec9sFVzM6cj0Bh5wtJypNuaHvhGUOEs=;
        b=X/iR7Uc4iYiidY38t+4u2nk83B/AjN+bjY3sHvRChJRNMTyqsnOB5k/TVhkedD16JP
         TqMXkHodgW6OnasZFZPFM6HaURWEC6d+Ta4ZDLxXD73QPArxogbVSW58QHhwYpUy1vQw
         k1W+AlK/DUhEhGFd+l19w8TSMmH2gNGYPLLhDm1ox5IZfpjsOH/IywqpKQWaI0RtdrLl
         nCaYBr9/vSrEiv2g6KnAuH1mv2iWPBIlN4exnWq2qjALGPXWrA6K+JvsF7YWBGH0IynJ
         Vb8K3l1F7S3rTEqEGj2mz9oIJBcERU/rKzpufqryEC0eZnBQo70vIJS8mLmcVq7MlQPT
         ZdhA==
X-Forwarded-Encrypted: i=1; AL+hErE5TUoMvoovBWUPtSFs1vlwtPxeS21ZyuLoNn5LGdiPORj02chhhD+26JASSICQ4zivoh3MoUqJkhU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+RltXAcv1e38x1C/K5EB+NRrtXHwQdWlSZTO5bgGjebVlYxRfh
	3rEpWLlpHtvYIFGLW5of7UJ5w/7RzZt9PKe16RpBgFmbXkFQ2g22/RIBl5OMzUSbHA==
X-Gm-Gg: AYBFou0/aOMJlJPPLt8tbWGYoJEu/P1nZoqkfXyiCp6Y1TntUhE/nmaUy7PCKcLx1nk
	dnC2DNl6trhMs155krGLoOJ04kD7Qc22JtEI7Ptq6Ki34W3bSeYoPO/xFFBfO9xMtmUnBQAmfQ9
	glNONghvJUeOXrDqoRx4697Eyl3F3OewLLmPW/jfO0dZhqVPj5xiO+t/pGMecIkbU4KUYUjF6wC
	cJwSupFqvKooIHMApg24ch9M11YdK++pZzbVH5qXvOwd2eLb6BXVXc4CG1MvguVf1Gq4pXXvG1+
	rxQiVvFRAK5wTRjS9GuALnfoyguXfaqjrKh+/dOafS68HEvEhJhvTVfSoOI6B+DT9VM/ykzQr06
	mOlXVX7JLZQDOE+MieGomUHM5sv8bEMMwz6KHVlkG/I/vyp26c/RCU4c10s79FXi/x+A/ledGcM
	Bd+fZZ/msu2azVD+MUIU+49WLM1yfUz2OHr58txDv5jeAOpeKbP6Ngp6hFLIwGgJaSO/X1XNLmi
	wtXKxqhO77CoSE9RiEEVngRZBR+GIXIwtivddrMY2x1/z4rmXfRVVXWFY01ZszroFJm7eTFsCnv
	9cJXLbACprnmAGBfwHqtmmaen8R7XBwtNef88/peLpK3Tr1ghPN9U5MZ4IF8hgZs3CwNtS0XP6a
	OGi/vVfz0myhLQar8Tg==
X-Received: by 2002:a5d:59c9:0:b0:493:edc3:6659 with SMTP id ffacd0b85a97d-49830b97a30mr6107150f8f.49.1794329543898;
        Tue, 10 Nov 2026 08:52:23 -0800 (PST)
Message-ID: <d0092b05-4bcb-4cf5-a3fa-11b2b54ec1b1@suse.com>
Date: Tue, 10 Nov 2026 17:52:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the
 hypervisor's XLEN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <198c5d8b140fb156b914eae007582ec3b0e83cba.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <198c5d8b140fb156b914eae007582ec3b0e83cba.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794329544-1B4D39EA-FCD5103E/10/78276251493
X-purgate-type: spam
X-purgate-size: 1549
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.09.2026 18:23, Oleksii Kurochko wrote:
> htinst reports a pseudoinstruction when a guest page fault is taken on an
> implicit memory access done for VS-stage address translation. Four such
> values are defined, differing in the access type (read or write) and in the
> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
> 
> That width is the width of a VS-stage PTE, i.e. it follows the guest's
> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
> to do with the XLEN Xen itself is built for. Yet only one pair is defined,
> selected by Xen's XLEN and named as if it were the only one, so the 4-byte
> forms, which a guest running with VSXL=32 and Sv32 in vsatp produces, can't
> be named at all on RV64.
> 
> Define all four values unconditionally instead, named after the access width
> they encode rather than after the build's XLEN.
> 
> Dropping the ladder loses no build-time coverage: a build for an XLEN other

Nit: "latter" (no matter that some Americans may pronounce it like "ladder")

> than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
> asm/config.h, so no replacement #error is needed here. Adding one keyed on
> CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
> patch removes.
> 
> This diverges from the imported version of riscv_encoding.h.
> 
> No functional change: the values have no user.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


