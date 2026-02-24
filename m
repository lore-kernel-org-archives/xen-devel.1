Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398BEE9B25F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Feb 2026 12:35:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1239992.1541454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurcf-0001wb-6U; Tue, 24 Feb 2026 12:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239992.1541454; Tue, 24 Feb 2026 12:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurcf-0001wU-2r; Tue, 24 Feb 2026 12:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1239992;
 Tue, 24 Feb 2026 12:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48fD=A4=bounce.vates.tech=bounce-md_30504962.699d9ad8.v1-441dd13042b043e084cde212e7ffca24@srs-se1.protection.inumbo.net>)
 id 1vurcd-0001wO-VS
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:34:40 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bbf4dc6-117d-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 13:34:33 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fKxxN0Vjyz5QkLd6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 12:34:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 441dd13042b043e084cde212e7ffca24; Tue, 24 Feb 2026 12:34:32 +0000
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
X-Inumbo-ID: 2bbf4dc6-117d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771936472; x=1772206472;
	bh=s5qi7uPRrfCegLpwk9h+nXdmi/P0H3e2sU4RGf+LcMQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=R68FeCrFEEAxatJkaRUPSfZFmOV1nONhHD4OgqtyMmUJnqyCZp3WfV/h0UxquqgqT
	 Mqt4BNTnVin3aypZ5W4ZrRxptE6vW8hXQ+HMsXV+c6tDThbyg5c1DdII8ymhaujJGp
	 oD3hwUEGkek/EzWtDYYWGLuOR6CkbYXZXjJJvRtkhdYQBd8mJLKWDkev5drRYSU+1x
	 rXQGimU8Z2x52NQwOHNul2ivGzHzxObl2MO6Xz8YliBv6Ic0+jVqYO4PgEq6GZ1mDB
	 V6UGzX07ESrpAMFJNYTq+VNKJ/TNgEDf4gnOx4hf5dFd8HczTYP/n4Pqk9OEKrtJtp
	 5iiBKY9vGga4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771936472; x=1772196972; i=teddy.astie@vates.tech;
	bh=s5qi7uPRrfCegLpwk9h+nXdmi/P0H3e2sU4RGf+LcMQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=D5kKCx28xONPo3r2NpigrMCZc+BdJ7Yz2IVWAdOJ/CYkY8DhvOheqwdp/mAzInjy9
	 90skkDF/+yy1bicT2ZiatWF9DCP8hbyeX+mtH2OI+MLJoH+kv4KI1okU6fBIjNbP8q
	 IjmpRq/EJhOi7A7NiPg9VymG4qn0ifYbRyhvGhueRHCANqx2kEEBaJED3bhyxoBhLW
	 9yConlS7JAGVr4itTlllYaAHHe/Oz7VnesM8AIf0aAFXmd26almwxbVSKdMsraf+Av
	 mj5cnZKezsjrPUvgISnB7ici9GolrgOvRL1++uCXajqsW1jCoQWRN8s3LLJZyPo3Cv
	 whRXmk+t0ctQA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20x86/xen:=20Consider=20Xen=20PVH=20support=20in=20CONFIG=5FXEN=5FPVHVM?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771936470614
Message-Id: <962fa327-2e9f-41e5-8382-71ace6fb0a10@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Juergen Gross" <jgross@suse.com>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech> <aZ2IB9gBo_DrZLSf@macbook.local>
In-Reply-To: <aZ2IB9gBo_DrZLSf@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.441dd13042b043e084cde212e7ffca24?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260224:md
Date: Tue, 24 Feb 2026 12:34:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 24/02/2026 =C3=A0 12:16, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> On Tue, Feb 24, 2026 at 10:51:35AM +0000, Teddy Astie wrote:
>> It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
>> and no CONFIG_XEN_PVH. That leads to inconsistent kernels that fails wit=
h
>> "Missing xen PVH initialization" when booting using PVH boot method or
>> display various errors and fail to initialize Xen PV drivers when bootin=
g
>> with PVH-GRUB.
>>
>>      platform_pci_unplug: Xen Platform PCI: unrecognised magic value
>>      ...
>>      # modprobe xen-blkfront
>>      modprobe: ERROR: could not insert 'xen_blkfront': No such device
>>      # modprobe xen-netfront
>>      modprobe: ERROR: could not insert 'xen_netfront': No such device
>>
>> When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, hence=
 when
>> booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even when w=
e aren't
>> actually one (in the "with HVM emulated devices" sense).
>>
>> As it is actually possible to boot Xen PVH without CONFIG_PVH; and that =
most
>> Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests sup=
port
>> within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.
> 
> So the current CONFIG_PVH selection done by CONFIG_XEN_PVH is moot?
> 
>> Keep CONFIG_XEN_PVH as a shortcut to enable PVH boot, ACPI support and P=
VHVM.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> A tentative patch, I'm not sure of the way of dealing with the KConfig p=
art,
>> keeping CONFIG_XEN_PVH as a shortcut is interesting, but there may be ot=
her
>> options.
>>
>> There are widespreadly used Linux distributions that have a similar conf=
iguration
>> to this one, thus exhibit this issue i.e fail to boot.
> 
> Do you know the underlying cause of not enabling CONFIG_XEN_PVH?  Is
> the default set to n on the defconfig?  Or are distros specifically
> disabling this option on purpose?
> 

I'm observing in these distros that

 > # CONFIG_XEN_PVH is not set
 > CONFIG_XEN_PVHVM_GUEST=3Dy
 > CONFIG_XEN_PVHVM=3Dy

Which makes CONFIG_XEN_PVH defaults to n.

> It seems like a step backwards to merge this into some bigger generic
> option, we always try to fine-grain as much as possible.
> 
> Maybe you could introduce XEN_HVM meta option, that selects both PVHVM
> and PVH?
> 
> Thanks, Roger.
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



