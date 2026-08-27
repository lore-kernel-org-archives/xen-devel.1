Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3845CC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 18:09:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401336.1637044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzeWs-0004Q3-BQ; Thu, 27 Aug 2026 18:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401336.1637044; Thu, 27 Aug 2026 18:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzeWs-0004Pw-72; Thu, 27 Aug 2026 18:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1401336;
 Thu, 27 Aug 2026 18:08:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wzeWq-0004Pp-O2
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:08:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzeWq-00CB7W-0e
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 20:08:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907d0c-e002-0a2a0a5209dd-0a2a450bde2a-48
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:08:43 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907d29-b7e8-0a2a450b0019-888fbc335280-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:08:43 +0200
Received: by mx.zohomail.com with SMTPS id 1787854116654249.51624760089214;
 Thu, 27 Aug 2026 11:08:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1787854118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NSaAsp689TJ0MR1KoE8zt+IjAD905tvBylhuZIETCCBQktTqWfPUAOskxZzUWCDAlNHpIqTgQv7HGOphie11akhcRBY0tNuUUmn6kFElTszm/Yx81ktIhaoJAo796iffH7VE6tQdYJ5wFaMPLAxjG3+r2abZB3OqSdF3Q6iLUJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787854118; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=7a5oE4QBukki7nNrLv3r4iRFdjUTs5zM0uoV9vdA7+E=; 
	b=g5uT11L2N6vU0wi0uGrMOapul016+t9pyS9WwcohKNdDCVegfLIg1mVGd/sj6fZ9DxZfQxxUJuNgDCgByyyX/AVuIjMBt5dfVTnV1vFUD6ulh06iDPi8bMBMV+ZCRPtYd/wJZIXHvpXoNSxTDeYuX8vgqDhOXm6Nt0XaC/Sdjwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787854118;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7a5oE4QBukki7nNrLv3r4iRFdjUTs5zM0uoV9vdA7+E=;
	b=W1e7yksXqCppDunTRDCoRubCBOajNRMbufVwKzjl1IbXSrjKfmsU+K29YEanW54q
	zut009Yiv4/I6t3/j3fg1wBqYFrkED/rA1mWdsfK6xGVpOYhBa9I24jUr5dikUuCX/Q
	0T2xczeWCJ8Le+FTtu3hjUfGXFM93Tt8HNJvJjSw=
Message-ID: <c9c9d3bb-e818-41b4-aca9-48724b92346a@apertussolutions.com>
Date: Thu, 27 Aug 2026 14:08:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-42698a/1787854123-1BED69EA-248F853A/0/0
X-purgate-type: clean
X-purgate-size: 1666

On 8/27/26 5:38 AM, Sergiy Kibrik wrote:
> The function does not modify context argument.
> Also it gives more flexibility to this API usage, because some context strings
> in Xen are also const char*.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   xen/xsm/flask/include/security.h | 2 +-
>   xen/xsm/flask/ss/services.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/xsm/flask/include/security.h b/xen/xsm/flask/include/security.h
> index ec8b442a8f..a2c5f423f8 100644
> --- a/xen/xsm/flask/include/security.h
> +++ b/xen/xsm/flask/include/security.h
> @@ -76,7 +76,7 @@ int security_change_sid(u32 ssid, u32 tsid, u16 tclass, u32 *out_sid);
>   
>   int security_sid_to_context(u32 sid, char **scontext, u32 *scontext_len);
>   
> -int security_context_to_sid(char *scontext, u32 scontext_len, u32 *out_sid);
> +int security_context_to_sid(const char *scontext, u32 scontext_len, u32 *out_sid);
>   
>   int security_get_allow_unknown(void);
>   
> diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
> index 35ad1034ca..764ac7d1d8 100644
> --- a/xen/xsm/flask/ss/services.c
> +++ b/xen/xsm/flask/ss/services.c
> @@ -813,7 +813,7 @@ out:
>    * Returns -%EINVAL if the context is invalid, -%ENOMEM if insufficient
>    * memory is available, or 0 on success.
>    */
> -int security_context_to_sid(char *scontext, u32 scontext_len, u32 *sid)
> +int security_context_to_sid(const char *scontext, u32 scontext_len, u32 *sid)
>   {
>       char *scontext2;
>       struct context context;

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

