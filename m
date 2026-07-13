Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B609C43458
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2026 09:48:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361565.1613753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDGo-0005wr-67; Mon, 13 Jul 2026 09:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361565.1613753; Mon, 13 Jul 2026 09:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDGo-0005wk-2o; Mon, 13 Jul 2026 09:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1361565;
 Mon, 13 Jul 2026 09:48:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wjDGm-0005wd-DI
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:48:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjDGl-006rcq-9D
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 11:48:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6a54b459-5cb7-0a2a0a5109dd-0a2a450a82b8-10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:48:10 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <berrange@redhat.com>)
 id 6a54b459-ec7d-0a2a450a0019-aa0a857c6e07-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:48:10 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-2WXUjvIHNqGIPGVhxRUOPw-1; Mon,
 13 Jul 2026 05:48:05 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79E7D18052F2; Mon, 13 Jul 2026 09:48:01 +0000 (UTC)
Received: from redhat.com (unknown [10.44.50.22])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA4BC195604B; Mon, 13 Jul 2026 09:47:52 +0000 (UTC)
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
	s=mimecast20190719; t=1783936089;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=f7npngFV1AQ2QwhoSPTXSrhzAwvyxpkZUaMlsdowmIw=;
	b=CBlv+yRp05ZGGN6wXA1fiC5RkumfKNRNVmZhtpuVvbQtNRWeAU2jBTm4iYYd+YN/qHcKWD
	Wm6OtDE0odcsfP1bjkZK+7pTnAa4na/PsLgqNZ3EmMrafXl5ddV99B93rB7KHXLZWwYYfW
	A4ooRfQgybYxbXFpO85F2gdeXS7UbMM=
X-MC-Unique: 2WXUjvIHNqGIPGVhxRUOPw-1
X-Mimecast-MFC-AGG-ID: 2WXUjvIHNqGIPGVhxRUOPw_1783936083
Date: Mon, 13 Jul 2026 10:47:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
	mst@redhat.com, peterx@redhat.com, farosas@suse.de,
	raphael.s.norwitz@gmail.com, bchaney@akamai.com,
	qemu-devel@nongnu.org, pbonzini@redhat.com, yc-core@yandex-team.ru,
	mark.caveayland@nutanix.com,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Sergio Lopez <slp@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jason Wang <jasowangio@gmail.com>, Eric Blake <eblake@redhat.com>,
	"open list:Incompatible changes" <devel@lists.libvirt.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	"open list:e500" <qemu-ppc@nongnu.org>,
	"open list:Microchip PolarFi..." <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v18 03/14] net/tap: deprecate "no" as special value for
 script/downscript
Message-ID: <alS0RZqeyEOVy6e8@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260710191809.721154-1-vsementsov@yandex-team.ru>
 <20260710191809.721154-4-vsementsov@yandex-team.ru>
 <87ech7uycy.fsf@pond.sub.org>
 <d1ea2c42-7990-4529-b9f8-d0d9e35ffd51@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <d1ea2c42-7990-4529-b9f8-d0d9e35ffd51@yandex-team.ru>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 4MGFv6I-RVYQYNCIvjy7YZ4Egz7reOs-APgzJcpMw3k_1783936083
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-4011c0/1783936090-3D777248-807E25F6/0/0
X-purgate-type: clean
X-purgate-size: 2111

On Mon, Jul 13, 2026 at 12:37:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 13.07.26 10:45, Markus Armbruster wrote:
> > Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> > 
> > > The interface is ambiguous, as "no" is valid file name. So,
> > > using "no" as a special value to disable script is deprecated.
> > > Use an empty string ("script=" / "downscript=") instead.
> > > 
> > > In a future version, "no" will be treated as a plain file name, just
> > > like any other non-empty value.
> > > 
> > > Document the deprecation in docs/about/deprecated.rst, qapi/net.json,
> > > and qemu-options.hx. Update other docs to use empty string instead of
> > > "no". Add a warning.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > 
> > [...]
> > 
> > > diff --git a/net/tap.c b/net/tap.c
> > > index fedd48c48d2..1ec9e5ebe6f 100644
> > > --- a/net/tap.c
> > > +++ b/net/tap.c
> > > @@ -103,6 +103,8 @@ static bool tap_is_explicit_no_script(const char *script_arg)
> > >       }
> > >       if (strcmp(script_arg, "no") == 0) {
> > > +        warn_report("script=no/downscript=no is deprecated; "
> > > +                    "use script=/downscript= instead");
> > 
> > net_init_tap() could pass the parameter name for a simpler error
> > message.  Probably not worth the bother.
> > 
> > >           return true;
> > >       }
> > 
> > In net_init_tap_one():
> > 
> >             qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
> >                               script ?: "no", downscript ?: "no");
> > 
> > This sets nc->info_str, which is shown by "info network".  Should we
> > replace "no" by ""?
> > 
> 
> Agree, will do.

Would it be better to not include the script/downscript parameters at
all if they're disabled ?

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


