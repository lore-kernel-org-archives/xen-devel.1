Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC740C433F5
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 18:45:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2217610FF
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 18:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2217610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183487.331687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOP3D-00007k-Kw; Thu, 09 Sep 2021 18:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183487.331687; Thu, 09 Sep 2021 18:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOP3D-00007d-HO; Thu, 09 Sep 2021 18:45:31 +0000
Received: by outflank-mailman (input) for mailman id 183487;
 Thu, 09 Sep 2021 18:45:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Llr=N7=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1mOP3B-00007D-MQ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 18:45:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 19b4977a-119e-11ec-b1e5-12813bfff9fa;
 Thu, 09 Sep 2021 18:45:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-BpmAA2n0MWGi-nGcYVOKCg-1; Thu, 09 Sep 2021 14:45:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20C28B8D3F;
 Thu,  9 Sep 2021 18:45:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892105DA2D;
 Thu,  9 Sep 2021 18:45:05 +0000 (UTC)
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
X-Inumbo-ID: 19b4977a-119e-11ec-b1e5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631213127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlL3i7aLjbTCNV8w6dHeoPvCpP3Y0rLMHrE4Kn6x5oI=;
	b=ZOraNPqIXQjRXxBuxULpzSORwtl8xMm64RwsRENy6CqaNzVv+4Wc6sFUNj/U/P96ukkWMQ
	so5OSsnpsQmnfOLDsVZbtqpQGngh+8pQQiCsj0jnX9qDDoCsQJWXLGnWf1jgl1lJ6v9HZ9
	oJ3YReYY3bukffTNL4mAx53zHr6dv64=
X-MC-Unique: BpmAA2n0MWGi-nGcYVOKCg-1
Date: Thu, 9 Sep 2021 13:45:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 01/10] sysemu: Introduce qemu_security_policy_taint()
 API
Message-ID: <20210909184503.mjg37ckq3ga4fzag@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-2-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:15AM +0200, Philippe Mathieu-Daudé wrote:
> Introduce qemu_security_policy_taint() which allows unsafe (read
> "not very maintained") code to 'taint' QEMU security policy.
> 
> The "security policy" is the @SecurityPolicy QAPI enum, composed of:
> - "none"   (no policy, current behavior)
> - "warn"   (display a warning when the policy is tainted, keep going)
> - "strict" (once tainted, exit QEMU before starting the VM)
> 
> The qemu_security_policy_is_strict() helper is also provided, which
> will be proved useful once a VM is started (example we do not want

s/be proved/prove/

> to kill a running VM if an unsafe device is hot-added).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/run-state.json   | 16 +++++++++++
>  include/qemu-common.h | 19 ++++++++++++
>  softmmu/vl.c          | 67 +++++++++++++++++++++++++++++++++++++++++++
>  qemu-options.hx       | 17 +++++++++++
>  4 files changed, 119 insertions(+)
> 
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 43d66d700fc..b15a107fa01 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -638,3 +638,19 @@
>  { 'struct': 'MemoryFailureFlags',
>    'data': { 'action-required': 'bool',
>              'recursive': 'bool'} }
> +
> +##
> +# @SecurityPolicy:
> +#
> +# An enumeration of the actions taken when the security policy is tainted.
> +#
> +# @none: do nothing.
> +#
> +# @warn: display a warning.
> +#
> +# @strict: prohibit QEMU to start a VM.

s/to start/from starting/

> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'SecurityPolicy',
> +  'data': [ 'none', 'warn', 'strict' ] }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


