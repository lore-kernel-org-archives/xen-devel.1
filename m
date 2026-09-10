Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA69AC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:55:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414301.1644085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bUs-00026b-J6; Thu, 10 Sep 2026 09:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414301.1644085; Thu, 10 Sep 2026 09:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bUs-00026U-Ga; Thu, 10 Sep 2026 09:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1414301;
 Thu, 10 Sep 2026 09:55:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4bUr-00026F-3M
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:55:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bUq-00AOig-GJ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:55:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27e6a-e002-0a2a0a5209dd-0a2a4502802c-44
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:55:08 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27e7c-6ca4-0a2a45020019-4a7de14caf29-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:55:08 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so1300018f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 02:55:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26bdbb02sm55396955e9.3.2026.09.10.02.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 02:55:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1789034108; x=1789638908; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8PLS0B/eOL2vcsxGj2sSaIE6QRFDPlPY0srq63ErSQ=;
        b=OdcmY2TDMkIfzSgAeSHO5SYyKh6Uz5rKqNu18CqkJM9HZsm+Q/4YUeTFNwc9wKk9Rd
         meeKHkham5P2JmsX3579kJhaT9vyCzu63I3K7PPbLIFU8GDcuYBqLuj1R7H1kK0ACo28
         eSjo5gDdfTAaRc66J5yGEPC4FpK0A07DamoOg8VQKztBUeWG2BBKOX0KPwVdAFc+qVVv
         2+ej/wW+oiDJxtcW0zIBzy7R2fT0lU+TFk2t+obryav1wf+3CvURlGFp3b4+hLBf0wyt
         6m6K1M1/ct5dp9bYaYVGUNhabIcEKp1K8JD4c1QlzNxTZvFlXK9fk265M4F8YcgLS26G
         mkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034108; x=1789638908;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8PLS0B/eOL2vcsxGj2sSaIE6QRFDPlPY0srq63ErSQ=;
        b=lRbQuzsfbuGRbNTLmbqbepsp6W3hXhIlZeQvKSxdjAQE0k40K1qNQIUIOqX+m8wRG3
         2lvn9CK2KDgY3ve5k2LDTM300nFKmR2LnliAEpx08XjD02suIqiizv4y4fysm15jAMxo
         b+6YeCx1X3ENWgwF849uwG7Xsk1lCdfZjKohHF0WimVNOGxPihCNNh1PNw8CimFZP7Ih
         bqd+4khDAVjibQRs468tjrWGfZMZF5AGNpPkNuNOFgUN1kiOekyAJG8FLOwo9o9qNIP9
         t2peaUlg+nc1n1fiOzm8tVMbC4AQfvRW12CDmaHOKAAY54r/mT43Iqfj4sqPaQguLmWm
         DL/g==
X-Gm-Message-State: AFuF++l4fjv7N28EhnvwBjrFhtW06xc4xh8tFDECYXsvExEbEy8d2nLl
	ERPJpwVsUwvltMrybYU6bpVqtHghf1bCe8YMzVWg0CmKewcjNtJ8T1OBLW9UzCfCgP3k0jsz9n0
	kE7/j/A==
X-Gm-Gg: AYBFou05bAB2a+j7QL+2nRteqOxIt24uRDwsA0pgLYH/EyQe7yKA6CvsWEPkaT7+v/h
	vQA/o5W1dZPeClZNl1fp0ccRTiZ/U4InG4qwVyz5HHaRpVjLQW7cQLVKu2paVdfg8UTkt+bo89j
	nkWKYUxzwy+a1Fj113EfEzhTqYaheaYAl6CrqFq/ETm5pu7NQk46LrWrK7BTSF0xFGeO+vktQce
	JFuLVDrmZZBBDheO9bNXOzEusNbUFLDS74lvvyAUIjOsI8t+2AfZRwfwiwe0t+8woX85XnHhq09
	bQUjN26kg7IOfZg5ZogIPT7inzoOq+c4m7fWDFtDsNAzgXnjFQkV44cxWvctz9kDgq89vsyEXY0
	zificVQ4rgXYTos8jkGORt7ql+91Z2KNhV3RWPVhkGKpM52DBnYDVBXDcHwZ33FFUhZm/zZteFn
	CQ+/SuV0jc40et4z/fyNjgBLUfIB+Fg6XAYHGFLhLP654R8sxITqvxZUMHvH60kBYvdw0QJmg22
	cGW3WU+JECDq8dn7kPD+gEKOTtVE3BY3xzTx9lJTHf5t36j/OkxAdsbnfPblY8jcfv1us9lhQ==
X-Received: by 2002:a05:600c:4592:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49d26c3081fmr38960535e9.0.1789034107817;
        Thu, 10 Sep 2026 02:55:07 -0700 (PDT)
Message-ID: <19fff81a-5920-4c9b-be8f-74354f88bb69@suse.com>
Date: Thu, 10 Sep 2026 11:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Eclair: re-enable scanning of the (almost) final linking step
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
X-purgate-ID: tlsNG-720697/1789034108-31BC82AC-2F19C3C5/0/0
X-purgate-type: clean
X-purgate-size: 1121

The real final binaries are now no longer created by a linker invocation,
but by renaming an intermediate file (each). Arrange for linking pass 2
outputs to be scanned instead, yet continue to exclude the auxiliary
.xen.efi.alt.* binaries.

Fixes: da944a72fdf4 ("x86: split xen-syms/xen.efi linking rules"))
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly for Arm64, until "Arm: split xen-syms linking rule" has gone in,
this will slow down analysis jobs.

--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -36,8 +36,8 @@ their Standard Library equivalents."
 
 -doc_begin="Do not analyze intermediate linking artifacts, as they do not differ from their final
 counterparts for the purposes of MISRA C static analysis."
--file_tag+={xen_efi_tmp, "^xen/\\.xen\\.efi\\..*$"}
--file_tag+={xen_syms_tmp, "^xen/\\.xen-syms\\..*$"}
+-file_tag+={xen_efi_tmp, "^xen/\\.xen\\.efi\\.([01]|alt\\..*)$"}
+-file_tag+={xen_syms_tmp, "^xen/\\.xen-syms\\.[013]$"}
 -frames+={hide, "kind(program)&&target(xen_syms_tmp||xen_efi_tmp)"}
 -doc_end
 

