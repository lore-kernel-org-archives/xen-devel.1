Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09BC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:44:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395222.1633704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweii-00062T-L4; Wed, 19 Aug 2026 11:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395222.1633704; Wed, 19 Aug 2026 11:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweii-00062M-IP; Wed, 19 Aug 2026 11:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1395222;
 Wed, 19 Aug 2026 11:44:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wweih-00062G-T2
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:44:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wweih-00GLJk-9p
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:44:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85970f-8faa-0a2a0a5109dd-0a2a450b9318-42
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:44:35 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859723-b7e8-0a2a450b0019-d155dd2de550-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:44:35 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4815bce4652so568479f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 04:44:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0dd5fcsm62584705e9.14.2026.08.19.04.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:44:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787139875; x=1787744675; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vm6DXDcPqsw9MwhiDhO8QXyISmCCCmZBdpzKByqLy8A=;
        b=MWZQtEV0PvkwM9iSVUGwUtxAb/CFi2G4SwrHjX1B4th89g8jhewSGjYNEfyK1BzElZ
         Ln1AtJpSP7q1ss325R1S1V3rL4J3VCrfysafLdjcDeLjQLvGBrxiDocBb1YncSWtg/mM
         Ari63btv9X0BarJCoD5hQk/mK6pv/IPgseCklvHGeOi8B6x4axmnuTNnTLjkP6S80OAP
         ndtW2iCmXnZA97ayMWeDOB+BaVlhnuTw+qeA1Ts3tmfl5ARDl9ikWmSRXmkLQlJ4sBTv
         +aZb4pRUBy6eWav+hh5YxYM/gh/8slxOofAu4kDdA6Y4XLdLFEfAozr6EFQr1TIkMNoF
         JC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139875; x=1787744675;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vm6DXDcPqsw9MwhiDhO8QXyISmCCCmZBdpzKByqLy8A=;
        b=RQ6oYhgceXtCVUywCnnDI0iLfKi40jmz8n1bMd3o5N27iWJk3jxpSyn2m036fCkT83
         EGf2dVE0cIzGtqtywR1+aD4gLChOO5m6cT9dYwENcZvb5sCJTIdvUpZTidjCMVv5NjAY
         zXgZcL9SKbPaIDExIjbHlw3c3aW8cNMH6GIsrlZ+2UUQYRykFOnlFRONRLPLbaliFMww
         AvXAbnpq2cnq+NIk2pLTZfKjWR45BVwFFQHYFxvHetBVz/OPZf9XIvUNSdNa5I+0wiHG
         50FTkUWfVziNbiTHMi5z1e9nrJ2f+Tir+bFFRNzpY5XEhdCFkWwu0gFaMiowwPy6mUR7
         r9qQ==
X-Gm-Message-State: AOJu0YxZKjlpjTwbLOl0eEYl2h3YGvsGDZYKGk4rB1+5TAobqeP85Guv
	w495Sk2/mnffkrC+10PDKmBObnnvbE5/g30yjvBTUnU6AlPlhYgsKk6MHmuj/P/TiCkFiMwYP39
	WYzIOpg==
X-Gm-Gg: AR+sD13xm6UOYlyRlnl2r3IWNquLRa1SscNSSPdAKEk4P21B3v1E31gfykEg3cPTW8Q
	aVz5C4W5wDHxoKThr7K81no+XrFD1VpFNPgRxW8uihKXACy31ixM5hcVE3Xq/QBK47s+jw4tOc6
	eOe8XOvvhpBhyPKkLs1sFZiMl71Cp3cguTyXxR4iX46ljkde5u4IAioIufGe9rl+WL4iJ2ZWty3
	ccrcQNpdkv4oGcIlSOFXMe4LYW9ZmAKck2OE9HSBqRFBNu8k6dYzSkHRGM07rMmdELAzHuYCYcY
	RO1h3GDWS/9qCooN/VqxuNYo0Dx6Lrumkebpbxo7n7/jDNkxMQjqtfLgKugFsPLqUlAjKo5wkmf
	mDh68wTCt/nfaMky4g020MCLyj3D2xKGELWloQRMFVUAMKsa1tAjo66NblZzJFA66H/I0cQiTIn
	zfrrdJyLgasQwzvp/0XwG/0OcHktsL/hAae0VizNQV4fQiNFEcalslilqOCUmbokk9cL2/ghN6a
	ljRzh7ORev2c9h13ZG52IM4mSZ72fffqSMxsd7nm77dSrZJp9eC4vDaJt/Qq7NXeBLvZoubUVY=
X-Received: by 2002:a05:600c:a00f:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499aa1b6c8dmr77659275e9.11.1787139874719;
        Wed, 19 Aug 2026 04:44:34 -0700 (PDT)
Message-ID: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
Date: Wed, 19 Aug 2026 13:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/2] x86/time: avoid early uses of NOW() to return zero
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787139875-1ACDF9EA-EBDD1847/0/0
X-purgate-type: clean
X-purgate-size: 103

1: CPU: re-arrange tail of early_cpu_init()
2: time: avoid early uses of NOW() to return zero

Jan

