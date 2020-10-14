Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30F5C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 07:24:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D54620878
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 07:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Rvmd0/EA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D54620878
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6458.17253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSb8k-0002Bj-3s; Wed, 14 Oct 2020 07:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6458.17253; Wed, 14 Oct 2020 07:24:02 +0000
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
	id 1kSb8k-0002Bc-0y; Wed, 14 Oct 2020 07:24:02 +0000
Received: by outflank-mailman (input) for mailman id 6458;
 Wed, 14 Oct 2020 07:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSb8i-0002BX-TS
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:24:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee3b042a-6037-40f7-991b-2b49f9c04d0c;
 Wed, 14 Oct 2020 07:23:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSb8i-0002BX-TS
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:24:01 +0000
X-Inumbo-ID: ee3b042a-6037-40f7-991b-2b49f9c04d0c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee3b042a-6037-40f7-991b-2b49f9c04d0c;
	Wed, 14 Oct 2020 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602660239;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pNqNcRkuwbTFB10l6Qhk3A06eyWK8JbrjaTDj3AQDdg=;
  b=Rvmd0/EABjO5im4S3k0nrsEhU9DRqqd2mFy0OHVRtwyjvT4LEUVCmWAB
   HXCoZlhiPFOwgJKC3t29nvAcHPqWCni2BdkKbZmLcT2547TeJpHkpL2s0
   SjtH74fEIMeSPiPo2xbceiYicbD7vQOxm/fo/QOx+xeefAb9cI6n9dLlH
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CRjuGkHC4wz7MnVSM7ARhAaC3WQ8hKET1hs1dFUZz6GhXbxnmpbznyOPUarAQp4U2UnuNu0yrg
 4ZWTFYcS5QntHpgnDkw0ury+gfXH+1NX6F1YRNcWQt+VaVZJAX6rfB865gMJ2d2XKQRZ4lyHfM
 Yow5FXcv52Hb7wn1FAyRwdmH6UG4X1U5V2YALIPNuWIHdM/8ZlhWVVXUU7CyUlw36a6chiiOV3
 5xD6CclW1yFyMZDXRv3eDZ7WnDmBXSt9reSYCaH2P4VE8YJyin24m9llzUvSbf3Cp9OZ2gaknb
 IYs=
X-SBRS: 2.5
X-MesageID: 29023393
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29023393"
Subject: Re: [PATCH] drop xen/hash.h
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <c398362b-6a09-a67f-50a9-b43b73fbd265@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <62bdf46f-e60f-d0e4-afc0-5955dc7d073e@citrix.com>
Date: Wed, 14 Oct 2020 08:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c398362b-6a09-a67f-50a9-b43b73fbd265@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 08:04, Jan Beulich wrote:
> It has no users and hasn't been touched in 10 years.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

