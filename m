Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD14606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=edpLKE7f
Received: from list by lists.xenproject.org with outflank-mailman.1501877.1697879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8Rt-0006da-Pi; Wed, 25 Nov 2026 08:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501877.1697879; Wed, 25 Nov 2026 08:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8Rt-0006dT-Kd; Wed, 25 Nov 2026 08:33:53 +0000
Received: by outflank-mailman (input) for mailman id 1501877;
 Wed, 25 Nov 2026 08:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW8Rr-0006bo-Qh
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW8Rq-00Af5i-O1
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:33:50 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069d69-e002-0a2a0a5209dd-0a2a450480c8-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:33:50 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069d6e-b57f-0a2a45040019-d155dd2ac0c2-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:33:50 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4a3e706b5dfso3413572f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:33:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853c9170sm569699765e9.14.2026.11.25.00.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 00:33:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795595630; x=1796200430; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jfxj6bj//czWUIP5B8l6iU09JVBP4qRCX3RrqLHsWzw=;
        b=edpLKE7fzjFUL6V3aVHcaQF3y3AUvQrqbLxyp2HwK/e1WAIlZqjTLjuSmzP5PaB0ud
         bC52qKsCUykHB1rI+VNCwRiBUdit7ylYG5+qwBsMk63D6GsmR9BO/9QhE/eylqmJrScG
         B85Hk/tZtTJpYq2kl41MmoxoDzol+Skc5pYsKHVYZN8DHFpzXIj/Nw6c3L+97T9+Bhn7
         W5XOVUelORIOMnjR4jeBC+LQ+Q2GLDwi995RiVcsZF5uU90d/5HhSOcKM33yj2CbaoWj
         EPGTWAvys7zPWLhrbgNnMCvTYXLKGJvoyzcO490ep3VF/XOCwUHHntAV+4yj5CZasbmd
         i8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595630; x=1796200430;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfxj6bj//czWUIP5B8l6iU09JVBP4qRCX3RrqLHsWzw=;
        b=ZIOSthvNpd9V+YJZqgNgP2W4xyyC55wYFFoWa8k8o8Gm+UC9pVc0ritOFW7B3RWMwN
         COidexP+OwI7cKUX2+xsI5L2KpWAPl3++4dMRl48uizFwFi2a0AAU+lgy/Y3JIgK0h+D
         dL4gxu7O/BjYA3ac1KrhhOfhw3Zsr+/1JNV45JoRyW7ueMGsvaPnMXl05VUBeICj1LRC
         t5sKzL+o58o4citnFqCP0Ye7Y3EQGtoMwjIHMxvSfiQK8cHBvZ1+zBFGy6X+cahdJJ5C
         iRkIONWKIF3AkJ90rnov6GM7s25MRF+p9FKQZIrqhmVWhXufG8SvG3GC3BfnHu0/qnr3
         m9fQ==
X-Gm-Message-State: APuU4Z80sQ7SUAcX3UP/72g3I5u8YHVylQ919QAC1yv25w4+8BhhXaoy
	dC9LRY7FK/SKmCvLVifxyfX6ASdZi/OPBZJjZHbBqNXagYWkRU8iE+RH/rrUSfY1jgAYDcfl74b
	P+JBfEQ==
X-Gm-Gg: AZFdTZfvB8h2uYdS4SLKZIr5obtAn6FtpdW9LASi18cFwEBJL5BPP/26W96fGPSzefj
	Lcv9gNiLMXa84AyQdR8zA+GA2LlAftdjIcG528caRylJNTs5XAAi0RiIE2K4VZO9/gp4YUn6ClO
	pSCnJXpFGgjCqXZN0wReKsyKIHyX/5AhzhGSxqZ+vrXbX5lyzYRmJZ+1lv3JEPYotIFk1FW+q7y
	eXWSEc51i18UkgmFTsp3gHyj49nT7la9v6y6v3FUPAK5wezOGq19L90axZf+H9c6aRKNEikGC8t
	2+F8kzf5GiV4XHOu55nEOnTta0Fv+KS7dgrST4PqRdZ8rQIXBlAah3zYAFjeEVKjDwLM+ktLgiB
	08MRaTgB3evR2I6ZgB1Fe3Ng+z/TqDkEq2PpNE7BsmEsuSlG/ddYCvqdRCFCPm4zoHc2h7SHSWY
	2YvmSTwK+cKEW8DllR9S1zSHR0gkvKWEeWPZX5yo8sLS0bdbV8x7ydrcdocoFkN4d7miPiiy+Fi
	hp8gD7EvkgvEoIfhSiiJvnTX/GzqKXspfA3VSUE/6O963DGDrLds7JNhvFRFo/71zPShEJYx451
	s9jtx3JzIVF4BYxXnzAdWnTpUaBNAOhgtpgS5pVcDFwHBckcA8FMcMl5cFRKNXlcHBMcr/INDWd
	Kd8xy0ZnnUn9YtDuEBA==
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr343277815e9.2.1795595629980;
        Wed, 25 Nov 2026 00:33:49 -0800 (PST)
Message-ID: <149e4ed6-558d-4ffb-a9c5-b9de8a8579ea@suse.com>
Date: Wed, 25 Nov 2026 09:33:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: check fault-reported dev ID against table limit
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795595630-C1ED6B50-404012AB/10/78276251493
X-purgate-type: spam
X-purgate-size: 913
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Requests with IDs beyond the device table limit report the bad ID in the
resulting fault. Hence like hardware we should not try to access the (out-
of-bounds) table entry.

Fixes: 0e461c2d7f45 ("AMD/IOMMU: walk trees upon page fault")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger@xenproject.org>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -556,6 +556,12 @@ void amd_iommu_print_entries(const struc
     unsigned int level;
     const struct amd_iommu_dte *dt = iommu->dev_table.buffer;
 
+    if ( dev_id >= ivrs_bdf_entries )
+    {
+        printk("%pp: beyond table limit\n", &PCI_SBDF(iommu->sbdf.seg, dev_id));
+        return;
+    }
+
     if ( !dt[dev_id].tv )
     {
         printk("%pp: no root\n", &PCI_SBDF(iommu->sbdf.seg, dev_id));

