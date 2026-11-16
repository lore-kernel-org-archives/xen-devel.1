Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E3606A329
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bg2IMMST
Received: from list by lists.xenproject.org with outflank-mailman.1490800.1691764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvOM-0008HW-6w; Mon, 16 Nov 2026 12:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490800.1691764; Mon, 16 Nov 2026 12:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvOM-0008HP-2j; Mon, 16 Nov 2026 12:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1490800;
 Mon, 16 Nov 2026 12:00:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3d_D6agkKCaICNKEGTaJNIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--aliceryhl.bounces.google.com>)
 id 1xSvOL-0008HF-3r
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvOK-00BlqV-Fi
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:00:56 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3d_D6agkKCaICNKEGTaJNIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--aliceryhl.bounces.google.com>)
 id 6afaf06c-8faa-0a2a0a5109dd-0a2a4503dd7c-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:00:56 +0100
Received: from [209.85.221.69] (helo=mail-wr1-f69.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3d_D6agkKCaICNKEGTaJNIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--aliceryhl.bounces.google.com>)
 id 6afaf078-fae8-0a2a45030019-d155dd45ed54-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:00:56 +0100
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-492e3189fc9so2149974f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:00:56 -0800 (PST)
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
        d=google.com; s=20260707; t=1794830456; x=1795435256; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=Bg2IMMSTpLmUoz5HVT/7zQhudL0n7hx9IE4yQfBFVDB6H5TAEehHrQ96D7DUZxV+Dv
         k34RKAetvcGzzx76Fv8b53fcMma2/pes0QzTReuf3oMaNpiV5KmJenCrmmbd7hLAgeto
         Imh0JQQuiEH3VA6uRhvRwdlFPbyqpfpIfWgWD/PiceztY/fTnozyQHlmFvvbhsL7VbR7
         6l2D6khtjin2EAEjwTYvyhtHi0QJEMd7dgRxa2cEYH2vlDehhEvGGDX5JTJlf2fjmIXw
         y/brwmx9RTVlaW+ur1nlrBtAuU++cTKKMcaOBFZTQyRS1fKfCmCa/Wn18V7DlJFKdYTf
         W7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830456; x=1795435256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=PhnxV4EuBLx4gnoBNhJUvWxvHSts+B4HhJMvXwPMLcXBUOxunI+eojga9hY3p35DGi
         QOgKKK7BVppsv/K5fGJl8XesfXrMi3ejLX45QXQSqqywqNIcgqxf1OlXsy0awfbfcHdu
         J8lictQXpgibOBhlbPc0BrXtfKLMDV7Pvh1d1q7iLtuAF1bmt4PMS0bDvGFz11fp1fFx
         7i7qbGBki0VEqn+oBL7cN9OM8ImR+VMlS13nNkyTtgANTUEt6P3lsfVaRKt/D6MArRzD
         cTa704iJKbkO2iSwLdszkl85TtqNAc54aTVdG7o0RIkzNuzVfW11m3lo/1q4MTr3zKaH
         tQEA==
X-Forwarded-Encrypted: i=1; AL+hErE25EEgCqlpt9QSv0Vd3jgdEHPfS095Q22jze9GLny4/Ev8drrvRkpvKL+My3FZk+Xu5F2L+wHLXhc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z97Utt+57VsplQEcFR9qpyPIMhcNu5W9gk+lYKOirdTcwzQUbmj
	WyYCMQpc7PzqIijeDH5yXXJ8YjuiIn6s88Bwmyz8BQQNLiZvbPKgvntMky+LI7xtEL17BI1ULWw
	LJvo71F0ZiX/SkFfCLg==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1794830456-6C8DD4E9-6622B032/0/0
X-purgate-type: clean
X-purgate-size: 382
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

