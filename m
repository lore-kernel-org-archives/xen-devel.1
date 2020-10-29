Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADA7C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:45:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B59F20720
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="SLiM+83+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B59F20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14554.35930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBzX-00009g-8W; Thu, 29 Oct 2020 17:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14554.35930; Thu, 29 Oct 2020 17:45:39 +0000
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
	id 1kYBzX-00009Z-5X; Thu, 29 Oct 2020 17:45:39 +0000
Received: by outflank-mailman (input) for mailman id 14554;
 Thu, 29 Oct 2020 17:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYBzV-00009U-RZ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:45:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ad4ce39-f4db-4bed-aa96-f4ab9cc7af4e;
 Thu, 29 Oct 2020 17:45:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYBzV-00009U-RZ
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:45:37 +0000
X-Inumbo-ID: 5ad4ce39-f4db-4bed-aa96-f4ab9cc7af4e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5ad4ce39-f4db-4bed-aa96-f4ab9cc7af4e;
	Thu, 29 Oct 2020 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603993536;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=TEzmsFvs5V+BQzfUO38TjsJ2AjAGtch8NefQjs2tR1c=;
  b=SLiM+83+JA226t8WFbi9k38+q2HXcQRXbp6VKsilp3q3SEi60twO338Y
   HObQtS1TnRVbbgy2yc+yjcHWqkOlxtGMHyMhr2ArkwVnbw0RG3YzQ8jHV
   US6JivbGQsva8kygOO67+pLLEC0dLGBYEfd7AvTamPKPr/cgS2jHWIHed
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: onNk+iUiQ2s5vvviSkBV8onCPxtCZrZrNegG6uE49Xn9rTber9OnZd3mF/kMfmH8EuaGmGnBDU
 4+vJcHfjTlUGfQPLnhdbi3kqZ9b6mryCcjnTTQF7vW3OYVDNm+osqA+itbgXRfOqsCUFIzjh5y
 gL908PsIUcUOJVlRcYqDEU2WE+Hsc2UQFLEoAw3s6OkNcygntqQvJ6taaAwWSZ6X2KomxJcxTa
 yUbdxAuCCgjIPewWErM4Y2pww6u3t14E/feW559IasfQi3IlTX7m21aoStwYTk78yDmZAJlZeL
 mWw=
X-SBRS: None
X-MesageID: 31181329
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="31181329"
Subject: Re: [PATCH] x86/HVM: send mapcache invalidation request to qemu
 regardless of preemption
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <d33721a8-af91-7efc-b954-1d775bd4e35c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ae68944c-ddbd-53b8-3725-376abc9013ae@citrix.com>
Date: Thu, 29 Oct 2020 17:45:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d33721a8-af91-7efc-b954-1d775bd4e35c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 29/10/2020 15:14, Jan Beulich wrote:
> Even if only part of a hypercall completed before getting preempted,
> invalidation ought to occur. Therefore fold the two return statements.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

