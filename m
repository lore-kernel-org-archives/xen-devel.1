Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107F606A326
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWFoCALw
Received: from list by lists.xenproject.org with outflank-mailman.1498020.1696038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULxE-00032k-4m; Fri, 20 Nov 2026 10:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498020.1696038; Fri, 20 Nov 2026 10:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULxE-00032d-1H; Fri, 20 Nov 2026 10:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1498020;
 Fri, 20 Nov 2026 10:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULxC-00032S-UN
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULxB-00Ed7I-VV
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:34:49 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b002243-e002-0a2a0a5209dd-0a2a4505e150-14
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:34:49 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b002249-4cb1-0a2a45050019-d155802bbc69-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:34:49 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so6821125e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:34:49 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm74221785e9.7.2026.11.20.02.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 02:34:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170889; x=1795775689; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNvlPl741+U4l+0ORb1xAhpkhfBh5sTTrJtO4j0+I94=;
        b=zWFoCALwBOTcDJuADMshZuj3zMVijQ3LhvTKWONX15FsowizDBg0F1od/xvZWC79JC
         zoZfr1EJdL3E36Ys1GBFwyZ+mbccBVInIaGY0c4lWGjPnQKKpQZHbYb3gyS1yx4NlMld
         mrH84bqPD47jQ0Q1CaLtG75pjD47c3Yr4Uj94uHhojEkFRgGX5TBSidwo+VyR9bYs5CN
         ykNHvLqdt4QfggxIPNi+TYoHWcHsLYoKo91Y8Mnf67fNrZijK0gy3G1ttSNZwKwgRrpA
         yK6E+GzuRwJ+420adltgyUhHJ96/DAJdzSuXq4n8uyHuBZm4usOL9KG4eZDHuPt5vDFU
         J54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170889; x=1795775689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNvlPl741+U4l+0ORb1xAhpkhfBh5sTTrJtO4j0+I94=;
        b=cMgZWnY31KWTkEPyx0gp6IejqX5JwlgJJo6mQew0G7QuOUmO2fC7EYanC2LK79lDq8
         ohgMdu0U1XKnhThhMvaIPG7crpljFQQc4fV+wiV9Yh1n5U8XqwhxwoizbKTzNXXZNsV6
         SFOJLnp1gp48PjgxrWXv5VKToBQrnraK2P6z78R8L7vSgFlMs0EY0s1NC3dPx33zMRvJ
         0ARmwPCTYq5uq4+2waC8IeSDMIiki1gTg3sNUWyp9xks2oWOHCDhWfrZV7hS5H0oX0/N
         7cWiz3HDor3DW82NN60bCoJnVOT7dcWImhnwfpfNXllTMeNDsvBvfuqraiSi+K5n1h+P
         3MNQ==
X-Forwarded-Encrypted: i=1; AL+hErHCOZ5IXHnw5KHUD78ZKzbLcLlvyN9C5d5S9v+RskYprNmJmfjAfoa4oo3b0m8rM0MADl5C6/A/2xk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/U03/+ybhA45x7DyIjt9ohGGoVImFZ7JoWHNN4CzEPdTCg24+J
	9OVBDZhJyrUk+LAjVsUs0GAc8g3sfnNcfe9he2Jb1X32oshrIH3AMKz9
X-Gm-Gg: AYBFou2axWUEOsG7lJZ6NU7KnBWKYtaKh34yrkhaxUYNktBJ6Y/HqoMd82+hpsCHqKw
	gsS/RSSlmt9d+MowZindtTpiohPb4vY0opsOJriECrTJneIV19Q21vTg3pKx8EJToGwMESO7I/F
	r70fsghCYPuzizfUP/tvIdCXK8dcNJh/k0jEtSMcFtbSzRHF8hUWx77lzs4i1ZkMm0BjIuf9NdA
	2b+j59/nW7f/YQs8/A48HcvgVcycQt5dEOU2RQT4mTbdhcnwEVEDEyqQDaPN+b/VarxkvK23Y7e
	ds+HJJmyVbSJOpcRFGjPJNWd7qUTLtlBdUVahoQNwwmcfz1Zg/VoUX+IVv66nPS+FVkKpX9ABI9
	MRSNSvWyiLXkeoYmMSFHhbXqplsAwd5jszZi+CtSkj3N+YLe01Y8MSBHEbkrJ5CGGN/PQ2JMniM
	Qsr40+37iFmzsdfWeHN4/gJNxO7ENQxpvscGKoJ+Zetvq2i5xVBeb8h08v8QHDA45eRav5ptDkZ
	aynzSFoQZqUH3Cn0TRwno6ioahJETTSk6jLZ8Pwu8qBrUoq/+DlW19X9mzAYhUnalhCK8TuYA2o
	26F89Gi0Hi0efbxiZJAOziaGx5+vVKlISzAcU2mDA9VTCcC/2/PAjplkO8RuAD3PTmlgmSccFlc
	jvSYO7B+FOHlzZOSF8OZMPnI=
X-Received: by 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr54710615e9.7.1795170889276;
        Fri, 20 Nov 2026 02:34:49 -0800 (PST)
Message-ID: <4adb2aa1-0125-4fa4-b7a6-9e1aa418ff6b@gmail.com>
Date: Fri, 20 Nov 2026 11:34:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 24/26] ci: add initial NS16550-compatible XTF test
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-25-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-25-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795170889-72AB72A1-11963E13/10/73395122804
X-purgate-type: spam
X-purgate-size: 3392
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enable simple functional test for NS16550-compatible emulator by adding
>    CONFIG_VUART_NS16X50=y
>    CONFIG_SHADOW_PAGING=y

It would help to say what the test checks, and why SHADOW_PAGING is
needed. If it is something obvious and there is no sense to put this 
infromation in commit message then could you please just for me explain 
why SHADOW_PAGING should be enabled?

> for alpine-3.24-x86_64-gcc-debug Xen build.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   automation/gitlab-ci/build.yaml       |  2 ++
>   automation/gitlab-ci/test.yaml        | 10 ++++++++++
>   automation/scripts/include/xtf-runner |  2 ++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 3d37e0b572d0..f2072f6a9829 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -290,6 +290,8 @@ alpine-3.24-x86_64-gcc-debug:
>         CONFIG_UBSAN_FATAL=y
>         CONFIG_MICROCODE_SCAN_DEFAULT=y
>         CONFIG_XHCI=y
> +      CONFIG_VUART_NS16X50=y
> +      CONFIG_SHADOW_PAGING=y
>   
>   debian-13-x86_64-gcc-debug:
>     extends: .gcc-x86_64-build-debug
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 96127995d7be..4f4ce8aab9e9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -785,6 +785,16 @@ qemu-xtf-argo-x86_64-gcc-debug:
>     needs:
>       - alpine-3.24-x86_64-gcc-debug
>   
> +qemu-xtf-emul-ns16x50-x86_64-gcc-debug:
> +  extends: .qemu-smoke-x86_64
> +  variables:
> +    TEST_TIMEOUT_OVERRIDE: 60
> +    BOOT_MSG: "NS16550-compatible emulator tests"
> +  script:
> +    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 emul-ns16x50 2>&1 | tee ${LOGFILE}

As far as I can see, emul-ns16x50 isn't in upstream XTF. With the
default XTF_SRC_URI/XTF_SRC_BRANCH (xenbits master) this job would fail
to find the test; only 26/26, marked "do not merge", points CI at your
XTF branch. Has the XTF test been posted? IIRC, it is posted. I think 
this patch has to wait until it's in XTF, and the cover letter should 
say so.

> +  needs:
> +    - alpine-3.24-x86_64-gcc-debug
> +
>   qemu-smoke-riscv64-gcc:
>     extends: .qemu-riscv64
>     script:
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> index d1ef888465c3..41deb49d1c5d 100644
> --- a/automation/scripts/include/xtf-runner
> +++ b/automation/scripts/include/xtf-runner
> @@ -70,6 +70,8 @@ function xtf_build_cmdline()
>       declare -a cmdline=()
>       declare -A per_test_args=(
>           [argo]="argo=1,mac-permissive=1"
> +        # QEMU emulates COM1 (0x3f8) by default, use COM2 for test
> +        [emul-ns16x50]="vuart=0:ns16550,com2 -- console=com2"

Could the comment say why COM1 isn't used? Xen's own console is on
QEMU's COM1 (console=com1 in XEN_CMDLINE), but since the test domain's
accesses to an emulated port are intercepted anyway, it's not obvious
to me that an emulated COM1 wouldn't work as well.

Also, no CI build enables CONFIG_VUART_NS16X50_DEBUG, which is how the
build failure in 13/26 went unnoticed. Adding it to one of the debug
builds would cover that code.

~ Oleksii

