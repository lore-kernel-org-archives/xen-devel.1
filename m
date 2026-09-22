Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1BCC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:10:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428240.1650959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8udy-00052w-I1; Tue, 22 Sep 2026 07:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428240.1650959; Tue, 22 Sep 2026 07:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8udy-00052p-FR; Tue, 22 Sep 2026 07:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1428240;
 Tue, 22 Sep 2026 07:10:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8udx-00052j-OD
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8udx-004bhv-0k
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:10:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab229d2-2eae-0a2a0a5409dd-0a2a4502a2d4-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:10:16 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab229d8-6ca4-0a2a45020019-4a7de14cdcd2-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:10:16 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so1241317f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 00:10:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8ce2623sm68941855e9.13.2026.09.22.00.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 00:10:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1790061016; x=1790665816; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cOkYijdAVOZot9RPBs6dzUlH7Fn/J9eNT9BPy4D9aR8=;
        b=AHx34gplSkXBZ+JMcZNhOEQw0FaEBMiSen1sonmlM9udgeyFQdzZNEIJXgeiXGDXJv
         /Qgvmb3xdDqexv+OJLrW+dlggDY9yI9HDVXVnm+L0xb59MA2tVDX87PuV/2cGXx5IXu0
         W57wRknKn6tYqfAnBfjFKqfPzqScU4Ha5qvSM2h36LyPxx/8LUDfvN4i5xZ79eZNCTu/
         Eq3xP8pncZmUzWiusRZWC+YXq9PQYVTtkPVwhrTe5zCSJlfRGkuITlE9YbVJwYxC8IqD
         I9TI7zJcG+3KChO5sViNmQA0Wif0EPzdpvFzUK0nK9sifU3kQ+hTvQgeX1mBI3z5hDFD
         W7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061016; x=1790665816;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOkYijdAVOZot9RPBs6dzUlH7Fn/J9eNT9BPy4D9aR8=;
        b=eCgjjWnF3+ZHo+41FhZ93QwPoSpBlYKwzAYGsopY6Es0S15IlK8dvHae6sCiQUeLCc
         W/bKOjGNlKymc8lMcvswEYHN3Qk2Dz4bKJRD5yWN2DCko6687zLmD2TrR48UCb+5ufFk
         iMgYsKmArhmsU7bCGGQiQJzFLrYvtzy25iL6oTFHSauh6kV3mfEnIvVVcj6cGbr/4ODO
         DMZ0XTBsMxAg9eij4O7Igu6WlrAVstI5Mit8g3WZDjL8SxcKDW7CQr1KYuI3AbJMIO02
         n9exgnuH0MZ453zu8959D4dI12N/ZXMovNCRud6uyCvt+qKGw78WX6rsGmrcjYn+O9lv
         wnqA==
X-Gm-Message-State: AFuF++kV4TuxGorzS/7nE/yctBfNzXg+nBgDhIrcBfkJfz+BWEbJHCOf
	TfnmiHfwGra1sWTV+GIuDK0ZNTFVP5j84Y1jBV/S39hqEwKuPlHyV6RsA6fF6KZZErU/zOSL3Vm
	cR0oeag==
X-Gm-Gg: AYBFou2eGCvYPbhPqTxAWZMT/KTmzGVBzJBYAMzcuik3bxgcIMDw6OSng0V2/G/HuhH
	EBAgaR2fDEiK5zcUHgob/44OIA2B9WCDQkp/Vqb/2v95WmnLa7UT5GocM/fLpE2l5iEtSGz3Usg
	aXrPseqEoopw/SFW1HfD6mU8TshIkea455FzkPm0HnAonuUm0YBo/UDQq1gmreHgsPc2r/Vm24P
	H+zn5sxRfg++nsrar5gp2uwvCMgGVRlC8eEpcCbKg9dIsYjfsPnzwSsuHMddG1YDVoilKrk/5o/
	2pK+jySc/sy5mKjTbcfDHWEYF1c9ACRB7v4+DIMiC4FBaZCaI6zTQthd+V5/E+gIQX63EeLmuxm
	Sa8h2/PGNUZ9RDUezDNMNJR0GnDlQJoKBtvaWZNBSjiuHfqEq/kwR0IERGw5soZ2l24+MKG/dfM
	i8fTVFhh5YKMAQ2iRhqWTI7xMBeQVN3v4uHeIkxNhiNhqPAxHxH0ldd1HIgNmML5kdMrY/J+oQ1
	oImymLeAoNtllmbhNAwDPpFHtFKAbirs1db/Iz0lfuAX7SeQT59PU+oDXvO/g==
X-Received: by 2002:a05:600c:4e53:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fd8a731c2mr25925425e9.17.1790061015669;
        Tue, 22 Sep 2026 00:10:15 -0700 (PDT)
Message-ID: <d8ed3534-979f-48cc-a785-d00d1d9790b7@suse.com>
Date: Tue, 22 Sep 2026 09:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ACPI: prune undue ia64 leftover
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
X-purgate-ID: tlsNG-720697/1790061016-31FD62AC-6B238355/0/0
X-purgate-type: clean
X-purgate-size: 917

This undoes the part of 3b0246ea0347 ("Fix ia64 tools build") which was
missed by e567964a54b8 ("tools: drop ia64 support").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The other ia64 oddity (in acpi/actypes.h) was truly inherited from Linux.

Imo 37dbdb0a00d8 ("[SOLARIS] Fix Xen build. ACPI headers aren't
Linux-specific") really also wants undoing, but that would require other
acpi/platform/ac<OS>.h to be introduced. Or we could switch to having
acpi/platform/acxen.h in place of acpi/platform/aclinux.h.

--- a/xen/include/acpi/platform/acenv.h
+++ b/xen/include/acpi/platform/acenv.h
@@ -136,9 +136,7 @@
 
 /*! [Begin] no source code translation */
 
-#if defined(__XEN_TOOLS__) && defined(__ia64__)
-#include "ac_ia64_tools.h"
-#elif 1 /*defined(_LINUX) || defined(__linux__)*/
+#if 1 /*defined(_LINUX) || defined(__linux__)*/
 #include "aclinux.h"
 
 #elif defined(_AED_EFI)

