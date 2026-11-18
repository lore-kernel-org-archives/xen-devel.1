Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD89606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ITIF0klX
Received: from list by lists.xenproject.org with outflank-mailman.1493979.1693687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTayG-0001qh-9x; Wed, 18 Nov 2026 08:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493979.1693687; Wed, 18 Nov 2026 08:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTayG-0001qV-7D; Wed, 18 Nov 2026 08:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1493979;
 Wed, 18 Nov 2026 08:24:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTayF-0001q9-CW
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:24:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTayE-003dhh-Hv
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:24:46 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd60cd-e002-0a2a0a5209dd-0a2a4505e32e-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:24:46 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd60c8-4cb1-0a2a45050019-d1558033b938-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:24:40 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso5888195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:24:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a655db6d45sm3255768f8f.33.2026.11.18.00.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:24:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794990280; x=1795595080; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XmmG+k5wVboWWykmZfFYU+AxI8xOmUm6JjQVmx/2UOE=;
        b=ITIF0klXz1HsZTvzBRdULkGgmPOagP8bjCUDIQpKe2uW13LK5HqIxXq1ONWw268fF/
         O8byxxcpYiujlUhY7aUmPLzSIj4vHuuGWHZuyoeozDx2yIP7lbgxkZtzgcKnkg9BoRjN
         i3PpNxn6xQlHIJyVLi8mvX19LTNzWPlzGuS/o+nml16QOwM0wvuibcQsj1zEbB1ODfaC
         H/7ev1m6AXFgsvkav1Dg72T41uzrGQgPDOYqRrWeOG0LIhnEvDZtmdCRQ646nUZHlamz
         FyBKOwhAGT25tQ0UP+ZT/WlergkiYobT9N6D74nri7FKwqI7yRLq/oWTwqDFFGe/RKMb
         z10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990280; x=1795595080;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmmG+k5wVboWWykmZfFYU+AxI8xOmUm6JjQVmx/2UOE=;
        b=WgsCzcpgI+5zdMG76nrfp2XJUnrRtxb3AVOioliZ9Bjwar8Xpm7+G4rvYuY6hx9cdD
         ofL+G0oXqWL23d17wudoOCKKDgXd6dKYDpoCoRcCdDyb0XIp8gVbXrnovjo/WylYzdxC
         ymEiyUEfEEn6Z6hZ0FAwn/uyYk44H6dOyI7Fq1Dgrqb6RDoZ1f0DCiwkBuOavwO0MCoI
         hwi3nh1RYNfcHW5p0ePeLBxVYuo2cpfTUP54C+IOUA/T17aPjit6lGe7AktSaTwKYfCj
         p2pXV8wiK8AjJcxA+cgY2ulmSfz5xshqF7Huw9zOxBZNKuJvxFrWbzwgjiCl08wmniLC
         xgQg==
X-Gm-Message-State: APuU4Z8a/0Oatjvywb+7oA5USfRcTcfyk2lxX9TV8lH0HYH3Ts8coSM8
	uF7Siv4ofgO3hEfmUHPvZMR+OxG8quEB54ywLIqVoZsX1su8hOQqr3UshpwBGDyXOeYh6iUbqmm
	lJDkakw==
X-Gm-Gg: AYBFou1XDRgE3qKo1Z7iFqBfWXkA+7LZhj2Ob5ugCzwCbrdk6+RUpiSiOoKWq7bsow2
	14kutzXb4yKnvpBIn/RoE0AztAM3RpPjsfKpetCuV5YGUP5OF4D5TmK0NAC4XLm+hn0PPDYIgqw
	sgMxiXwL3BtCGsRpN+VZXCwLZMLiTJ1+z14piSkKQmHVW7wZG3N4+43HnHyM5MvwK1ynVl8J/Au
	JVAI/ZNQUzXEpwLGdTMgqSbYjM71wTrZhuKx0+YwkcAr3iGgxwwvdTIc54dnstrP2jTlgBMluL0
	1UPojsaKs7BogKY/ZpNVS2Hw9ykXDDHuwhvnCwnANa1KrWmipdhu7tBatMQekNaiMrXT0ZCBO0Z
	O1sl3d7UNZQjdlnOi1Fa3Adai4tSFjEh828cJS9z8iKvlXoUcVa+5QoPkknwFoVUyrCL7wABEcI
	Y0Xe7zGTs5FpaXSaIyvxovLVC/VTKSHEYnWE5DRc0FPK1SLmvNoaPZvEwkYm1OqpZJlV9uwCd5l
	i8nABI/UdGWiitkv4EDsFdsg3ZbCr5MsyzY2R1kvAbB/LyUc3i1+rqMkY5fuksVa7Zt0PecFJ8D
	b6VsYApfVeBqNrOgnt7kbO8pyxCvCPhcqfRo7r/7ly1lZ05iVmNz+exfJAgJkcrwhgNSDNy5a+V
	SXuw4g7X0PXi1CUgY
X-Received: by 2002:a05:600c:4585:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb7da3d1f1mr32266135e9.34.1794990280293;
        Wed, 18 Nov 2026 00:24:40 -0800 (PST)
Message-ID: <b263f174-e5c7-4e99-993c-9a66d20cefa5@suse.com>
Date: Wed, 18 Nov 2026 09:24:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
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
X-purgate-ID: tlsNG-c201ff/1794990280-73ABF2A1-4BB94E2F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1448
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Not doing so results in a number of Misra rule 11.8 (casting away of
const-ness) violations. We need to allow kexec to use pointer to non-
const though, so provide a means to override the default.

For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
incoming pointer.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use ELFNOTE_NO_CONST as the external control identifier.

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -6,6 +6,9 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
+/* We're producing ELF notes here. */
+#define ELFNOTE_NO_CONST
+
 #include <xen/acpi.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
--- a/xen/include/xen/elf.h
+++ b/xen/include/xen/elf.h
@@ -29,9 +29,16 @@
 
 #include <xen/elfstructs.h>
 
+#ifndef ELFNOTE_NO_CONST
+#define ELFNOTE_CONST const
+#else
+#define ELFNOTE_CONST
+#endif
+
 #define ELFNOTE_ALIGN(_n_) (((_n_)+3)&~3)
-#define ELFNOTE_NAME(_n_) ((char*)(_n_) + sizeof(*(_n_)))
+#define ELFNOTE_NAME(_n_) ((ELFNOTE_CONST char *)(_n_) + sizeof(*(_n_)))
 #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
-#define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
+#define ELFNOTE_NEXT(_n_) ((typeof(_n_))(ELFNOTE_DESC(_n_) + \
+                                         ELFNOTE_ALIGN((_n_)->descsz)))
 
 #endif /* __XEN_ELF_H__ */

