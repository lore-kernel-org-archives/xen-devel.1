Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB6AC9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:44:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430722.1653223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9NGJ-0008MU-RM; Wed, 23 Sep 2026 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430722.1653223; Wed, 23 Sep 2026 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9NGJ-0008MN-OO; Wed, 23 Sep 2026 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1430722;
 Wed, 23 Sep 2026 13:43:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9NGI-0008LC-IP
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:43:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9NGH-00BToJ-AZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:43:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3d791-e002-0a2a0a5209dd-0a2a450cb844-22
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:43:49 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3d795-f479-0a2a450c0019-4a7de18dbf3b-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:43:49 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so5082575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684863fbsm6346831f8f.11.2026.09.23.06.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 06:43:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790171029; x=1790775829; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DZsTMyt4BK3N1ESu+j3jzdx1XPzDqWmsokBRCaUxVHU=;
        b=TlbuKE82sHTsRAGrLLuHuWak2HQmIXOD5YclB5LcjIjH/4ErVPmd/DvZt8wHsJtFkp
         a6A+enPr5i8VNSftH36JkDEGXB/4w3CA+uA6/7hmydSifTVefVr4ClluBEQQjTAVgiSS
         DtA5aeDI/xwtTJ93ZQT9WtrgcfKaFgHLDHYoafGvMQfCS/YjP8Q3G+/sZu4D2bHLpKOe
         V0FiviLLZEuWCbhMUhSjmnc19sKUuxSF1aukiaS7GlfJy3v+AwZdEXPA1hh0yC7DDM4S
         h8UK5bQR/1ItcDZvWdOJDAeSeMEbexnWDH2Cm03RolJRIK29TQ0V5Ui9z9aJe2/Coh9C
         rUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171029; x=1790775829;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DZsTMyt4BK3N1ESu+j3jzdx1XPzDqWmsokBRCaUxVHU=;
        b=rkqnOogwHGboWV2J0o/3qDspICdeScNQ0AAuyNt5edWA+6CRPEwGs6/r+7bZ3NgcQc
         1cjFB6pFsBlu5yCl8YSwyDxx1VKI/5jXbYDVb37+wWmk7mePcyKRKigsWkG+GBQBSQXL
         pDmjhlNL8g6phlsmdb5DCEs1LHhg5kWBeNOTlb49/q3848zL2KD46SbUeXpZ3YB3IJr+
         fPoPFg4eS4EysdKi0FjheXp1ZhNzts2LUWLjHS2cV+WPPiS6Rdgu8s9WU53qjOGulaQ9
         Itn/m+xhY7Wi7h0+WBBc/aPvPeHpY43G96qGrkG4szM09RNPcA6PQ4iPeRZCp53K/i9U
         baPw==
X-Gm-Message-State: AFuF++mkyfal+yWb3DbJ6Vz1meOcBsDs0NNHR3eF5H+rVyPOnuqa5497
	4RGSasnXiPs4+5sbysbg9pxReo1v6g9lw1Cu+9/2NFDlHBd4PcAyOVH6tGlzhJGjjJo8KO+Xqsm
	dBmphBw==
X-Gm-Gg: AYBFou2klNFQuxNi1jGKH+Dt38kK2+AM9P9VHhZYxP7qfc8egaxC5+h3dVOydWA05as
	vMAz1+i1X9qcT23XTzJKvtOMjERtUtj1VZBMIxcV33bkx2VVkEBUpP1ScydRq056D0aXxecQWlw
	9NJ0ekwvhcRBc3l+uXM1fDEG75+cUgXRo17XGCSL6dhOtHB7ihAD/58zDFHZu/Zq52u4UuUqJv9
	G5RNK0a27W0V/pzlsIcL8UHYbNmPp82iKqlf2Pq8IV/eXyNk47grcUNFWNSepuZFIMnsjGL4vYl
	/MoLWP9KmFAeZ2ixcvETFiAefKd3vGi4Gk3WWOPf7D4PV+dni9IR7MlLdI5R/MyWZdn2bDpib1P
	jgatSly+d5bImgAW9wN04+tN+SPb0DMs8kM/djOWqFoAu0lPeglIHiDl6y3PpgLXqkv5awjElWt
	1CXINLwC/diHfBoaMNIfZWUVsRADuOpWHUK335hnk3NWc4E5moVrUAzvspWopL0m3AXHTc5ZJnp
	hEA+KsIi3azXtDLPpn/dNiaTJYGTYI9iGmMOv0rcb+7NgrS+VOP3Oz2yopcIGDM7WCA4cN9
X-Received: by 2002:a05:600c:190e:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fdf13b858mr36956505e9.28.1790171028731;
        Wed, 23 Sep 2026 06:43:48 -0700 (PDT)
Message-ID: <05180ea9-4fba-4b2f-b20e-7ea231c66cd9@suse.com>
Date: Wed, 23 Sep 2026 15:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
Content-Language: en-US
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
In-Reply-To: <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790171029-018C5A5B-2B91056E/0/0
X-purgate-type: clean
X-purgate-size: 340

On 28.07.2026 15:53, Jan Beulich wrote:
> I'm surprised Eclair doesn't spot the large chunks of unreachable code on
> Arm, i.e. violations of Misra C:2012 rule 2.1.

This was a thinko of mine. By using "gnttab=max-ver:2" v2 can actually be
engaged on Arm as well, so related code isn't unreachable. I'm withdrawing
the patch.

Jan

