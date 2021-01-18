Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EACDC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 19:06:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B352206DB
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 19:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B352206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69998.125551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zqg-0002xN-OX; Mon, 18 Jan 2021 19:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69998.125551; Mon, 18 Jan 2021 19:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zqg-0002xG-LS; Mon, 18 Jan 2021 19:05:58 +0000
Received: by outflank-mailman (input) for mailman id 69998;
 Mon, 18 Jan 2021 19:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1Zqf-0002x6-4t
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 19:05:57 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3209e8a-c026-4965-8973-5bf2a3250bf4;
 Mon, 18 Jan 2021 19:05:56 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10IJ5qin016846;
 Mon, 18 Jan 2021 20:05:52 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 654D6281D; Mon, 18 Jan 2021 20:05:52 +0100 (CET)
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
X-Inumbo-ID: f3209e8a-c026-4965-8973-5bf2a3250bf4
Date: Mon, 18 Jan 2021 20:05:52 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/store: make build without PTHREAD_STACK_MIN
Message-ID: <20210118190552.GB1106@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-18-bouyer@antioche.eu.org>
 <00483a69-0c93-96dd-2ea7-60c91c050a88@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00483a69-0c93-96dd-2ea7-60c91c050a88@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 18 Jan 2021 20:05:52 +0100 (MET)

On Mon, Jan 18, 2021 at 06:56:46PM +0000, Andrew Cooper wrote:
> On 12/01/2021 18:12, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> >
> > On NetBSD, PTHREAD_STACK_MIN is not available.
> > Just use DEFAULT_THREAD_STACKSIZE if PTHREAD_STACK_MIN is not available.
> >
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > ---
> >  tools/libs/store/xs.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> > index 4ac73ec317..8e646b98d6 100644
> > --- a/tools/libs/store/xs.c
> > +++ b/tools/libs/store/xs.c
> > @@ -811,9 +811,13 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
> >  
> >  #ifdef USE_PTHREAD
> >  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
> > +#ifndef PTHREAD_STACK_MIN
> > +#define READ_THREAD_STACKSIZE DEFAULT_THREAD_STACKSIZE
> > +#else
> >  #define READ_THREAD_STACKSIZE 					\
> >  	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
> >  	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
> > +#endif
> 
> How about this:
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 4ac73ec317..3fa3abdeca 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -811,9 +811,14 @@ bool xs_watch(struct xs_handle *h, const char
> *path, const char *token)
>  
>  #ifdef USE_PTHREAD
>  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
> -#define READ_THREAD_STACKSIZE                                  \
> -       ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?       \
> -       PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
> +
> +/* NetBSD doesn't have PTHREAD_STACK_MIN. */
> +#ifndef PTHREAD_STACK_MIN
> +# define PTHREAD_STACK_MIN 0
> +#endif
> +
> +#define READ_THREAD_STACKSIZE \
> +       MAX(PTHREAD_STACK_MIN, DEFAULT_THREAD_STACKSIZE)
>  
>         /* We dynamically create a reader thread on demand. */
>         mutex_lock(&h->request_mutex);
> 
> which makes things rather clearer IMO.

fine with me too

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

