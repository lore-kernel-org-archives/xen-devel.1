Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7039BC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 11:51:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383318.1626570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wra95-0002C4-KS; Wed, 05 Aug 2026 11:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383318.1626570; Wed, 05 Aug 2026 11:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wra95-0002Bx-H9; Wed, 05 Aug 2026 11:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1383318;
 Wed, 05 Aug 2026 11:50:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <matthias.goergens@gmail.com>) id 1wra94-0002Br-5b
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:50:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wra93-00EoM2-Dm
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:50:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a73238f-bab6-0a2a0a5309dd-0a2a4506cdba-20
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:50:49 +0200
Received: from [209.85.216.51] (helo=mail-pj1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a732397-195a-0a2a45060019-d155d833dd7d-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:50:49 +0200
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-38e42560ebcso782359a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 04:50:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3903927db6esm2936674a91.10.2026.08.05.04.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 04:50:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785930647; x=1786535447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VOjG1qeqbpED3aclWfN9lJ5XhH5+1/8WZV2to/loYI=;
        b=KKR1bP08mU+SuGjic3P6//TyuUZDxrUn9Ytstok6joEPW/pUUciN+vt4yFwuI+iLjl
         ylmmr2O0ljuIsjdR8sKXRW1d2ba9+jvXYVVae/6Z79KlovdgmoLVxfnlq1hhBtf8JyRb
         ZMwvHouttC4MZumNX8+TQ75Pv6qux3DuVOGeWjskLAagRDkpxKwfxY9X+hjE1Fp1YSW2
         Lqvf8Zr2ZNPjVtT5gGTyrRNH+mMlp2RCOmeWtHvabn1iozvPOGI38/rhE3iJ+mhocFXC
         d2g13h2YHAnQPD3j7puwkWdxZXFCEhwP3jcdr5JN/GSwrJ6ZSsEDmVxInHWhcZbEzHxB
         xc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785930647; x=1786535447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VOjG1qeqbpED3aclWfN9lJ5XhH5+1/8WZV2to/loYI=;
        b=bEQV+Li4vWyHNg8LLvlyXJWgpPjbm7OiQiO1iyayIqnk387xZb/r8ZHNbmgZdlC59o
         G1CwAU+byGGq2pCx7qnf1nx7HQY9209eUZUFzb805JChogkHdzOMihZ5Fr8ZWAnERSjW
         RGRYNXmJ+L52ZPezZ6HHWOfC3EJw7S8a9bLzoy4YpkmL7F0SCyPIi7ok+dtRForrshHV
         N2yfrqiXq3joeMA6AiZM+NKgwjun5SsnuHbryeUr6mzgi/uLHsSgJMJpVCewZQdQdyXm
         +e9dfbb7G1XgwPqizFmF1FeDs50vhNiLPqkPIctmhLDYTjCSUHv6ELRQUgUNOhRPqGmi
         ZHRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDUIyktbVk7NKRGl5K+DM9eBCC9iFPOLwstFIEXmJkfU4zmUe2+tzOkV+dU98jufGZrJfm2NDD2ro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHq2z7dKLO3lSXUqKzkagw30mTXYN9BnhQevBB9fGGlWJzKPbf
	Z0Fh9KISfmgYXr80KhvFS6RihyTXU8WZGFO0UAhm6cimqCFzQsl6XggV
X-Gm-Gg: AR+sD11k69vJlZItCT4mONKBT+SjNktcDFZVzcjYpaZDNAIgAxLv8Gxfc5SVHPw0xua
	LvJXBMKErySilrvSBvBAcaGF4SyX08SL4oqS89Q7H0/+WHBap0VF3c2O+Zwlm0wyzU8c1C/D0Qb
	lLsJJGAw8eoG+LCIPz4p63nHmUBlsswekj8WzOqXvxLAWk6CSKOBSriWDAGIN+IrXIiqsfb3fU6
	VVYYf81F7wcRQVvOFxnLSglFrRKdfsCOooe8iDB3gxWx53EMz5/mSS1igkovxzV4Ep+S9xkI33Z
	LCYCxS7oDhikvHfkk5XsqA82XPeJ1vFCKl3KfFhAigpXNaZ8X6k8rAjuNNTK5FKtNYblsmQp8bN
	UrI5IXaAgfHSBIEPKXj74rC7eBhKX2X8s1v71GEqbiGm+e1inOyA6+WoOPK2PZRbnVLyIck+LOT
	cTbXatxpquGZkAewV585Xu3iOmk0PGLn/MJZ8jmuCRI+zamDcMpakHR1DjaTINjlx5BrZ04XpWx
	WQfMkvqafc1turj1bGYq+WDBJtRKzhoWTfZXemBdaj2FCilyceuliAJ831T5eBJ9OUAF0cA4KgW
	L1NNrmN/bZBQF6PXkE6xHVzm/nWTZuhHgkGHJqvZHBxXPZsmOJzo
X-Received: by 2002:a17:90b:224e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3903c5c443dmr5103146a91.16.1785930647103;
        Wed, 05 Aug 2026 04:50:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Roger Pau Monne <roger@xenproject.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yannick Martin <yannick.martin@okazoo.eu>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] x86/xen: fix init of balloon stats again
Date: Wed,  5 Aug 2026 19:50:41 +0800
Message-ID: <20260805115041.409008-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805094008.95778-1-roger@xenproject.org>
References: <20260730143548.39320-1-roger@xenproject.org> <20260805094008.95778-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785930649-F440377B-5E610B4F/0/0
X-purgate-type: clean
X-purgate-size: 1104

Hi Roger,

v2 looks good to me.  Keying append on the source of the initial count
covers every case I can construct: by inspection, a domU always enters
the fallback branch (current_pages stays 0), so HVM/PVH domU and the
dom0 hypercall-failure path share the subtraction branch, while the PV
start_info path and a successful dom0 XENMEM_current_reservation append.

I also ran it on a nested-KVM Xen rig (Xen 4.23-unstable, Linux
11028ab62899e as dom0, static busybox initramfs):

- PV dom0, dom0_mem=2048M,max:4096M and 3072M,max:4096M,
  CONFIG_XEN_UNPOPULATED_ALLOC=n: no WARN, current_kb matches dom0_mem
  (2 and 3 GiB respectively).  Same with =y.
- PVH dom0, same two memory configurations, =n: v1 WARNed in
  balloon_init and returned -ERANGE in exactly these cases; v2
  completes cleanly and the balloon driver initialises.

(Scope note: PVH dom0 userspace stalls later in boot under nested KVM
for an unrelated reason, so the PVH evidence is boot-time dmesg and the
balloon sysfs state.)

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>

Thanks,
Matthias

