Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C9C88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 09:20:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418305.1646473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5JuA-00015p-Qb; Sat, 12 Sep 2026 09:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418305.1646473; Sat, 12 Sep 2026 09:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5JuA-00015i-NP; Sat, 12 Sep 2026 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1418305;
 Sat, 12 Sep 2026 08:50:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <suunj1331@gmail.com>) id 1x5JRP-0005Pj-8L
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 08:50:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5JRO-00ASB2-LY
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 10:50:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <suunj1331@gmail.com>)
 id 6aa51240-e002-0a2a0a5209dd-0a2a4507c87c-20
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 10:50:25 +0200
Received: from [74.125.227.140] (helo=mail-pj2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <suunj1331@gmail.com>)
 id 6aa51250-b4ea-0a2a45070019-4a7de38cfb6c-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 10:50:25 +0200
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d8fb334ddcso7035685ad.0
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 01:50:25 -0700 (PDT)
Received: from fedora ([61.74.238.173]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd2ccaceafsm21924715ad.9.2026.09.12.01.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2026 01:50:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203024; x=1789807824; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F06q9s994N2wdwEDu0iitxn9mZtTsmX3Vz77YooKqCM=;
        b=oBSomCXAyZIeeZmsDIkJd+3U+ivimm1iSt6LlVGg9LfSLBgJaACAiyxNUs6GAn6LWV
         ySRH5U3TXz3YBpLarXKF8JA8ZGJtOCPCvoKma3VZDFQoNyTud114gf4vHM/ilbQY/Kj6
         bMShdpcJV4SsBRi3I0bsxx9KSjgabvGVQqM5T/zyt3o1DjPT0KrWY7nIhNIs1PnIx2Ks
         8JkdC6f47LwYYpz+0qVSVmTVbwey9ywcekWHsp3NwUvXgiqoK39YOhKFYGBRWhjuVRoI
         5hsbEqashAfjziBSdS2IKBSFTdJiCfP+WkR3geVRXr128/ymZGiVfIlgtRP+Wx+as2A8
         pNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203024; x=1789807824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F06q9s994N2wdwEDu0iitxn9mZtTsmX3Vz77YooKqCM=;
        b=hWH8S+t39Lz0FI+6ZyR+B+VHtimV7cZIuudqkuLaqa2hosz1lNEyCVDAWidmgxTcqc
         XoRokGFByyImwCYhmhz5/BPbtSm8EeawuZJ1PfFxFLh3jzODSr+H10ZG+dDC7+h1hdDn
         zJTTNnCWigX3MIg3aGwoRv9fLcXxTmw/jDUxith5mtnTiMV5w1z61mfBpndYxCJyt3F5
         4MGRy94yH/X9+E2vSnxTZ142b8x3brKyTBaoLexD8MS2dIGLteL5CELFcfHhz1ohrxpJ
         ATp1/7oMwn2iYy7bf8qj/DRC+YFSFtdwl82cWpeJUS8tcviXwsSf9QfTW864Aj0LA1bG
         twiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRdepfvdwGNMBJGwJP4Bj36Os+vruoRI+AbntkBoWgJGvtbwBcOyRKsxoQnmdcwNhvOu8Lie0WwDQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++mt0MsMFBAVx5hQTQNnTHV2e+DlahLEnttY/0a+3xt2a29jf6io
	hfi60/hVPkWazojXLuqT36RJ5fYpZ3oBheuSbD3lo/c6KS99lBwXBm2N
X-Gm-Gg: AYBFou2QTXfSMQRVCofJnsATw7aqrC6V36ZzrzoIEu3+XDdHhlkBmAE2ikjx8/P8ERN
	lxnUoBFOc/4rP7FQF33RTR0oTryQTUQ1PU2OMhH8j0X0D0oks6mw2vCFrdB9NVSfsq/j8GZUCAj
	Coj1nmT+RBgY4mS/HcMNa4Yb94OCwl7PBi9/ZCXvWVEDdnpmxvvN2zkn4aL+GOga9rdoMS4/YdP
	vJuumv6PxFCXEDI1vG3vmAVJ3lKybI0MuaPWMAuybr34sU0FQCwh46Qa6MqJargJxaa3NKepzTt
	coGObS7x6uUiO4uWVLrnEzhx8RRW2WDlwpApGPvMhDTjFfOUK98Aqpf4+gX2m6cJtqy3/pwIOhw
	71vh0Yw66gD3/WZYqgbazHFv+tmz7TI9DP6yilsXB6TzyZN/X7nGnVu0ynvWNxOMR6kjZF+oaL9
	8tX99X5KHcmrsAN+vCXQRdDmRIIHF+6Lqr8RQolxpdNjlujRsLSpc9cWKu8G4ysmLeVEkzjSEAL
	yNojpcFSHhKazCIdU0PRdY=
X-Received: by 2002:a17:902:f60d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd2a34fd91mr152629015ad.17.1789203023740;
        Sat, 12 Sep 2026 01:50:23 -0700 (PDT)
Date: Sat, 12 Sep 2026 17:50:18 +0900
From: SeungJu Cheon <suunj1331@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Zheng Zhang <zhangzheng@iscas.ac.cn>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
Message-ID: <aqUO_u-Spcmjcy8P@fedora>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
 <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
 <48857983-ac79-44a0-8a11-93f62ac3d0c4@suse.com>
 <efd67e96-e24f-4bfb-b484-51514c5fc18b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd67e96-e24f-4bfb-b484-51514c5fc18b@gmail.com>
X-purgate-ID: tlsNG-ef75cf/1789203025-A74D3AE4-AB735BDF/0/0
X-purgate-type: clean
X-purgate-size: 2133

On Thu, Sep 10, 2026 at 04:24:06PM +0200, Oleksii Kurochko wrote:
[...]
> In v3 I'll (a) stop using ->processor and take the (guest_file_id,
> vsfile_cpu) pair, which imsic_update_state() updates atomically under
> vsfile_lock, and (b) do the snapshot plus the h/w TARGET write under
> aplic.lock, which aplic_reconfigure_target() also holds. As
> imsic_update_state() completes before aplic_reconfigure_target() (also that
> could be checked in this patch series and is introduced a little bit later.
> Probably I have to re-order some patches again) takes the lock, the emulated
> write either happens before the scan (and gets fixed up, or skipped as
> already correct) or after it (and sees the new location).
> 
> Any better option I have now?

Unless I am missing something, the snapshot also needs to handle the
case where the target vCPU has not been attached yet:
vcpu_guest_file_id() returns zero until the vCPU has gone through
imsic_vsfile_attach(), i.e. until it is scheduled for the first time,
and vsfile_cpu is NR_CPUS until then.

With the current code, a write targeting such a vCPU makes
aplic_msi_target_gen() program Guest Index 0 into the physical APLIC
target register. According to AIA section 4.5.16, Guest Index 0 selects
the hart's supervisor-level interrupt file rather than a VS-level guest
interrupt file. Could this cause the MSI to be delivered to Xen's own
interrupt file with the EIID supplied by the guest?

I also could not find where such a target would be updated once the
VS-file is attached. imsic_migrate_vcpu() reprograms the relevant
targets during migration, but the initial imsic_vsfile_attach() path
does not appear to replay targets which were written before the
attachment.

Whether a write targeting an unattached vCPU should be supported seems
like a separate question. Independently of that choice, would it make
sense to avoid programming the physical TARGET register while
guest_file_id is zero? The virtual target could either be rejected, or
retained in the shadow target[] and programmed once the VS-file is
attached.

Thanks,
SeungJu

