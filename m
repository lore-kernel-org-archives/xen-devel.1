Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B9CC5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 14:43:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398890.1635138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVsu-0001PM-Vq; Mon, 24 Aug 2026 14:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398890.1635138; Mon, 24 Aug 2026 14:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVsu-0001PE-Sb; Mon, 24 Aug 2026 14:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1398890;
 Mon, 24 Aug 2026 14:42:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wyVst-0001P5-2y
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 14:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyVsr-00HBFn-JU
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 16:42:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8c585c-e002-0a2a0a5209dd-0a2a450aa2bc-22
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:42:45 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8c585f-f2d2-0a2a450a0019-aa0a857c6691-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:42:45 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-G0JcXDphOs-FociHKCrOfA-1; Mon,
 24 Aug 2026 10:42:35 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B9642183459B; Mon, 24 Aug 2026 14:42:30 +0000 (UTC)
Received: from redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 73B821955F10; Mon, 24 Aug 2026 14:42:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787582559;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=u+NBWWqcUHs5ssfN5Rb0Q5HairH34nNGEaNv1uLG/do=;
	b=jSC4PEPwWANmX9ATVi8aMc6GvRGxiJi6QvZ10M0ip6hWjgI4sXKOKnyRNVmVAgzb8XuW+w
	lULZokKUH6fsuAXJrR13Ms1FOST8z+jAXr3LO3xD5J+mgd+hQ8bkOgnRJQ8s9z7LnDCe8j
	AmhC3829l5cr7ip6cahDS5CVCwA6RG0=
X-MC-Unique: G0JcXDphOs-FociHKCrOfA-1
X-Mimecast-MFC-AGG-ID: G0JcXDphOs-FociHKCrOfA_1787582551
Date: Mon, 24 Aug 2026 15:42:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org, dave@treblig.org, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
	aurelien@aurel32.net, mjrosato@linux.ibm.com, alifm@linux.ibm.com,
	farman@linux.ibm.com, richard.henderson@linaro.org,
	iii@linux.ibm.com, david@kernel.org, pasic@linux.ibm.com,
	borntraeger@linux.ibm.com, cohuck@redhat.com, alex@shazbot.org,
	clg@redhat.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
	sstabellini@kernel.org, anthony@xenproject.org,
	edgar.iglesias@gmail.com, pbonzini@redhat.com, eblake@redhat.com,
	armbru@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH 3/8] qdev: Support forced device_del in QMP and HMP
Message-ID: <aoxYTO8UkzzXvKOc@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <20260824011420.752806-4-dongli.zhang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20260824011420.752806-4-dongli.zhang@oracle.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: iyvXw9rJy7DNJsLPuHBrn3zR4XIf7xnV0MCeZGzzAe0_1787582551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-4011c0/1787582565-585CBCFC-EB06941F/0/0
X-purgate-type: clean
X-purgate-size: 3320

On Sun, Aug 23, 2026 at 06:13:33PM -0700, Dongli Zhang wrote:
> Add an optional force argument to the QMP device_del command and expose it
> in HMP as "device_del -f".
> 
> When force is requested, qdev_unplug() bypasses the pending deletion guard
> and asks the selected hotplug controller to complete removal through its
> force_unplug callback. Controllers that do not implement the callback
> reject the operation.
> 
> Forced removal bypasses guest cooperation.

This sentence is rather missing the punchline....

  Force removal bypasses guest cooperation and may result in guest
  errors, I/O failures, or guest panics. The guest OS cannot be
  trusted after force removal until a full power cycle has been
  performed.

I'm rather on the fence as to whether it is a good idea to enable
this feature or not. If it is used by a cloud admin without knowledge
of the guest owner, its use is liable to lead to hard-to-debug/diagnose
problems in the guest OS.

If a guest OS is not honouring an unplug request and the host owner needs
to force reclaim a resource, power off is always there as the failsafe.

> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 974cf9c583..cb5b5ad1db 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -90,6 +90,11 @@
>  #
>  # @id: the device's ID or QOM path
>  #
> +# @force: if true, remove the device without waiting for guest
> +#     cooperation.  The guest may still be using the device.  This can
> +#     cause guest-visible errors, I/O failures, or guest crashes.

I'd want to be warning in a stronger way.


 This is a dangerous operation that can cause guest-visible errors,
 I/O failures, or guest crashes. The guest OS state should not be
 trusted after a forced device removal, until a full power cycle has
 been performed.


> +#     (since 11.2)
> +#
>  # Errors:
>  #     - If @id is not a valid device, DeviceNotFound
>  #
> @@ -101,7 +106,9 @@
>  #    will automatically complete removal for all devices.  If a
>  #    guest-side error in the hot removal process is detected, the
>  #    device will not be removed and a `DEVICE_UNPLUG_GUEST_ERROR`
> -#    event is sent.  Some errors cannot be detected.
> +#    event is sent.  Some errors cannot be detected.  If @force is
> +#    true, guest cooperation is bypassed, but backend cleanup is still
> +#    performed through the device's normal unrealize path.
>  #
>  # Since: 0.14
>  #
> @@ -117,7 +124,7 @@
>  #          "arguments": { "id": "/machine/peripheral-anon/device[0]" } }
>  #     <- { "return": {} }
>  ##
> -{ 'command': 'device_del', 'data': {'id': 'str'} }
> +{ 'command': 'device_del', 'data': {'id': 'str', '*force': 'bool'} }
>  
>  ##
>  # @DEVICE_DELETED:
> diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
> index fa3cae246b..ca10a25c46 100644
> --- a/system/qdev-monitor.c
> +++ b/system/qdev-monitor.c
> @@ -956,11 +956,13 @@ void qdev_unplug(DeviceState *dev, bool force, Error **errp)
>      error_propagate(errp, local_err);
>  }

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


