Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E827CC44502
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jan 2026 10:06:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1209548.1521517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viV63-00075a-L3; Wed, 21 Jan 2026 10:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209548.1521517; Wed, 21 Jan 2026 10:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viV63-00075T-Hv; Wed, 21 Jan 2026 10:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1209548;
 Wed, 21 Jan 2026 10:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viV62-00075N-L9
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 10:05:54 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c520ceff-f6b0-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 11:05:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee974e230so50286615e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 02:05:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c5965fsm16673495e9.17.2026.01.21.02.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 02:05:52 -0800 (PST)
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
X-Inumbo-ID: c520ceff-f6b0-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768989953; x=1769594753; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxKCIkkJG3xB6JSWikT5kTdRTUB4DNUXfQt8pyX8HK4=;
        b=M9bIlFTb1kZAzxHn+4u3xVymTWhfPPSrrdWHabD/wr2wklHz5m/WkLsjxdkRU2YWEO
         scE6hDnifbaa4u5oHiypO2jkbxHaVnQBEVJWt0H7Zrib0Npj6XmWAFOjVueNv3boC9Zp
         T+M0JyvPAGc7XflRMbbQszJL3cUJFF03C2Q9O6B7Y5pjvwthUpG5DK/DN3ToDNlc6q+m
         mD6t+lOsoqVY7SebugYm71fa+cHjZCsvdcSHemPsNoEnlOKsM5UucVfapdsITju89eEm
         ObTsmOpIk7HQ1VP9NCWFZerEXCKiXXaMljsrvEJkwo7PF1LsDUp9nZVv4kk0vBk5aW6M
         MRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989953; x=1769594753;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxKCIkkJG3xB6JSWikT5kTdRTUB4DNUXfQt8pyX8HK4=;
        b=a1/zPj4UFyGQxkeO7gl/4ASgzXB2gbIELn47k98tQtCfYSFGHJuwn3Xf2aEScY0W7F
         fXTrwCGkxQb8TEuVGvQ1yM3pYGv4+jFVAvvFA8+76ZY65X4g7VgnlmVz/2jEfVpxmmMo
         F7GifsgDIWt1RXc67wINJw4MWL5zlU/Ju8blLfWDntGeS/bTmrbcTC26WDyqppZkjrv9
         smGmTcAO0oi7Dkww9u9M7aaVpkaFf1bUl9F305WA+pA7U6GTY1g7EcZ71WluOUzQJPZb
         YFvZ2FZGEy7lVblHJ/OdXqAQGhIih96BP74Sh2K9tHyLH5eJzRE910hLMY27m2zzgmyW
         r9Hg==
X-Gm-Message-State: AOJu0YxHv0IDLbZlRKTYPzlZaevFU16OQ99WHRqywudWSC2eBkG8mE5R
	c1eOEdwbmpTRz8VkQOvAIFkG8npxNHJ0s2kCMj24gDIc9G14yHdbbzU5oIjvl0kthqWHSgMyHQz
	QRxs=
X-Gm-Gg: AZuq6aLl5mMNuaxvPIMsqSZtKJvfih4yIZj+WJ9ajQSpTNpbq3sJv6PpOAWalisJdlP
	gVohvrWAK16eGWEDx1113Nb0BQiEzEi1vpc5Gf5OLUQKE0IPAILwx9r+kI7s+6ab0mUq+c6fy2N
	FfDyXe6P1TX79+v+0ysVDxrpF+PpYA0IHwAYcHbbp7FJDJTveFWf5oxvn/n38C1nT45b/jjukRX
	jg4srhfZU2tD1CqAR4Z85NHwXM5+VDGh4t3CgF9XpVmgQ9PWYFIHDThK2/p6fzK1ITYO7OYHlYH
	mZjp+Y2NmyHXVIQx4APrv00ViqzJdrmdz4Iu8GN56MfGMrvI2eCDS6AVbX68i7EXALzemFC2z4v
	K32q7RDc8+0TWb8O0nAjlhaChRx+Jms7JfZkykdsnbyN49Ec8PWCPjJaqFj1ETut3zNbEXFPvPM
	KE9StJMHxqp4xjdEuj1IG4nCJHF6aLxevg1TsrPEIk+/LuE2PZUy72L9bk19RWvEG0kFtc4c9tJ
	sA=
X-Received: by 2002:a05:600c:4692:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4803e7a4b90mr60794575e9.13.1768989952641;
        Wed, 21 Jan 2026 02:05:52 -0800 (PST)
Message-ID: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
Date: Wed, 21 Jan 2026 11:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: correct symbol table generation with older GNU ld
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

See the extensive code comment. This isn't really nice, but unless I'm
overlooking something there doesn't look to be a way to have the linker
strip individual symbols while doing its work.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should we try to somehow avoid the introduction of the two symbols when
using new enough ld, i.e. relocs-dummy.o not needing linking in?

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -339,6 +339,24 @@ SECTIONS
     *(.reloc)
     __base_relocs_end = .;
   }
+
+  /*
+   * When efi/relocs-dummy.o is linked into the first-pass binary, the two
+   * symbols supplied by it (for ./Makefile to use) may appear in the symbol
+   * table (newer linkers strip them, for not being properly representable).
+   * No such symbols would appear during subsequent passes.  At least some of
+   * those older ld versions emit VIRT_START as absolute, but ALT_START as if
+   * it was part of .text.  The symbols tool generating our own symbol table
+   * would hence not ignore it when passed --all-symbols, leading to the 2nd
+   * pass binary having one more symbol than the final (3rd pass) one.
+   *
+   * Arrange for both (just in case) symbols to always be there, and to always
+   * be absolute (zero).
+   */
+  PROVIDE(VIRT_START = 0);
+  PROVIDE(ALT_START = 0);
+  VIRT_START &= 0;
+  ALT_START &= 0;
 #elif defined(XEN_BUILD_EFI)
   /*
    * Due to the way EFI support is currently implemented, these two symbols

