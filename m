Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF896C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406906.1640065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25qk-0001FY-3Z; Thu, 03 Sep 2026 11:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406906.1640065; Thu, 03 Sep 2026 11:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25qk-0001FR-0p; Thu, 03 Sep 2026 11:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1406906;
 Thu, 03 Sep 2026 11:43:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25qi-0001FD-Lf
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25qi-00Epyw-25
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:43:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d3d-bab6-0a2a0a5309dd-0a2a45028086-40
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:43:20 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d57-6ca4-0a2a45020019-d1558031d88c-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:43:19 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so18839705e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:43:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea5b4sm13613689f8f.27.2026.09.03.04.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:43:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1788435799; x=1789040599; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dRoVP6mPAAUzl0+K2OfWrG9TPv2kIzR6dwNYvx6VPj8=;
        b=WdyKuzsbR6Q66zSVK8NAad+jmb1XIhEOImsDSq5NvC49yM49xPDQnWi1W0k7e9cNfi
         czwr6FicZWR0bZQ7PI5pDg+Nx+AOw2MPZCpCvfRcOz08MI5rG6b8zR4UOghne0fR9tjl
         NLp2P+lkyWv1MdygPzU75ZD88Rt8X84qsq07FXBNqUOj3tJV+AH35PJNmTjd3YxoUiyr
         ZpVbwPI/spHLqGvxUFXbKn1VFErdJI43PNwfZZQSTQ3oL5SAATZjMhgTDtaidvdDmHuf
         sDSp0OOPolgLtn7z/JA3rq5AxZUWrdwCWReGVfZvLIPuTPsTmayfugbevgAl2K3OzfT9
         vT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435799; x=1789040599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dRoVP6mPAAUzl0+K2OfWrG9TPv2kIzR6dwNYvx6VPj8=;
        b=dQSR66fsy0A501hLXAocZw+4jYp1SaZld88SCLSneAjI8fkMeyDg8keyWSkAaGpYXi
         YLFxw+Me9Zf42zXpuYExvhdDP8268GL36qQEnJC6PnrbJi1Xn/TVEsmUv2UUfuw0WkD/
         LZpCQKigSYpg66wB/D3K/eeRuPwNJsVafAz9507v0cX1n+cSCniqv1nVSorXZBg2Zg46
         sJfVente7jxWiMVDCIUff74iFS6EWzcGffUStHIqylqDmZ/a83mvFSAVmQTKUMxj9PvU
         LEIhXIIvtAeZxsW8rptY0MsuV0VuPX27U03mNmX3Lgxq1ZsmIPrxQJ/4jaPLum3pamv2
         kGqA==
X-Gm-Message-State: AFuF++lcL9c9Hanfu5zcFBW8fGvCKXcD0jqjEbPsfnlFkTct/H0jGon4
	sYc6FWCnwkD8R2jHXr9gsc4u9F36a2hRNyC61U9K0Vgc46IH/uiE4yjwSY+AMlC1x+sr/QH4zzK
	6bYBv3g==
X-Gm-Gg: AYBFou02mMmjRwt8Gx1s9mvkpAZrmY11Zs2chmX/ZufLKpf371HDN4jNLOtgODtBPGp
	UudTxfiV6XOK5vMG5ZmyTmEakU0H0A6mDfrdqevVQvasOQzHmTFeIAxfyFz0rdoIGdtNlC38I4m
	eMyudhOXLCDLgNQYn7Hszo6mYl8GrRoi98I61vsRnBA1vtJOO74JxVD2ld90Sth76hi9rGpfcD9
	UJo2UMG7MTpjBtC5hUalF9rnYT8DPSL1UQm9ElehggXGnU2wKUowu2dtHrlOvdpZKyg8UlTnYuk
	/C75HBrOuNnIsvmt8/wfBfRKWhk0CEJbVk3MACw3JqdTlqrUl904jdCduKFOxLlSyqSvbQYVYy3
	bWok78u6nrM+EjrkRJDSBs0oKCYN8LptC2d5+9IsbOTtkyHMEjVdO0xjb1IY3b/TeVYAQlWk/Me
	Xf/ZCi4TXcdeoqGg7JnBP1hKUstuKQPPD17O0RDQdP2EX0tC5MBHERRVaEsbKture+s4eMbnOlo
	C+KexygvgDarrytcknY2LqFJpKv1siHsfz+UPiVWNYv8LSxk7ZZHdAKqW/uFTJu
X-Received: by 2002:a05:600c:a00a:b0:49c:f4e1:3135 with SMTP id 5b1f17b1804b1-49cf4e13cb7mr25162065e9.14.1788435799469;
        Thu, 03 Sep 2026 04:43:19 -0700 (PDT)
Message-ID: <be5f65cc-332e-4292-9b63-33196cc8ce81@suse.com>
Date: Thu, 3 Sep 2026 13:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/domain: address Misra rule 11.1 violation in
 reset_stack_and_call_ind()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
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
In-Reply-To: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788435799-674BE2AC-3AB31209/0/0
X-purgate-type: clean
X-purgate-size: 1364

Eclair dislikes both sides of the comparison to differ in noreturn
attributes, thus deeming this a violation of "Conversions shall not be
performed between a pointer to a function and any other type". Since gcc
doesn't permit use of "noreturn" types used in a typecast, resort to
typeof().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really Eclair's diagnosis is misleading here, and not only because of the
missing "noreturn" there, making both sides be identical: There are no
implicit conversions performed on this kind of pointer operands of an
equality expression. A diagnosis of "comparison of pointers to different
types", along the lines of what compilers use, would be more to the point.

--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -208,7 +208,7 @@ unsigned long get_stack_dump_bottom (uns
 /* The constraint may only specify non-call-clobbered registers. */
 #define reset_stack_and_call_ind(fn)                                    \
     ({                                                                  \
-        (void)((fn) == (void (*)(void))NULL);                           \
+        (void)((fn) == (typeof(dom_xen->arch.ctxt_switch->tail))NULL);  \
         switch_stack_and_jump(fn, "INDIRECT_CALL %", "b");              \
     })
 


