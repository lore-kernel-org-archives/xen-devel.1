Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCEC79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:03:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412010.1642482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vTu-0007CS-Et; Tue, 08 Sep 2026 13:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412010.1642482; Tue, 08 Sep 2026 13:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vTu-0007CL-CG; Tue, 08 Sep 2026 13:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1412010;
 Tue, 08 Sep 2026 13:03:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vTs-0007CD-Ou
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:03:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vTs-004ZPd-55
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:03:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00793-8faa-0a2a0a5109dd-0a2a4503a44e-18
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:03:20 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00797-fae8-0a2a45030019-d155dd2dddc9-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:03:20 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-482f9309813so4256037f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:03:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6158e9sm478335795e9.12.2026.09.08.06.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:03:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1788872599; x=1789477399; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UD/LJtaYXoAHqAilG4ijFKHbuTzxrL9p3CeWMQG+5VI=;
        b=MXu0T5l5CqFEdlbnSYrD/iWXpHImoYVJGEEobPOxmsTvzGYhVv7lxq9nPuWfVrW2Q3
         DyPUgVFigt2KC/Gv+vNfV/vh43VEEPKcdmn5ixVsU12P76wVbRjAHcRWhvhhAfscm0AS
         QSk1dGYs6pgvRlFtZb5oDLNABqF2hEyOKSPRkS1hSRBZhdbbwUI7KvQFto1veY2Ipdlq
         d10la64P+DeJRYC6svT8NdPTlpI+jox7k9fMiirDlcahbyEDW054beSfNelE2JEzN8jm
         sGxFdtoLeL8ObWKBY1Wm/65J+OW93RSaS50GYve5JdAEhyjXv+DA7W1JyJ081z91Q/PW
         XAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872599; x=1789477399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UD/LJtaYXoAHqAilG4ijFKHbuTzxrL9p3CeWMQG+5VI=;
        b=ZtrLH27oo8g8mG5ey/ejJyetxdxXAbioSn4ExOSvDLsONgSm7OAh1BGIwalLvtMVnF
         9SWcxbj9rjpGZgKqUC3gDPyT7QzAiRJF1fAAgNwgfKHYAAoJK7KhI0zfgIbP4DZzDZ8U
         dOJHEkmR2o/KMbqArs6m46gYnGRCqVQWAAEuS92Ho7755cF2TEgw425CPmxVtt3sFyyu
         +T0v00RasLBLuKXFHjbgKB6Xqsc5Vp+Qo0Hakx9RvO7RAu1sRdha2wxvdj1xmOFuLnRR
         /pdow2iUvXWne3efpnyAdiUk/JiTllW/V0MFrNoeh3WagQqvGCfJnCIQojjP6rGwlf2A
         QFyQ==
X-Gm-Message-State: AFuF++le6KnXyHviL4VO7ZytQzfmAQphAtwwxyITYydcsfsy51UceghS
	m9So/5ckRR0wdo1VUUbr5TTRm2GS1gwJiU5PxTaGDrBbGzhpNwj2DTT7JKcvTj6gsse7k0hDjn3
	MD8U9dQ==
X-Gm-Gg: AYBFou2MEZV3QH5KLpyAOKXxER7CnqmlNL8Y8fvoeVuGHU2k/Yk/gDgjFkKlBtndN1c
	hX24r1vmhouNWhBCYsJR3Qt5DIEaAnae9BTtHoX2ItU1nWEtjqqMEwEBlBtxKwAmz51w+Btfcvx
	jJPANSoEXtk2DJGfPu0qlUcwhQsjvNgJOe/tTDpcyWXA7lvcfVm9wUplMxqADSSCcov8wzXdV8i
	SycrgUyz8RxTl80x3a7tgWJCpiZj7+XbTEoERJd9Ey6NvaQzbmhFcPQAjB0LK9Y+vylfgyT5eJr
	b2EtvW6hMSDQSm0q7XAratM/gg3/3MtW1Fxie38X23S93WaEFDQZEDlusKgqV/Hg+XQCYWpXu+p
	R7WQkjE075Aj+kspbtiOW9lMuq2NHKGTp5I2u38A+Y2ywC8faeO3Vo6PS0unY7R6G7TZboSRVIz
	6J6M6Im6bvQ08ZHRRPP+Y+oL6Qc1AOQiXYVkdvEvaSRmB8Viwfb5KOFexhqnQT36EsuviATF6zD
	A5DW7XddrkFlUjF0dHQPClTCeSTyntMUKgJZmoWin+07g3felH1
X-Received: by 2002:a05:600c:3551:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49d16df85a8mr77640395e9.4.1788872598900;
        Tue, 08 Sep 2026 06:03:18 -0700 (PDT)
Message-ID: <a6766b40-7798-472a-9f61-dc96aa6b59d0@suse.com>
Date: Tue, 8 Sep 2026 15:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/6] vPCI: drop bogus locking assertion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
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
In-Reply-To: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788872600-77EC24E9-83652250/0/0
X-purgate-type: clean
X-purgate-size: 647

msix_find() is a local helper, with all callers explicitly acquiring the
per-domain PCI r/w lock. The checking, which should never have included
the alternative of holding the global PCI devices lock, therefore is
pretty much pointless.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -158,8 +158,6 @@ static struct vpci_msix *msix_find(const
 {
     struct vpci_msix *msix;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
-
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
         const struct vpci_bar *bars = msix->pdev->vpci->header.bars;


