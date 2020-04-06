Return-Path: <SRS0=VfOS=5W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830E9C2BA17
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 18:07:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7CC2064A
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 18:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Z3fhDzPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7CC2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLW93-0004PE-QO; Mon, 06 Apr 2020 18:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9GA=5W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jLW92-0004OL-SV
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 18:06:48 +0000
X-Inumbo-ID: 61a36ece-7831-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61a36ece-7831-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586196407;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EmCYMXXV/FWMrAk5qPTjZe9gmczYRMuUlGuyXr4tuRs=;
 b=Z3fhDzPzEee0JdVwKZ422ubkOCJCsWCcB1YDoWKDQdwp//581H9ORTYl
 thGwTQRVrqDwvT4sjqHpIH0TajinNsJHvCoB3Er/PAp5Fbk69L/Larq+i
 hbktqsc4nqqx8Bk2UONWHcDysJE5jeUf4WaVfaMkpUkbpoeRFvNTuRM9m k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yhqYQjmxDg4Vnxs2f6GQSkPyU/dkx1k58Ai/uxWGJsJR3WEEcYBdCG+1MILtmwaxIxcbXK74X7
 ukU4VN6789gNHO/YdEmnet0A9U4zPBsoDt6SIKrmvx2njYfr2BFz/LjoNaz+xRwuXRqWKUyWjQ
 M3klRCUgpoy81lsvPYPRWGDEK3FAz1t6bUkS5X5fOCBLDeaAXSZCpgZu4Ust7gjm42hXvz+c5f
 GTb8FfgikOblaA4p9oZLbbzy/Y7TMm5v3tn85ZJUJM+ZkueJTgLZEVK7Uj2+8uS/w6eEORP/Cp
 yMw=
X-SBRS: 2.7
X-MesageID: 15919822
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,352,1580792400"; d="scan'208";a="15919822"
Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>,
 <xen-devel@lists.xenproject.org>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a112896-9d22-eca1-f406-7bfa3f047b40@citrix.com>
Date: Mon, 6 Apr 2020 19:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/04/2020 18:46, Harsha Shamsundara Havanur wrote:
> It was observed that PCI MMIO and/or IO BARs were programmed with
> BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> register) enabled, during PCI setup phase. This resulted in
> spurious and premature bus transactions as soon as the lower bar of
> the 64 bit bar is programmed. It is highly recommended that BARs be
> programmed whilst decode bits are cleared to avoid spurious bus
> transactions.

What kinds of spurious transactions?

Keeping memory and I/O decoding disabled until the BARs are set up is a
no-brainer, but busmastering is a more complicated subject.  Therefore,
it would be helpful to know exactly what you've seen in the way of
spurious transactions.

>
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed.
> PCI bus memory and I/O space is enabled in command register after
> all the resources like interrupts, I/O and/or MMIO BARs are
> programmed for all valid device functions. PCI BUS MASTER is kept
> disabled in the bootloader as this needs to be enabled by the guest
> OS driver once it initializes and takes control of the device.

Has this been tested with an Intel integrated graphics card?  These have
a habit of hitting a platform reset line if busmaster is ever disabled.

A lot of this will depend on what Qemu does behind the scenes, and
whether disabling busmastering gets reflected in the real device.

>
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
> Ack-by: Paul Durrant <pdurrant@amazon.com>

Acked-by

~Andrew

