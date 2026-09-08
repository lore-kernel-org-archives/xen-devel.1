Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CAC79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:17:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411860.1642337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uld-0001zJ-VM; Tue, 08 Sep 2026 12:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411860.1642337; Tue, 08 Sep 2026 12:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uld-0001zC-Qt; Tue, 08 Sep 2026 12:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1411860;
 Tue, 08 Sep 2026 12:17:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3ulc-0001z4-DH
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:17:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3ulb-004S3u-CT
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:17:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffcd5-8faa-0a2a0a5109dd-0a2a450bdac0-46
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:17:35 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffcdf-b7e8-0a2a450b0019-d1558032dd95-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:17:35 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso49313205e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:17:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfd3f8192sm350315025e9.3.2026.09.08.05.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:17:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1788869855; x=1789474655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O5lPzo+t3hfm7cwSI12MDpP1K3B9KD0k3C3qPSDsa/M=;
        b=NFdz1OZ3BbY5mg+ItSKIzE/nTxVDhsJfVU7Kj3BpXjxtl+Co7XPtdpKlnECSf2J7XD
         oai6mMA7icgtajB0UQgKhl4lU8OI10npm2YvYVtwsz4OieMpKtgEKqo2MJN0majquHVn
         ltNvsocLEuZAkz/+5ZznofneT8JtPsGuXcsc/H0VJBFZDm3hknuURukcsGZ/Sik5o7j9
         7ASgNfHX1FUNethdXJCaxm8VB/vtBnmH3jJJThOZzC00qsSETf9jzPpQ/z3xEF5e6a3r
         U9TksmHEpo6eOB11+xXGBym8vqDftH5R5uO6WlCIjll3RzqREXbqX0FpaOHVvEDfCxzK
         reMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869855; x=1789474655;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5lPzo+t3hfm7cwSI12MDpP1K3B9KD0k3C3qPSDsa/M=;
        b=sEYIxrLUdJxsbTEW+EvJhWUk0TAVHv1yIF1kX7BagJaHRDZeHDLRvDbWuIvAFgSs+B
         k6srebT3OXUnj6dKsJgl6TGVcyp36CTXMyP9O3sPkLIanY02UEDdgqkSK+2g7O9gEV0X
         FCN4O5L0W+mideQWc3/cZhojZ3OJAZRu3YMFoPdBqoCDuCirJC4gA7AW7CXeGmmAl2C1
         6/kVA3AONj0oa4PvaJO9q8DxS3r6PpKgJ3mgqoAF24S9sTBITA0xFXjtEPKQlEOxa71Z
         j7unEjD0f/rCHhjSnycMmAQR658TXsmdxGzGp0VsTDYmzFCTdpXZCf1snfDjftSmkrg8
         7lUQ==
X-Gm-Message-State: AFuF++kdbM5MFaZ4zOdryu4qKjVw3m0J0G/myMWdoB9aX5ilPfAM85Cw
	4EAeslPWYlKMgxqha6yIp8ROpOxqxW5tBDWV/uNmwVWfvluSXq9XLj2NZfCL8qMFZJZlU830tq7
	vykHRNQ==
X-Gm-Gg: AYBFou2wNeQ9ncHQmYV8g4+HS3roXXPA3RSMDFxBuox6XTowQyAR3No7thwUA/RSRxQ
	Y95qMFOi58/fHxiaTMDjVkxjNQtSnIMiS13UHAwSMZWIPQbwkpcnMoC7a6hCwPsPaN/qyYR2x00
	uc9351RaufNtnoT5t/tk1T1oeIMx7ajGC0zNBABpdpYUonuVveAy9R5S6dB2Mu4txjWGGizvmuV
	UoYD56DG+tejc3yPuCUq8Ajh2feLl8kRi4l14rnA8bxEzTpyD7ElVrfofHjjqtNhWsjPQ5jukz7
	1Vuhu6HKv6TZjphydo6jt3bPJDfOj1fyDXkEUNhkg5+5jvrdSPRqnCQq5igNWuh493ulJvDyz6T
	s6I3bdwknTs1HQaok1zcdfOVFcyAwctWGlL6xFyFyJcYx17s8PeevXTiPmtpL91pGgBJISPolxY
	IO8e2uu4MoLgLwwR3lAg62hWuGTBkpc/ka+d+RCaowm0dmqtb6K3CiIpDrM1OoKJY3b46fU9yEP
	s/GBA7UxmWyN9X8zmcTUYh0awUxRh630u+QBTi+8rbmeQwV8fxB
X-Received: by 2002:a05:600c:530d:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49cfc6e8f24mr232362155e9.18.1788869854572;
        Tue, 08 Sep 2026 05:17:34 -0700 (PDT)
Message-ID: <837bce31-aa87-43ee-82b9-1f188432d572@suse.com>
Date: Tue, 8 Sep 2026 14:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: move evtchn_upcall_vector field
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
X-purgate-ID: tlsNG-42698a/1788869855-A92CC9EA-696A5DCE/0/0
X-purgate-type: clean
X-purgate-size: 838

... into an available 8-bit slot, rather than having it followed by 7
bytes of padding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -129,6 +129,8 @@ struct hvm_vcpu {
     spinlock_t          tm_lock;
     struct list_head    tm_list;
 
+    uint8_t             evtchn_upcall_vector;
+
     bool                flag_dr_dirty;
     bool                debug_state_latch;
     bool                single_step;
@@ -165,8 +167,6 @@ struct hvm_vcpu {
     /* In mode delay_for_missed_ticks, VCPUs have differing guest times. */
     int64_t             stime_offset;
 
-    u8                  evtchn_upcall_vector;
-
     struct hvm_vcpu_io  hvm_io;
 
     /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */

