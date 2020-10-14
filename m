Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57A9C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 10:58:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3F4208B3
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 10:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XlH2YGgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3F4208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6551.17481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeTh-0005aO-GK; Wed, 14 Oct 2020 10:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6551.17481; Wed, 14 Oct 2020 10:57:53 +0000
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
	id 1kSeTh-0005aG-DD; Wed, 14 Oct 2020 10:57:53 +0000
Received: by outflank-mailman (input) for mailman id 6551;
 Wed, 14 Oct 2020 10:57:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSeTf-0005Zt-8B
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:57:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bfd345b-7ab7-45b4-8096-442f3d3185c7;
 Wed, 14 Oct 2020 10:57:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSeTf-0005Zt-8B
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:57:51 +0000
X-Inumbo-ID: 7bfd345b-7ab7-45b4-8096-442f3d3185c7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7bfd345b-7ab7-45b4-8096-442f3d3185c7;
	Wed, 14 Oct 2020 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602673070;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VZSfsKM6hXozM7xhDIjoCFNckdpNAUN3ydH++pfiwLs=;
  b=XlH2YGgFnn5enfEamUlbotwLnAthWKhDFW0uGb+MUnIzBdZGzfHhlttV
   nmphuGqYhZMoeQ3P1Qk2GPnLo5/av1E0MHPTpxkD+CramFsBkpHFWYLqh
   TKRTLeWCXEeyV9VH/lyfKYs0fBW9Yf9OJWsj7bkMc+g8g2Aen2za+70Yn
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bWOkWBdVNgsJXwaJqjdmXnViPra0NXB7jR0hl9QwOdIPMjaxBarTc7mfMOGjDUs0uA1WeIBlUg
 O6BkrdUZNtmQWXsdiOQklKikZvfhel3mDwVyKj1J6CM4sI6iISApEhRNMWtQRp+SSayLdVPwtn
 h1ETc1ZxCrm6TD2O12Re3zGjjV0hGqG2rK6HPr4AkBVirXdH8kH7KhGbqOeLIU4Tr2qZRofs+M
 Qe1XSYKycbLrAofTfm3JlaoVK0UWjV7Z6Dt2hOFPE9aeKoB0s+UixjKYrEss8h5hoGjN2LrfQC
 Bfw=
X-SBRS: 2.5
X-MesageID: 29220109
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29220109"
Subject: Re: [PATCH 1/2] EFI/Arm64: don't clobber DTB pointer
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Trammell Hudson
	<hudson@trmm.net>
References: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
 <825ded00-3971-4e56-7bef-324ee5531f70@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <43eced1c-d4ee-e596-6ec9-7d9ad22ed5e0@citrix.com>
Date: Wed, 14 Oct 2020 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <825ded00-3971-4e56-7bef-324ee5531f70@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 11:42, Jan Beulich wrote:
> read_section() needs to be more careful: efi_arch_use_config_file()
> may have found a DTB file (but without modules), and there may be no DTB
> specified in the EFI config file. In this case the pointer to the blob
> must not be overwritten with NULL when no ".dtb" section is present
> either.
>
> Fixes: 8a71d50ed40b ("efi: Enable booting unified hypervisor/kernel/initrd images")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

