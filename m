Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC39C55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 14:58:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377964.1623652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSCv-0006Tc-Rl; Thu, 30 Jul 2026 14:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377964.1623652; Thu, 30 Jul 2026 14:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSCv-0006TV-OM; Thu, 30 Jul 2026 14:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1377964;
 Thu, 30 Jul 2026 14:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpSCu-0006TP-Rf
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 14:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSCu-000N1A-84
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:58:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b666b-2eae-0a2a0a5409dd-0a2a45068766-28
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:58:00 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b6677-195a-0a2a45060019-d155dd30ed96-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:58:00 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so2309453f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 07:58:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc89347bfsm5890152f8f.28.2026.07.30.07.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 07:57:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785423479; x=1786028279; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kbr4KlJ4X4RLyJuddVEthaAtCz+hy6m4xdECCXkOzhg=;
        b=ItMZf8VDorylKSvF8LSv5u2xo6eK8xncEv2GJkBG9IfMBkhbQbF7ShlLAcmT/m1tku
         NFt/KoRkyr5MyaBZLjtWEdiyavd5raEPrU8nbP/T3/hqK8S2p/9/bvIxJ4oIOoQ5Waj4
         Bvmd4vyvYtr2CENwNekpBs2arjOQ/0PsQ+RaU9znTXd8mE8lXsiNJseGe9vQ3SEQK4iz
         YxvWEQWKKOywacvdiMAD1i19pMX05Lz1jFZFwTGeRd+oCXGpohZRzUrbhndJXuboB1o4
         C1bnd3JxaVDS53L/FMCHXHLRRk+JAG+mVmPTUCGbT0mLY8bmjKhFJg6b1rknbNUbXvcR
         sL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423479; x=1786028279;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbr4KlJ4X4RLyJuddVEthaAtCz+hy6m4xdECCXkOzhg=;
        b=GXkzMRHoqWx1b2okRDvKyRUaXiPtdI36ceHE1wf6pB2byLha08PIBuFTp9BMb0Y85f
         SXOjglNgJNsnR9GUuojIR/QIkQnKdnpFfGkUjUkOrBFYe7qrrvyU7QRMK0Xkiny+lCFY
         0H23TXeEuGYvjo9RQ3mhnXAn0WMw8p5kQV13eLlKTQuPTYc6zuBYpTk+XBFWloUCGSTw
         w4jpAl/tANkplHh6tTW4NHgrCn3rhlWmt4Ued6vzhBCF8gyMy/GbXgRwLE2HW8koNz2m
         arz4pKqBNCjgX74x9raYf7V61EC+ZF7aJV/hfbROnq7KZsZUGFqg13MawN6i/697n9o+
         bVog==
X-Gm-Message-State: AOJu0YxeLEL8HBlg5rmZcZ8Lj0nRDv7rfOVT7sHyn94JMY+0T0a+0oeg
	PYgZxKGmQGNVt2gkPVvmaNbFWcGow+RyB2o6SXY+KriGPs0UH42OjoWkqiLHgRAkE6p6MipDyTR
	FqErHxw==
X-Gm-Gg: AR+sD120Al/m8Av1whSKFNd/c2Fqo14tnDRMVZJyOl75wiWpkLlv9xtvmUODANc2/+1
	rQOwUd5MNultzY/9BeXwffjxtXQ1xLEZHMN/gReWQpU5xQZXjT421kPHbFQbfvjAC+apqJrdyKk
	stkgYfPTJKwI4+fn5ZvKnT798R5G4EBgPMkGHykAWrmkWyThzjbvSIrvTQ38k3uhR+A+eiJZHCJ
	UhiXQlOYY+iPOpmJSiwC8AHWl8Pvc5NXuk948Zw4TCwfgc29C1mpmNEwj6SQul5wk5clq85xWuv
	ktA3dGIO6BXaGV4xHPn3iRnXxyb8TaDrccjdXFA5zoAdchiCsCjujBkYzO+/OVIHybwhiNqnlzq
	fLk/7PdW8m32OlrnKXFKaqneirW+3l0OHuUvZVKlXqMk+OOOpoCx7GnLRFgLwzAY/jpEYljfrGP
	/DhDpdS+MCHkL+MdscgFZlornuCUriEIYP4BOZC9nzyYOaauJktUNM2ecOVPiutlRwdLwDxOBH5
	9qejQw2+YKCUkySeNHPmE+yW0uQk9rGTNLYZ1CUlA7a/Zwo9cN0XhWxFpK6K08=
X-Received: by 2002:a05:6000:1865:b0:47f:9a5c:d2dd with SMTP id ffacd0b85a97d-47fc820d567mr4191056f8f.40.1785423479574;
        Thu, 30 Jul 2026 07:57:59 -0700 (PDT)
Message-ID: <0ddff6c4-7ec7-41a9-9417-687ca16aaafd@suse.com>
Date: Thu, 30 Jul 2026 16:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Xen/gnttab: adjust two uses of sizeof()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785423480-FC20077B-ABD52E46/0/0
X-purgate-type: clean
X-purgate-size: 1040

The use in gnttab_map() is latently buggy, as "frames" there is
xen_pfn_t *, not unsigned long *. Adjust the correct use in
gnttab_map_frames_v2() as well, just to avoid the problematic pattern of
sizeof(<type>).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1406,7 +1406,7 @@ static int gnttab_map_frames_v2(xen_pfn_
 	/* No need for kzalloc as it is initialized in following hypercall
 	 * GNTTABOP_get_status_frames.
 	 */
-	sframes = kmalloc_array(nr_sframes, sizeof(uint64_t), GFP_ATOMIC);
+	sframes = kmalloc_array(nr_sframes, sizeof(*sframes), GFP_ATOMIC);
 	if (!sframes)
 		return -ENOMEM;
 
@@ -1478,7 +1478,7 @@ static int gnttab_map(unsigned int start
 	/* No need for kzalloc as it is initialized in following hypercall
 	 * GNTTABOP_setup_table.
 	 */
-	frames = kmalloc_array(nr_gframes, sizeof(unsigned long), GFP_ATOMIC);
+	frames = kmalloc_array(nr_gframes, sizeof(*frames), GFP_ATOMIC);
 	if (!frames)
 		return -ENOMEM;
 

