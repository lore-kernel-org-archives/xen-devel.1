Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F56C61DCD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:06:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401662.1637223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqep-0007CG-PU; Fri, 28 Aug 2026 07:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401662.1637223; Fri, 28 Aug 2026 07:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqep-0007C5-M0; Fri, 28 Aug 2026 07:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1401662;
 Fri, 28 Aug 2026 07:05:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqeo-0007Af-4e
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:05:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqen-006PDC-Hf
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:05:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913343-bab6-0a2a0a5309dd-0a2a4504da3e-32
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:05:45 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913349-b57f-0a2a45040019-d155802cad37-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:05:45 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so4100305e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:05:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dd2517sm27274095e9.7.2026.08.28.00.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:05:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900745; x=1788505545; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xeBcqU4ONhlQiamT59WM+Tt5fXRzCZEnMYHTumLui88=;
        b=e5HbokPhDqYiFyMWxgW5GjIiHOt0T4Nu8qx4WEzVJhXFJWiJ3dQB/uR9kCo820PR4H
         KCcC3sDIl06ro3YqW/lZZSpxlEtAeRgdNKmcxa7WWFMyM+Ed+RF5H3I2kFVg4q2vqrQ7
         leNFl51pv2krAbPY/GqzBm5N5Dh/x7kNs4w+fFCxTkJ+hiiG75DqqTzu9e88YObxg0dq
         tMcbDm+J4Q3+OB6e0Axu6Iu60Twzav04/8Lnp2Uu9hgfZLd/7dmFO1b6hutT2ErjVQpO
         PdmnJ4eCojO820qGlPKLaSSJJTOUNVE5/ciDOgF9KdgONH56hmCGk/6RQHceofeMwZty
         neJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900745; x=1788505545;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xeBcqU4ONhlQiamT59WM+Tt5fXRzCZEnMYHTumLui88=;
        b=MfHHNoXHtviE+sua24BJhunkmcY3aILTNWs3hacd5tgDHpwZGlH1t0A/FQ/6I/aHie
         CcZDMYkaD2CcUzO0j29phzEPqvTrqPStaHifMA4aqcCE3P6u9fUdpRhzqat6m69ViVNy
         JEZDMD6VoDipGMjrfjjTdWetLRtm1xcrKyLFoyKfiZzbPPzWjJgO77wMyP7KFPecI13z
         5wpsYKqNkeZk+hdoT3s/gxlOfH48qbjl6K5BGzw5uX0pXEi0N2C1Cb+CAX5+NkK4gzon
         IXNFkR1/aly16u0zHIcu+IkAzNbpIOSFgSeZmHWszY20q8SoIeupk1zLcgupWQMfn4yM
         1PbQ==
X-Gm-Message-State: AFuF++ne9CgUWzT3cAoyHHbo3anyM4l+6qoIT8TgxpahbWoG2Qr40Es3
	fIV6otpxJ2FKJdiN6qECo1faVwSxJmt4s9iR6qZTHkp0DIx51+DRCa2U7qzq7W1nm32KUG0JZ8w
	Ax1TTPg==
X-Gm-Gg: AR+sD12JxFLyzGBFgx4rzGyAKocS17Pp1xEey4V8FM4hJSx9oBPLgLfBcsQpsI17eka
	W21Lad8VtEC/FgDzXLEDGTmPpQyE1Dl7y3GP4v5iiXAi5+7791m8YB8YiU6kwl2BBA2EA5p8taJ
	tciqE5g22Owen5yzBIw1eWRPt6kuXrysJF2CHc29Mh9LhVBcnDEL1toNbhMXVkVl9AQ/4rXmJlo
	6SXbBIOnbnO6xBiURrpvFwNPMuaKT6qhpmWSd8RwPmf0PN91IiyzToXbgwxsVCAJFlWmOihw7/E
	ZGEwHSTNw31Dc1Rm+z8ODu0xtsdTi7T38274OOWsta46fZqcf2SrT4ze8iHEVTIPC0aU+iZTnAg
	LS15lSpf4oVh6jMBjuZMpC5MMj81B3NHqPCq+zuG3XInRrGCSd5rAT45TOywQJLoFd0wuVtVfrD
	BWr/2y/HdMTkjJhpFDfHIHZj6Y5ygX8HsO08sTAfgvF141KuhXlYx7l4PpXrWIANRsKyzFWt5jz
	8bAKEmfV6Jce6Z6wJxxJxbO4GUh11Gja4Kg8vpNYlF+wsL+nZ+F
X-Received: by 2002:a05:600c:1f8f:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49b91c1fc4bmr44557995e9.2.1787900744936;
        Fri, 28 Aug 2026 00:05:44 -0700 (PDT)
Message-ID: <65330fe2-0a0d-4b70-a647-27290d0041e0@suse.com>
Date: Fri, 28 Aug 2026 09:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 11/12] x86/HVM: address Misra 2.1 rule violations
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
X-purgate-ID: tlsNG-ebf023/1787900745-52AC8B50-FBE8B311/0/0
X-purgate-type: clean
X-purgate-size: 884

In hvm_set_cr3() the "bad_cr3" label is reachable only with
SHADOW_PAGING=y; the code being there is therefore a Misra rule 2.1
(unreachable code) violation when SHADOW_PAGING=n.

Similarly code past the initial switch() in hvm_debug_op() is reachable
only when CONFIG_INTEL_VMX=y.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2455,6 +2455,7 @@ int hvm_set_cr3(unsigned long value, boo
     return X86EMUL_OKAY;
 
  bad_cr3:
+    BUILD_ERROR_IF_NOT(CONFIG_SHADOW_PAGING);
     gdprintk(XENLOG_ERR, "Invalid CR3\n");
     domain_crash(currd);
     return X86EMUL_UNHANDLEABLE;
@@ -5201,6 +5202,8 @@ int hvm_debug_op(struct vcpu *v, int32_t
             return -ENOSYS;
     }
 
+    BUILD_ERROR_IF_NOT(CONFIG_INTEL_VMX);
+
     vcpu_pause(v);
 
     switch ( op )


