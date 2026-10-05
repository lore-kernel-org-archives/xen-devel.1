Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EEDCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:01:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440988.1658575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl8F-0002Yb-C2; Mon, 05 Oct 2026 16:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440988.1658575; Mon, 05 Oct 2026 16:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl8F-0002YT-7g; Mon, 05 Oct 2026 16:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1440988;
 Mon, 05 Oct 2026 16:01:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDl8D-0002Y1-LB
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:01:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDl8D-00BeVb-22
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:01:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3c9d4-2eae-0a2a0a5409dd-0a2a45019572-28
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:01:36 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3c9e0-5984-0a2a45010019-4a7de163b039-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:01:36 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-488811c9ebaso1028502f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 09:01:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62299461sm4484324f8f.28.2026.10.05.09.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 09:01:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1791216096; x=1791820896; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UtXZ2NV3vzpMO+ieuRVth/JV/i6CrKS8slzAzlmRl/s=;
        b=WZq+YMfT6Gw1pt8xRWKUBat/yGRvlEwN982GKMxVauo2QWTIcmt0GuEgz1fP+lVRbw
         BRJuyVpote4K8L7ywAJLtsB2Zj/mVSxfuQjvfkju54OABBKDdDd4IWeuYwNYOeeiXANY
         dZa/zd+SHVhyhcjldxxzr024P57Mf63+pv/ATWXrXyAwtEB84GhCbPXCGPY3t76Q7IVY
         R5JxyH0mZQBKRZibVJB8cjUY4ek1uuDqFfQM870q6H69pKH7IvJF+e/qkmS1yKZBqL2b
         Iyio0BBJiAQHeOESraz/qqJ8S4QusAxDgo4OYgm0V+9SdKr6UvdDHL6DG93+upVGI+2b
         VUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216096; x=1791820896;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtXZ2NV3vzpMO+ieuRVth/JV/i6CrKS8slzAzlmRl/s=;
        b=Vu6251J+FkV6UYSyaMn3xni7Vgvg5reG+8ZnTwm7F1ynN57fCqowvYT/tKcfmGmjtV
         Y2UFQYmBlWhskhH/hnbwnrbVEP0WO0UKCyeYhlSHvRakdxRB1R7wkJY3oV/o4eqWaBt6
         qREqMmy7BDeHCJztuROmrBthq9MAHFVZcQ5UOPa7a4BrZqzENFIzVvI783KO3biXJ0VY
         en5CLUdP3ORJc9zTTAEyoj2IyCCmwsp5ZGg13Snkzpc1u0/Q/UPdQBzxpZ+B2km2zKJx
         akaMbxJ5PQb1O6aeNEreGunY7uXbdPRjtERnROrZJQW5F5oMe0fEOBCgiNLbWebjBUdB
         MppA==
X-Gm-Message-State: AFq9FYL0DIYiUb+j9l0OpdE89eJRww5cTnv7Nd8mcIss+Wh8Ssi0bSGn
	ieWTeO6jlY8rnlGmUqxb3X3vmbHMfMEYveanIClwkC0AJ9btGhvkKoCraB5CsXg8LUztiVtVj6I
	1p06WjQ==
X-Gm-Gg: AYBFou0U++JV0PUrLdnfSWr0eSA0pKDSzi4g+JTT/Z9EOsTs2WfuRlrdQsEzC7yjG/i
	GotW0UkwGQVoQplwNtefw29Dxo+/WsAIhZ7hL46drCvhyXC1tpYUbOETFTg/IeVjuW7IBaGZWbK
	awe+zb1VXQxD9qpYyQVxH5jITlBz++N8PUOP+gmGwf3QhQvqkEfL9+VKFGNryT2hLsXvp/14LIB
	xyLPUM3bmd9Oy7JOKMCLjKjkX3SQNQpeQ/wK8l6dGxvnPgEvIZUHw7JUYNWtHsaRbjmOB4T51VW
	rrVL4pnDihxG1nYwu12o2dJM70w0BHG4bGBj400PQxHvmQJVFdqi9SGEXtn4hrgQb4Z2IqXZdGy
	AmqHyvkptJHtdODDjk7LXu9JMXCaHvxn/gCuZjhYjIlMI4CuWV0fP+BlfqJe0cQDY3G74Wx65M7
	O4q1rOK/izxDpR75aePykiZNsAyNL/xfVih7OsvWvajVKb4QCGUagO9MhSfb0DA5Zyn5R/B66CD
	HcXSfTWCQToSw67YhiBW/MWRG71M7voD4xwGalQesAwa7j3m7MB1xJsiCrWWuM=
X-Received: by 2002:a05:6000:4208:b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48b126f1580mr19272290f8f.6.1791216095116;
        Mon, 05 Oct 2026 09:01:35 -0700 (PDT)
Message-ID: <012de89f-000c-45b3-a600-544114346e5b@suse.com>
Date: Mon, 5 Oct 2026 18:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: correct PVH Dom0 E820 region merge
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
X-purgate-ID: tlsNG-d62444/1791216096-1FC69757-ED904CF5/10/78276251493
X-purgate-type: spam
X-purgate-size: 607

Folding with an immediately successive region can't be done by merely
lowering the start of the region. The size of the region needs increasing
as well.

Fixes: 5427134eae81 ("x86: populate PVHv2 Dom0 physical memory map")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -229,6 +229,7 @@ static int __init pvh_add_mem_range(stru
         if ( rs == e && d->arch.e820[i].type == type )
         {
             d->arch.e820[i].addr = s;
+            d->arch.e820[i].size += e - s;
             return 0;
         }
 

