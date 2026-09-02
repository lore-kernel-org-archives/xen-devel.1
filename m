Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A1C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:32:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405054.1638603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eVg-0003oo-VG; Wed, 02 Sep 2026 06:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405054.1638603; Wed, 02 Sep 2026 06:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eVg-0003oh-SS; Wed, 02 Sep 2026 06:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1405054;
 Wed, 02 Sep 2026 06:31:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eVf-0003n2-GD
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eVe-00AIYQ-TA
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:31:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2d2-8faa-0a2a0a5109dd-0a2a45069f90-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:31:46 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2d2-195a-0a2a45060019-d1558031b446-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:31:46 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49b9320423cso6190745e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:31:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e72df2sm4531177f8f.1.2026.09.01.23.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:31:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330706; x=1788935506; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SLQw4AZiW0xGo4eY+c2v6v3KWBjjDDtH8z6OZdHRa/4=;
        b=NPWsEPp9kIoikqvRgHzf3qgd3+AZd43HATQTrprd1mDHUGxxT/MBezdc5+YwNx+pmn
         FllsT9O+CYCOYjfpVvPBKf8RdjIw8BsOiKevObyNMbPxt3hpXCONF4m1/nh5N/QbOByt
         dLyZ8AcDoaeS3tcAELmIRqAgxgk8PtcPz6GSe8hIcDIZ0ZFlgaLsq6SAopteKxFirezK
         CeuJZC/fPDxJ9rO7oNu7po2OgrXjj5V7WSkBq1YdOUZ9xyt4OmqPhBa8zN01uo5Gq5Tf
         0fiXe7pBFKavR535aNBvie+sgK27SM7IaLqZ7e4jAdWeSho2+nu07K/JJktESH6HPzof
         D5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330706; x=1788935506;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLQw4AZiW0xGo4eY+c2v6v3KWBjjDDtH8z6OZdHRa/4=;
        b=Prt+3R/8Bs9oCBLWqMuWTXw5f3O5uEf6eT1hxD/GhAmJFsFee7w3+H/zAexaSQKWvl
         HvEEV1lyRmtpDZXfJcMepfI5ZHSxVeBYDFb8a+z9sYRxL9nnSIH1nOKVWrid5ql+6arG
         m/0W3jKyNR2ctGuYj967aJVAWPuWjfKrrYNq3T4axI64wz37nB7EpygE/E7/o9uA9PTf
         hoPlwNoqbIjvNyJgOvy4eZUpBDnj0vrOpHWSal4i+yiCRH8eSLfluW2yR//Dr07P7ZDA
         UwasxMV0stYyGoElj26/pI6otqkM0mrL0gz/PCuS9RHgu8BRMZSfnTTXD36QiEKAqYHi
         l3Zw==
X-Gm-Message-State: AFuF++m6MGuBZWVOYtlMx8A0Nr+paHDI7FfHz2X5DZYEzIHx/1BUm6nv
	qs0db29/wOQmZnf3HdbyxXP6Dkqp3+VPWzLqU3NBW5EGsnG/eqjPmlv5YtRcAPybQwGzxB8oCaO
	/YFxLFg==
X-Gm-Gg: AR+sD11uMm07MquNZ3Zb5dPPfUFaQSVor9mDwmuMEoiCbunLglvDnoxycLZ7G7r2xFC
	euklJYYuEbDTalSI05L8Do/W6uos6U48R4OBs3K1VmkpB+FfWtRectmyCUIE6hmqhwes4ZMl/fV
	8sgTE70owWzT3we2H3Uc5vI/9YCney5izk/A58l41gBUU0Mtd71qnPCUZb8052PaRnRCogfgnQS
	PjIizIWdp0AC9CaoSKzU6qTABwaWh4gcQlmi6mOihvxKKNTWkt9IBm0VB5SwUSQ6XM9qYmHMErj
	+81Vzm0/YiDsCSD84nIzGPT7IJCkypPC+uTn3rP345EDv8YOjka40XjYWqeIrpmkuH8zWIdtgt3
	MurfC5Q5qbcAT4AG2jIs9Flg7MVoxwd0gtPsZ305ZJTPgO+/CI/dCCWiuwM4ci5eZGtTML/d87v
	EFuB0LpST939jTH/7XO9Owww20n6a2b1HDm4QlKvZSkmbqnJzGU9izHQ7eYMsEwsRR9ejk7Ge3c
	VUVLPvffTpCvzfEGcePY4pKIBw1r7JfZ9ls8JJfuLTEuG/qXido
X-Received: by 2002:a05:600c:8b05:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49ce5817bfemr48720775e9.6.1788330706300;
        Tue, 01 Sep 2026 23:31:46 -0700 (PDT)
Message-ID: <b0c22b5d-f5dd-45cf-8633-e3e1410c7d4a@suse.com>
Date: Wed, 2 Sep 2026 08:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/14] x86/boot: don't cast away const-ness
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788330706-F540B77B-DCC2F386/0/0
X-purgate-type: clean
X-purgate-size: 636

While the general C library strchr() has to do so, the early boot cmdline
parsing has no such requirement.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -77,12 +77,12 @@ static int strncmp(const char *cs, const
     return 0;
 }
 
-static char *strchr(const char *s, int c)
+static const char *strchr(const char *s, int c)
 {
     for ( ; *s != (char)c; ++s )
         if ( *s == '\0' )
             return NULL;
-    return (char *)s;
+    return s;
 }
 
 static size_t strspn(const char *s, const char *accept)


