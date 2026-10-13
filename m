Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A5CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 07:52:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446708.1662805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXJ2-0000Qy-AO; Tue, 13 Oct 2026 07:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446708.1662805; Tue, 13 Oct 2026 07:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXJ2-0000Qr-6a; Tue, 13 Oct 2026 07:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1446708;
 Tue, 13 Oct 2026 07:52:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGXJ1-0000Ql-0E
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:52:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXIz-00H3gi-QA
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:52:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde322-2eae-0a2a0a5409dd-0a2a4509adc6-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:52:13 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde32d-be1a-0a2a45090019-d155802be491-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:52:13 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so21528735e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 00:52:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19f249692sm275398095e9.3.2026.10.13.00.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 00:52:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1791877933; x=1792482733; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gI9OG+0/oduLbqJDOQ/NiHLm3Z/shBvQAtSvRPnL9c=;
        b=T2bW8+d5JGlJlM1FkXVYwvKI7IPaNM3iwS2Xefru0gNYxeTFeaV2k4J6nPcmsQ4dAt
         y06yBtsn1rMOYrVv9cKf/lxLO7qZVNVuE7O8ugkTyFeBEOKUmuZntSCJ1Jm6CpS48/8e
         fc4eR7tiAIc9xcu0uM6e9Ld7Wb45y8wjMI3bLWcEFQmit6Gqw8gbbJpvclKlwrKJMl81
         KaqUSpoiiHw+VmikEz+tRz8xe31H36qkxk1Sxu4bzu+rzmDq+wu4Cdz1i8LZXAJDS8mL
         pBpRJKYtMUUFu7h9N+HWEX2+YmJPHjTmTBbiaKjlAAX838IXUl8WbPuMuWMzdoGeo+Lq
         ic2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877933; x=1792482733;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gI9OG+0/oduLbqJDOQ/NiHLm3Z/shBvQAtSvRPnL9c=;
        b=vfxskmBGn8d3z7nza686kLcp4RFQOFlDkoamyctCuaEpZd/V4DWYVQWh7XbsXAEjxI
         FvT545a1PVbu1mKHyhUDFLpGqxPQxe+yc+BXpktBeJFqj9QzLyQceofIHd5tN2X1k67S
         fJqLvgTfAObx2kxegR3h0Ww3QKKmqtd8ylv/wqMcutMRavwGFb4ee2Iybi8grHYYCq4G
         zacxkJh5BWsWWK/cf/eXFz1aYgesNAiv/ejA3mhpHXgI9MBbTmhmEdmJO+1kQ3u84nMs
         Yrc0F6uN4xWX/ofcGSXM2TntuZBMBXFm9MrzeRB/ENjIOoYzLUDsALJmhFxk2Mje3Op5
         jxaQ==
X-Forwarded-Encrypted: i=1; AKwUvByDZJli4Pgv7w7Clg0h7dKxR+oFwsvAH7N6kwATgK9MnoykzdbiGi3BQ7QQupYi72+KJeNaGjdSI9M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIw7zg1Mvh+ArWby7zdbiMEHUmZPtVZEXj7ASm6/ILk6jJxkpKb
	B3Ykj5+wOzgPJD+WOP49rgJZnf9iLLEkgX8LWsGumrQMkFCsi0FyIMGY2PzqG6uqUw==
X-Gm-Gg: AYBFou1/j7gSfQ4P0LPyEP+s947IMmSIQYIWw/5BYZtcOH8FM1edWmmDZTMZVBj1ef/
	ESbCR6sJSULdBOGKwb6ayNaDwsbXa5ig7XxTtlY+9phTkpWmfKBUTj25mwT+UP0XInaemZUi+6h
	WtKB8OIgLzQvtQYCfvvUDSJoDsuVK0gIgiAnYiemeH/V1Ha3fEiMA8h+cIeUn2xbNOAkh0nOX19
	vBeCspXRodL64ASScjMfTlNfyt9uSTRarAwkhl+DFx/vjdfqn8B1wc4XUGRLJ24yS7KGPANpSWs
	bhW2OpVGhdZnb5R1XU+Uf8R6cOuPdPcoD15kUGou8Kk04iixO205VCBrDAeyOvTxs2SnBK2Eaxx
	y6eRWRgpKEG6/k4Uzc/+0giDbpeFDmawEEMooGdA/xGV0ScTxlMMSc1j365iRRQn5zsZ7qp+3wr
	zNavSOHP2v0wbJfYROfT0rZOkJRYWsUBcy6hTXqkA2diZX4m8VeWOQClgWidbv2pb51Fsn1Ph4N
	cHSLT/UcHkPtrZ37sWuG/540VvDsSsgEzWcVfpviuXo+1HWU40S7m0hGwq+Y7HH0rDGewxsDw==
X-Received: by 2002:a05:600c:3f0c:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a18e47a844mr242392065e9.9.1791877933077;
        Tue, 13 Oct 2026 00:52:13 -0700 (PDT)
Message-ID: <d10c7b4a-bd83-4a18-810f-50fab37ab841@suse.com>
Date: Tue, 13 Oct 2026 09:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791877933-BD0CD034-B2FCA56B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1025

On 12.10.2026 22:49, Dmytro Prokopchuk1 wrote:
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh

You neatly use dashes in the new file's name here. Is there a reason ...

> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +# Hide every xen-syms linking pass except LAST_LINKING_PASS.
> +# The pass list is the foreach in xen/scripts/Makefile.link.
> +
> +set -e
> +
> +cd "$(dirname "$0")"
> +arch=$(echo "${XEN_TARGET_ARCH}" | sed -e 's/x86.*/x86/' -e 's/arm.*/arm/')
> +last=$(sed -n 's/^LAST_LINKING_PASS *:= *\([0-9]\).*/\1/p' \
> +    "../../../xen/arch/${arch}/Makefile" | head -n 1)
> +passes=$(sed -n 's/.*foreach n,\([0-9 ]*\).*/\1/p' \
> +    ../../../xen/scripts/Makefile.link | head -n 1)
> +test -n "${last}"
> +test -n "${passes}"
> +hidden=$(printf '%s' "${passes}" | tr -d " ${last}")
> +
> +printf '%s\n' \
> +    "-file_tag+={xen_syms_tmp, \"^xen/\\\\.xen-syms\\\\.[${hidden}]\$\"}" \
> +    >xen_syms_passes.ecl

... underscores are used here?

Jan

