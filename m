Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4786C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:11:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374006.1620956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woha7-0001Yy-RA; Tue, 28 Jul 2026 13:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374006.1620956; Tue, 28 Jul 2026 13:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woha7-0001Yr-OC; Tue, 28 Jul 2026 13:10:51 +0000
Received: by outflank-mailman (input) for mailman id 1374006;
 Tue, 28 Jul 2026 13:10:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woha6-0001Yh-He
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:10:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woha5-00BKNJ-MS
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:10:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68aa4e-2eae-0a2a0a5409dd-0a2a4504dcd0-46
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:10:49 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68aa59-b57f-0a2a45040019-d155802dc141-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:10:49 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so34034745e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:10:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm57184541f8f.4.2026.07.28.06.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:10:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244249; x=1785849049; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HoN79m4SQR8M4WJEm1cBz9XtjO+9NbAU37Xijdb/25w=;
        b=aVDLpHs4BYfVpSuZJPPp1V2qjlIPiCWQQOpsw8ZgDX8ygY59KtfdwJA75Wh42A/+oF
         I4fuqVA125s8x+N506Kmy3+XimUygjv4yPH1v4zXhHGP68ssoSOEoGTeWc4gFcbH8fMY
         sDleGo3v5Z7y1m3NUrU+WU/86hE8gWYmhQIJFascnPkL8ZcdXrM0UnMjRKRR4fwGuWjP
         lV8Z9j+x2MOMXCLKrg/TF+xgqm5khq6bYJCqwmJ3TQk0TEdmhgyri27CyG8jW+q0Gc3M
         BVHjWrit0ly0FSrU+9a7Gg4cbwgeIHzurOEe+fYYYFIHzATNG/3XTZL7lqdQAdwZLCN3
         u83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244249; x=1785849049;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoN79m4SQR8M4WJEm1cBz9XtjO+9NbAU37Xijdb/25w=;
        b=W+9eHArIB3d8+1f9PVflimc8t0PaUUp/nEH50lcd5sDraPdP2chqemMRP64QJ0be8t
         dGc3ocU3t7EXR5BX56D5505v35nBGBH2IvXdruWXHrRlDaca1/V6vbmlS/lqCmsGoW2K
         GF0xacwuLZgJOko7y1X4X0Is+gxVnId+MdA3b47a4fqigiLnfwCQVM4uFqj8+T4ZvfKb
         9eU5+3Or+0Ik5D0IuMXasUBW+0T2bpYoidMb4o8tERPB/C58M0bjxhW7IG+8NbMp9W1W
         BEOJVeR0Y6N5xHCGx0gtTYD/MMUJeHqc4mJzrvCWyljHIE9LxzV4FwokQgvLwOouknm3
         Gh0g==
X-Gm-Message-State: AOJu0YxSE75mXgwhURY7IkNgQYJHMnzCHIs4SFNkxYPfoIxUKFQsUWOa
	pQzFpK0b6NwLDL6+5ZomeEP1CEIgjl6oK/Jp4nyjyv41ziviLT8xUl4vKVzVDemSqLBV6mLjQhf
	P4ve59g==
X-Gm-Gg: AR+sD13k2WkeysbgVtkNHVB1PSbXLqZzCMI2k0M/tHSUPMPUT6taGRpmHg6lYqJ9nmQ
	0qdB8bLWj4WfQv5rfyAOdT8GamNwiBBLFMzvassIH9VH+sZQIN5FbzBgdF7JcqBGcM6gufOIzgS
	JVuGCzbSCKwEKJqJh+5wHvzf4DWqUWSHzzB+l0MzlwGBUYvk3uElotLHQQk+2UqtgJ1kH5zO7Gv
	C+kUB/Ap+DFJt0u8wiaDAw6BkmwnL+wWXyy1uTMlIslagcQ7gA3V0ub2+wkGT2/s33VrW72XTu/
	eQkm5T6T4ibN77KpMvF3Y7QjDLYocSMr+dVLZG3fdaC7pen34527tKZy5T1xrtM6aQyFYhCuQFp
	DaLnmw+h7owGzgG5NEH5kZDOpn62t8payy6yW43TVAbEBE2FY2IDrW+WiVOOrW9lIw7bPiDLlgA
	H+uOaZHjPH8TbP6oHp7lO1HMECvaJN+7jGWUyb2glzAj9nn99USO/VYOFraMSmEMfvsQ==
X-Received: by 2002:a05:600c:46ca:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-496c653ec08mr24507055e9.16.1785244248886;
        Tue, 28 Jul 2026 06:10:48 -0700 (PDT)
Message-ID: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Date: Tue, 28 Jul 2026 15:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/24] XSM: follow-on to XSAs 492 and 499
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
X-purgate-ID: tlsNG-ebf023/1785244249-C0CDFB50-6B0B4AD2/0/0
X-purgate-type: clean
X-purgate-size: 1547

Working on those XSAs made pretty apparent that there's a lot of redundancy,
requiring changes in too many separate places if e.g. adding / altering /
removing a hook. Obviously while dealing with that, some other, smaller
tidying opportunities turned up as well.

01: XSM: reduce redundancy in hook machinery
02: XSM: make .grant_*() hooks dependent upon GRANT_TABLE=y
03: XSM: make .{,un}map_domain_pirq() hooks dependent upon HAS_PIRQ=y
04: XSM: make PCI hooks dependent upon HAS_PCI=y
05: XSM: make .iomem_mapping_vcpi() hook dependent upon HAS_VPCI=y
06: XSM: make .kexec() hook dependent upon KEXEC=y
07: XSM: make .hypfs() hook dependent upon HYPFS=y
08: XSM: make .hvm_altp2mhvm_op() hook dependent upon ALTP2M=y
09: XSM: make .hvm_param*() hooks dependent upon HVM=y
10: XSM: make .dm_op() hook dependent upon IORE_SERVER=y
11: XSM: make certain x86-specific hooks dependent upon PV=y
12: x86/mm: get_page_from_l1e() is PV-or-shadow-only
13: x86: restrict PHYSDEVOP_* when PV=n
14: XSM/dummy: fold cf_check into XSM_INLINE
15: XSM/dummy: drop redundant return statements
16: XSM: suppress hypercall when XSM=n
17: XSM: make Argo hooks well-formed ones
18: XSM: make XSM hooks well-formed ones
19: XSM: convert "allow" (Flask: "access") parameters to bool
20: XSM: fold xsm_{,un}map_domain_pirq() hooks
21: x86: type-correct last parameter of map_domain_pirq()
22: XSM: pass just SBDF to xsm_{,un}map_domain_irq()
23: XSM: fold xsm_{,un}map_domain_irq() hooks
24: XSM: fold xsm_{,un}bind_pt_irq() hooks

Jan

