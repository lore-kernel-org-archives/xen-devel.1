Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339FEC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 13:54:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348977.1606768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYux-00026k-9p; Tue, 30 Jun 2026 13:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348977.1606768; Tue, 30 Jun 2026 13:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYux-00026b-4F; Tue, 30 Jun 2026 13:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1348977;
 Tue, 30 Jun 2026 13:54:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYuw-000269-Aa
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:54:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYuv-000DWt-MY
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:54:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca85-2eae-0a2a0a5409dd-0a2a45078548-46
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:54:25 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca91-9c8e-0a2a45070019-d1558030c43b-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:54:25 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4926f8e02e8so27978785e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:54:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8ca8a81sm71394735e9.10.2026.06.30.06.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:54:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782827665; x=1783432465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7VObdJ/Ay7YvnO1Jkamyr9ljoHlqZ5SKP2YYwI2w7ZY=;
        b=Ieqq6+GGBU3va/ophsoGd+rAU038dOVIdmTXiVOz699blm/AuZT0+IWHiTdIkJI1kZ
         +Fm3YOdbFpH/lK0+AdaLAXJhKpFvgiBPJTq1wqVya4rS5KpK4xOFp4Tkwvf18DW/RfT1
         zA1gQpEv++b12ppIw/VNkLqU3ElKHRWsRo+oMpg3Vas3yMz/lfD9V+EjNzovLNKmaNzn
         6IgXTKZ6xXw7iDqfFO8sD1gRf85wdmXKaat39IK5wUWV3RIXq4KwvbLo0nHEABlzbWLG
         NKDKVjs2Dr4EvLGZcwBWm9sdQMo5Y3vXca8bHbUxXsviGjt+X9vNqMibbF7kmWOhr+fy
         q5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827665; x=1783432465;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VObdJ/Ay7YvnO1Jkamyr9ljoHlqZ5SKP2YYwI2w7ZY=;
        b=Il2dEkJ1y0H4dtgYr2ciHM667Bc1P3bzuIS08O5S4dpfmVf0dbJP/qUUOcIy2MaYdj
         bShAGbMfBPG7CcNe1XFAhX3GYyKwbymHoULwtWFCkDYtsWJ/3G0lRYkfrGSLwW7kw06t
         eSO31e0kL+6IGzQD+rQx3+6IkJvSbc9DyN0Z7WOrmvpxZlIdqndUGsDSG5BoKJar/P2O
         /0FQtgq1fX94xbecBM2cBiVHYrGLD2wF88X9oR/eHczALnB1mQ8b06qjjVGecLwCeEi3
         EsAV0kgJL8HggTDTobgvZngJumckPiTRefxukVl94HEXXMMo1cv+jVjgKqopxvF3x3DO
         hYtg==
X-Gm-Message-State: AOJu0Yzr2CcXmGzlgZhnwRumXxi8UyoL1NQ8zp1cWz1s/JteM3hWyUzC
	LPiws9bu21xju92unpVaSMt89KPevBHKm+KEYPTPZ9+l0K40I/Yceg/5yl5oKsRdnKRbZSDfSvo
	6l/lg7A==
X-Gm-Gg: AfdE7cnHthfTS6nYNTTEOVBTqlv6HfRV4IN9VRAIEkq+eRq7fVTWtzVy4OgMPBr45OJ
	e85Jlf26M0scEqP4+hdffmgM6EW+IhbJIiP6EoxKzy1ME+Hvbo6yUFtIiHi/O5zWPSPeKVE73F9
	FkAOik7GLsJoqgM3/obAfWarDcHi3TF87kB44BKnVgp++NMerCLY2qTzS0QEt29Wm8EliDYrFvK
	LI8gWUfVQ2+7QG3qwiwQ6cXMGHuo8cGtsk3mxVV3rQqpmV9xH4iR8gWa3dkLbvetucKZrzHOgzr
	ewFsrR1Ys6Z0sMULrSh8rkct4I8Uot9LeuojR9ANn2FKLLlFnLraaIRNcghX6CMdF0VVs0YV1Vt
	m03fq+lz6jxQ5D1useZRxZrn/HSPx0lKtcieZQgunmf0JYNrxr/BE+gTg+BfmoI99zrL67vR9Gw
	Iq7rv1xfZek2aZyr5RD770SJCoM+BMlP5mBIhXZd7DJgH25yd2vPs872A20T+GQWfDd4H80KsS1
	YK4
X-Received: by 2002:a05:600c:810b:b0:493:bc4a:d5f5 with SMTP id 5b1f17b1804b1-493bda928edmr10545345e9.39.1782827664971;
        Tue, 30 Jun 2026 06:54:24 -0700 (PDT)
Message-ID: <e7fe9dc2-a7e1-4d9c-a6fe-d57b4d39944d@suse.com>
Date: Tue, 30 Jun 2026 15:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/2] x86/HVM: more checking for XEN_DOMCTL_ioport_mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
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
In-Reply-To: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782827665-FC11625E-240ED00C/0/0
X-purgate-type: clean
X-purgate-size: 2315

When adding ranges, only alter existing ones when there is an exact match.
Don't accept ranges overlapping existing ones.

When removing ranges, only remove a range if there's an exact match.
Return an error when the range isn't found.

Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
Should "exact match" perhaps also include the guest port number? I'm
uncertain here as that kind of conflicts with "add" being treated as
"change" when the host port (and now count) match.
---
v2: Re-base over change to earlier patch.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -728,12 +728,14 @@ long arch_do_domctl(
                    "ioport_map:remove: %pd gport=%x mport=%x nr=%x\n",
                    d, fgp, fmp, np);
 
+            ret = -ENOENT;
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if ( g2m_ioport->mport == fmp )
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     list_del(&g2m_ioport->list);
                     xfree(g2m_ioport);
+                    ret = 0;
                     break;
                 }
             write_unlock(&hvm->g2m_ioport_lock);
@@ -746,14 +748,21 @@ long arch_do_domctl(
 
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if (g2m_ioport->mport == fmp )
+            {
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     g2m_ioport->gport = fgp;
-                    g2m_ioport->np = np;
                     found = 1;
                     break;
                 }
-            if ( !found )
+                if ( fmp + np >= g2m_ioport->mport &&
+                     g2m_ioport->mport + g2m_ioport->np >= fmp )
+                {
+                    ret = -EBUSY;
+                    break;
+                }
+            }
+            if ( !found && !ret )
             {
                 g2m_ioport = xmalloc(struct g2m_ioport);
                 if ( !g2m_ioport )


