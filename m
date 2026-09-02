Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBD8C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:35:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405098.1638649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eYg-0006P6-9n; Wed, 02 Sep 2026 06:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405098.1638649; Wed, 02 Sep 2026 06:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eYg-0006Ox-6G; Wed, 02 Sep 2026 06:34:54 +0000
Received: by outflank-mailman (input) for mailman id 1405098;
 Wed, 02 Sep 2026 06:34:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eYf-0006OY-4V
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:34:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eYe-00AOt2-HT
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:34:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c386-8faa-0a2a0a5109dd-0a2a450388c4-10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:34:52 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c387-fae8-0a2a45030019-d155dd31b190-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:34:47 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so421653f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:34:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ee9cf7sm4347259f8f.25.2026.09.01.23.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:34:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330887; x=1788935687; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4M7ZO90BkV+o7MOoEhTcnL8On+MmsrDJefwVfmLqVG0=;
        b=Jcf5lt7I0pywFWTZTdwXoYzOtjUMNO9JOtue6Uj/wfwVzGAIkD7qWEIC2P5qQ9hnuf
         2Lb1r7Nv6bFpORP2wvH98pPE3PH2XDmylv81O+XEPF0nAqr/hmle/cR0va2MoPQH7JCX
         KAYQeIY+0po4vl8nZifN9/I7u3sM29B1dpz1cR67s0BJc/JfztNEnc/qrhXiorg+A8+T
         Y/RheTPASV6rBrm3sJtm3ttm0dFhaew2csfo+mXfIdpz8JWM3n7dGgB2hUxW6/Jvt1JR
         saymcwhrwk65rSn/eM570tMy8ouVl7eKNOec94DnJaM7a/L8SLGEBw3NLtUHy6dI77RP
         Ve3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330887; x=1788935687;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4M7ZO90BkV+o7MOoEhTcnL8On+MmsrDJefwVfmLqVG0=;
        b=tFWoaZoGw3CeJuULwFTwOv/LQVd0UNfKX1eeZZto+tJKH3x73ktx572NtxPjc35OE/
         rpMQkbwpwQR0Y8GibCpH106XQ+2fZQlyrgmwbtVoLznOiYIePvjWLQO42v2MlJDDSjec
         DX44BwS78Xx7vq+pVHfl6M2G6dfKZO2xagDR2/bsYq7fPVIpdctFgsfo/OtkZVV4DgDd
         9iRyJELDjEa/niv/fTJvak/TY20BqKrRuHxnM412vQLPyW6BittRKX8JWpuUKM3fKKsy
         g/h5ZNOwuaxZ8MLKFhbDE5eOtxIo1HT+uC6ruhrTlSL+NVisARw13VXMZau7zkeu3lXW
         bDzw==
X-Gm-Message-State: AFuF++mEz4EQbHLo6MvvincoxnypCkhZFhaN2rnf4e241jPoizEmxe8K
	orRyykujefr34bdcuOgJQFJ5+M+CoDlx3CMOKsbcRzvzq9IsFzoFyFgKNW+iuq1WRLEnzULykNj
	TPGjvpQ==
X-Gm-Gg: AYBFou2+jw0gbkybzaxmqdRJgR2mn60vKvEjknK62n6VHlnUrbzbOqOVVAVcZmt9hAh
	dQ6ttkh+RAW9/A/uqGEEMYhSSoUotRqDgzg3XyqbByuIW2DhTUmg//JEpAd8cviCcrAp6oa0rHU
	t4nZP8kBh4eBDP+p9dzNymTZR/kQCZIaEXah4x15rM0Hb7lhHTQYsHhQA5b+59eCVTwS17JSuAj
	2ZEz5wTaLBpdQgSIaXHM+Jqxr9ankZ4TDfdCg0cEM4mg89OGOs+xakYbgD/+rzaH/2Lmd7Lm1ui
	q0dXTyztdXEO0OKWT9w8a6n0LSfHi/I2s55kyPXgrko57RDQnAICU5qBLtrIz1qlwXwU9un6RDq
	6P+yi4HaetMQ0zDo+43UuW/QBxYaiJl0HBYX3yOmHKdU0FXnPWndVYNQyvMyfhPDH1AvoX7wKnS
	AxOLrYHlh1gpvIFbmsAV2GiLIsW8TeNQQ1yn2PJ10GUP2N5jCWvnScNbeedkvaGPaVdIQUw3nlD
	dId1bdpCOU0tGh6QoN5WYGWdtPkz/F0wYZXUUHKr7ErmqfxeFSL
X-Received: by 2002:a5d:588f:0:b0:482:fbb5:8a74 with SMTP id ffacd0b85a97d-48488f032b6mr3872532f8f.11.1788330887011;
        Tue, 01 Sep 2026 23:34:47 -0700 (PDT)
Message-ID: <8fe86787-7590-44f1-be4f-461b61d7669b@suse.com>
Date: Wed, 2 Sep 2026 08:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-33051d/1788330887-758824E9-FA6350E7/0/0
X-purgate-type: clean
X-purgate-size: 1311

Not doing so results in a number of Misra rule 11.8 (casting away of
const-ness) violations. We need to allow kexec to use pointer to non-
const though, so provide a means to override the default.

For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
incoming pointer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -6,6 +6,9 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
+/* We're producing ELF notes here. */
+#define ELFNOTE_CONST
+
 #include <xen/acpi.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
--- a/xen/include/xen/elf.h
+++ b/xen/include/xen/elf.h
@@ -29,9 +29,14 @@
 
 #include <xen/elfstructs.h>
 
+#ifndef ELFNOTE_CONST
+#define ELFNOTE_CONST const
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


