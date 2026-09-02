Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5594C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:33:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405080.1638630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eXK-0005Ok-OQ; Wed, 02 Sep 2026 06:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405080.1638630; Wed, 02 Sep 2026 06:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eXK-0005Od-LY; Wed, 02 Sep 2026 06:33:30 +0000
Received: by outflank-mailman (input) for mailman id 1405080;
 Wed, 02 Sep 2026 06:33:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eXJ-0005OJ-8t
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:33:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eXI-00Dz70-Lt
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:33:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c32f-8faa-0a2a0a5109dd-0a2a4505b27c-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:33:28 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c338-4cb1-0a2a45050019-d155dd2cc938-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:33:28 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so458406f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:33:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3840sm4273883f8f.17.2026.09.01.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:33:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330808; x=1788935608; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsE0cG49Spb40SlFjalUjfTBIhzgLgv1Lpzf0EskD3A=;
        b=bncEFbrULAX+rhh1SgplJfQJL5Yi14V2s+AbU/sPS9KCcn7fRzoiDiUxgPSRAPtbEq
         IcHO+CL0OGYxn4QlDU5VySq0Fh6j8pVfxpc5CYV0Ao2tlIrAlSbNOag9grN6zeqC6YQy
         NPLGX1v/0owfqLAOJ6b2fezyre1BRnBHTwF0F+IbPIhJ4Tublx0eyMJZEEhnxV19QoVi
         bt90QvcJaIHFWf6/NQmtvmiD/6Q5yEXYUjaHA9TexufiymBSNq3Nxk+wX8iHqpDbwg79
         If8sU2nNFNJ9gFZUuDog4Nh9yH5B/zEvHTGwOAL4UI8uTvGmzCTZAlMzjoxajA88bm1d
         K4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330808; x=1788935608;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsE0cG49Spb40SlFjalUjfTBIhzgLgv1Lpzf0EskD3A=;
        b=rn1E15sG//lABz87voUoQecytkhIdocNQNOhejH/fQ5aVt9RbMdsNHpCR+MKIpGz5r
         e+wOjCFYhSakW8Qo5NKUINbKxywFG3MzI6qgUsMvzt/FBrtfTfAyTlYj6JIJK9kjp8+6
         /iSvwQ8tIZhR3S3KxVAIzFvsc+K7L6byp4mHSsHmWJYUrXMNNhplL23oCEkkn7bG1jdM
         3gy3EWdf1rkpZAeu5zUKNEevjaFYpcbh2XCaIJkHCq3zfNXrVGCI3z4umaCAoWIJ3n8q
         HRMXXDm2PKs9nhiuXwSj3FgvuQLC7MfpFFl5uYlzf12P3C+3Lojh/GGKXnMdKp2QOyYA
         4MaA==
X-Gm-Message-State: AFuF++l+gCaB+Uy8fEfeZ7qgvdL5TI8AkjRV1/rYS3jDtlwiXSHbdUum
	4f7vtA1IMjzrDLql9RgfLoddyP00dc7tP8MvlMRw3jBuVECZ334J9hHWGVrL9XZwbo/DWI71x3u
	SKSN+OQ==
X-Gm-Gg: AYBFou08LwOXqLuCaUjrJRWnUSu3++L1L7Iz/AGSLR6UrlFsVFe8j3iYyj2GH9oYz08
	9wwpTUmwSzMzxMaUB02pMIrOIKiew/XEwBTShPW/AqeJdei68L81LrBFP3sAz5RKBDZ2+16h52o
	YWV3MZq4pE+73aDT+L7L6Y9wLMrLEBwlk+eNxyrKJRnuRUuSU2VjHjwBUSuHlgJw95gUpd353+/
	B8XnUDHsJ02aHsw+uh9Uw+L1BbF5L67/XhB2vNUQli+XA1ZjvccWEouMOO0+YI+xb6hHSNzgSkZ
	KKGl3aV0IJyzO1sLmGjgBjY0NSMyb3XyR04t4vYjMI80SprD76qunA7CKLg0AVnvcWPZnYvcvHn
	9UM7nYGe+nYULrro6aIBWQvAdll+PRH2lvo+nzH3ip2bz67+3PsqucWIgbgvBkpmuBrVGQJpP3W
	MoZxDLSxEr/xp4amgGgJbRoA0RokegXKqeU5eYNJgKQlU8xcMiI/3m3fktbz5GU+4zRawwmDKnB
	bSfzs8RLf0GpuuJuoFNGp/19LCRJbXmJ1Mc2jrTrzs+Rh9H/hmSFHIYFwX/pB0=
X-Received: by 2002:adf:e18c:0:b0:484:41f5:5b0a with SMTP id ffacd0b85a97d-484914c1a64mr4079727f8f.28.1788330808052;
        Tue, 01 Sep 2026 23:33:28 -0700 (PDT)
Message-ID: <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
Date: Wed, 2 Sep 2026 08:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/14] Arm/guestcopy: deviate copy_guest() uses just like
 their x86 counterparts
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
X-purgate-ID: tlsNG-c201ff/1788330808-F56AD2A1-71FE91D4/0/0
X-purgate-type: clean
X-purgate-size: 2262

Like x86/HVM's __hvm_copy(), Arm's copy_guest() is used for both to-guest
and from-guest copying. Naturally in the latter case the hypervisor buffer
needs writing to, hence the function parameter cannot be pointer-to-const.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course for both the pre-existing x86 deviation and the new Arm one it
might be more robust if the deviation was also limited to the respective
source file. Can this be expressed together with the needed regex?

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -433,6 +433,12 @@ Fixing this violation would require to i
 -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
 -doc_end
 
+-doc_begin="Function copy_guest() in xen/arch/arm/guestcopy.c is a double-use
+function, where the parameter needs to not be const because it can be set for
+write or not"
+-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*copy_guest.*COPY_to_guest doesn't modify.*$)))"}
+-doc_end
+
 -doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
 function, where the parameter needs to not be const because it can be set for
 write or not"
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -109,14 +109,16 @@ static unsigned long copy_guest(void *bu
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
-    return copy_guest((void *)from, (vaddr_t)to, len,
-                      GVA_INFO(current), COPY_to_guest | COPY_linear);
+    return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
+                      (vaddr_t)to, len, GVA_INFO(current),
+                      COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
-    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
+    return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
+                      (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 


