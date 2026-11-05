Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501F606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=ehDn0Weq
Received: from list by lists.xenproject.org with outflank-mailman.1475842.1682352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6ey-0006pb-Nf; Thu, 05 Nov 2026 23:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475842.1682352; Thu, 05 Nov 2026 23:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP6ey-0006pU-L2; Thu, 05 Nov 2026 23:14:20 +0000
Received: by outflank-mailman (input) for mailman id 1475842;
 Thu, 05 Nov 2026 23:14:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@paul-moore.com>) id 1xP6ex-0006pO-NT
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:14:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP6ew-00Fk0f-Of
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 00:14:18 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <paul@paul-moore.com>)
 id 6aed0d7a-bab6-0a2a0a5309dd-0a2a4502b6e2-34
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:14:18 +0100
Received: from [209.85.215.175] (helo=mail-pg1-f175.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <paul@paul-moore.com>)
 id 6aed0dc9-6ca4-0a2a45020019-d155d7afe87d-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:14:18 +0100
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-cc758830601so23319a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:14:18 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=paul-moore.com header.i="@paul-moore.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793920456; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzW4M4agcbx7sJ8BUD2ixJaDVSoLH20R1ZoMmPjo3rZ/0y8pNmQrE9vmjvwkdvT8Hn
         yy6DsQ0UOUqm7mO3DfA1hkBU/+yN3LYtV7mw594NuMu/iLEROLUDI85S83cSixXQB/08
         CVs2nXXPzMR0p+1VCOiqoBBko02ByLGhpFnvo7TNkdR1jzUv/Yai+gRiH3rg6k6rMbBy
         WzRhxEdbGUHmvQFGvKDy5hMTUo4MduNVmB7UgXJ6K3MPrgIwO3NPeIMJilrqKTq2TZVp
         B6gKZ4lUCtSWL7QQ2zpVwUFE6Z7i75Xd93Q8e2wwXRaRCOhd6TAxXYt6ptAmFh8x+1XW
         rWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        fh=MfGFRDDCXYV+Dv1AAnb83D2cWHbOVtfldSnJ1j3tI5o=;
        b=Nn4cFa27+LM3h8vT2TPn3YV+SHV7+lJPXddkLGvJuOxAjVs1axe1pTFzAiOqNNc7sp
         2y2uwa2obP5omgI+jAZk3angoBlh8UK4u0IWV1JzYeSEbzOtrwmCn9syIdTPsz+j9a3c
         BEcIk5S0a914Vj3B4G6NcjXIrUxBttfjF90DoW/IW9/F84eAZu1Z4pmgzF19XDicf0f7
         U7iUx0QCPjy9NVoWj/ChB+Yc+gZ9q7C2o4TDJTmhxe9F1pKA3ACWNoZ4Q3OBo65D7i9N
         6DHwH+4RhFZdFAGqciJvhPeH9QmUNblygtfsSZtD43igIaMp0LbN0nQmNJiYo/yC4Is8
         92cg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920456; x=1794525256; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=ehDn0WeqbrX8tXbGpL592o978uh6xXAYSSjmiDnxqTVt7kwyR6gBX1LTi8JqwPrs1o
         YEC6Nw1fEu1/vDkL8j06qZ7br5Ffjt0GHoyWIpjCu2TCe+toU9n13HCUlPO8sJ+kxugC
         6wfQ/57rfTaVsnMVTBBDL8CR+mq9xbEaSOSYvKM0Z8+IWa7rE4EZCtrxSzWm8pw5B8dE
         CPojTq2mlkevCV32jyVHnM/k8ngTu3qghZiLrtVrujNekUxNGxIj7e2dzKSj7ECXoUaH
         Qa0FSJrX+L3HuYjTjnqOChBJTyPzuv75c8p2sask6DSH8T6mhtG4/YdMog47p63othGu
         k6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920456; x=1794525256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=mWARwik6WQtXQV84Hfa6+orr6nCH4t1zfYvRJYmAcblPxcLFCFuo9IkCAALQX5IWK7
         rVSLC0rANzpi3Hr36TN3w3BXKah0hWE4A9f2TnYLHeOws4QEMSXBoT3YB+0erjrHDDn5
         UPu/oiYac6W2Hsm98bpLyYR9jHGdFXb0ulArPBR/45PTb2Rvmcu+GfrtJA9BrlXwb5Zl
         deAv97dfuESGHcP/5Q3cNsv8EwmOgYPud9F8bcuH41v4Pw374GJXu5VGh0noB3Xu4E8m
         VPFUvwLHMt/+hjKHjk2zXGPLr1GZsN9uIxdPpEpPpZVpAFJw1h6e1h2pnKpyS3i0XEPu
         jcRw==
X-Forwarded-Encrypted: i=1; AKwUvBwmDp04/VjoLfUdsCNJ8DITQGVbVxeABFpMIvj2sF+6x3XZ8W0Pac6IrGEn5Cw1RCkjwxD+JD1GSqY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+SP+ou/Zy0G4G2zYB9yFR8m1jCuk9e0CLVyrn/NARatYIcpEig
	irZrsorHPGSG4+f/F3XoO+cUj7MzTAVzClLA0tIaGf4WOCUVxs/Vx7nI0m6+D+HfCjWMSqPSt9J
	vXRAVHU7Q/XhZjoAmzqmXsz+o2c7TXDHV2tyxef00
X-Gm-Gg: AYBFou1Thkxto87t5HpEqFXOA5KD1H14iF5exP+ulwwKvYhXJj8wQGlU8ZTTX7Yw1Vz
	WBQ8hiK4R9I8X6pOQPU7Jspi9kfOn28SEtFbigGsYE7vWsqIDUDiw0qJ6Tx6tO007E9ooxMKtL9
	S6tmc+4qYb+6ZkKkPEwuF5jCMGiIMDf+9LUYPmgLoItBzcKi6uYMFEr75ZMqGqla3mjeW80z63U
	ZjhCsJNaqrnD38TB8agwPnxEA7vJQeYBdAxbq1csA2EX1qLihzZs6IG/nePF3bgaZGOsQv59hEQ
	lh/WRv0CSSgsvOEvQ4qgiEMjyPVMcXDYrhaT7nJOCdDbRtvv7FVlx63K0KuWXgI/MP2mc6D3PNQ
	EUGP/XOh5pzFuul3qbtHdBV1VjWZFNtfI38EzujfCkTzEtO4fsRx84F0d0t588YagwUCL
X-Received: by 2002:a17:90b:48cf:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3b0db6e8ca3mr534231a91.45.1793920456567; Thu, 05 Nov 2026
 15:14:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:14:04 -0500
X-Gm-Features: AclHuK-Yq9Ya_gmjsTlhf760be1vg51BQVbAOtNinoyo6VpZvAmG2k73A1wV2Mc
Message-ID: <CAHC9VhQcmX09Do8BmY-HYJEWKiw7Tf-ZB=EEr9K6t5dBzk0SSQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] selinuxfs: convert mmap hooks to mmap_prepare
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
X-purgate-ID: tlsNG-720697/1793920458-678BC2AC-452211E6/0/0
X-purgate-type: clean
X-purgate-size: 835
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:07=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook for the
> policy and status files.
>
> The policy file only sets VMA flags and operations. The status file remap=
s
> a single page, so use the PFN remap mmap action to do so.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)

See my comment in the cover letter.  I'd prefer to take this via the
SELinux tree so it can be included in all of our SELinux testing for
v7.5, but if this has to go through a single tree with the rest of the
changes, here is my ACK.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

