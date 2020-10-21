Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CD9C55179
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 17:42:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96ECB20870
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 17:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BNi+KJFe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96ECB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10135.26787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVI7d-0007AB-1e; Wed, 21 Oct 2020 17:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10135.26787; Wed, 21 Oct 2020 17:42:01 +0000
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
	id 1kVI7c-0007A4-V0; Wed, 21 Oct 2020 17:42:00 +0000
Received: by outflank-mailman (input) for mailman id 10135;
 Wed, 21 Oct 2020 17:41:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVI7b-00079z-8v
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 17:41:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e7857f7-49b8-47e0-9d0a-43ac289923a2;
 Wed, 21 Oct 2020 17:41:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVI7b-00079z-8v
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 17:41:59 +0000
X-Inumbo-ID: 4e7857f7-49b8-47e0-9d0a-43ac289923a2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e7857f7-49b8-47e0-9d0a-43ac289923a2;
	Wed, 21 Oct 2020 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603302118;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nTqh4d75K3JROmU6X1GvO+WNAKP5DpJgavm1crRCtUI=;
  b=BNi+KJFeq6gHSj+Mu13tZHZusyzsgb9AsquvhIRrScx1IgFly4slAbKF
   52z3fo6DaYXQKi5B93D/HsjPcUio54Qy3cnCNsEUkZco2KXRPM/8M53I2
   Pvx80AF7dQnqi9G4ZPdJ1Zxfl9Y9Ef5VWtX1IDdcF+3Me/tcIl76QLc9I
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J9eY8jhvX+cLa7Rpvcod0oBhFc/dWWOR+rbci/a9W7NHqZLoIZdUv1RHr6a7aO0USH3VigVv3a
 3MhJmMyAnGEU02fyi/ntBTU7fCdVnH6d8GtuoE3eSjz7gwEsEb29/NyAvI00J6h/LEm+075haJ
 X2qulEXE7OimTp5gD/Hm0oDYpao2/5CTKbgerxPV2uHB4Q1jSIaTEtOsbGA2SV7zeFB702zwR4
 P2Q+6HO46qNXw71tOxfr6nAEFBG3sirI1tNhaVR/Ni0S8bUIdmyLI3lEsAGYzY06uyzLPhGvb3
 1o8=
X-SBRS: 2.5
X-MesageID: 29510736
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29510736"
Subject: Re: [PATCH v2 00/14] kernel-doc: public/arch-arm.h
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <george.dunlap@citrix.com>, <ian.jackson@eu.citrix.com>,
	<jbeulich@suse.com>, <julien@xen.org>, <wl@xen.org>,
	<Bertrand.Marquis@arm.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <85d505c1-1328-055e-e3f9-1b8cddde16d6@citrix.com>
Date: Wed, 21 Oct 2020 18:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 01:00, Stefano Stabellini wrote:
> Hi all,
>
> This patch series converts Xen in-code comments to the kernel-doc (and
> doxygen) format:
>
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
>
> Please note that this patch series is meant as groundwork. The end goal
> is to enable a more sophisticated documents generation with doxygen,
> see: https://marc.info/?l=xen-devel&m=160220627022339
>
>
> # Changes compared to v1:
> - addressed review comments
> - use oneline comments even for nested struct members

On the whole, good.

However, there is one thing which problematic.  Right from patch 1, you
start breaking the content used to render
https://xenbits.xen.org/docs/unstable/hypercall/index.html

Either the patches need to incrementally feed the converted files into
Sphinx directly (possibly with some one-time plumbing ahead of time), or
patch 1 needs to be some script in docs/ capable of rendering kernel-doc
to HTML, so we at least keep the plain docs around until the Sphinx
integration is complete.

i.e. don't cause what we currently have to fall off
https://xenbits.xen.org/docs/ entirely as a consequence of this series.

~Andrew

