Return-Path: <SRS0=m7Uf=B7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39655C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2020 14:55:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0728C2075E
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2020 14:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ZLp4H9N1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0728C2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k98RM-0007NM-LP; Fri, 21 Aug 2020 14:54:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=82JZ=B7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k98RL-0007NH-Jf
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 14:54:47 +0000
X-Inumbo-ID: 065fffe1-cd73-4888-94c7-98751e87072b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 065fffe1-cd73-4888-94c7-98751e87072b;
 Fri, 21 Aug 2020 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598021680;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nFsBZlcfFycI1R21rUKYa2TvmzbxwxyXJYszeevv5Tg=;
 b=ZLp4H9N1GFKy4IQaSVIhBmI2RwRPlbcC2bDjwckDkWcKnSDydctRc5Ep
 Agn6QXG9q1CC/m8PzbVT4bMkeKOeVZxVaHybwaR3/jjvXFUbAReWJz3PN
 i+Hn7RPjxdgFervIANu9RL5PMY0vLDznne/Xlgvc7Q+u42oY1zwSpAZ31 Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +Yoq5zu1qFa3/y/GyPkTQVn/PGLz9OuXv4ZG1WvxxV1jIrgEiPCCj6RaUF6kCDUeM3JQUTiWgm
 bf4Yzt/VbEZE71W9Y5fix+h6mWhiac8wETxdUxZiw2eFmtq5uuR+VY/fGW0q31zxasmS2x46Fk
 bYiOgtCZe7r+dz5pSLDF5HyoMrG3AlXv5XJHwQfzcmtnP5dEZ88l4Jyq+0tDusb5xGepXTvPFe
 BACbcPPsj7Loe5h4e7ZUxuyLIVpx1LeC5U2+ih8Od87MjH28BV0rT3K9UpWRA+7sWpiAUlUa/U
 aPA=
X-SBRS: 2.7
X-MesageID: 25348246
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,337,1592884800"; d="scan'208";a="25348246"
Subject: Re: [PATCH] MAINTAINERS: Add Roger Pau Monne as x86 maintainer
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20200821143201.831774-1-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1fa55083-6d83-eac3-bf57-b8852eb8d3b6@citrix.com>
Date: Fri, 21 Aug 2020 15:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821143201.831774-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 21/08/2020 15:32, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

