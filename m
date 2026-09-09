Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39133C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 08:38:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412672.1643051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4DpD-0007UK-Ua; Wed, 09 Sep 2026 08:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412672.1643051; Wed, 09 Sep 2026 08:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4DpD-0007UD-Rl; Wed, 09 Sep 2026 08:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1412672;
 Wed, 09 Sep 2026 08:38:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x4DpC-0007U7-J4
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4DpB-006iYA-Jf
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:38:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa11b01-8faa-0a2a0a5109dd-0a2a4509ddc6-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:38:33 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa11b09-be1a-0a2a45090019-4a7de18caac1-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:38:33 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so4571515e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 01:38:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d08144037sm370597035e9.7.2026.09.09.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:38:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788943113; x=1789547913; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhIKk2TEmYzBuTS8CzFFK4ZoaLgPdXfCnSl12U5DxsY=;
        b=k0e78w/cAbAwaxekbOrc+zEqy5SW3vLiZa0AXGzf612eu18DRmVp7NRJnAzme/IyUW
         q5qZHqKQEAHCTIKNZObj2xeXGgpGAR4Cp1MAr9dV94NhwUo14kPyfHKUzeoJnHVSUsMq
         Ar+U7vwgvClMOlLZOL74kn1wMiR7q1+76GxmRmFYCiGwvIT0KrVi0xKfvS7SZAuevcjP
         9KxSppi+hr7OXLm175B8BCmVFYkc5AXbcukjgJ89muDJ9vasLQ2PAv/2UVcJiVhrI2H7
         vO3fZOTwSwZ2933A60HDZubOCbyOFim5hEbI2x0rVZnobcE2di2UpkxeaDDhxXkpAl/m
         KrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788943113; x=1789547913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhIKk2TEmYzBuTS8CzFFK4ZoaLgPdXfCnSl12U5DxsY=;
        b=NsAR2E3PpA5g3rBC6iP38fT9RsmzBV1mW34u/L8x9PViYQ8OoLKFY9e8HyRzlTnAqB
         uTQ3LhEaO+Pw5L7MOI8X/GvFDylZl4rYR6f4LceNqv9Z9exLHlggoy9TRj/Pe+ugMgdx
         n98PZh1ivqAt1/6sI18d5PJkNdee59uudU/9WoAqqaneYRzRN0lZRL48F8Zwvv7ZHJOq
         lhhq7vV8qG0oV0j+sLNF3dfbQ/eJJIQzPB1wE06Q5czQrgpZfIXr8i1AclrLLdyuJcx7
         CNVomQlPn403ZG2rESYmmJhPX9GPszj8ZQmTy+UGvLi9KKxQNigDSKmng3Y6GwEsCLpU
         GDGw==
X-Forwarded-Encrypted: i=1; AKwUvBxytSIwA/VCYF2nn23BvsR+V3xcQMbRcOxoSCyk0x9yQZIlCn22yRTOKtdp6o/KxD9bA6/+OwAn1zA=@lists.xenproject.org
X-Gm-Message-State: AFuF++lEToUVrbg/kEofZ/10ee+S3sEI7ZbZ2/wDnlYWF7/BlL2lWiMk
	7e3PxECft4P/XTK535aHPL8aHvrb6qaTgqak453VVEj7fGEAcHWswD5G
X-Gm-Gg: AYBFou1kt5g94SXoyGzUvq/cj5J0A2RATQgM52wEVC9eIQhEF5SrIAfKCYVZm9i/FoE
	Zvw5WPM4Z7p4idMpR7EWt5j+nuUIDSU8FT7hFUXSTMSH42876rxLM1PHQgko8xxK6HrW5qxcb5K
	/mmVYtQr2i4sFp2oXgZLlrKbI9DsLqQssIq34Ze63NunxFKzEp9ME7nbAF+omgEl+BRCCTUOTF9
	GyMEmtp9or2mnHAb5htsyWnJrapL3PIhb71pprYw9QBzsUMmdNLpCXNAk6JSiihb+anF88RxRl2
	vr16ICHzpZoBY9CnzoiBymI6Ztt6u7Ss+XJNk3v/bukMnGXucl3U+59zDN30EKOvnMUOVgoxqER
	0VU/mT2PBXdS+fJlc5KeAKqs9AYGj/c4oSH+3S9MlmyPTkZGnNOwUGmf9htuAqKN0wo5HLn+DJb
	F6utXZxytqdYsueEXaLiWfpmzx946x8CJnb+gUTn4rJyUP1JbpI00HkxPKfPYZqBD9pmi6jnFyv
	XFHFetZ60KzleQwyXtuup3CKxbpsL0jjpBB
X-Received: by 2002:a05:600c:3146:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49d1f32335amr77527365e9.8.1788943112674;
        Wed, 09 Sep 2026 01:38:32 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:38:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909093831.095b89cb@pumpkin>
In-Reply-To: <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788943113-BE4DB034-03D3055D/0/0
X-purgate-type: clean
X-purgate-size: 2418

On Tue, 8 Sep 2026 16:16:51 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-09-08 12:32, Borislav Petkov wrote:
> > On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:  
> >> Boris, perhaps the approach here could be changed to add an actual
> >> memcmp()-like inline implementation (e.g., as provided in a previous
> >> revision, without return value differences), or continue with the
> >> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?  
> > 
> > Nah, new functionality is not needed. We can add it later when it is really needed.
> >   
> 
> I personally think it would be a good reason to explicitly rename it memeq(),
> after all it indicates what it actually *does*.
> 
> 	bool memeq(const void *m1, const void *m2, size_t n);
> 
> Note, however, that the sense of the return value is opposite -- true means
> equal, so !memcmp(...) needs to be replaced with memeq(...) and vice versa.
> 
> The other issue is when gcc/clang wants to call memcmp() out of line. Although
> a theoretical concern, there really isn't any reason not to DTRT there since
> there is only one instance in the code, ever.
> 
> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> 
> int memcmp(const void *s1, const void *s2, size_t len)
> {
> 	int rv;
> 
> 	asm volatile("xor %0,%0 ; "
> 		     "test %3, %3 ; "	/* Handle len == 0 correctly */

That comment doesn't really say what the instruction is for.
The XOR sets Z and clears C (I just checked) so it isn't needed
in order to get the correct flags.

> 		     "repe cmpsb ; "}g
> 		     "setz %b0 ; "
> 		     "sbb $0, %0"

That pair is just wrong.
Only one of C or Z can be set, so I think this is ok:
			"seta %b0 ; "	/* C == 0 && Z == 0 */
			"sbb $0, %0"

> 		: "=&r" (rv), "+D" (s1), "+S" (s2), "+c" (len)
> 		: : "cc", "memory");
> 
> 	return rv;
> }
> 
> On 64 bits it compiles to:
> 
> 0000000000000000 <memcmp>:
>    0:   48 89 d1                mov    %rdx,%rcx
>    3:   31 d2                   xor    %edx,%edx
>    5:   31 c0                   xor    %eax,%eax
>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
>    9:   0f 97 c2                seta   %dl
>    c:   0f 92 c0                setb   %al
>    f:   29 d0                   sub    %edx,%eax

That isn't the object code from the source ...

David

