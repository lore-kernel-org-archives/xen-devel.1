Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4FBC56201
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:08:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B4B22256
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 16:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JzACV2Mh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B4B22256
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31076.61299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmU6-0007gA-Dt; Thu, 19 Nov 2020 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31076.61299; Thu, 19 Nov 2020 16:08:34 +0000
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
	id 1kfmU6-0007g0-AE; Thu, 19 Nov 2020 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 31076;
 Thu, 19 Nov 2020 16:08:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfmU4-0007fd-VA
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:08:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 766091d8-f149-448d-824c-99df06a1aea4;
 Thu, 19 Nov 2020 16:08:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfmU4-0007fd-VA
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:08:33 +0000
X-Inumbo-ID: 766091d8-f149-448d-824c-99df06a1aea4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 766091d8-f149-448d-824c-99df06a1aea4;
	Thu, 19 Nov 2020 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605802111;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=nSs4CrsxfMMQoxP8VXBC2GGpZarGmVENVa9Rl6O8stM=;
  b=JzACV2Mh4fB4t87i/sQUB0C/fKyuWb7HjWLpRO45W9X+l1lEYeQNQKoI
   pX0M25oX4gmg+ElMTZyWsFIfuttem2lPb69XE+AOk1nzTUHRFtnSj8cVc
   xsv2TRlYALwSsHDXZFZ1F8dGmlNniAY8R2X2i9ViGa6uBm1RD7TemtCuC
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CkKraE4jtMBsK8X7Xl1X8NxhY2hZJ95fAL4+kfQ+/A4q1xatLPgLVNFkjgKO1grXyV5Gd6VCa8
 a6GSrWepx9PCys2NOCkd76h35UtW6XOuVeuAecBROzfDHZH5oT8OE8PL+S58VHShFSQ/uT3fGM
 Q2E35O+s9vh47seOQhwrOXc0h46QCbBzRBa4J9WGn/KfDMsuapIkFix9NedPrEW6pC+eXIjgSV
 oXAFQo2o8aDewu5clLBCoy3ZDqoS5gjqQn/fFEOk29Tof1sD6OqeK/Vd/YQ5nnDQCiYealniss
 Qu4=
X-SBRS: None
X-MesageID: 31508117
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="31508117"
Subject: Re: [PATCH] SVM: avoid UB in intercept mask definitions
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <eaef863f-a396-58be-cb32-7a9e2535d9e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fd257643-fd2c-edfe-ccef-fde3d03d514a@citrix.com>
Date: Thu, 19 Nov 2020 16:08:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eaef863f-a396-58be-cb32-7a9e2535d9e2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 15:57, Jan Beulich wrote:
> Found by looking for patterns similar to the one Julien did spot in
> pci_vtd_quirks().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

