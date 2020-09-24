Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8301C4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 20:21:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD0F239EC
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 20:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Exf5pfEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD0F239EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLXjx-0005Hm-Of; Thu, 24 Sep 2020 20:21:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oT5B=DB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kLXjx-0005Hh-BU
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 20:21:17 +0000
X-Inumbo-ID: 637168cb-6188-4cc6-b2fd-f0f3cd2f43a1
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 637168cb-6188-4cc6-b2fd-f0f3cd2f43a1;
 Thu, 24 Sep 2020 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600978876;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lxsmR/QyZNqiZIxqVf0QQlfxhFl1jWjd5A4Ji/sqiHI=;
 b=Exf5pfEQDJjFq34GSLAjywIxA4dmBsHvoRmJFiTPmX20xF5To5/Ls2ts
 YtPCoef6cdE8qsIYNnlp9nNHUkDKE0V+iSh7V7UM5jZW79jGpI2KbLpJf
 XGI3O+bTNFVTVW3cA5V+BO0xrH0IANxtIZxHRP+aqSUZrxf1hfxu79WqX g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wtaVvoziiuMoWd12mWGRTbO7QPtYJx3VqM7mfzy/JcJr8JjuwdG7Uic0dKC73Ha9nei5/rcLbL
 o8+Gu47Kq+DRWj5mLa4vy9MOvTUHcRBYXINLdQnZGxGJyHyHmvXrb8hce8EwGMYFl+PYPWW6km
 zbKN+tzhm2P26ygdy6PAwrVBFafQ89QyMT2L6zclq3D+ITGJQjEV3vOhyBlOcAs9LYuISKEX9e
 wKGkbLGKC/EYq+JO0l/pPfzA6yTxBEgWdULiX5Y//RPTc29KUndUUYfBqfGntgpZw5j5JONFCi
 igg=
X-SBRS: None
X-MesageID: 27624622
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,299,1596513600"; d="scan'208";a="27624622"
Subject: Re: [PATCH v1] tools/libxc: report malloc errors in writev_exact
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200923064840.13834-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b8de1fc2-158c-e725-451a-4e2ce5ca3d2e@citrix.com>
Date: Thu, 24 Sep 2020 21:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923064840.13834-1-olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/09/2020 07:48, Olaf Hering wrote:
> The caller of writev_exact should be notified about malloc errors
> when dealing with partial writes.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

