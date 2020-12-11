Return-Path: <SRS0=zDgU=FQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4C9C4361B
	for <xen-devel@archiver.kernel.org>; Sat, 12 Dec 2020 05:45:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA802313B
	for <xen-devel@archiver.kernel.org>; Sat, 12 Dec 2020 05:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA802313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50912.89955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knxiQ-0003RW-Vp; Sat, 12 Dec 2020 05:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50912.89955; Sat, 12 Dec 2020 05:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knxiQ-0003RP-Sa; Sat, 12 Dec 2020 05:45:10 +0000
Received: by outflank-mailman (input) for mailman id 50912;
 Fri, 11 Dec 2020 21:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tmXl=FP=redhat.com=wrampazz@srs-us1.protection.inumbo.net>)
 id 1knpwZ-0002f2-I9
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 21:27:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 90ff68e5-2648-47d5-b9af-f152df81388b;
 Fri, 11 Dec 2020 21:27:14 +0000 (UTC)
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-3dGxt_KeNhCxA8d0MZeqwQ-1; Fri, 11 Dec 2020 16:27:13 -0500
Received: by mail-ua1-f69.google.com with SMTP id b3so1934601uas.10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 13:27:13 -0800 (PST)
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
X-Inumbo-ID: 90ff68e5-2648-47d5-b9af-f152df81388b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607722034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2baaQLSNBEeqb8s4I052o+MuhTpKsGsOVMcltvWRcFE=;
	b=MS/6rZbU/buc9zcnquU9rlpJ7y6a29qJAmOsKrzkVtmTZyxPFJ0NPAiB0rgEoJFTJvx2V1
	Z9YEI0TC0K0ndOiqNDziy+/tOtgq41Zpah5T2qcJLr10T/LTEsUh6KFqu4MK8Yty+J+5DT
	UQLIzxVDLGm2q9BGWkNvwWa/gAsIOsc=
X-MC-Unique: 3dGxt_KeNhCxA8d0MZeqwQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2baaQLSNBEeqb8s4I052o+MuhTpKsGsOVMcltvWRcFE=;
        b=LxlaL3RPN8X0OgE9FJ9vcv4FTLJLCChyOuIfyVra8D12XbVIeE9Ee8hiFTklSHICNy
         blW8bkfjrZh7g6fj39jdEgjqVZxcRvPGtF2N8Jqeju1WEGgIUrKyFimFZSCxg+CyEoTO
         0YOwieTZ6yfc1/zMB4wJpmr6jjsbNdTxAODggnixbZsqFKcCxSXaSYrg0PU9kvl2iFyr
         MA2Ho2Ihm6BNNnHtmkG6lFp6YKBUTgrhd3RN0NIehJ6mJFDT1/Ftnj2hrLD/qoDKPuDL
         0a9Jn5rQwQg605EPF71YKTiTDBKSGJ3Ao3ky5QtzikF2pRDjRVj2MUDALoCCxJkwR1QF
         yCWg==
X-Gm-Message-State: AOAM530aD05i+5Z43ToDV6zIxG5pHFsyO2y/uZufmmpbVXIRZqrYbv2U
	w60VUCC0IoX5wha0i+Y7WOZO70Pz0lNwoP+J53YjXiOQbq2hxcQAavgWM7KI15yX9/VBonTtV4W
	eOqrjsmDpJTc8j4aFBDbE2s5+chgTDJSgZxKUZsxVnp4=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr16017730vky.1.1607722032623;
        Fri, 11 Dec 2020 13:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoAxYS7LmWjUd46I3qBH/wmX8+rEnzXAY9WUS8yNPb88aaCCmUw66PGF9HvP9W43g/thyTvGXx+ar4+M0xIEI=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr16017712vky.1.1607722032420;
 Fri, 11 Dec 2020 13:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20201207131503.3858889-1-philmd@redhat.com> <20201207131503.3858889-2-philmd@redhat.com>
In-Reply-To: <20201207131503.3858889-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 11 Dec 2020 18:27:01 -0300
Message-ID: <CAKJDGDYwUdGxHC4ctzqO6JfrsGQDv7uwdCC29x5Ty61=fzV2RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM
 X86 job
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, qemu-s390x@nongnu.org, 
	Halil Pasic <pasic@linux.ibm.com>, Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>, 
	xen-devel@lists.xenproject.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Claudio Fontana <cfontana@suse.de>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2020 at 10:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Document what this job cover (build X86 targets with
> KVM being the single accelerator available).
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: WIllian Rampazzo <willianr@redhat.com>


