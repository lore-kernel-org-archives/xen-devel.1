Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40043606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fq4m9ztO
Received: from list by lists.xenproject.org with outflank-mailman.1485997.1688991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWBM-0006re-5H; Thu, 12 Nov 2026 14:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485997.1688991; Thu, 12 Nov 2026 14:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWBM-0006rX-1o; Thu, 12 Nov 2026 14:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1485997;
 Thu, 12 Nov 2026 14:53:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRWBK-0006rR-Tv
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:53:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRWBK-0007ub-Al
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:53:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5d2ee-8faa-0a2a0a5109dd-0a2a4503dfda-32
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:53:42 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5d2f6-fae8-0a2a45030019-d155802cdc6e-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:53:42 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so54480885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:53:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e271378sm84331685e9.13.2026.11.12.06.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:53:40 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794495222; x=1795100022; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/n7/Wio+QoaFLhGev74I2n9ttcV6Lj9IV/LZvBHCm8=;
        b=fq4m9ztOw5bmTjDnTTrgF3N898b4jKfYOHHvPA2OdTdKimXZXTdigeB7eLJTCETNHM
         QcWIJcWFd+6gGrIPsGw1YmZhukGdBloQ+PqrIlBBT98lW3vcpM+j3WQBf1Dk/DFaMXaB
         GxUHHf8Ue9eL/U4niJ9yp9H8qD5pdjpjewDt0bnfNRcb0vXj0cKExtKq04Bk/oCOY3o2
         dRGYSLti9djasBINVUcshtHGXKn38AYTitKbWCGT7JUZZ4jsFKPaMAStfut3v5MdSZUU
         lQMKDjbbgwg9dq9T3X/8lVlJRgzAb6oMf53GNamzwJWr+3gqpEm0aDmBvdATLxflmwDC
         32Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495222; x=1795100022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/n7/Wio+QoaFLhGev74I2n9ttcV6Lj9IV/LZvBHCm8=;
        b=JQzCInlN4kTMfRa2pQiqz/4jL2Sa5Htpo0ljds5YznSg+2DVvOt4tpxPc3A57F7MKV
         xq0a6MgNhGcpcPGK7xcMUPfIFEQhx0AshQvavKtEQVxNAL+oOhZspzMsFL67ZNv2V8vk
         1afEzVlwIVd+v/2uU7O0P44UeQOC/MNv5GMUqvw/5oZfyhs8F5ptL/HrdUx3DSgH1ZLU
         dj8fiKUHBybBeeQCCcJoVqYwhTbNQ2I3JHeqdJisADHT3+w1oSiF5niBXcGALmU1D4Yg
         vcD1cNsw7WI/T2bNCIj0aRGnpl9qWMLMPZAjGyEZv0P2FcJO32OZ/pawmeJl2duSe2DA
         g1HA==
X-Forwarded-Encrypted: i=1; AL+hErFOWzn140uwLmnbdRrlG6toePu9pjJZwq8w8lgm6bSbRyaDsM3gbapn8qQoVTEAF7xuTzlCjMu2cpQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8eBZbqVcQTFIpPLsxYwD1yryOxxRSGKg3Pabf8OssAmDer66bO
	AaoXbdZjdHnntcP7APsu+SMLRnm8VMH1Bf9WK8Zjl/T71eGdlLWZ6MJp
X-Gm-Gg: AYBFou1jbVTuvpcC1CIEOZiNbH4EjvGErQ17Xfm/HvHHffzO/ENxv2UijXDluwTEoa2
	RGExvcu446MbIO/gpJcOJZvpTW2MpPvpXmMC1VNSVv6MMVL7nh+77zQSv5GUSvKVmJ3EOLtQ+24
	TgDxA44dDd2qFgmClqF3tgQXYRpWNOcPqxlbFB1rHNFRF26f5aPFrVed8zbBEIg8uEwle+SkeRP
	oTEIUrGanx2+yWyB9hJjESn2p/jmWdHNIKz8xVtybQyPCgyohXdtiq1Q3z3dgSca7PR7OIn9TfF
	cqBHx0j+hKQxKN1TvuR0J60jNtZQn9xcMj/8zU5p4n/LVxayVO9ZbNDYE4oHsOo0pHyfm/j6vKm
	PBYsSY242uwHPsY3iStAPQ3uqiJuZ7b9sqI7S2zTfrqraXbebyL4RPd2cF0RNYR60xmd0HYU6kS
	+e9dhWcPrfxQtGAi331Whwlga8XS1Z+GrQU0zqnP/JMzhxq4vFCcBd4qM9wf7sPeOF1FApyTmSf
	5+vOoDfq7fmvjuiC98E+PQVYGxUm7ounaSLwnDT8uXMGFqYOJoTPHVWo3kzXBmBFNO1TYaT4RaH
	u5iUPlqrWIiNRcfC2GaGZJ9htRl4zkJYNS9pKryoi5a9OeBPe85KWiwW4cRnLuT0UMFc/s2SjxK
	Jsw==
X-Received: by 2002:a05:600d:2:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb52bda3e9mr24812765e9.6.1794495221478;
        Thu, 12 Nov 2026 06:53:41 -0800 (PST)
Message-ID: <30050658-04ce-4ab3-ac6e-bb3f517d5ded@gmail.com>
Date: Thu, 12 Nov 2026 15:53:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/26] x86: introduce NS16550-compatible UART emulator
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794495222-6C2E04E9-3CF3FE40/10/73395122804
X-purgate-type: spam
X-purgate-size: 3893
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Denis,

On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
> guest OS bring up in the embedded setups.
> 
> This patch series introduces initial in-hypervisor emulator for
> NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16X50.
> 
> In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
> early guest firmware and OS bringup debugging, because it eliminates
> dependency on the external emulator (qemu) being operational by the time
> domains are created.
> 
> The emulator also allows to forward the physical console input to the x86
> domain which is useful when a system has only one physical UART for early
> debugging and this UART is owned by Xen.
> 
> By default, CONFIG_VUART_NS16X50 enables emulation of NS16550 at I/O port
> 0x3f8, IRQ#4 in guest OS (legacy COM1). Legacy COM resources can be selected
> at run-time via temporary and undocumented switch 'vuart='.
> 
> CONFIG_VUART_NS16X50_DEBUG enables some extra debugging facilities useful
> for NS16550 emulator development/debugging (disabled by default).
> 
> The NS16550 emulator is disabled in default x86 configuration and goes under
> CONFIG_EXPERT in Kconfig.
> 
> Note, there's a follow on work for RISC-V which is based on that series:
>    https://gitlab.com/xen-project/people/olkur/xen/-/tree/riscv-vuart-support-wip?ref_type=heads
> 
> Limitations
> ===========
> - Only x86;
> - Only legacy COM resources, custom I/O ports/IRQs are not supported;
> - Only Xen console as a backend, no inter-domain communication (similar to
>    vpl011 on Arm);
> - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> - No toolstack integration;
> - No baud rate emulation (reports 115200 baud to the guest OS);
> - No FIFO-less mode emulation;
> - No RX FIFO interrupt moderation (FCR) emulation;
> - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
>    friends);
> - No MMIO-based UART emulation.
> 
> Series
> ======
> 
>    Patch 1 introduces the new vUART framework, that is the code originally
>    posted here:
>      https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford.com/
>    Required for emulator.
> 
>    Patch 2 adds missing NS16550 definitions, required for emulator.
> 
>    Patches 3-4 introduces the basic emulator skeleton - state machine
>    initialization stubs, I/O port handler stub, logging, etc.
> 
>    Patches 5-12 incrementally populate the minimal NS16550 register emulation.
> 
>    Patch 13 hooks vUART state debugging (disabled by default).
> 
>    Patch 14-16 adds Kconfig for enabling minimal NS16550 UART (disabled by default).
> 
>    Patches 17-21 introduce necessary changes to enable NS16550 on dom0 (and PVH).
> 
>    Patches 22-23 documentation updates. Note, that vuart= setting is not
>    documented since it will likely change with hyperlanch landing on mainline.
> 
>    Patches 24-26 tests updates.
> 
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3055921295
> Link to XTF branch: https://gitlab.com/xen-project/people/dmukhin/xtf/-/commits/emul-16x50
> Link to Xen branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-ns8250-v8?ref_type=heads
> 

I built every patch of the series on x86 (defconfig + EXPERT + DEBUG,
gcc 16.2) and a few of them don't build:

- 18/26, 19/26, 20/26 with CONFIG_VUART_NS16X50=y: ns16x50_deinit() uses
   d, which is declared only in 21/26.

- 16/26 up to 26/26 with CONFIG_VUART_NS16X50_DEBUG=y: in
   ns16x50_dump_state() (13/26) the initializer of as dereferences info
   before info = vdev->info, so -Werror=uninitialized rejects it. It
   shows up only from 16/26 on because nothing compiles ns16x50.c before 
   the Kconfig option is introduced.

~ Oleksii


