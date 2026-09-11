Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6A5C88E53
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 15:54:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417489.1646268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x53a6-0005dQ-4Z; Fri, 11 Sep 2026 15:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417489.1646268; Fri, 11 Sep 2026 15:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x53a6-0005dJ-1q; Fri, 11 Sep 2026 15:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1417489;
 Fri, 11 Sep 2026 15:54:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1x53a4-0005c0-6h
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:54:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x53a3-006Fkd-Jm
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 17:54:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4242f-e002-0a2a0a5209dd-0a2a4502eb14-0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:54:23 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aa4242e-6ca4-0a2a45020019-aa0a817cbe01-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:54:23 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-dk6J6WxINLu-Ma5BynTPmg-1; Fri,
 11 Sep 2026 11:54:17 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5F05818009E2; Fri, 11 Sep 2026 15:54:15 +0000 (UTC)
Received: from redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 44965195608F; Fri, 11 Sep 2026 15:54:12 +0000 (UTC)
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
	s=mimecast20190719; t=1789142061;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqFdjDZDSL4KFrLZvXicREIlIhrSfJCxxjgHKaNpYvg=;
	b=C0NUFIbvLzvtPbvRKMDT45V/4YjicywyJLAWh8dAtqvLKxBfhWv/1GdxuOhxe7PnSIhMSt
	46MDVYMrjFX5sJgyQ4mHm+kgXkgTb2g9izy26sVVra0dD0n/XBnkoJXAjLBCnu7olDkdtT
	HvNZHc+PtpY8vGozSdBQjZe1ZUmiqYg=
X-MC-Unique: dk6J6WxINLu-Ma5BynTPmg-1
X-Mimecast-MFC-AGG-ID: dk6J6WxINLu-Ma5BynTPmg_1789142056
Date: Fri, 11 Sep 2026 16:54:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, mark.syms@citrix.com,
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	edgar.iglesias@gmail.com
Subject: Re: [BUG] hw/xen: features published after InitWait since
 240cc11369fc
Message-ID: <aqQkIa-l0MyAoUmt@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <30ec634b6072ac23c38a6a05bf3f90de4b383632.camel@infradead.org>
 <c9a719c9a67c9a32ad566a0255d24722e760a622.camel@infradead.org>
 <CAFEAcA9WAARKjyim9HkYWQA9L45L27NNhxvCVw6CkH5d9pgiYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9WAARKjyim9HkYWQA9L45L27NNhxvCVw6CkH5d9pgiYw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: F8rfShCarDF8RFpB2KnT89wH4rqMn6x5nSOqqS7nzKU_1789142056
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789142063-F1CAA2AC-D270ECC3/0/0
X-purgate-type: clean
X-purgate-size: 1812

On Fri, Sep 11, 2026 at 03:56:22PM +0100, Peter Maydell wrote:
> On Fri, 11 Sept 2026 at 15:39, David Woodhouse <dwmw2@infradead.org> wrote:
> > I wasn't *actually* setting out to comment on the AI policy today  — in
> > fact I didn't really have a strong opinion on it. I spend enough of my
> > life tilting at windmills *intentionally*; this wasn't meant to be one
> > of them.

snip

> Yes. I view that email as pretty strong data for 'even a policy
> shift which says "we're OK with accepting some kinds of AI
> generated code" should still be pretty strong on "text intended
> for humans to read (docs, commit messages, mailing list posts, etc)
> should be written by humans"'. I think that review commentary on
> Paolo's RFC about a less strict policy tended to be in that direction,
> so I don't think I'm completely out on a limb here.

The latest proposed policy explicitly forbids sending AI text
to people:

  https://lists.gnu.org/archive/html/qemu-devel/2026-09/msg00260.html

[quote]
### No AI-written text must reach maintainers

These rules apply when publishing AI-assisted work to GitLab or the mailing 
list:

- **AI-written cover letters and commit messages are banned**.  These are
  easy to recognize and waste reviewers' time.
- **AI-generated responses to reviewer comments are banned**. This undermines
  the human-to-human interaction fundamental to code review.
- **AI-written issue ("work item") descriptions or comments are banned**. These
  are verbose and waste triagers' time.
[/quote]

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


