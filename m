Return-Path: <SRS0=iCHD=JZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCAAC433ED
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 12:54:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8826E610A5
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 12:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8826E610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119323.225761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjiF-0004FB-Vo; Wed, 28 Apr 2021 12:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119323.225761; Wed, 28 Apr 2021 12:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjiF-0004F4-S0; Wed, 28 Apr 2021 12:54:43 +0000
Received: by outflank-mailman (input) for mailman id 119323;
 Wed, 28 Apr 2021 12:54:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbjiE-0004Ez-72
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:54:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbjiD-0005VL-8O; Wed, 28 Apr 2021 12:54:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbjiD-0001Im-21; Wed, 28 Apr 2021 12:54:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=VOmnTql4yGp3HV6+dThJmA2YVQ5HHGu99D0K71CUp0A=; b=E7+oyqDjBm5qEZiRP0xpoCKRoc
	QetUCs1bsQMkNfbWgcRKwsAc9h2p9sI90dWKDBnaJ+9bJvAPq18O8lDznx/C4BWZCT5ddne2tVdEu
	K5w2O9NtVTWCFnlBZYEx7gZStgiIJ+Y86mKuKhWCfPgihtwSUUTF5vPq4QEJqqL3E0FM=;
Subject: Re: [XEN PATCH] xl: constify cmd_table entries
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210427161105.91731-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5cbe94d4-2d07-b517-af9f-c5f1e47f7588@xen.org>
Date: Wed, 28 Apr 2021 13:54:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427161105.91731-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

NIT: I would suggest to add "..." so it is clear...

On 27/04/2021 17:11, Anthony PERARD wrote:
> and cmdtable_len.

... this is a continuation of the title.

> 
> The entries in cmd_table don't need to be modified once xl is running.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   tools/xl/xl.c          | 4 ++--
>   tools/xl/xl.h          | 6 +++---
>   tools/xl/xl_cmdtable.c | 8 ++++----
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 3a8929580212..4107d10fd469 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -362,7 +362,7 @@ int main(int argc, char **argv)
>   {
>       int opt = 0;
>       char *cmd = 0;
> -    struct cmd_spec *cspec;
> +    const struct cmd_spec *cspec;
>       int ret;
>       void *config_data = 0;
>       int config_len = 0;
> @@ -462,7 +462,7 @@ int child_report(xlchildnum child)
>   void help(const char *command)
>   {
>       int i;
> -    struct cmd_spec *cmd;
> +    const struct cmd_spec *cmd;
>   
>       if (!command || !strcmp(command, "help")) {
>           printf("Usage xl [-vfNtT] <subcommand> [args]\n\n");
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 137a29077c1e..e5a106dfbc82 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -218,10 +218,10 @@ int main_qemu_monitor_command(int argc, char **argv);
>   void help(const char *command);
>   
>   extern const char *common_domname;
> -extern struct cmd_spec cmd_table[];
> -extern int cmdtable_len;
> +extern const struct cmd_spec cmd_table[];
> +extern const int cmdtable_len;
>   /* Look up a command in the table, allowing unambiguous truncation */
> -struct cmd_spec *cmdtable_lookup(const char *s);
> +const struct cmd_spec *cmdtable_lookup(const char *s);
>   
>   extern libxl_ctx *ctx;
>   extern xentoollog_logger_stdiostream *logger;
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 07f54daabec3..84e2067e278b 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -18,7 +18,7 @@
>   
>   #include "xl.h"
>   
> -struct cmd_spec cmd_table[] = {
> +const struct cmd_spec cmd_table[] = {
>       { "create",
>         &main_create, 1, 1,
>         "Create a domain from config file <filename>",
> @@ -631,12 +631,12 @@ struct cmd_spec cmd_table[] = {
>       },
>   };
>   
> -int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
> +const int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);

NIT: This can be replaced with ARRAY_SIZE().

>   
>   /* Look up a command in the table, allowing unambiguous truncation */
> -struct cmd_spec *cmdtable_lookup(const char *s)
> +const struct cmd_spec *cmdtable_lookup(const char *s)
>   {
> -    struct cmd_spec *cmd = NULL;
> +    const struct cmd_spec *cmd = NULL;
>       size_t len;
>       int i, count = 0;
>   
> 

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

