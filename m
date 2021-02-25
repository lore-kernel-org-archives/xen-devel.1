Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7C6C433E6
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAB464EC4
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CAB464EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89744.169298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGQ2-000088-8y; Thu, 25 Feb 2021 13:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89744.169298; Thu, 25 Feb 2021 13:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGQ2-000081-5y; Thu, 25 Feb 2021 13:11:02 +0000
Received: by outflank-mailman (input) for mailman id 89744;
 Thu, 25 Feb 2021 13:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqz4=H3=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lFGPz-00007q-U3
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:11:00 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d449a19c-97cd-4124-a8f9-ed2bf40b5728;
 Thu, 25 Feb 2021 13:10:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t15so5165886wrx.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 05:10:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u142sm7679305wmu.3.2021.02.25.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:10:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3BDF1FF7E;
 Thu, 25 Feb 2021 13:10:55 +0000 (GMT)
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
X-Inumbo-ID: d449a19c-97cd-4124-a8f9-ed2bf40b5728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=mgnS54OEhG6StWQlfiBayFcuQ+35hFIjW41rG7EyOIg=;
        b=DULLN3DamYaBSd1mz/P66d69FaXKvQCld4aT8OhnoqB/9Zqk2X9jx/zMrHWzZZujrV
         Ot7gwsbN4PNyjfAHo0ToAx5XMnAbHveODLpa75mriUf1hB5SVMcfcu7MFNXO/jVpUloT
         kcyQ7QgMoAiVzKshAn8lYpN+LfRoubKgNmR9y/YHp0wfwYj/B2AUA4ddGMuttIV81mzS
         v04v5hZbeCoj/tSkdbwhn0qz7iCo2WhIz0A47i9EjMYZMmG7o1wBX/2vk2TJPVaHbh7g
         efE0qtqFVmusG/SS1v/sEbsBWOTLmQEaLIC5v+bITGtE+8GQIiL5aVKW00AOIHT6GuaW
         pobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=mgnS54OEhG6StWQlfiBayFcuQ+35hFIjW41rG7EyOIg=;
        b=i1hHRpUkEMNncqXYCuiQbUOr7Slllujmbhj9Ot8H2ezpeWU7Xh/vpzRUGp4iVUsxrw
         T32Ee8AARS2PI11Hy0Vs0CYkmtqR6GyMEHg0pSLVddT0q2yFt3dF7LJFBytAnBiUbt2L
         HhSxH6hz29InU492R3C+XCbmIN6sq6RpZ6KkwoxHVvGjwWpvSRXayxpDFdlLRfwZ/RfC
         DK5GGBgNNm8BlR8wH+T9NLTV7K0ViYzxZvAPuqY3ApOnN50IilWqV/9inHTTCv/ki+mJ
         g+mzi2rXk5UljRZ0vDnZVQ0j5k/gjSiHDk9w5X9WFZ+qojuEkNjWCedZ9ZkUbe/T2NdV
         QUDA==
X-Gm-Message-State: AOAM533vWWVHARpF8FVQDShsin8zL+5tyjnAtso2BXEUnqIDTGh4DA1+
	X2eIFYMn/M30nSMRlBo+9k24SQ==
X-Google-Smtp-Source: ABdhPJzbUAyxaW4v8GaYgwhteEyl4EmN5AQfIY3i3VygXCemdi8fb3flI6/NTDdme8q4XH5MGuvTSw==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr1751149wra.272.1614258658131;
        Thu, 25 Feb 2021 05:10:58 -0800 (PST)
References: <20210211171945.18313-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org, stefano.stabellini@linaro.org,
 stefano.stabellini@xilinx.com, andre.przywara@arm.com,
 stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 0/7] Xen guest loader (to boot Xen+Kernel under TCG)
Date: Thu, 25 Feb 2021 13:09:58 +0000
In-reply-to: <20210211171945.18313-1-alex.bennee@linaro.org>
Message-ID: <87y2fc9tsw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> These patches have been sitting around as part of a larger series to
> improve the support of Xen on AArch64. The second part of the work is
> currently awaiting other re-factoring and build work to go in to make
> the building of a pure-Xen capable QEMU easier. As that might take
> some time and these patches are essentially ready I thought I'd best
> push for merging them.
>
> There are no fundamental changes since the last revision. I've
> addressed most of the comments although I haven't expanded the use of
> the global *fdt to other device models. I figured that work could be
> done as and when models have support for type-1 hypervisors.
>
> I have added some documentation to describe the feature and added an
> acceptance tests which checks the various versions of Xen can boot.
> The only minor wrinkle is using a custom compiled Linux kernel due to
> missing support in the distro kernels. If anyone can suggest a distro
> which is currently well supported for Xen on AArch64 I can update the
> test.
>
> The following patches still need review:
>
>  - tests/avocado: add boot_xen tests
>  - docs: add some documentation for the guest-loader
>  - docs: move generic-loader documentation into the main manual
>  - hw/core: implement a guest-loader to support static hypervisor guests
>
> Alex Benn=C3=A9e (7):
>   hw/board: promote fdt from ARM VirtMachineState to MachineState
>   hw/riscv: migrate fdt field to generic MachineState
>   device_tree: add qemu_fdt_setprop_string_array helper
>   hw/core: implement a guest-loader to support static hypervisor
> guests

Gentle ping. They all have reviews apart from the core bit of loader
code and I'd like to merge this cycle ;-)

--=20
Alex Benn=C3=A9e

