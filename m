Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E0606A332
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jJgKXX+D
Received: from list by lists.xenproject.org with outflank-mailman.1476510.1682577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIWJ-0003fH-D2; Fri, 06 Nov 2026 11:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476510.1682577; Fri, 06 Nov 2026 11:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIWJ-0003fA-AH; Fri, 06 Nov 2026 11:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1476510;
 Fri, 06 Nov 2026 11:54:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xPIWI-0003dz-Td
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 11:54:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPIWI-00HQcN-6l
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:54:10 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6aedbfde-bab6-0a2a0a5309dd-0a2a4506ae8c-20
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:54:10 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6aedbfdb-195a-0a2a45060019-aa0a817c784d-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:54:04 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-YFptxQWZPqOcoLwxFxBMyQ-1; Fri,
 06 Nov 2026 06:54:00 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E3D66180057A; Fri,  6 Nov 2026 11:53:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EEEF139200; Fri,  6 Nov 2026 11:53:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9841921E6A04; Fri, 06 Nov 2026 12:53:54 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793966043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ddJIImjGsmsUfpk27UWUOb09SPlNh75NQ7+6roRcnk=;
	b=jJgKXX+DEqVokIPy6LwAozAySFZBp+ANhZOcXoN/YyCPQbPwEczTm1GqRKctf7mRXMMkOy
	W81zC0PZID86AahwyX+pjBJ/8T7G86hkrw4bA3s5BnxqPUWBUrymGqkepoT6I3uEA3MtWy
	fmr6VKurGFWXM1yb+S+U1JU7ow/hPDs=
X-MC-Unique: YFptxQWZPqOcoLwxFxBMyQ-1
X-Mimecast-MFC-AGG-ID: YFptxQWZPqOcoLwxFxBMyQ_1793966038
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Gerd Hoffmann <kraxel@redhat.com>,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Eric Blake <eblake@redhat.com>,
  Markus Armbruster <armbru@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Anthony PERARD <anthony@xenproject.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Alexey Kardashevskiy <aik@ozlabs.ru>,  Richard
 Henderson <richard.henderson@linaro.org>,  Helge Deller <deller@gmx.de>,
  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL v2 23/25] trace: stop tracking static disabled state
In-Reply-To: <20261104201802.11556-24-stefanha@redhat.com> (Stefan Hajnoczi's
	message of "Wed, 4 Nov 2026 15:17:59 -0500")
References: <20261104201802.11556-1-stefanha@redhat.com>
	<20261104201802.11556-24-stefanha@redhat.com>
Date: Fri, 06 Nov 2026 12:53:54 +0100
Message-ID: <87se1efa5p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: IJdNcwzWJ_wz1RqDANEeaOvq2OQDRh1YEbJrmGfvW9o_1793966038
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1793966050-FE87577B-12A0F5A3/35/111497
X-purgate-type: clean
X-purgate-size: 3232
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I missed this, because I wasn't cc'ed.

Stefan Hajnoczi <stefanha@redhat.com> writes:

> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> The TraceEvent struct contains a "bool sstate" field which track whether
> a trace event was disabled statically. i.e. at build time via the
> "disable" property annotation in trace-events.
>
> The only runtime use of this field is to let "trace-event-get-state"
> report that an event is "unavailable" instead of reporting an error for
> an unknown trace event.
>
> Trace events are not ABI so their names can change and the event can
> come and go at any time. Thus there is little utility in reporting the
> existence of a disabled event that cannot ever be used at runtime.
>
> Removing the "bool sstate" field from TraceEvent saves 8 bytes of
> space in the struct, adding up to approx 64 KB across all current
> events.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Message-id: 20261102142844.3464712-24-berrange@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

[...]

> diff --git a/qapi/trace.json b/qapi/trace.json
> index 29c76256055..8533e378977 100644
> --- a/qapi/trace.json
> +++ b/qapi/trace.json
> @@ -16,8 +16,6 @@
>  # @TraceEventState:
>  #     State of a tracing event.
>  #
> -# @unavailable: The event is statically disabled.
> -#
>  # @disabled: The event is dynamically disabled.
>  #
>  # @enabled: The event is dynamically enabled.
> @@ -25,7 +23,7 @@
>  # Since: 2.2
>  ##
>  { 'enum': 'TraceEventState',
> -  'data': ['unavailable', 'disabled', 'enabled'] }
> +  'data': ['disabled', 'enabled'] }

No note in docs/about/removed-features.rst needed?

> =20
>  ##
>  # @TraceEventInfo:
> @@ -69,6 +67,7 @@
   ##
   # @trace-event-set-state:
   #     Set the dynamic tracing state of events.
   #
   # @name: Event name pattern (case-sensitive glob).
   #
>  # @enable: Whether to enable tracing.
>  #
>  # @ignore-unavailable: Do not match unavailable events with @name.
> +#      Deprecated: since 11.2
>  #
>  # Since: 2.2
>  #

Are you trying to deprecate use of argument @ignore-unavailable?

If no, what are you trying to do?

If yes, this isn't how we do that.  Instead:

   ##
   # @trace-event-set-state:
   #     Set the dynamic tracing state of events.
   #
   # @name: Event name pattern (case-sensitive glob).
   #
   # @enable: Whether to enable tracing.
   #
   # @ignore-unavailable: Do not match unavailable events with @name.
   #
   # Features:
   #
   # @deprecated: Argument @ignore-unavailable is deperecated and does
   #     nothing.
   #
   # Since: 2.2
   #
   # .. qmp-example::
   #
   #     -> { "execute": "trace-event-set-state",
   #          "arguments": { "name": "qemu_memalign", "enable": true } }
   #     <- { "return": {} }
   ##
   { 'command': 'trace-event-set-state',
     'data': {'name': 'str', 'enable': 'bool',
              '*ignore-unavailable': { 'type': 'bool',
                                       'features': [ 'deprecated' ] } } }

with a matching update to docs/about/deprecated.rst.

[...]


