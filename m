Return-Path: <SRS0=sIj+=KD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27797C433ED
	for <xen-devel@archiver.kernel.org>; Sat,  8 May 2021 11:54:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E8261466
	for <xen-devel@archiver.kernel.org>; Sat,  8 May 2021 11:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E8261466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.124267.234539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLWw-0002s1-Lj; Sat, 08 May 2021 11:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124267.234539; Sat, 08 May 2021 11:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLWw-0002qu-H6; Sat, 08 May 2021 11:53:58 +0000
Received: by outflank-mailman (input) for mailman id 124267;
 Sat, 08 May 2021 11:53:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfLWv-0002oB-7G
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 11:53:57 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8052b0f8-0e70-4258-873d-b6e9dd96d311;
 Sat, 08 May 2021 11:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BF953201CA;
 Sat,  8 May 2021 13:43:45 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-eHrPlRN5Dd; Sat,  8 May 2021 13:43:45 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9F804201C9;
 Sat,  8 May 2021 13:43:45 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLN3-00BMUQ-3U; Sat, 08 May 2021 13:43:45 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:43:45 +0200
Resent-Message-ID: <20210508114345.gattpm6g7zulm7hx@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 dgdegra@tycho.nsa.gov, quan.xu0@gmail.com
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lelko-006BIO-MM; Thu, 06 May 2021 23:41:54 +0200
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
X-Inumbo-ID: 8052b0f8-0e70-4258-873d-b6e9dd96d311
Date: Thu, 6 May 2021 23:41:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 11/13] vtpmmgr: Fix owner_auth & srk_auth parsing
Message-ID: <20210506214154.ssot4jwf64k22wth@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-12-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506135923.161427-12-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:21 -0400, a ecrit:
> Argument parsing only matches to before ':' and then the string with
> leading ':' is passed to parse_auth_string which fails to parse.  Extend
> the length to include the seperator in the match.
> 
> While here, switch the seperator to "=".  The man page documented "="
> and the other tpm.* arguments already use "=".  Since it didn't work
> before, we don't need to worry about backwards compatibility.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/init.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 4ae34a4fcb..62dc5994de 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -289,16 +289,16 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>     memcpy(vtpm_globals.srk_auth, WELLKNOWN_AUTH, sizeof(TPM_AUTHDATA));
>  
>     for(i = 1; i < argc; ++i) {
> -      if(!strncmp(argv[i], "owner_auth:", 10)) {
> -         if((rc = parse_auth_string(argv[i] + 10, vtpm_globals.owner_auth)) < 0) {
> +      if(!strncmp(argv[i], "owner_auth=", 11)) {
> +         if((rc = parse_auth_string(argv[i] + 11, vtpm_globals.owner_auth)) < 0) {
>              goto err_invalid;
>           }
>           if(rc == 1) {
>              opts->gen_owner_auth = 1;
>           }
>        }
> -      else if(!strncmp(argv[i], "srk_auth:", 8)) {
> -         if((rc = parse_auth_string(argv[i] + 8, vtpm_globals.srk_auth)) != 0) {
> +      else if(!strncmp(argv[i], "srk_auth=", 9)) {
> +         if((rc = parse_auth_string(argv[i] + 9, vtpm_globals.srk_auth)) != 0) {
>              goto err_invalid;
>           }
>        }
> -- 
> 2.30.2
> 

-- 
Samuel
c> ah (on trouve fluide glacial sur le net, ou il faut aller dans le monde reel ?)
s> dans le monde reel
c> zut

