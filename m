Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2C3C4741F
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 10:54:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8005820679
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 10:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="X/rLMMJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8005820679
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22368.48667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4oc-0001Cy-W1; Mon, 09 Nov 2020 10:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22368.48667; Mon, 09 Nov 2020 10:54:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4oc-0001Cr-ST; Mon, 09 Nov 2020 10:54:26 +0000
Received: by outflank-mailman (input) for mailman id 22368;
 Mon, 09 Nov 2020 10:54:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kc4ob-0001CW-Km
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0207ecf-dd8f-4568-b69b-aab8e27ed41b;
 Mon, 09 Nov 2020 10:54:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kc4ob-0001CW-Km
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:54:25 +0000
X-Inumbo-ID: e0207ecf-dd8f-4568-b69b-aab8e27ed41b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e0207ecf-dd8f-4568-b69b-aab8e27ed41b;
	Mon, 09 Nov 2020 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604919263;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=K0393i6vKcAjDPstlMWXCVBlFDlN8IgGJ1fo3abEXHc=;
  b=X/rLMMJIcIQJx83i37ZqvgfuAiM7L4BizObwHWLA4l2Z1N81vzFmSTHz
   5qfgv48G+zjBms8t6x2XKPIpiuShhFWtZDYXVeSoGVwmwRdUkxaVTy3G3
   5dqnBfI2Amgn1ZJmWBUCLOP2xJvXkHQ4N2GSc6MajKnoDsyxPK7xwY4Cn
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ctql2X4OGiMxAzz13OyWDhYIQkPJMF5wMecpH0QPoeoRuiFG/O3FIlWkP+7OFLvoiuiRSCf0gp
 Fna0lvPCEyGtzpj1tZQEUxsDZOhzWMEsgV+HMuBK6VcSLBPkeM8cvozfLv//0J0Rwwoze81F+2
 nSxlu3n+tVeiosxy5bIr4Hmfm9FIm2WMicdMcJVt92W4u/M9XqSjmSC4BJTJcQ4TUsnOzQvPrQ
 TdKRZlvfvfUSNO64LqZFZb6uTjuabauGpgvOJ4qw1FhWo5fatqYWKaK4FjwnW3Us4c5pfJb4mh
 3/Q=
X-SBRS: None
X-MesageID: 30713828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="30713828"
Subject: Re: [PATCH] x86/CPUID: don't use UB shift when library is built as
 32-bit
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <b579bde8-6cd2-0407-f098-c44e1c9ff814@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21f2020b-f74b-3726-69ff-fa54f4a209c0@citrix.com>
Date: Mon, 9 Nov 2020 10:54:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b579bde8-6cd2-0407-f098-c44e1c9ff814@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/11/2020 10:53, Jan Beulich wrote:
> At least the insn emulator test harness will continue to be buildable
> (and ought to continue to be usable) also as a 32-bit binary. (Right now
> the CPU policy test harness is, too, but there it may be less relevant
> to keep it functional, just like e.g. we don't support fuzzing the insn
> emulator in 32-bit mode.) Hence the library code needs to cope with
> this.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

