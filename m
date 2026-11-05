Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418FF606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 23:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=EnWWcEGP
Received: from list by lists.xenproject.org with outflank-mailman.1475836.1682342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6d7-0006JG-DQ; Thu, 05 Nov 2026 23:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475836.1682342; Thu, 05 Nov 2026 23:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6d7-0006J9-Am; Thu, 05 Nov 2026 23:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1475836;
 Thu, 05 Nov 2026 23:12:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@paul-moore.com>) id 1xP6d6-0006Iz-EM
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:12:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP6d5-00HRI0-Jd
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 00:12:23 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <paul@paul-moore.com>)
 id 6aed0d55-bab6-0a2a0a5309dd-0a2a4506d444-2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:12:23 +0100
Received: from [209.85.215.172] (helo=mail-pg1-f172.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <paul@paul-moore.com>)
 id 6aed0d55-195a-0a2a45060019-d155d7aceda7-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:12:23 +0100
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cdb1199bfd8so15096a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:12:22 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=paul-moore.com header.i="@paul-moore.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793920341; cv=none;
        d=google.com; s=arc-20260327;
        b=L4Y4Jj/h2SB6HH9xKG2GWVk2uUkGcfnN0wDnovggsAqOPJyCUUdwvLFQX5GP4pV2R+
         HrPReXyD8AyDRQzJkbUCv9iMr/gLpuSJeDVoMVr5exy5dLReT/XJRzLDuSKK15uy+WqF
         Oa6UTcw7MCtxXIOtvCOfpN3fywVeKbJkBMUFoiDf17rOByX6UZFPBDLhUh7D9R2asYob
         VFD4O9MtQP4UR59MbCdLlJqyuxbREdHu7FQNxq+alM/U84RcrSkIh0nE/JRZvzfe2M2m
         TZLJdtbfD1krrhqzBtzc6of8LTu8xzpjVx0zq60oWdsxKyFp/dOHB05+aAEVq8VVW/r0
         fevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        fh=m1xu7JDuD9lfZam1WJ90hjSH8snyy8QYGL2JPH3usfo=;
        b=I9+iSZo8l+y8g8wfVG8mdqelCuy60+i0WUYoTWhacSrjKsCnT4XjQNl0SNAvq7gMEo
         4SHF5Ot74frb5kAJaZZ20q5ulg1+Ly57ObHmDDp+eZ4RAv+ERyXGGwihEZsE0PrlzdcS
         ZMgNmP3mQnS0IVpSstY41MvobpTYskEnrfOj3bjftYcY682v/Ri5Qs8gE3WnB61N4ozV
         3HFG3XjeK2UbhouMcpP/OqFg3XJ8yVpTtkWfjFDbyprrt1WIwNRfKw1gyXDLUDLrSkAc
         YbVEXlttLiIcgU5wCtlmfWWCeIqcAui8n1XyJtF6hha6TsDdWHUBHCfrMhNIl3vqPWrn
         2f9g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920341; x=1794525141; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=EnWWcEGP/0K2wlV7r4bpEU2AG9LwiyTqZiMHoViWinG+AbEDN9wYWUw3RkFSlj/RC+
         5JQtDcmHZ53POYg1sLjkZVX0FxSGz/WqqY/gPG5uXqNAdNCenqyVJ++yZhH7hdEpNhiX
         /otrn6BRzS02FEFc+4Dl6T7Xy0w+I1r430rMhdpKjrWQtbTYs3Xt7FblCpwd4BA2VlFi
         0NTy9LaF6U+FSc4X1KI3o4nKo75rAk3zN8Cj4l6iN7Wtz+cX4EW8qc9HKMXgqxDHYA7c
         FuwhX689Rkq2gwN4tTgANnk+UB6/CLTrrF9D9qdQzCo1r8T2KHNxCc9EWkN8ARc+HGg2
         Splg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920341; x=1794525141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=iajnV2u2EiASLEdBVKDyCJKrbVNR0WZtcd8nE6aXGNDF5kpCOWZNhljrNULL9vE5xF
         ++5BGa898uj2rX9HnMFCE2Wtv2W3vw6tpQn2uICnNnhFW9596xp7PJN/Xt61mRxb4J2s
         usGXSh5OzPtQs+HXJrbCj8uXZQS2LgUk+AVX/Rng0UJW3s33mumPYBRQVZR+G6bVgxO4
         i1k13hQBAVi0NgLNnLwJ4CP4Wcx3ouL4aoZ/QK0OlIk8wOaW7h5357bD6pYzyrQiZEfI
         DsDhRJMCouBQYErEMPhQ26y2up4Or7SZxFhrJHa93Jy8uSFKnVbEhX6qtNtf6QsDznu0
         WHdw==
X-Forwarded-Encrypted: i=1; AKwUvBxnnQdXIKHG4H8eHCDMXHi9IYIdvtY219fHImNhKajqxKTOnnK6VTGU4iuNQXq0Y6yM4NVRpO15zUE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9df0Sb2qQK6Hl0NqTNSuvq4f2zbk1IBZCSaKGJHTvgNPTNdIjV
	NW2yBv2RIDxHidrLZEUw2mgLPJcya/fxnSB7vioOlqCkXrptCDrpL8p82wrjTHZoz5VM+gjPWnn
	CLgRFpFgUeD9rJHKx2BTBeRVFYO+APBssvyMb8svt
X-Gm-Gg: AYBFou0lBlEzYaZ2Dd9zwcUHgvrGsBkhdR0ylr8Dm4IwTNxmKoAUoQZq2qFVCN5m5TE
	9ybokt0RuBgUGWhLeva2DYSZfxu7z0+e6fqzZWKnAidGomqfJsNY82f5VirFv0acydb1msUWHGo
	MqnzAJ2fp/a8sgJ1TdE4sMdflkXmuctpaTeJct05dCyTYs55b+qxPFtQ6nZr+SZL/2UfaszHMQ6
	mQ2fuz9kV698tOHiuQpZ+rI3qFFeMfhjKHalzwyqswVb2ZgSo22RpACUIUBnwuRcGSYoZHNOToy
	t2T+BzajtExnnov9FooehdIzyLW0TjRzlUK3S+5QY+hwbhKwogB09jBIYergGJ/36yqSkoHzmY0
	8D6+ptcEDPzaLE1qSbjHC3ZGNu0F7ORg2KRxBmUF+bEbj+t8GeeKGC8guFb+HSrmZXqd3
X-Received: by 2002:a17:90a:d88f:b0:3ac:b867:81df with SMTP id
 98e67ed59e1d1-3b0db6fbe69mr555739a91.39.1793920341210; Thu, 05 Nov 2026
 15:12:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:12:09 -0500
X-Gm-Features: AclHuK9SAmQ1s59IzUj_GoyUW49QmobrDei9zDR78OY4d10Tcv8mWs8d-l1JUg8
Message-ID: <CAHC9VhQvpFeEJaEyPDaqj8_S752puSaNe0Rn-hxjh=ugCoFsxA@mail.gmail.com>
Subject: Re: [PATCH 00/14] mm: convert further simple mmap hooks to mmap_prepare
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Scott Branden <scott.branden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Cochran <richardcochran@gmail.com>, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-sgx@vger.kernel.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1793920343-F647377B-B8B5F913/0/0
X-purgate-type: clean
X-purgate-size: 2953
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:06=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Continue the conversion of users of the deprecated f_op->mmap callback to
> f_op->mmap_prepare. Keep things gentle this cycle by targeting simple
> cases.
>
> No functional change intended.
>
> Build tested on x86-64 (allmodconfig, each patch individually), i386,
> arm64 and ppc64le.
>
> <<>>
>
> David, Andrew - I wonder whether one of you guys could take this series
> through your tree? Since it's kernel-wide it seems sensible to take it
> through an mm tree.

Granted I've only properly looked at the SELinux patch (7/14), the
rest I've just skimmed through, but these are all independent patches,
right?  Is there any reason why individual subsystem maintainers
shouldn't just pick up their associated patch?  Yes, perhaps chasing
down individual maintainers is a bit more work, but isn't that the way
this should work?

> Lorenzo Stoakes (ARM) (14):
>       xen/privcmd: convert mmap hook to mmap_prepare
>       KVM: PPC: Book3S: convert spapr TCE mmap hook to mmap_prepare
>       mshv_vtl: convert mmap hooks to mmap_prepare
>       vduse: convert IOVA domain mmap hook to mmap_prepare
>       x86/sgx: convert vepc mmap hook to mmap_prepare
>       udf: convert mmap hook to mmap_prepare
>       selinuxfs: convert mmap hooks to mmap_prepare
>       xen: convert xenstore interface mmap hooks to mmap_prepare
>       soc: aspeed: convert LPC and P2A control mmap hooks to mmap_prepare
>       soc: qcom: rmtfs_mem: convert mmap hook to mmap_prepare
>       tee: convert shm mmap hook to mmap_prepare
>       misc: bcm-vk: convert mmap hook to mmap_prepare
>       ptp: vmclock: convert mmap hook to mmap_prepare
>       vhost-vdpa: convert mmap hook to mmap_prepare
>
>  arch/powerpc/kvm/book3s_64_vio.c        |  6 +++---
>  arch/x86/kernel/cpu/sgx/virt.c          | 15 ++++++++-------
>  drivers/hv/mshv_vtl_main.c              | 14 +++++++-------
>  drivers/misc/bcm-vk/bcm_vk_dev.c        | 20 ++++++++++----------
>  drivers/ptp/ptp_vmclock.c               | 19 +++++++++----------
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c    | 20 +++++++++-----------
>  drivers/soc/aspeed/aspeed-p2a-ctrl.c    | 22 ++++++++--------------
>  drivers/soc/qcom/rmtfs_mem.c            | 22 ++++++++++------------
>  drivers/tee/tee_shm.c                   | 14 +++++++-------
>  drivers/vdpa/vdpa_user/iova_domain.c    | 12 ++++++------
>  drivers/vhost/vdpa.c                    | 23 ++++++++++++-----------
>  drivers/xen/privcmd.c                   | 11 +++++------
>  drivers/xen/xenbus/xenbus_dev_backend.c | 14 ++++++--------
>  drivers/xen/xenfs/xenstored.c           | 14 ++++++--------
>  fs/udf/file.c                           |  8 ++++----
>  security/selinux/selinuxfs.c            | 24 +++++++++++-------------
>  16 files changed, 121 insertions(+), 137 deletions(-)

--=20
paul-moore.com

