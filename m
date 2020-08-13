Return-Path: <SRS0=Q/fq=BX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E30C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 14:12:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E235420675
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 14:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UCUA5zRO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E235420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Dxl-00055c-Io; Thu, 13 Aug 2020 14:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kwl=BX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k6Dxk-00055W-IF
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 14:12:12 +0000
X-Inumbo-ID: 21ec2eed-b3c6-4d99-a587-6f08abcdf1c7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21ec2eed-b3c6-4d99-a587-6f08abcdf1c7;
 Thu, 13 Aug 2020 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597327932;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KN0FXVjzRwlp19i8z3AakjNsH2dxzgrCCt7+DUsa1AY=;
 b=UCUA5zRO8c7jGJcja28aVc8T5irlcYx0J3Z4KQ230fwSPwaaIuBZOOD4
 tWGg3Ox4+VHDGTBj4swcKwCyT8k7LoYEDlA2GTSts9W+QWHE7fK/w1OrN
 yxTDMW+o/bJvSBrtThdiTYHFqA8cYgqdktuDUbs7JMhn7rQwOSQ+gfGBu o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: amkjKNIKOoGskk/ycpzGtExiZlbHegbnaQx3t3j3oX835dRs7YZpDK+CKC6NlFwDAmn7NDBqH9
 6UAY7yvhUqHAnhPJWrEBjWwWNcKO34ndeC1S0tr86aAdwfhtIFi9o9Mok5LOyxXUNtTWwKS2yc
 14WvBacKfuS6fXmg9Ma8otK1jTBMu8josY4nlpcEZPIlbxhy7VSfUXxWeBvIz8CeujWG2mRwrl
 qDbrIgYRIxBZD0DGvq2doPROVYsmCWWY5jlU//z42hQzyPfXzcv94rWZHLBP2Blkk6/IMzx+t+
 QDw=
X-SBRS: 2.7
X-MesageID: 24474195
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,308,1592884800"; d="scan'208";a="24474195"
Subject: Re: [PATCH 1/5] x86/hvm: change EOI exit bitmap helper parameter
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7052f153-a7ed-da33-4319-f49370ef08ad@citrix.com>
Date: Thu, 13 Aug 2020 15:12:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812124709.4165-2-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On 12/08/2020 13:47, Roger Pau Monne wrote:
> Change the last parameter of the update_eoi_exit_bitmap helper to be a
> set/clear boolean instead of a triggering field. This is already
> inline with how the function is implemented, and will allow deciding

"in line"

> whether an exit is required by the higher layers that call into
> update_eoi_exit_bitmap. Note that the current behavior is not changed
> by this patch.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

