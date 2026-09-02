Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB762C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:34:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405332.1638838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gPu-0003Li-Fr; Wed, 02 Sep 2026 08:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405332.1638838; Wed, 02 Sep 2026 08:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gPu-0003Lb-BT; Wed, 02 Sep 2026 08:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1405332;
 Wed, 02 Sep 2026 08:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x1gPs-0003LT-UX
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:33:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1gPs-00Fp5T-BC
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:33:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a97df6b-2eae-0a2a0a5409dd-0a2a4503cab2-36
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:33:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a97df74-fae8-0a2a45030019-d1558029b587-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:33:56 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49557167508so7437265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:33:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4642382sm54766395e9.3.2026.09.02.01.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 01:33:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788338036; x=1788942836; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCy9uizeEUcLaZCIpHKeiBs6su7LhtDrq+7wAuCLOHA=;
        b=I6gSJbTGUH+h4BPsDXclGah+6xtHt4/Q7a/4xnun5yFwfezgJHnNpNOwdTj4EXGfYW
         XtR9MhWoBJMDUNBkwvvzX5Ps3Hx/9Ft2X3pmp3X3mvfEoQ6YrymLi9FZlOXlGKhsaavO
         G+Byx+QxgBwdjb9u6eN6Jpu5kEp0qVtzLadRjj9qRvMf2Nj/7u0x+hR5gItl3h86nIck
         HpP0hcI1vbvYpl+/ZiR05mw4ixGco5gd26OYeg23X4wSpodkn85st55BT9sf3Ak7tW58
         RW5a9gKxdnIVaRdKv+oquEYBmEUimrIeytQQZxGr7xXjv8nj76N7o+LhhKvE/mAM6NBl
         0/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338036; x=1788942836;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCy9uizeEUcLaZCIpHKeiBs6su7LhtDrq+7wAuCLOHA=;
        b=l289kXLrPiaYg9+DgfPJPSNfsmEENf0VEWw18MkfzJbmRDjkawOo+AFYgLud8Hujwl
         INiOLT3dlNhduBwiUfTQZI7vxqOOuInHX/zwUgMnok8AuZ2acC0vuKQSZxFL+739RL94
         VKwIg4T4FS560oOB+KbiHbsI5pirWzJWXq00TBCS6kCFP4HWGrk8oHY/8kdvaBDPw+sv
         EISzOsbo+UhN2cEKRi/oAFbezEhLCZ+7U9x/V03D2jbBE5IpYH0VFKP9+pXDUQFwYqb+
         fkS6lkKWHoUKc+/OG/quclEjKsAXBNJ+AdMzPiG/Dp4qziCktgO272/AyAQr8dIoSMC4
         WF1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3PSgLqS4v+sWYtO1HP3DA/Os9tOzG1LJfjkpCOZLJbisp/3sWImqJRn7c2Wxr+Md8xfsF8jQMfW0=@lists.xenproject.org
X-Gm-Message-State: AFuF++nAc05BFIEgKcnC/T0ZJw9uj/2Dwjjf11ktwZrGKjfRZ6uXzgAA
	SG6xnpOT/1bcFFEw9AwlBjpVU8BTZFHguWX1vk4XkDlFG+3s83gx4wEa
X-Gm-Gg: AR+sD11rtMGTRfgttPV4Rz981WBUhPB/GbQXRrtMQ46WBCcimXKxXemdultCDY1FBCY
	yPTxR3cZPHED/qXnPMFG2rvkN/i5YeZgsdLdCTsnyZg+V1sdOC5YmWVuVofHh3NG4gM1e5xj+WZ
	NK1OAOW4e7CfUtQglKr1GAsHH9++u6z9fsIt5Bga7ITzb76/WIynXsDPdk1pkgoDNcZzdh1QrL5
	/McW455+flWyrnpkvDwB3dFbfyYAidO9zGOopUJJfqZ4ByTXDFEWjTG9UbMLADlXT7zNbnN2Lfv
	/KohpwuDjYwzi/gy24PI3aYKzu/qNJYKcf6/WbUFLg4BcJxm0sUpPjFoVgp/fdnQqLm7HbbqjcE
	tNaT6lmuH4EREw2v3ow9fzw1LA+YRA11FFV4CajyGmJ4+BKMI40EZQdbJHW8IDJU4fyDBFFRMwj
	mnh30+JcEbckTQ5mgpfeRKoLTZ6Sq5/6lSX856dbTvT2Qu/jIlM9rqyaxe4HmvMeuXov5X6gBws
	BChy8Ae2uNoiY0DOGTlj/dmLQ==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr44652095e9.10.1788338035485;
        Wed, 02 Sep 2026 01:33:55 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:33:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260902093354.582c2f07@pumpkin>
In-Reply-To: <16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
	<16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788338036-6D0D94E9-83023E9B/0/0
X-purgate-type: clean
X-purgate-size: 2206

On Tue, 1 Sep 2026 15:16:58 +0200
Jan Beulich <jbeulich@suse.com> wrote:

> On 22.08.2026 20:33, Mauricio Faria de Oliveira wrote:
> > According to the GCC documentation, conditions in the flags register
> > (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
> > 
> > Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
> > 
> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> > "=@ccnz" output operand.
> > 
> >     """
> >     6.11.2.4 Flag Output Operands
> > 
> >         On some targets, a special form of output operand exists by which
> >         conditions in the flags register may be outputs of the asm. [...]
> > 
> >     6.11.2.6 Clobbers and Scratch Registers
> > 
> >         While the compiler is aware of changes to entries listed in the
> >         output operands, [...]
> > 
> >         Clobber descriptions may not in any way overlap with an input or
> >         output operand. [...]
> >     """
> > 
> > Reported-by: "H. Peter Anvin" <hpa@zytor.com>
> > Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
> > Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
> > Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-Operands [1]
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1 [2]  
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/arch/x86/boot/string.c
> > +++ b/arch/x86/boot/string.c
> > @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len)
> >  	asm volatile("test %3, %3\n\t"
> >  		     "repe cmpsb"
> >  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> > -		     : : "cc", "memory");
> > +		     : : "memory");  
> 
> In fact I'm using a modified gcc which properly rejects such conflicting
> uses of output and clobber. ("cc" clobbers are redundant on x86 anyway.)

And, if "cc" clobber wasn't redundant, you'd need clobbers for the cc flags
that weren't being used as output values.

David

> 
> Jan
> 


