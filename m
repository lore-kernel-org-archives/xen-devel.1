Return-Path: <SRS0=Dhy5=FM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C21C433FE
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 14:34:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8BB23A5B
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 14:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8BB23A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.47477.83994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme43-0003QP-Hj; Tue, 08 Dec 2020 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47477.83994; Tue, 08 Dec 2020 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme43-0003QI-Ep; Tue, 08 Dec 2020 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 47477;
 Tue, 08 Dec 2020 14:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PeDt=FM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kme41-0003QD-Pt
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:34:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d50020c1-1a74-42da-81f3-9a65fe809b87;
 Tue, 08 Dec 2020 14:34:00 +0000 (UTC)
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
X-Inumbo-ID: d50020c1-1a74-42da-81f3-9a65fe809b87
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607438040;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=yIUj8hMRyr0GAmSeVgq0BMEU5WF1ogfC7Z8gN3L0L7Q=;
  b=Sh1SRq85OnYg8/mA0qKwB4x9RQ3vQBUbZSN6vtCHDLtowDRP+7bltjTd
   p/LS9OjbTMTu5+qvqH3FP2dN//P9WmPWypF/PMPQv7GERDNiH+7zWCHwb
   cu7Oq+n+5dbfmn6kp/ZulQsxqm94xzJKzqGoppeTnyVh1IbA/r4Nu4vkH
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: E5xIAiTp0i+FJjtJQtUqoircIjnlvSjuhhoYpbszATjlFP07uvAh/n7Pw1SZBMCIPp8L70djM7
 JXrEzf83FJsba7oyg4wrICQE+iB9lmGbXOLT7yW/LXroPOh7b0DTtS0HRpUCb+49M+TzeBtiyb
 jNmQp9mpXRaZCnCVzaMVYwTjl/aLYE8RIyZWEBL5KlRnP2w2AsmxMQjkcUTTSBQSjCVG+yU3cw
 1t+NcSf0CYes3FzjZb+oNNPYQOhyfKDTeXPal3nFjBYB9taJZeMkuo9wcDh5ruSs1tvN/noprF
 pME=
X-SBRS: 5.1
X-MesageID: 32778924
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,402,1599537600"; 
   d="scan'208";a="32778924"
Subject: Re: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually
 exclusive
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201208135146.30540-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
Date: Tue, 8 Dec 2020 14:33:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208135146.30540-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 08/12/2020 13:51, Juergen Gross wrote:
> With CONFIG_PV_SHIM_EXCLUSIVE some sources required for CONFIG_HVM are
> not built, so let CONFIG_HVM depend on !CONFIG_PV_SHIM_EXCLUSIVE.
>
> Let CONFIG_HVM default to !CONFIG_PV_SHIM instead.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

So while this will fix the randconfig failure, the statement isn't
true.  There are HVM codepaths which aren't even dead in shim-exclusive
mode.

The problem here is the way CONFIG_PV_SHIM_EXCLUSIVE abuses the Kconfig
system.  What is currently happening is that this option is trying to
enforce the pv shim defconfig in the dependency system.

We already have a defconfig, which is used in appropriate locations.  We
should not have two different things fighting over control.

This is the fault of c/s 8b5b49ceb3d which went in despite my
objections.  The change is not related to PV_SHIM_EXCLUSIVE - it is to
do with not supporting a control domain, which a) better describes what
it is actually doing, and b) has wider utility than PV Shim.

~Andrew

