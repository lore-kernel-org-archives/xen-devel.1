Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A053C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 13:47:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A803220809
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 13:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="twlFJEfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A803220809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14180.35197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8HE-0005e6-0u; Thu, 29 Oct 2020 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14180.35197; Thu, 29 Oct 2020 13:47:39 +0000
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
	id 1kY8HD-0005dz-Tj; Thu, 29 Oct 2020 13:47:39 +0000
Received: by outflank-mailman (input) for mailman id 14180;
 Thu, 29 Oct 2020 13:47:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY8HD-0005du-2q
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:47:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a29eaeca-5f5d-4913-9ec7-207c03daf668;
 Thu, 29 Oct 2020 13:47:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 439DAAC12;
 Thu, 29 Oct 2020 13:47:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY8HD-0005du-2q
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:47:39 +0000
X-Inumbo-ID: a29eaeca-5f5d-4913-9ec7-207c03daf668
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a29eaeca-5f5d-4913-9ec7-207c03daf668;
	Thu, 29 Oct 2020 13:47:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603979257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQIujlwoAnCz3OyXR+oavnADLbcJ+AWZBHdl8qVnZIw=;
	b=twlFJEfSy56lqJhjWE0r7bvN28nioCUfMRInHGSE0v9nYPLldryfvRKCL6HoMF6Hv7VGPA
	szsnYerJUWEEjiizYpI5SaPsV8LXmsK375gwpF/g+fVrQ0gp0Mu1I6ZeQ6CwSBTyWkdHVi
	6d8iWZIKttJuqRlttoBUy6h/I1otvNE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 439DAAC12;
	Thu, 29 Oct 2020 13:47:37 +0000 (UTC)
Subject: Ping: [PATCH 2/2] tools/libs: fix uninstall rule for header files
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
 <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
Message-ID: <952aa284-9112-a128-db88-4a2e89d8c8ef@suse.com>
Date: Thu, 29 Oct 2020 14:47:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 09:21, Jan Beulich wrote:
> This again was working right only as long as $(LIBHEADER) consisted of
> just one entry.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

While patch 1 has become irrelevant with Juergen's more complete
change, this one is still applicable afaict.

Jan

> ---
> An alternative would be to use $(addprefix ) without any shell loop.
> 
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -107,7 +107,7 @@ install: build
>  .PHONY: uninstall
>  uninstall:
>  	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
> -	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
> +	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$$i; done
>  	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
>  	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
>  	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
> 
> 


