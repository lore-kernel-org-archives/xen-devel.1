Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408F8C388F7
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 12:16:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10DF20729
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 12:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WM/T6Uuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B10DF20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19757.45085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaeBW-0002CM-FF; Thu, 05 Nov 2020 12:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19757.45085; Thu, 05 Nov 2020 12:16:10 +0000
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
	id 1kaeBW-0002CF-Bj; Thu, 05 Nov 2020 12:16:10 +0000
Received: by outflank-mailman (input) for mailman id 19757;
 Thu, 05 Nov 2020 12:16:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kaeBU-0002CA-PD
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:16:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f117fe0e-a7ff-4b79-aaa6-bd9efbde5763;
 Thu, 05 Nov 2020 12:16:05 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-L2z54I-1M8OoQQrCIQUUvA-1; Thu, 05 Nov 2020 07:16:04 -0500
Received: by mail-wm1-f72.google.com with SMTP id o19so552018wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 04:16:04 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 89sm2413628wrp.58.2020.11.05.04.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 04:16:01 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=68sV=EL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kaeBU-0002CA-PD
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:16:08 +0000
X-Inumbo-ID: f117fe0e-a7ff-4b79-aaa6-bd9efbde5763
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id f117fe0e-a7ff-4b79-aaa6-bd9efbde5763;
	Thu, 05 Nov 2020 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604578565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9ICR1yXh3FG7V16PL+z404rlhj3Yi3iLJ9NPtGdMTA=;
	b=WM/T6UuoLm6j9V4ScywLDc6lX3Y/SFfm3q//cngaZBEt7fY/BDPOpT9NU4UXKcrT0WIO/8
	Lgs4xSUrw+OsLskGmHNdwqTCbIuHv8huChNkBJ56vv2zNbGy9exeCW+Qlgofp8nV1/lgqn
	PpyrX+ai/vw29ZlBpdToLDmwKhjzhjM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-L2z54I-1M8OoQQrCIQUUvA-1; Thu, 05 Nov 2020 07:16:04 -0500
X-MC-Unique: L2z54I-1M8OoQQrCIQUUvA-1
Received: by mail-wm1-f72.google.com with SMTP id o19so552018wme.2
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 04:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M9ICR1yXh3FG7V16PL+z404rlhj3Yi3iLJ9NPtGdMTA=;
        b=Puk5QEBtTeBJDMLdyxZOYMr8vwCusIXnrx0udb8QF5v52KzxambuNPsDx5hZ6E8leF
         wx9kJQp+ylYp8akJf3IMR8DgVu9NymvgFqYb1PBBqu0zxeIR1NYkQHrtKwCPYmkyaTxh
         3Tpn7kyfux50T73oGrk60j/qRQhViA4ryN5z/+CQdcUFjrzxF6TISZ5XmdcUehJgCR5O
         m2Z5rvqt4XJ2/DUdYvLkB/6FtAyOzQG+1Bwk9SRaSWq4EyVRCuehfCWiHCwYurNkYViX
         MKQ+VM/eUeU4H6t8uEfIet6EvazfU1ygb7HvglpkNGQJcOjNkVG/9SSjXBQGX7yfT5Do
         oAkw==
X-Gm-Message-State: AOAM531flenvTlbw+eSv1jedV8mxA9+qcVYVNH8wmITZPF1uBQwXCf0x
	FKNQXu5ypnyXlBynVlPza8yT4ukL0txzhkuLspDv8pmdHgE6P7xhWPlX66LqZBvEnYU1ojEcY1u
	b985GC5jieZsM4fJR2QPOBEpaqZ4=
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr2406918wmj.101.1604578562984;
        Thu, 05 Nov 2020 04:16:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUna/uTT3GoKmJffb5+QYG325EJWzeGaJI9YrtAx/wl8yEiUHnt1PCFQCITOvfdErMIV251g==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr2406887wmj.101.1604578562777;
        Thu, 05 Nov 2020 04:16:02 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id 89sm2413628wrp.58.2020.11.05.04.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 04:16:01 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem
 between 9pfs and Xen
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <rth@twiddle.net>
References: <20201104115706.3101190-1-philmd@redhat.com>
 <20201104115706.3101190-3-philmd@redhat.com> <8965407.pN9RvXrJQ9@silver>
 <20201104185439.41e9ddb3@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17370310-d69c-91ff-763d-52a1355ad605@redhat.com>
Date: Thu, 5 Nov 2020 13:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104185439.41e9ddb3@bahia.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/4/20 6:54 PM, Greg Kurz wrote:
> On Wed, 04 Nov 2020 13:18:09 +0100
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> 
>> On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daudé wrote:
>>> Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
>>> CONFIG_9PFS (probably a wrong conflict resolution). This config is
>>> not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
>>> depends on CONFIG_VIRTFS.
>>>
>>> Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
>>> fix the './configure --without-default-devices --enable-xen' build:
>>>
>>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
>>> `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefined
>>> reference to `xen_9pfs_ops' /usr/bin/ld:
>>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to
>>> `local_ops' /usr/bin/ld:
>>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference
>>> to `synth_ops' /usr/bin/ld:
>>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference
>>> to `proxy_ops' collect2: error: ld returned 1 exit status
>>>
>>> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Acked-by: Greg Kurz <groug@kaod.org>
>>> Tested-by: Greg Kurz <groug@kaod.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>
> 
> Phil,
> 
> Same questioning as Connie. Do you intend to get this merged or should
> Christian or I take care of that ?

Same answer too =) If you are preparing a pull request, please go ahead!

Thanks,

Phil.


