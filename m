Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CFCC624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 16:05:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404854.1638526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QzM-0007oI-BB; Tue, 01 Sep 2026 16:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404854.1638526; Tue, 01 Sep 2026 16:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QzM-0007oB-8L; Tue, 01 Sep 2026 16:05:32 +0000
Received: by outflank-mailman (input) for mailman id 1404854;
 Tue, 01 Sep 2026 16:05:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1QzL-0007o5-Am
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 16:05:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QzK-008kqP-IM
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 18:05:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f7c5-8faa-0a2a0a5109dd-0a2a4509bdfc-14
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:05:30 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f7ca-be1a-0a2a45090019-d1558035ad41-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:05:30 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so34650445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:05:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9269f1b6sm273269135e9.4.2026.09.01.09.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 09:05:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788278730; x=1788883530; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AbuICIoNGzBdRJXA7FCwp3jUZqBDb4bPalbg5kTERBI=;
        b=joPZWQ2O5RFerk56Rs1g/l0UHTvIZIM9jsYscl1+JaYQO8pN1yX19FnN4kk9XCg+TD
         DrJ4uHuwWQj6OZlwdTS8feA8Sp2MMGIq67HKl8dS+s4nxmv9Y6jUKnQCQb0v+xw9JIBN
         UL5NcaWfq4gcp4mzaoSn2tPkLRvv+pJ3HnAvtFX272rXyN5ND30nJS7KXPAnLKN+iEUi
         JfNr2Vi/05gQbpLKsarIvJUpDLXP2TGcoUT4Zxu0c1prVqwzLDIxkxpbvXXUNCyCWuEJ
         V37XAouD0B6wVvL46ucwZDr7lqslgaARzqRBG/tX+5U/7SwqMoxihdZZyakW49ysBjlT
         rWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278730; x=1788883530;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbuICIoNGzBdRJXA7FCwp3jUZqBDb4bPalbg5kTERBI=;
        b=lLuDsu6VYnNxIsibIhD5PxoF/97UzcH1quZ83J0sPYk5FcaJ+8OekJ4PaP1PJy5clh
         5k3OyldU5hb5x2DC6M9gWhI+66f/jyB1KvpsfcyRn4/yNpRzCSOcm1A5lf5Yjjeq8elP
         R6X8mmGR/4my+9KDae0A6MQxKD+3tIalJrVgttyIkUMrhoycFFaQRi+LD+pVQbw9bW1M
         D8y/GDknSA6dMajnLdkqpNz+GqtHiHnCp4usY8JAsSAABVWTGEGLWeNW6Mdw2PSqtzyy
         l4UX4XF7lBeO4wV8R/s6oWMp09zaHSAoU45CFC5loaS7Sl+tuySCh4n3uRh0x3RIZdee
         j6lg==
X-Gm-Message-State: AFuF++lmnglqsZevbJXEZUaKFTK1YngV3C/gKQAO4zg9i26dPK3Og+rG
	AeV9M6O8abMazwBVfhjQXyrxaIUNMwz2eZlZh+cF2IkLTJrkLJmrq1q8yhHL+Q==
X-Gm-Gg: AR+sD13sdkB0DYen+9whvT7DLwZ1MAzPNMvZ0h+LgLldT6mNa26zN4LaxiK5lI6GgIJ
	RrNIjPCn0jqFJkruVctq9ZoBgkPUiyp9KbbRiJql7ZUKH5XKPfGe46991YaLPD8Tx2sHVRGTnSM
	giAYf8xyLpgoO5SAE2PmiyMqPXrNXzRNfsULgcqaxqfw53PB4lF6PviqoypbjU2J3l0PdZwPfXu
	ugRK9E0sCvtbiffj5dDa5FQWMRVYuYI2syZXOxJ8s8Qw0Z+WKqkOabwtSg2Um65/QpbS0LxFz1q
	B+ZpYcXSb6sf4RcmrvB+jPCQI3Dnvx5UTpgvcpWvOEaFajRoTfD8ESXq2CTL/7zM8V4wHFeyCLn
	gE5JGCgO6/sFnACybOfwtND3qLjZ6+C7h3ceebhLV1rH7SY/tBC70ubKiOxRg9qNVN/YAZT2Uu3
	LxUA/37Ug9UN3OAk+1XhSOixzv1lHmOWrzul09QPbSX4OfijTpu3kSN1m1ENqhG120QvJtslq/K
	AJ+qZXNrIXMkLVAQJh7zU85UuPAYmOEUJJ32Br1+g==
X-Received: by 2002:a05:600c:524c:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49cdc55a9e5mr141652635e9.14.1788278721179;
        Tue, 01 Sep 2026 09:05:21 -0700 (PDT)
Message-ID: <ad1588cc-3130-4ea6-a7cc-0210b507b7a4@gmail.com>
Date: Tue, 1 Sep 2026 18:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.23 planning: items for the release
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788278730-BECDF034-99D55FE3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1333

Hi all,

As we are starting to plan for Xen 4.23, what items are you planning to
work on during this release?

If there is an existing RFC, design discussion, or patch series, please
include a link.

Short descriptions are also welcome.

I will try to use the gathered items to provide some kind of monthly update.

As I am mainly working on RISC-V-related topics, here are some of the
things we are planning to work on connected to RISC-V:

- Dom0less guest domain creation:
https://lore.kernel.org/xen-devel/cover.1787836900.git.oleksii.kurochko@gmail.com/T/#m2697fe1ca8d7c07eda0b11d4c5183a18e46d6f97

- AIA-related topics:
https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#mae53a50655abd12ef4851a328b68a182b23abcac

- CI-related topics:
https://lore.kernel.org/xen-devel/1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech/

- Support for real hardware (HiFive Premier P550) with a PLIC interrupt 
controller:
[not fully connected yet, but some preparation work]
https://lore.kernel.org/xen-devel/1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech/T/#t

Other patches are going to be sent later.

- Dom0less guest domain launch. [patch series planed to be sent]

Thanks in advance.

Have a good week.

~ Oleksii

