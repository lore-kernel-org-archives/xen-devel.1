Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C50C4361B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 11:33:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC9D233A0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 11:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC9D233A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46323.82200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmElZ-0007p2-TU; Mon, 07 Dec 2020 11:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46323.82200; Mon, 07 Dec 2020 11:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmElZ-0007ov-Ps; Mon, 07 Dec 2020 11:33:17 +0000
Received: by outflank-mailman (input) for mailman id 46323;
 Mon, 07 Dec 2020 11:33:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUZZ=FL=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kmElZ-0007oq-Cs
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:33:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ad371ca6-b359-42c0-a1ca-2960136a0a51;
 Mon, 07 Dec 2020 11:33:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-p6QMBE0tMBi98nP0Oz0kPQ-1; Mon, 07 Dec 2020 06:33:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F07180A092;
 Mon,  7 Dec 2020 11:33:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8A660C13;
 Mon,  7 Dec 2020 11:32:59 +0000 (UTC)
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
X-Inumbo-ID: ad371ca6-b359-42c0-a1ca-2960136a0a51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xdBCwIggNRrC/nj8pC9pamACvDBeORdRC9fwQeI4Ss=;
	b=DO31zYnL1cy7+leYgIz733Wp0lKvHUc1M0GKtEB8Ywrn15LM6VXLzF5X5FdsRnfcA7/SW7
	8E/X6TaSgL5GrTw4eUB+NB2al2HWra7/U5hXh/YDbYgsfiuf0Dw06Cuc+XnRJL86geKtlB
	bniUkTsO/CJbqmskapQTNTcQ7Eyx48Q=
X-MC-Unique: p6QMBE0tMBi98nP0Oz0kPQ-1
Subject: Re: [PATCH v2 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM
 X86 job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-s390x@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0a146451-04de-e29c-1e6e-91f2162306ee@redhat.com>
Date: Mon, 7 Dec 2020 12:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207112353.3814480-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
> Document what this job cover (build X86 targets with
> KVM being the single accelerator available).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b16..ee31b1020fe 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -220,6 +220,11 @@ build-disabled:
>        s390x-softmmu i386-linux-user
>      MAKE_CHECK_ARGS: check-qtest SPEED=slow
>  
> +# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
> +# the configure script. The container doesn't contain Xen headers so
> +# Xen accelerator is not detected / selected. As result it build the
> +# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
> +# available.
>  build-tcg-disabled:
>    <<: *native_build_job_definition
>    variables:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


