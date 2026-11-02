Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE641606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ks1B7SWp
Received: from list by lists.xenproject.org with outflank-mailman.1468800.1677863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxjY-0000hg-JJ; Mon, 02 Nov 2026 19:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468800.1677863; Mon, 02 Nov 2026 19:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxjY-0000hZ-FM; Mon, 02 Nov 2026 19:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1468800;
 Mon, 02 Nov 2026 19:30:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3x-ToagYKCZIE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 1xNxjX-0000hT-9z
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:30:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxjW-004LIf-7V
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:30:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3x-ToagYKCZIE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 6ae8e4c2-8faa-0a2a0a5109dd-0a2a4501d89a-20
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:30:18 +0100
Received: from [209.85.215.199] (helo=mail-pg1-f199.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3x-ToagYKCZIE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 6ae8e4c8-5984-0a2a45010019-d155d7c7b08e-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:30:17 +0100
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cd60a365440so2184334a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:30:17 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793647816; x=1794252616; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMZG+Vonh2kG6IEXx5qekjJyTd7RpEVJ3Nhz9EIK9Q4=;
        b=Ks1B7SWpYVGNA8ZjG+MHYbj2S4ZOjmKy4xz8TEw4+mexxvanUUZvS9cUI4Sw4mXGjR
         OwvNsuqBsaIYVcGdugHlOI6H3wW4Hh1JV6pLmRRNaUWNWymNg8oH/B6wkGE6kUaCvg19
         TEZ3NcJqrWk2Wf6Xpk00hGG5DPmw9BNmg2nQhsvlNL2HAJPuVTNatSxSH6dXv6bEJr8r
         XmgqwnY7p1+TOJKwQ5hpsZIM1NpJdwq6I97KvO97KEDzEhfjcTd3kHRVnFb5wZwaftFH
         6xtVnpL8dabgwH2rR0VmE2Quy1DY/8eniIyUxZaa1ECJNu4vK6vEG2NNhmT2CvCdktEZ
         uu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647816; x=1794252616;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMZG+Vonh2kG6IEXx5qekjJyTd7RpEVJ3Nhz9EIK9Q4=;
        b=FRP0Ig0N485UTrfBG+yH6yvz3ahX+TzSOAOBF0wCDwLGUZuOTKK/yXXxboKaOfuLjz
         FnLJu2+KDRA9NRN238JBWYOaM0izWMv8RcPtpGYqlU0HoBX8+7WedLQGaxB3uutz9s/g
         CS02V+SLD7Bfnt53iW02WYKsHMAqyFIQs6vxrnUVESIXf1Qp0GJOOGyrGCpeakA5C+6d
         AOwZNKzMQcPZL3OfGFVUeNcfbkfCb0tjptj7VbnJClUzVlJ9Kdbpj5jEpUnhK7/dpi67
         4/A/Nape0sqk3zYGAaZdAF8t8b01bYjpSgU/QWkhMIl2lTse/oOG1BEYx2E6hYtu8HHu
         M6nQ==
X-Forwarded-Encrypted: i=1; AKwUvByrF1Dw9NgxBb9iVTFbh4qIo+rH+lb2Srdl3hUZO/o1EDgZQdZNLc0Dens+ZO9F9mW+ts87lK/UQ+c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKmgSbVGFBu74EHzyaGt4vGI5VP6rMV/drEJK1NDobclqCfHYql
	L9XbovqdLDm14/rvp5kryi/E6AvW3u1jS2fj4zS4Jr8PdUbENT8lU1GelYl8yel9mzDF+H0gUf2
	tiqKUvg==
X-Received: from pgfd13-n2.prod.google.com ([2002:a05:6a02:654d:20b0:cd6:1ef9:53db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1441:b0:3e1:a4ac:2d5b
 with SMTP id adf61e73a8af0-3e928dc6c6fmr8634625637.41.1793647815861; Mon, 02
 Nov 2026 11:30:15 -0800 (PST)
Date: Mon, 2 Nov 2026 11:30:15 -0800
In-Reply-To: <979f3d53-d4b8-411f-bc66-cf487ff76d42@amd.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261031003309.3751-1-jason.andryuk@amd.com> <20261031032009.GIauVeaXTMNHgjYEiM@fat_crate.local>
 <979f3d53-d4b8-411f-bc66-cf487ff76d42@amd.com>
Message-ID: <aujkx3-YmRrWd6nX@google.com>
Subject: Re: [PATCH] x86/paravirt: Add ioremap_verify_range hook and implement
 it for Xen PV
From: Sean Christopherson <seanjc@google.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Ingo Molnar <mingo@kernel.org>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-d62444/1793647818-1FC69757-9C5FFC66/0/0
X-purgate-type: clean
X-purgate-size: 368
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026, Jason Andryuk wrote:
> On 2026-10-30 23:20, Borislav Petkov wrote:
> > And I know Sean doesn't like X86_FEATURE_HYPERVISOR but sorry, nothing beats
> > a oneliner at the beginning of print_s5_reset_status_mmio() vs this overkill.

Deleting Xen PV support would beat it :-D

Yeah, just go X86_FEATURE_HYPERVISOR, I don't care _that_ much.

