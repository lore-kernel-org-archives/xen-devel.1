Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CDCC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:02:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378098.1623706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTD1-0003kp-De; Thu, 30 Jul 2026 16:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378098.1623706; Thu, 30 Jul 2026 16:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTD1-0003ki-Ag; Thu, 30 Jul 2026 16:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1378098;
 Thu, 30 Jul 2026 16:02:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpTD0-0003kP-3i
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTCz-00EBV7-Gi
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:02:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b7577-e002-0a2a0a5209dd-0a2a4503b08c-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:02:09 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b7581-fae8-0a2a45030019-d155802de9f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:02:09 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso15444095e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:02:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc88d7097sm7058704f8f.5.2026.07.30.09.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 09:02:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427329; x=1786032129; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5JqV2IgoJiP/5bR3TA19sAWti4WtH2o9SxHpsotcQs=;
        b=CJ0RyEWFAhsUSvRGorYuwBY7nfUZH/QZWn5iBXHvIIIVIBRgk6o+lmPrm7qOgEATCq
         3w4mC5tY2nEAwQWaTp/r8rf3XVizfkklQf5cFtNw+S16QUcIVlkd9xPS68HlA4hi6dvR
         TKnjjo88ILhgeSPNDlI9n/FhVgvf2nKiFwCsEY24UpbnS8MlCOFlq1mqVqsB36Rrgggu
         DEB6nat5AhyW1r6gUzcHCYm57osiR2tVxe8O8/9fCBB1nMmx7uC08R4G0rwbD/FVozuJ
         vCO44ALVSzEk1cm5nYzL0PIfPG1o/nkp6hLrATgyzU1kzKdhKBm13RPg/lApv+qey6m4
         4D5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427329; x=1786032129;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5JqV2IgoJiP/5bR3TA19sAWti4WtH2o9SxHpsotcQs=;
        b=e7D4WvADgQaQJVTbyJIO6wMlknFJmQLQ5PvuBV0eWGMXWCoByBwiF3GQadkWdnLgbZ
         MOzZ/tpaYINUM1EkixeiX+HDQi5YvxPLnM54bVVsWSAB4T3K1K2I6tNxXcs2hLvqdzbd
         r+pZ+bcZbEfzvledQ+QgqxXhaO3ha3dGy/dmyPDod7tyJt2CMRK4LzDnWLEeBYn2l+W6
         DryFpKvx8AAFCeBXXxZvc6dNvv4hbWb4xM7gaScwWHZszK9TsJaRW5d0cMy63NKYqsJg
         TLHRD19YQukTgf9z6SEGgEk2c/RDq0QWApoIQJP65gBdA7PRRUV1S/wyFI2/hVZE/Pur
         DmxQ==
X-Gm-Message-State: AOJu0YyhVPI2OY3xeQmieIlk0D9AHSeYbZuHRYnLgKQ0+K7sufxHbryR
	JEC7SdMsYUvzegAKxza3cvcjzbVYwOWGD/l4akRvDfGnmEwxBP3K3psRnkaMCw==
X-Gm-Gg: AR+sD12DXuo6YlSHKWq8jSt3778BtJdxZQ+l62GaquM9BXOlnnPOgeIXyxjlLjg//8H
	c4LHUlvwU8qPLo8K6a6qWn6D/aTxMO83A6qcfnPXGIk3arITTjwThESuu6sEZuIAMyO1TRte3KA
	c7aOJJ3UrA/QwDPlsZ3lzztfy4w67dfWkk/UmFCVfIA6qISrL2yjpSAlfHKmvLz9imoFD6XgPhJ
	K0NZV3qEIuIQruU+QAONFB/r7oDr7mey3Ydy8MO4I61xjwuSW8xo7J1qzsXd04x/5CzaO6U2zng
	sElmE5N8MhnJM63y4wn/V6dxj8s4xsIEigYWEBOfSbXTnpcQ7VIjezDiuxiqK4jkU14CXgM3P0y
	W//6mB25aPvtrUEFD8Bna+aVYQMI9VngpLbVXHesVnckhW2Ek0c1fuul58vBX1sJXXU+IwWbHyp
	p4chawyh7LOAs3JWSqSOiODneixhZ57j4sgjqzYjMttP7Kq3edpccHCiDFwz0/MfEc8xDUEJTmS
	5f77ZvAJXYQt+JOVk+qZkS+EzHi/jp3EzMH2Wvp5U4=
X-Received: by 2002:a05:600c:1d2a:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49800eb97aamr45183645e9.34.1785427328791;
        Thu, 30 Jul 2026 09:02:08 -0700 (PDT)
Message-ID: <e3c01386-0f85-4312-8da9-e1bc8ea3fa56@gmail.com>
Date: Thu, 30 Jul 2026 18:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-announce@lists.xenproject.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 advisory-board@lists.xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen Project Releases Version 4.22
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785427329-6E8CD4E9-7F762346/10/73395122804
X-purgate-type: spam
X-purgate-size: 1292

Hello everyone,

It's with great pleasure that I announce our 4.22 PR release.

I want to thank the whole community for their efforts in getting this
release published!

*Please find the PR article attached here
<https://www.linuxfoundation.org/press/xen-project-releases-xen-4.22-strengthening-open-source-virtualization-for-cloud-embedded-and-automotive-systems-1
  >*

Please find the tarball and its signature at:
     https://downloads.xenproject.org/release/xen/4.22.0/

You can also check out the tag in xen.git:
     git://xenbits.xen.org/xen.git RELEASE-4.22.0

Git checkout and build instructions can be found at:
  
https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes#Build_Requirements

Release notes can be found at:
     https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes

A summary for 4.22 release documents can be found at:
     https://wiki.xenproject.org/wiki/Category:Xen_4.22

Please find the released features below:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=CHANGELOG.md;h=aa1a777dd4a84765149425a89f2de10888c563f3;hb=HEAD#l27

Best regards,
   Oleksii

Come join the conversation on Matrix:

XenProject:https://matrix.to/#/#XenProject:matrix.org

XenDevel:https://matrix.to/#/#XenDevel:matrix.org

