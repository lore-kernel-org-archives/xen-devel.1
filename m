Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB1606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o78V3uyd
Received: from list by lists.xenproject.org with outflank-mailman.1466414.1676439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMucw-0006r9-Ew; Fri, 30 Oct 2026 21:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466414.1676439; Fri, 30 Oct 2026 21:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMucw-0006r2-C9; Fri, 30 Oct 2026 21:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1466414;
 Fri, 30 Oct 2026 21:59:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <visitorckw@gmail.com>) id 1xMucv-0006qw-1J
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 21:59:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMuct-0014bi-WD
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 22:59:08 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae5132a-8faa-0a2a0a5109dd-0a2a450a8ae8-2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 22:59:07 +0100
Received: from [209.85.214.174] (helo=mail-pl1-f174.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <visitorckw@gmail.com>)
 id 6ae5132a-f2d2-0a2a450a0019-d155d6aed900-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 22:59:07 +0100
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2e9d1114320so9701255ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 14:59:07 -0700 (PDT)
Received: from google.com ([118.150.148.19]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae8454327esm5361880a91.4.2026.10.30.14.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 14:59:04 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397546; x=1794002346; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgi7PD6acUYIL+i15Ys7CNpZIZoU86hFOzd/i7bJ3bw=;
        b=o78V3uydBVdEeINeaVr54vdhigm8qsTVfPUtBJ6L3/CnuKLkEhvrOEK3ru8jeZ3A01
         Z0QP5YOXJEpsdCHgRcwHwNM8Ngfp0ieSqQq2E85YMrlI/1rc6sz1BAlHE5c78FiONpCs
         yxdoh33oZKliXQoaeBfuXka7CNgc+WMApHFyR2A1ulFpL3zIaamIA1QD7XZyvJ/mINNl
         3I9os607E/sy6aOLAio5DQYUvtKaRV8IAIX1X6XUvfhgBeeGHq+O8TpLxHy7tDz9O+Uq
         Kz8DqWajehZ0f3DOejFRbHX8H6Ry+h3i2E0zS1VBDM8bvxItaVCBAlMLQfLZG6rO/H52
         4QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397546; x=1794002346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgi7PD6acUYIL+i15Ys7CNpZIZoU86hFOzd/i7bJ3bw=;
        b=L6Vmp4htMlrtg56NxlUyj2EeivbXoQKhBbfMx1LMaUOywnL8g4Fm4Ai4F0WmnMBpK4
         6QHkqcWaxvVCtHHcGHV+O1S3DWlNB7qK/E10H5b4L/YOhtbr1WpYy8WipGVBwtgUqNUD
         JNc/sHJ4zwjVrkINdacRa3DQZBX/F04YbK+6uX32nTEQZEYZlcxfBKEF9iJ384gkw8zG
         L7GycLY9PCPMR0GCkBPDRRZrIlj2LMJPhFS6YwrCjFqLwGcLjGPGP6foN5eU16FkOaPw
         +CGvNCnGzRWndtHywg0VAAM4GPjo1gQAuESag30KwhCd8r/eEqN0NnS942LitSPT+VS7
         dZ1g==
X-Gm-Message-State: AFq9FYJ4oDRtbEqCzgO+06rGpVrRkCU5r1gMRPsPA+csRbafnGRulKTD
	RgmUYbtIJuqt0++mBjkUTUROOiq4dO1BxiHGb9U6zKHuhldt52AOeuy/
X-Gm-Gg: AYBFou2S0s/wwgXE9Oe/Scs1rqOAliq+mYLBvFKDspe1Uo2aG5dLUPTTqKqd6LlMx9z
	SQQr2t5DxVuSMAkXYfSCl0wnHHjynzCqDrxxxxu14uGFa7mWUJ90RzjmqO4jfd1Fm1JdG/H4nBW
	a2jkRkk5rBrLZajLGl+u42tv7gTzp68+g8jXTR6wibvyGKUYm3yYOBwra5/XcdNrMpW4w7Q664g
	pcMv/zIyNZhFnA/A+SWFO3Xr4cHdYNGtSojWJieI91p0+FgbayG1gRwQRDdrgJK2cgh5DZ3VKrD
	E80bckW9xe212kG6D+6V+vdTqCJW9Sh+9jt2WD5ruVpSRHyIaIlmELkVvwbegpYcgbl8TvRlF1u
	fmcumYL+Sgt+9+Nviin6334B6Gp4USwgshGppxU0dVs38do7fKxlG/rJgfNR+NGzMGTkfSgPqEG
	QQyZfpNQhMbo0w3KTJFta88Ynf2XvMK7dVngwh0D71wLMYk9pVkHWLAYcYS4yek3pnhPOGmDzoe
	IkTmqTTu9jw1vobRI1hlQ0box344pE0hMJL2PGopYDdwlwJGvclvO6jW/ro7AmbrvSP8TfbM4eF
	VDyuLR3EuGvlnfLuJpC//MBGboHxWw==
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr1750429a91.5.1793397545841;
        Fri, 30 Oct 2026 14:59:05 -0700 (PDT)
Date: Sat, 31 Oct 2026 05:58:23 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	bertrand.marquis@arm.com, marscheng@google.com,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com
Subject: Re: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
Message-ID: <auUS_7jNO-0ONE1e@google.com>
References: <20261028211737.17629-1-visitorckw@gmail.com>
 <d25a667b-5126-4c57-b379-c31c4e7645c6@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25a667b-5126-4c57-b379-c31c4e7645c6@amd.com>
X-purgate-ID: tlsNG-4011c0/1793397547-4ABD8CFC-31D6C958/0/0
X-purgate-type: clean
X-purgate-size: 1985
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

On Fri, Oct 30, 2026 at 12:04:58PM +0100, Orzel, Michal wrote:
> 
> 
> On 28-Oct-26 22:17, Kuan-Wei Chiu wrote:
> > Xen creates a second /memory node for Dom0 from
> > bootinfo_get_reserved_mem() without checking whether those regions
> > belong to host RAM. However, /reserved-memory can also describe
> > on-chip SRAM or firmware regions outside system RAM. Listing them in a
> > /memory node causes Dom0 to register non-RAM addresses as system RAM,
> > conflicting with device MMIO mappings.
> Hmm, I always thought that /reserved-memory is to exclude regions from memory
> described under /memory. That's what Xen assumes too. map_range_to_domain() for
> example does not call iomem_permit_access() for such regions because we assume
> it's RAM. Can you provide more details of your board e.g. the device tree? Is
> there any documentation I could use to confirm that "reserved-memory can also
> describe on-chip SRAM or firmware regions outside system RAM"?
> 
Hmm, your reply initially made me wonder if this was caused by a
non-compliant downstream device tree on our side, so I checked the
DT spec and upstream Linux.

The devicetree spec does not seem to explicitly mention whether
/reserved-memory regions must fall within the range described by
/memory. From a quick look at early_init_dt_reserve_memory() in Linux,
the comment there also mentions not worrying if a no-map region is not
memory as it will not be mapped.

In upstream Linux device trees, there are cases like
arch/mips/boot/dts/mobileye/eyeq5.dtsi and eyeq5-epm5.dts, where
/memory starts at 0x40000000 and 0x802000000, while /reserved-memory
defines an on-chip sram region nvram@461fe00 with "nvmem-rmem" outside
/memory.

Our board's device tree is not upstream yet, but it follows a similar
pattern where /reserved-memory defines "nvmem-rmem" and dma pool
sub-regions inside on-chip sram outside the dram range described by
/memory.

Regards,
Kuan-Wei

