Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A480C79F99
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 21:17:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411060.1641817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3ghq-0000SL-EM; Mon, 07 Sep 2026 21:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411060.1641817; Mon, 07 Sep 2026 21:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3ghq-0000SE-BZ; Mon, 07 Sep 2026 21:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1411060;
 Mon, 07 Sep 2026 21:16:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1x3ghp-0000S8-EB
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 21:16:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3gho-002O5G-RD
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 23:16:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a9f2974-8faa-0a2a0a5109dd-0a2a4507df3c-32
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:16:44 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6a9f29bb-b4ea-0a2a45070019-aa0a857c6979-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:16:44 +0200
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-SeNEevirPw2xlOwOZvOJXw-1; Mon, 07 Sep 2026 17:16:41 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-485866e0066so2135272f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:16:41 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm26191451f8f.9.2026.09.07.14.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 14:16:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788815803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mw8RFV/2HjpqWkwUwmTokzDl1/223/6QlsoHVWfboPU=;
	b=RMkbwb4dcu+vzvPC1g6A2PqKkPa4vUm9wHZr1aYcRu51gy/K/xLpNojESwlRNG9IZ3WwYK
	qQxDylMdIpsSeRI+bOlarBYJps9J4ArAAqu3bH31UDG97uANCeizbbNxmdmLWKnSStc2Id
	3SELq7RHFxHN7fi2/yCuZl5+KR9FcJ0=
X-MC-Unique: SeNEevirPw2xlOwOZvOJXw-1
X-Mimecast-MFC-AGG-ID: SeNEevirPw2xlOwOZvOJXw_1788815800
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788815800; x=1789420600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mw8RFV/2HjpqWkwUwmTokzDl1/223/6QlsoHVWfboPU=;
        b=PzXi0M6xDWGIO96GJnA2jqxH/8uzXbgPMyWk2ITD856T9FQbQx5OSMyidp1rOb9WFU
         W6YGeeHipB/lRIdqRGkmTOhudFHuREIxrrkw1rigUJS9LVA98c8lhgO5W7pTDdjJrFGH
         Skts9wZ2+vGtysxBX/yiiM992RUVM6UeIBV4JeodvtXqi8HEK0FlFUt5ye7uNKhMkyr+
         +FawJxUHr6KDSLMjN4gMVhn2Lb8c6KCAJq6odS6r98iMfY28Pd32i1uG9wpNuheqM2hb
         dccSBQ0c6PyMi0uvpWN1i5bK36pqZ8BKijc5XkXCYcxt1xLDUNCOmotG3m7neIw/uxnK
         VBOw==
X-Forwarded-Encrypted: i=1; AKwUvBxk7S0N6/QMPlxc5XxBN3xnm9dnj0UmiXcK8GE+n1kJzHMkVrstv/UFG3D7+d0yJLX4MErnNKJeAF8=@lists.xenproject.org
X-Gm-Message-State: AFuF++l08V22OJ2KgJQEokhqN1QY/yA5aocXeQBEpkcWOuQiYE7ElFna
	oHqy8owcuKAaxPZInNEhF4qrkRrK8PhKAf/zbh5APGxtRaAMKjXdIcC7vazwlY86+yydKRhfDkO
	0d8LjlDP88Dmm1ZuH8uPg00MSuHneEp3a6c2+ZqIfyvDwx9QCBgh/DkiBI1YijfpKJR2J
X-Gm-Gg: AYBFou0RFZRXOqGbxNX4esOaeA+KSXYgf00S5wmGXo0pI0Ljk3lpB/B0YNzssH3CpxI
	aGt/AmUopV1FG0wfPwxI948UI1czMH4MNsCMagBaqgm1k4nuDHUxtio0HDrHPQqypjxHK6bOin8
	a/ExOZNtirvMQrX3/C26SEZhyj9VAltXCJ3Hnw3YWozzVLl2GowA9fCAAPH+0E7uJiyAc0loq7O
	mnL90iQY8MQKEw81qeIkaUvbzx/oi59B1IjJQKoY0ke4L9ADdtqoD5VqL/jf6Z+zM/Yz/qw3Qi3
	VPTQWFf1kynfo7Ir/+ggySfP/DHDlKcvLmx+edKQ/Z/QrhUaevaDlBmof/i8F6dJwkIgqxdWjb1
	pfdPTmTkI+d++3xXez+fsdkI=
X-Received: by 2002:a05:6000:1a52:b0:481:51ce:542f with SMTP id ffacd0b85a97d-485872b40e3mr21034577f8f.21.1788815799871;
        Mon, 07 Sep 2026 14:16:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1a52:b0:481:51ce:542f with SMTP id ffacd0b85a97d-485872b40e3mr21034526f8f.21.1788815799406;
        Mon, 07 Sep 2026 14:16:39 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:16:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org, dave@treblig.org,
	anisinha@redhat.com, philmd@mailo.com, aurelien@aurel32.net,
	mjrosato@linux.ibm.com, alifm@linux.ibm.com, farman@linux.ibm.com,
	richard.henderson@linaro.org, iii@linux.ibm.com, david@kernel.org,
	pasic@linux.ibm.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
	alex@shazbot.org, clg@redhat.com, akrowiak@linux.ibm.com,
	jjherne@linux.ibm.com, sstabellini@kernel.org,
	anthony@xenproject.org, edgar.iglesias@gmail.com,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	joe.jin@oracle.com
Subject: Re: [PATCH 0/8] Force detach PCI devices for ACPI-based and PCIe
 native hot-unplug
Message-ID: <20260907171522-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <aoxY4Rxst2qAyn5z@redhat.com>
 <01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
 <20260903172835.0e253a25@imammedo>
 <6154b857-16b3-476b-a2cb-8837464dd4cb@oracle.com>
 <20260907044608-mutt-send-email-mst@kernel.org>
 <296a04a7-f917-4abd-b564-4a6b8fc6aace@oracle.com>
MIME-Version: 1.0
In-Reply-To: <296a04a7-f917-4abd-b564-4a6b8fc6aace@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1taDTRGFZUBoRqBjgR28qygnpPPlk3O4GO5IeSGcEvI_1788815800
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-ef75cf/1788815804-366DAAE4-8A5ED4D2/0/0
X-purgate-type: clean
X-purgate-size: 428

On Mon, Sep 07, 2026 at 02:06:29PM -0700, Dongli Zhang wrote:
> 5. By instrumenting QEMU code and possibly adding additional metadata, we can
> track whether a PCI device has been accessed by the guest VM, especially during
> PCI hotplug. If the device has never been used by the guest VM, it may be safer
> to force-detach it.

this last one I am not sure about. as I said, devices are commonly
accessed by firmware.


