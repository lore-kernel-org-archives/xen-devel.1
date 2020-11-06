Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121DC2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 10:28:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78728206ED
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 10:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejZ6JohK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78728206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20608.46622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayy3-0006PU-QO; Fri, 06 Nov 2020 10:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20608.46622; Fri, 06 Nov 2020 10:27:39 +0000
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
	id 1kayy3-0006PN-NP; Fri, 06 Nov 2020 10:27:39 +0000
Received: by outflank-mailman (input) for mailman id 20608;
 Fri, 06 Nov 2020 10:27:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wn+7=EM=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kayy2-0006PI-Ta
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:27:38 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28fd1890-da98-4f7f-9fbd-bae6b5694c32;
 Fri, 06 Nov 2020 10:27:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so736102wrf.12
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:27:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm1526567wmj.40.2020.11.06.02.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 02:27:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 156E71FF7E;
 Fri,  6 Nov 2020 10:27:35 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wn+7=EM=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kayy2-0006PI-Ta
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:27:38 +0000
X-Inumbo-ID: 28fd1890-da98-4f7f-9fbd-bae6b5694c32
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28fd1890-da98-4f7f-9fbd-bae6b5694c32;
	Fri, 06 Nov 2020 10:27:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so736102wrf.12
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=SyBKF5lvpBcPf2igl0ogG/qJ4sn+brqfAU2r6HmwwSE=;
        b=ejZ6JohKG0rn5WQjVRFWJbtHCFsrWiqlveT4qu6dAxHWdIe/z6hoGvh+j+dvqZBsQs
         6CNA9CGpTD/0rr2V5PFwRIKF071QDT8Iocm29HCpZELu3WHs6kmBY7ovACtfc6Fcp5dj
         Eg1NpxjnRLMuzCOFUQo6BTgA1t31GjfUK9rlXZg/qz6U9AzPZfLtX1T0YHWCCLKA6m8Q
         6TC9GnP1DY7A1flkOXGdwv87t1lsdB7vaDmpwitbv9JFKcK1B/O1ThCk5TIrZNt2gNXP
         VJVYo5qlv0Ye2rjkJwfk8DApma5vT8SlTBs+usTLk1Vo/+JXiZ04DbmOMu8PTqZfsTEC
         j9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=SyBKF5lvpBcPf2igl0ogG/qJ4sn+brqfAU2r6HmwwSE=;
        b=mcIyBMdkkyOXTb3RIDVQsGtfxGPAesg0YOX4jTjjpW0b60h0rE3VEr4LOmxxdiKJVp
         jhwNaN+oozXTIfdDf4/GVLagzLpaeudFbZK/z1HTWJe5R/Hj9vMJ07kdnWEQy9WU6zMz
         GEgAKf0KjYouwBp2ygZsyGkSBKQH03YDAJEkQc7PQcbiUaqxUTSdRhZyP4Wlbr+3tNtK
         Og2QcFG5cNW+CL62giRaZ4qYzNdSkT4pH2dlX01vchjtbEpzaM7IF8j+PScHSaQDdyYp
         ohmlxC9FLKj6kibdch4IMrGgDOasI5+p4lg9xFomNzcIKusAUzAOmfRa1R70hVbf4XU/
         sJKA==
X-Gm-Message-State: AOAM53137qOR98c/wcE6/SGacUKg+kiVRx4d3JuS8ygO8E8bYUPKN7Dr
	Qxnt0vIMVhzloEfoypjFpnXHNg==
X-Google-Smtp-Source: ABdhPJw553yGEbhizv9iCXBgj+jdsaxGTZUcWSpTtS2mWg52QvG6/RKniP75yXJMvBedSQPMaQAwbw==
X-Received: by 2002:a05:6000:8d:: with SMTP id m13mr1824130wrx.216.1604658457162;
        Fri, 06 Nov 2020 02:27:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u6sm1526567wmj.40.2020.11.06.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 02:27:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 156E71FF7E;
	Fri,  6 Nov 2020 10:27:35 +0000 (GMT)
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-13-alex.bennee@linaro.org>
 <11afa6f8-ec49-ab2b-2011-ef22665cd0c3@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, masami.hiramatsu@linaro.org, Paul Durrant <paul@xen.org>,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 takahiro.akashi@linaro.org, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
Subject: Re: [RFC PATCH 12/15] stubs/xen-hw-stub: drop
 xenstore_store_pv_console_info stub
In-reply-to: <11afa6f8-ec49-ab2b-2011-ef22665cd0c3@redhat.com>
Date: Fri, 06 Nov 2020 10:27:35 +0000
Message-ID: <871rh6bx0o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/5/20 6:51 PM, Alex Benn=C3=A9e wrote:
>> We should never build something that calls this without having it.
>
> "because ..."?

  xen-all.c is only built when we have CONFIG_XEN which also gates the
  only call-site in xen-console.c

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  stubs/xen-hw-stub.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>=20
>> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
>> index 2ea8190921..15f3921a76 100644
>> --- a/stubs/xen-hw-stub.c
>> +++ b/stubs/xen-hw-stub.c
>> @@ -10,10 +10,6 @@
>>  #include "hw/xen/xen.h"
>>  #include "hw/xen/xen-x86.h"
>>=20=20
>> -void xenstore_store_pv_console_info(int i, Chardev *chr)
>> -{
>> -}
>> -
>>  int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>>  {
>>      return -1;
>>=20


--=20
Alex Benn=C3=A9e

