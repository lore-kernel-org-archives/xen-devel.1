Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8398C4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 10:44:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDEE206CD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 10:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cZ+Iidvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDEE206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1866.5658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIXg-0006XA-4L; Fri, 02 Oct 2020 10:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1866.5658; Fri, 02 Oct 2020 10:44:00 +0000
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
	id 1kOIXg-0006X1-0P; Fri, 02 Oct 2020 10:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1866;
 Fri, 02 Oct 2020 10:43:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOIXf-0006WE-38
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:43:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a;
 Fri, 02 Oct 2020 10:43:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOIXf-0006WE-38
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:43:59 +0000
X-Inumbo-ID: f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f1ba8aba-4a4b-4e9c-bd8b-d6ef16bc008a;
	Fri, 02 Oct 2020 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601635437;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=KqxlULH5hG1JKBjKDC1ojwnlQxBw52oERRltytFhc0w=;
  b=cZ+IidvkILjnzjbtbOXDFAfzQAWr745S+hWl17Ica2ex5S9Lanlyt/M0
   Ja1xJWlgWQY/LK/5fCdBZh/TIH7wzMd8gYC/VhsZ5YTKlI3BdxKccsmUo
   80HA0NqGEKuhSFbYE28QcN8vyCpM0KT1dYJpDRUSubptUoPZqtHI5cREI
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lgv4ndG40uZ/fXaj7Ly6CF9/N5VJANF0YAmH0/mx2p4CYHYkXwi4Nh3KVau2ff4/GckrzQJzHR
 Gam4lOKUdntJvonYryqpXwzQ2k9QhHw8e5/j7WCmR/o7+ELrE0FgqYLIavUIXPswSMafJmMANt
 +0Dze8Lh4kRLSOCtKK/MUFqrNdFz4+PzbCc9Ahp64FCKJbnIaYaOSBSUJIVh0F8sXbSymANaGB
 WYS2VM13a3Ut8HxZi9vddyvvZgcZNvgAi1sR4uuNNpBdD6nCDddCpTpgsUp8oMdUkOCZeG13bf
 AQg=
X-SBRS: None
X-MesageID: 28418869
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28418869"
Subject: Re: [PATCH 1/3] x86/vLAPIC: don't leak regs page from vlapic_init()
 upon error
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <b437de21-f108-c30e-4e0c-1137ad7d99fe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <71e0720c-5a50-6844-5631-e1802dfb0b94@citrix.com>
Date: Fri, 2 Oct 2020 11:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b437de21-f108-c30e-4e0c-1137ad7d99fe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 11:30, Jan Beulich wrote:
> Fixes: 8a981e0bf25e ("Make map_domain_page_global fail")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

