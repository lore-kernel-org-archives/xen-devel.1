Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C65C43460
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:19:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF70E613C9
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF70E613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122380.230821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduwr-00022c-Jq; Tue, 04 May 2021 13:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122380.230821; Tue, 04 May 2021 13:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduwr-00022V-Gr; Tue, 04 May 2021 13:18:49 +0000
Received: by outflank-mailman (input) for mailman id 122380;
 Tue, 04 May 2021 13:18:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1lduwp-00021e-PX
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:18:47 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccd55b99-cfc5-422d-b7d3-854f8fb372a3;
 Tue, 04 May 2021 13:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id C5AAD41B;
 Tue,  4 May 2021 15:18:45 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSDWyE44xkTu; Tue,  4 May 2021 15:18:43 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 779DB8F;
 Tue,  4 May 2021 15:18:43 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lduwk-00FpZq-Ez; Tue, 04 May 2021 15:18:42 +0200
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
X-Inumbo-ID: ccd55b99-cfc5-422d-b7d3-854f8fb372a3
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:18:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 8/9] vtpmmgr: Shutdown more gracefully
Message-ID: <20210504131842.cas3s2rpd4cvr46q@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-9-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-9-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: C5AAD41B
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 08:48:41 -0400, a ecrit:
> vtpmmgr uses the default, weak app_shutdown, which immediately calls the
> shutdown hypercall.  This short circuits the vtpmmgr clean up logic.  We
> need to perform the clean up to actually Flush our key out of the tpm.
> 
> Setting do_shutdown is one step in that direction, but vtpmmgr will most
> likely be waiting in tpmback_req_any.  We need to call shutdown_tpmback
> to cancel the wait inside tpmback and perform the shutdown.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/vtpmmgr.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/vtpmmgr.c b/stubdom/vtpmmgr/vtpmmgr.c
> index 9fddaa24f8..46ea018921 100644
> --- a/stubdom/vtpmmgr/vtpmmgr.c
> +++ b/stubdom/vtpmmgr/vtpmmgr.c
> @@ -67,11 +67,21 @@ int hw_is_tpm2(void)
>      return (hardware_version.hw_version == TPM2_HARDWARE) ? 1 : 0;
>  }
>  
> +static int do_shutdown;
> +
> +void app_shutdown(unsigned int reason)
> +{
> +    printk("Shutdown requested: %d\n", reason);
> +    do_shutdown = 1;
> +
> +    shutdown_tpmback();
> +}
> +
>  void main_loop(void) {
>     tpmcmd_t* tpmcmd;
>     uint8_t respbuf[TCPA_MAX_BUFFER_LENGTH];
>  
> -   while(1) {
> +   while (!do_shutdown) {
>        /* Wait for requests from a vtpm */
>        vtpmloginfo(VTPM_LOG_VTPM, "Waiting for commands from vTPM's:\n");
>        if((tpmcmd = tpmback_req_any()) == NULL) {
> -- 
> 2.30.2
> 

