Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ADFC982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:37:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429980.1652613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JPM-0000Ru-BU; Wed, 23 Sep 2026 09:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429980.1652613; Wed, 23 Sep 2026 09:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JPM-0000Rn-8a; Wed, 23 Sep 2026 09:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1429980;
 Wed, 23 Sep 2026 09:36:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9JPK-0000Rh-Pw
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:36:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JPJ-008UsM-DU
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:36:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab39da9-e002-0a2a0a5209dd-0a2a4506cac4-36
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:36:53 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab39db5-195a-0a2a45060019-4a7de18dd912-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:36:53 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso4635865e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:36:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1e045dsm67733715e9.11.2026.09.23.02.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 02:36:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1790156213; x=1790761013; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ClC/J8zDPk6EbOykFfOvPn+lLyj+URpAEetR1UoEGk=;
        b=IgcMCycNUeSw1RT7loJhyLopoGtcBb/dZUS2k3EM/TKQ+4MdeuXbDL0QRvjpdA5UWg
         GBWEN8TpxrrUbNYQrajTfHqtSWFTygZ2bFty5Hs0ghQVKlx33X5+86YiMeGkp7ExIT3M
         wEv5z+eGTKSzE0D1Wpb5IdDgoIZQLoVvmL7yCZZmifGzbtt37kP4qfv0hCpxUSuEgaJe
         7v4/aHPZs19FfoJAPL6yddSLy/Mxnkkh+lCRQneS2BUA+2qTgnDES/PsgtrWOTzMtj2t
         blMTd3MZB4BWPbxFRELrFeX9/Kjqle3WzYrkZ2aVK+QHoHkJ+GifvYDvyrwMgep/uMgU
         ErLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156213; x=1790761013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ClC/J8zDPk6EbOykFfOvPn+lLyj+URpAEetR1UoEGk=;
        b=xf7wfOQVeS5/rK4mOB4He2JljTzr4sdvihnUrdpFQ2DY2i4tUBR/+y4A310kbltttb
         EwdCQiQfbtGMGALZUDrNd5JHkGWCYAqkNzrSmkbM9VZyNhygonEMlgK/ruDt4j2cYzZP
         9SUKAw7EVyDflpH4sIjxsRuyP1WHtC0i12+eyFfp+WTKAd7epznyU3wg7qczS5GzS8fm
         im05APR/eaCR8OiK1+06LkSlcPl4rFdTIWYHibKT0oDFtRztIq8vZt+tvEHU1YDmkXms
         XSAxmGhpQuYisjB3PWdXtdZq9QstSfpGVSk/ND8En3wBfQTklhM75/43pI1s/nMTCY3W
         PWsA==
X-Forwarded-Encrypted: i=1; AKwUvBxsGQi25DnpvKdPmxfVjySeJQzS4F0KT0VHfy3m4FAgTuv3TT1J9FHlTWe/+Atmg/wWySG+UOMAsjY=@lists.xenproject.org
X-Gm-Message-State: AFuF++mc5oBgVncnHj+mOcx62ELLEmd/aW5YmVB64GJuii67T0eBLoMa
	aTOgvyFOVpLQMWHYU9iGphlOQ8ykT7Q51SbEo6Hg4PJCNyklge1KBCsHvQ5adK+5qA==
X-Gm-Gg: AYBFou1LD8z9z1moRGWy/HmRvAkGFSrrBxW0CalvFm/FOTt+L6X2bgOlh4MTWJzddUi
	mWYPL5b/ympyoL1bRL0pntCkQ3W7cFSQsZMk0pO6Ut/0JEc3AuIvL5+uhZVDws7f8l2CNz+qqV/
	vuuLXtNedIVXkP64hJPhfrc5aoYJT9i4pA40uxBJUY7+fk2Sc84z/F1nQUMMTK0YhE/UHBlcqb8
	JGC35vTobtMu1mqA8edevRu2hMnswMvCYA01l36xbd3K5E7gVDumL66vSmpRwUoCXf6oXsnbfu+
	44hwAjslgbwKk5JkJrhm0EZbT9f7MFJU9OyIogMnlaqGIMJbzNKmaNb1E1kmKIUBY48sx1Q5G3z
	N7P+YGe5N4UF+DFjAjPKu3u0h5bJOlTFb5ivkK6UHUcOHOxkSO+767sPQPNE4sKqCDxRLufXKU0
	LtUBUk+VDXX+3oD1Gur5PmdaXDHPdRAafOZakEnRb98AGD3kd0e9Ohm5YNngM46YOybo5rSD5xs
	iAuX0trxLdh5185tC4X+Ba9jmkS0eqOdJ/XrV4CY2/wwLP9fJyrA0cKTvf3Qkc=
X-Received: by 2002:a05:600c:314f:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fdee0a0d0mr25809755e9.5.1790156212674;
        Wed, 23 Sep 2026 02:36:52 -0700 (PDT)
Message-ID: <bc5eac3c-b540-4fa4-b890-0eee106736a4@suse.com>
Date: Wed, 23 Sep 2026 11:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] x86/nestedsvm: rework nested VMRUN/VMEXIT handling
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790156213-F76C877B-EB49604B/0/0
X-purgate-type: clean
X-purgate-size: 1236

On 23.09.2026 11:20, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> This series simplifies nested SVM execution by removing pending and
> deferred state from the VMRUN and VMEXIT paths.  Nested transitions are
> handled directly by rearranging the state transfer and control flow.
> 
> The series also removes obsolete interrupt-window and vCPU-switch handling
> associated with `nv_vmentry_pending`, while updating the relevant assembly
> offsets and nested-SVM data structures.
> 
> Patch 1 rearranges VMRUN handling without pending or deferred flags.
> Patch 2 removes code related to `nv_vmentry_pending`.
> Patch 3 rearranges VMEXIT handling without pending or deferred flags.
> Patch 4 update vmcb fields correctly.
> Patch 5 fix issues which cause transition failure.
> 
> Chunjie Zhu (5):
>   x86/nestedsvm: update vmrun without pending or deferred flag
>   x86/nestedsvm: remove nv_vmentry_pending
>   x86/nestedsvm: update vmexit without pending or deferred flag
>   x86/nestedsvm: update vmcb correctly
>   x86/nestedsvm: fix up

This last patch, unless it was meant as an RFC without being marked so,
surely wants a better title and a non-empty description.

Jan

