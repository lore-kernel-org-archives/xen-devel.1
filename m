Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CAFC00A89
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 17:13:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4085B20797
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 17:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSeG/W5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4085B20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.16074.39349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYXxs-0000jp-5V; Fri, 30 Oct 2020 17:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16074.39349; Fri, 30 Oct 2020 17:13:24 +0000
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
	id 1kYXxs-0000ji-21; Fri, 30 Oct 2020 17:13:24 +0000
Received: by outflank-mailman (input) for mailman id 16074;
 Fri, 30 Oct 2020 17:13:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fiM=EF=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kYXxq-0000jd-JK
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:13:22 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ff9ca925-3ee7-401a-97f1-7e1125e2dc50;
 Fri, 30 Oct 2020 17:13:21 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-mFkj9phpOayQbYNxPQng0A-1; Fri, 30 Oct 2020 13:13:16 -0400
Received: by mail-ed1-f71.google.com with SMTP id bc27so2879577edb.18
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 10:13:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rn28sm2612035ejb.22.2020.10.30.10.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 10:13:13 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0fiM=EF=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kYXxq-0000jd-JK
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:13:22 +0000
X-Inumbo-ID: ff9ca925-3ee7-401a-97f1-7e1125e2dc50
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id ff9ca925-3ee7-401a-97f1-7e1125e2dc50;
	Fri, 30 Oct 2020 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604078001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DuNzb5Kn5X9pUmStEj+JKnJyNB4NfLrBdeM6NHGeIbs=;
	b=MSeG/W5BFgaAPjelMz4G385FsavPPQo+gqZuFo+/AR0O2gOUPn0plCcsO6Ysduc6xRWusw
	LoC1jVp0X/sChwyuxPSCMeKb6u0HmdROEnxl3EyJHIw5Yibp+8a3ZrlHnU5BSshrWMJ2W8
	N+WlGRYMRS9S1oqx/Q5rZedueRjLVQ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-mFkj9phpOayQbYNxPQng0A-1; Fri, 30 Oct 2020 13:13:16 -0400
X-MC-Unique: mFkj9phpOayQbYNxPQng0A-1
Received: by mail-ed1-f71.google.com with SMTP id bc27so2879577edb.18
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 10:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DuNzb5Kn5X9pUmStEj+JKnJyNB4NfLrBdeM6NHGeIbs=;
        b=Iwpv+mIsQHBrIH3sTTLqNVD6Lu2YTtbvPuCf29zATxxSccYsdBIXJZV6PidTe5QGhw
         BWmOLPBp5UWbSFzlCLdm4/3APd0aHMONtYuHvB+kscrXRlpJBdqoIoa1psJXFs9f//6n
         jv5IV0J/amGj2UqIx7rsP/lElmvkoWh46TBOju+PTEJJVcbZ2G5v0ho/7X1L/Va824Qh
         xaH8dfl+uZ/GB+3MjihejgypqcZQpmoE0E/zOvWP3gtLGAXNIDJYYgUMbvpkb2X9bsus
         CbWYP62YBiLHYoFc7wb7tZKWeI+/bHxw15rszBegNbwwL6UN+rJiwLnriNJiajFMk2Wn
         02TA==
X-Gm-Message-State: AOAM533fN7uf0r7pyhUQo+WdFiGX/6quwtil7gjv2WOI5LL/BPcUf5m3
	mEq8v1L+t7x0LwstMSd8T/vtlCxcuvCiAdZ4hDpHyA9+OHd/H67wPhCoP/WO6pkx7C/IGIt59c7
	OcUQ0s4/rVuLochk7jFuPSVOaFKM=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr3611019ejj.477.1604077994632;
        Fri, 30 Oct 2020 10:13:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNrqw+IPZ72SgiHrvzWBvPiDF1WXxJhZYdZEXFTddoFS+f0M1aGXH70Zz6DFO5MzIbmGeOKA==
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr3610991ejj.477.1604077994450;
        Fri, 30 Oct 2020 10:13:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id rn28sm2612035ejb.22.2020.10.30.10.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 10:13:13 -0700 (PDT)
Subject: Re: --enable-xen on gitlab CI? (was Re: [PATCH 09/36] qdev: Make
 qdev_get_prop_ptr() get Object* arg)
To: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
 <20201030113516.GP5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7645972e-5cad-6511-b057-bd595b91c4aa@redhat.com>
Date: Fri, 30 Oct 2020 18:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030113516.GP5733@habkost.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/10/20 12:35, Eduardo Habkost wrote:
> 
> What is necessary to make sure we have a CONFIG_XEN=y job in
> gitlab CI?  Maybe just including xen-devel in some of the
> container images is enough?

Fedora already has it, but build-system-fedora does not include
x86_64-softmmu.

Paolo


