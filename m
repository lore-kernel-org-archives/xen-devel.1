Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23AEC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:28:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378199.1623772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTcH-0002qF-TL; Thu, 30 Jul 2026 16:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378199.1623772; Thu, 30 Jul 2026 16:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTcH-0002q8-Py; Thu, 30 Jul 2026 16:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1378199;
 Thu, 30 Jul 2026 16:28:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wpTcG-0002q2-7t
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:28:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTcF-003oMv-Kn
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:28:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6a6b7b7c-bab6-0a2a0a5309dd-0a2a4507db7c-16
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:28:15 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6a6b7b9e-b4ea-0a2a45070019-aa0a817cea87-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:28:15 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-7xMYhJITPlqpE46A-NtYBA-1; Thu,
 30 Jul 2026 12:28:09 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0B62D195608D; Thu, 30 Jul 2026 16:28:07 +0000 (UTC)
Received: from redhat.com (unknown [10.44.50.113])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 63B801800480; Thu, 30 Jul 2026 16:28:03 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428894;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y4UE00n91iOuO1sMGSgdTcXw7u/2gX5tngNSzLTVMg=;
	b=NxZ58oobzHkhjI4YE+R4wW1zuz3/hPiU4S+1ljwFg64gPuoFvwAsyUDgUXR8ZFs/RMkNPF
	YXCEGizf64hiHAoo4026Lwv4J4OWXTmjKsxN8mJfHwaSxTdRaQFu2ZqINk9aqvRdJThtur
	inVhF2YStC/VC+jkabWfCULTaqXuqlM=
X-MC-Unique: 7xMYhJITPlqpE46A-NtYBA-1
X-Mimecast-MFC-AGG-ID: 7xMYhJITPlqpE46A-NtYBA_1785428887
Date: Thu, 30 Jul 2026 17:27:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org,
	xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	anthony@xenproject.org, paul@xen.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386/pc: xen: reinstate the "xenfv" machine alias
Message-ID: <amt7j5SAZo07O7xB@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260730162238.3308286-1-dfaggioli@suse.com>
MIME-Version: 1.0
In-Reply-To: <20260730162238.3308286-1-dfaggioli@suse.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: prjHF_tdPwjzOPpFFne5a2W_XQwrT-a4h_w9hMUwYXY_1785428887
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785428895-374D3AE4-FD4CC120/0/0
X-purgate-type: clean
X-purgate-size: 1132

On Thu, Jul 30, 2026 at 06:22:38PM +0200, Dario Faggioli wrote:
> Commit 7d2778dea32a4924a469f1cc5767042c8f5b4eea ("hw/i386/pc:
> Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines") removed
> the Xen machine type that was providing the "xenfv" alias. As a
> consequence, since the tools are apparently relying on such alias,
> we're getting this, as soon as one tries to start a Xen (HVM) VM:
> 
>   qemu-system-i386: unsupported machine type: "xenfv"
>   Use -machine help to list supported machines
> 
> Reinstate the alias and let it point to the only Xen machine we
> still have.
> 
> Fixes: 7d2778dea3 hw/i386/pc: Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
>  hw/i386/pc_piix.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


