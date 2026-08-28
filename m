Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B33C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:02:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401612.1637159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqbV-0003H0-Td; Fri, 28 Aug 2026 07:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401612.1637159; Fri, 28 Aug 2026 07:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqbV-0003Gs-QU; Fri, 28 Aug 2026 07:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1401612;
 Fri, 28 Aug 2026 07:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqbU-0003FW-Rb
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqbU-009FjH-7t
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:02:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913275-8faa-0a2a0a5109dd-0a2a4505ae48-40
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:02:20 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91327c-4cb1-0a2a45050019-d155802eb505-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:02:20 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49557167508so5866045e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:02:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dcb3d9sm28839595e9.5.2026.08.28.00.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:02:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900540; x=1788505340; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1byslbOG0CeFzmY2s3/l4wrq9b0PgsYDl6emmZmMS4=;
        b=LY/nj0veQReLQo8MGqj+h2PwS4e/15ZjgRJyHiiL/tOVc/R99bMLaIePRh70YQsd6u
         qqVZyV7hZB8Nw6EgkywFNh2eL8VRcTBbwTCCJUW2TCQxciW5CO7Hj6vOAf+YgbDqWPNj
         4SQ/Qmycjq551RmCW/kR2DtN6VJwM/8/0UzJdOC1PhFh2uKIUV2R0wDrlcDpBQi9QzUH
         IkQ+AKnzQxuNU6xw30sLUXFMJa/frLZ+zD5AWycE4giEk5H1rw+B7a4kqAIQvYfy7ltA
         QQ8uOEmn8jTKEJhWOgM5wZrKf98W7Bh17eVErEtSTuJfT9PdMeF0J5J4+jyo6mS1Sn5I
         w3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900540; x=1788505340;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1byslbOG0CeFzmY2s3/l4wrq9b0PgsYDl6emmZmMS4=;
        b=Ij3Mit3I+ivCAbuusmjB6zH4zcjSF0HaLsWZJ0b5ZANksEeI2wWctsKDwRHuyv5MhH
         088uzCjPngiHFayAdiolM2tGXw+E/4HhPwZY0pyvD/eEAzsW3f4mqm0vBukhyEbiAqPN
         NQWj8nhXu/DUlmVyzP52GwkNJNA/fDR30V0RWyEZc7rw/xVFwJgMjDnL0dQt3zE1Er/n
         HyIsSzk6alLt+mVpTn1ky96dFTmQhhrJX01djQ6xl/5yov9oBNgwI46264DnZMcg+Pfk
         CemctUz5w6ZxY9fMaT1cMsn37eutv4Jx+cQob9njiZ4Q7ecuHz/wbk5DkdRoNgN7/V+H
         N1tw==
X-Gm-Message-State: AFuF++kY1X1ZsJf2pkOmyxx39dDMil1pYJERdVCp+MgHWkiBt5AF1/Rc
	J0l3X7tQ98OCP2HCZPVnkFWVTo4vIuvmNnVU3To+NGuCN5ICLkF5d09HzHuH483tG8thWyI8u1+
	s3W7mDg==
X-Gm-Gg: AR+sD1042K9HyDPTVpyotoKACXogAT95s0rt3fcPkCq2Tk/eNBEgcVnMnfb6HgrAreu
	b/AQq/BDQAjscEomfB/kxzh4dW0iXAHtvSGQxZCCFgepT/0XY0YQpBXGdvJ3P9beo+xVH+eOTTO
	xLzx7IKfeDpzZ0Xv/bHzQLP6VxV+NhXEdf8v3qo3Mg+sxrUx/yvEspYEjPLyarSTpNku40xhUJ2
	v/ZPmNZ5Dzv2ST86NeS41Ig+uJ2kPOlLwTv6r2GYtM80Vzz1ZzFPsiaW1CijEYteFVRz1hWYvYr
	VxMetsW6jCPJPNElsP95eAMhcfKt6/R+gXZ2ALoDufZDg8TjgszNnoI/yBoVphc2izBbnlG/F4H
	INi3ebMqBEzIUiMD0A75Kl8ale6EiwMhJf2BlzGTTJUa+PrXhhEdjwUlFU3Dr7CAIo5x/bCeAZI
	ufpWh7CRh7l9TFpV1x83HFmgHhovMvtt7QPkxuuqJwiLBUkUPMEuTodNF47SDOfeAZ54YZTzWNd
	FstgQffYfkpkz/IEOUqpF5gZvlNwnL7hvtPE22HQuwhSmQuS4X3ar8/7M4OzsE=
X-Received: by 2002:a05:600c:8486:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49b91c27436mr64024755e9.5.1787900539660;
        Fri, 28 Aug 2026 00:02:19 -0700 (PDT)
Message-ID: <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
Date: Fri, 28 Aug 2026 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787900540-72AB72A1-FF57D71F/0/0
X-purgate-type: clean
X-purgate-size: 438

The use of unreachable(), when unreachability is visible to Eclair (and
compilers), is deemed a violation. Drop the redundant statement.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -118,8 +118,6 @@ static int cf_check do_nmi_crash(
 
     for ( ; ; )
         halt();
-
-    unreachable();
 }
 
 static void nmi_shootdown_cpus(void)


