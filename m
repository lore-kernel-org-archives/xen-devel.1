Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92004C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 10:01:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427289.1650000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8apx-00007e-2t; Mon, 21 Sep 2026 10:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427289.1650000; Mon, 21 Sep 2026 10:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8apw-00007X-Vo; Mon, 21 Sep 2026 10:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1427289;
 Mon, 21 Sep 2026 10:01:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <regressions@leemhuis.info>) id 1x8apv-00007R-6B
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8apu-00Cfdc-HX
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:01:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <regressions@leemhuis.info>)
 id 6ab1006b-e002-0a2a0a5209dd-0a2a4506a45e-30
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:01:22 +0200
Received: from [188.68.63.162] (helo=relay.yourmailgateway.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <regressions@leemhuis.info>)
 id 6ab10071-195a-0a2a45060019-bc443fa2baf9-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:01:22 +0200
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hpJdV2sb7z4NRn;
 Mon, 21 Sep 2026 12:00:46 +0200 (CEST)
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hpJdV27C2z4NRh;
 Mon, 21 Sep 2026 12:00:46 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hpJdS65cXz8td8;
 Mon, 21 Sep 2026 12:00:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5AA1A5FA21;
 Mon, 21 Sep 2026 12:00:39 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key2 header.d=leemhuis.info header.i="@leemhuis.info" header.h="Date:Subject:To:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789984846;
	bh=8EDrVz3B5Ui9t+59/tsVLp1aP1KLxbEoqN01RrOD6w8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=N+muyZXc8ymigm1X4WJYdQfg2FAM32UXD62GkYAoXAwUrk7y9wSeo8wrc/kijMJRV
	 y5tWKY3o2n02jG8BFKiSIVU0+QItf44A8F/uAvgSzG094QdLpHkIhB2vYGkX46B20i
	 VN8otbW9QVGTprs7yAikun99LjJZdMuY8JvNPtYmNbSMCRCvzKBQOTZyd8gdjxZZ5l
	 DyvixvqPU0uzZ2XY48NNI84277giq0riOIyvt5KdUAjXgXxXqYHUF2UnaCKvpjyJhB
	 wokbeEO1V5wZCwoLz8JbmY9fO/UzY31upQSqXV2mNt9yhCmfs119MpbQUfndGp34Ma
	 0jJsS2X3dDAMA==
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8aaad113-1952-4655-978d-0cdd8b048064@leemhuis.info>
Date: Mon, 21 Sep 2026 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks
 bare-metal Xen dom0 boot
To: Support TRINITY <support@trinity-net.com>,
 regressions <regressions@lists.linux.dev>,
 linux-acpi <linux-acpi@vger.kernel.org>, linux-pm
 <linux-pm@vger.kernel.org>, stable <stable@vger.kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: 
 <905771062.272724286.1789919301858.JavaMail.zimbra@trinity-net.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <905771062.272724286.1789919301858.JavaMail.zimbra@trinity-net.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178998483973.134331.13310613659725459518@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5AA1A5FA21
X-NC-CID: jHAYD1xjKcSrG8HKUMDccnDoibkQCgWtGfye6GROeeyolTZ1i1c=
X-purgate-ID: tlsNG-16d1c6/1789984882-FEC7777B-42F7454D/0/0
X-purgate-type: clean
X-purgate-size: 3947

On 9/20/26 17:48, Support TRINITY wrote:
>
> I am reporting a bare-metal *Xen* dom0 boot regression seen with *Linux
> 6.18.52.*

Thx for the report. There is one somewhat important detail that was
missing (hope I didn't miss it):

Is latest 7.3-rc also affected? And if it is: does that partial revert
help there, too?

Ciao, Thorsten
> On affected systems, Linux 6.18.51 boots successfully as Xen dom0 on
> bare metal, while Linux 6.18.52 *consistently black-screens before dom0
> userspace/networking comes up.*
> 
> #regzbot introduced: v6.18.51..v6.18.52
> #regzbot title: ACPI processor/cpuidle lifecycle change breaks bare-
> metal Xen dom0 boot
> #regzbot link: https://gitlab.alpinelinux.org/alpine/aports/-/
> work_items/18447 <https://gitlab.alpinelinux.org/alpine/aports/-/
> work_items/18447>
> 
> Tested results:
> 
>   * Linux 6.18.51-r0, Xen dom0, bare metal: boots
>   * Linux 6.18.52-r0, Xen dom0, bare metal: black screen before
>     userspace/network
>   * Linux 6.18.52-r0, Xen domU: boots
>   * Linux 6.18.52-r0 with Xenbus notifier change reverted: still fails
>   * Linux 6.18.52-r0 with only ACPI processor/cpuidle changes reverted:
>     boots
>   * Linux 6.18.52-r0 with refined ACPI idle lifecycle patch: boots
> 
> Affected hardware tested:
> 
>   * Intel Core i7-4785T thin mini-ITX, 16 GB DDR3
>   * Intel N305 thin mini-ITX, 16 GB DDR5
>   * Supermicro / Intel Xeon E5-1650, 32 GB DDR3
> 
> The successful boot used the regular Xen command line:
> 
> multiboot2 /boot/xen.gz cpufreq=xen:performance
> module2 /boot/vmlinuz-lts modules=loop,squashfs,sd-mod,usb-storage,xfs quiet
> module2 /boot/initramfs-lts
> 
> No IOMMU workaround, serial console parameter, debug parameter, storage
> workaround, or Xen command-line change was required.
> 
> The regression was narrowed to *ACPI processor/cpuidle* changes between
> 6.18.51 and 6.18.52, specifically the idle-driver registration lifecycle.
> 
> The working 6.18.51-style behavior registers the ACPI idle driver from
> *acpi_processor_power_init()* and unregisters it from
> *acpi_processor_power_exit().*
> 
> The failing 6.18.52 behavior registers the ACPI idle driver globally
> from *acpi_processor_driver_init()* before *driver_register().*
> 
> A first ACPI-only revert confirmed the regression source. A refined
> candidate patch was then prepared to preserve the working ACPI idle
> lifecycle while keeping unrelated 6.18.52 safety fixes, including:
> 
>   * _LPI bounds checks
>   * cpufreq notifier cleanup on *acpi_processor_driver_init()* failure
> 
> The refined candidate patch modifies only:
> 
>   * *drivers/acpi/processor_driver.c*
>   * *drivers/acpi/processor_idle.c*
>   * *include/acpi/processor.h*
> 
> It does not modify Xen, Xenbus, IOMMU, APIC, PCI/ASPM, intel_idle,
> syscore, USB, storage, XFS, networking, printk, or the cpuidle core API.
> 
> The earlier cpuidle_disabled() workaround is not included.
> 
> The refined patch has been rebuilt and boot-tested successfully as Xen
> dom0 on bare metal on TRINITY-EDGE.
> 
> This issue is currently visible to *Alpine* users because the *Alpine
> v3.24 *stable repository contains:
> 
> alpine-release 3.24.2-r0
> *linux-lts 6.18.52-r0*
> 
> Systems tracking Alpine 3.24 stable / latest-stable may therefore
> receive Linux 6.18.52 as the default LTS kernel.
> 
> Attachments:
> 
>   * revert-acpi-idle-registration-lifecycle.patch
>   * APKBUILD
> 
> The original Alpine report is here:
> 
> https://gitlab.alpinelinux.org/alpine/aports/-/work_items/18447
> <https://gitlab.alpinelinux.org/alpine/aports/-/work_items/18447>
> 
> Please let me know if this should be submitted as a formal patch with
> Signed-off-by, or if there is a better upstream fix/dependency that
> should be backported instead.
> 
> Regards,
> 
> *Tony BONNIN*
> 


#regzbot introduced: 6cffb59ee50ea4

