Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847D9C5DF85
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 05:16:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394519.1633244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYek-0001DN-T9; Wed, 19 Aug 2026 05:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394519.1633244; Wed, 19 Aug 2026 05:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYek-0001DD-Mk; Wed, 19 Aug 2026 05:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1394519;
 Wed, 19 Aug 2026 05:16:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwYej-0001D2-Eo
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 05:16:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwYei-004J9Q-6J
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:16:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853c0c-8faa-0a2a0a5109dd-0a2a4503d8d8-18
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:04 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853c13-fae8-0a2a45030019-d155dd33b571-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:04 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso487232f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 22:16:04 -0700 (PDT)
Received: from notebook.. ([78.173.117.23]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b80a5sm2827700f8f.24.2026.08.18.22.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 22:16:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787116563; x=1787721363; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlPnMake1WeKgYBILi+3s7wjU1+1VkocmbnS5yGfgZA=;
        b=XKM1ib60WCUDXhtApBkkTTbIzUKXrqhd5ZOz36+oCjlO6Dncoi44vu/yOT0OEdl6eC
         URvFzl0ELMwn2IOgxLxjsrNskGGnUHy0woaPePUiq4Zt7zRV5gb6jfj9dMjpyNkbSZ4X
         38mAflweF8t5OvBT7RVJy3Cy4sW2Ge6e1tJH28C13OJNtASrKMnkcsgPCzp7ZasNwko/
         BGVzERp9Jlh+w3swye6XbHduZcTPFAhJ7EIO5fOVbCt7ZdZcdulWHgexxBZ6U2iTdsR8
         S3E5b52kgoGSuLewOkRITce7fVr3onXYyhDfDm3VnXtX0o1FAy48Z9sgiGGF6MNotGfA
         D01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787116563; x=1787721363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlPnMake1WeKgYBILi+3s7wjU1+1VkocmbnS5yGfgZA=;
        b=fgo5QGKxzRygKUBDXLWwAWTtclRyZLF5BBWVdcXedDV3UujtoBNQSg7cFn496cgDGi
         ZCQiTS50PfmXx3OuTm5bdRTzpwOROlxcu9zOTZk2zygzTcSe5Za8vGK39ST6cB4AfZDS
         pFqXvDZensuaYfTfhZ4pUVQo+aMjatYg7armms9ouS+GSh4HVV2tR+yEFqpXJT2cm/Jb
         eErnG2Rufl2IW9JmKhAwBTR3cstFCvKFqqPr5BuqpTmZxl8dlKuT6eBCPGKPnNC2mSPn
         Fsu9TWp3bcuwdW/KLYuWHFNLy8KSOCeZsY+wWGAKM3kxc6x/BZecyW3rqb8q6M863U6I
         J9Ng==
X-Gm-Message-State: AOJu0YzdoVVm3Xfe3wPnpDDIhQbqxjf/T+GOElIV+F6y+Q9zPMNIYt8g
	+7x337KsymT39+JtoKig3QEJy394pv4moaivlKwUCw47Ag3gulFI6A1r/vqZdg==
X-Gm-Gg: AR+sD13qRN+s2fuREjqsZwv7NPZH/3gun2Iau+qcp6t2zEHq2NjluE5JC9ro9eb9AFp
	F1Uv02hwVJkJrY8s5gAMN2tk7LfTZd0ScK3P3MEwOjkE19eSu3lAPWxSCeIOJidDOVRharTCsnR
	eDfKVA2LqaJFxIVUxdag50XfSpfBCzggHNUO7c8mP07N/u7lZqcX7ViH7MFk+TbD2Pa28PH9Dvc
	3DMm0yXQSxtUjRGkD/QLEfFRi82hOn72CUMOFknwf4ytTgPStxjLF8EbPYCcMKus+jeBrTsW4PO
	2Ccp4wHGXztk/qVzp1EOrSVqLD7XkHa7TB15ThDjWQhyhsS7dHm68fMawAht27Ri7+8fWDyx3wb
	FQTBKNrLW850HjBZkvkCD1iQRHlhx3N+Z5l2fSr+L4CgJxbtVP/gUs8jGD+TvpPcoAlG6Pcff8t
	ul96P7CJbIBLbCp+NQof+l8HVJeK8iQdUeRZ1GKNtMimRKnwUKxi/Xll4tM0sV
X-Received: by 2002:a05:6000:715:b0:481:57f7:6015 with SMTP id ffacd0b85a97d-482b1e96130mr2875074f8f.6.1787116563513;
        Tue, 18 Aug 2026 22:16:03 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 0/2] xen/sched: fix crashes when vcpu creation fails
Date: Wed, 19 Aug 2026 08:15:30 +0300
Message-Id: <20260819051532.9197-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787116564-764FC4E9-C80521B3/0/0
X-purgate-type: clean
X-purgate-size: 279

Furkan Caliskan (2):
  xen/sched: core: skip missing vcpu slots in sched_move_domain()
  xen/sched: core: kill unarmed timers on sched_init_vcpu() failure

 xen/common/sched/core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.34.1


