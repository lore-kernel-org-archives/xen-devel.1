Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B905C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 14:56:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380850.1624548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXbj-0007sh-3f; Sun, 02 Aug 2026 14:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380850.1624548; Sun, 02 Aug 2026 14:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqXbj-0007sZ-09; Sun, 02 Aug 2026 14:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1380850;
 Sun, 02 Aug 2026 14:56:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wqXbh-0007sQ-HI
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 14:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqXbg-008Ecu-AZ
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 16:56:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5a74-bab6-0a2a0a5309dd-0a2a4507d39a-24
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:56:03 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6f5a82-b4ea-0a2a45070019-888fbc335287-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 16:56:03 +0200
Received: by mx.zohomail.com with SMTPS id 178568255845463.554231152630905;
 Sun, 2 Aug 2026 07:55:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785682560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VAz/p1RK69xgKt3N5Ueaeb2Ye60bKh3LCyM31UCMlhV3/EhyHrwa+u5FIDhPVeXRm6dR/YlYaMMi0DqBOu88sFQBTn2Q9PDn1QDWLr9bYL4rAWHAUr24JjkTBvuBQNPcsSkcAtvwpuS/Vq8hWA1R4BGjlkkg2enbhVxwwvvVDVg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785682560; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=nEk+EQeINCftDeVHUH0EflRmlpsWdGR8Goc03eXOtm0=; 
	b=DzWgvtMCbIMrAI7krK0TgLj/r+L9h6CeLRPVbR7bkiJ4jptPtMV1IrRFkBXY7zzq9SvAOlU27qq0lGtndIc1iwKLXH3rC/D/mLof8pAr+SLQyjLwtWkz5Ue/vFStz2mF9VMA3Q+60ujCon8uLil0zEMw0FpzU5/kRdg41leRgOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785682560;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=nEk+EQeINCftDeVHUH0EflRmlpsWdGR8Goc03eXOtm0=;
	b=ZlnuS17pnusfi7K+aUQ9fGKYWiiwOroh508btkj3cng82X4QCfyJdqYN0HhPsTAY
	3mIUcBVDT/2tPaHSFGaRXOoLXOj8dxNpoOoBSG2ztJv7Rsann6JeXdOu9KbIvOa6VVR
	RjlkxNs2GeAQcUTaE+/qULGsKm9rkWwbc8fpsT0I=
Message-ID: <d705cdeb-5f00-432d-9363-648287988a99@apertussolutions.com>
Date: Sun, 2 Aug 2026 10:56:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] XSM: make .iomem_mapping_vcpi() hook dependent upon
 HAS_VPCI=y
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <d466a04f-8151-4b83-972b-3525eaa39bd5@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d466a04f-8151-4b83-972b-3525eaa39bd5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1785682563-36AD8AE4-51E90D11/0/0
X-purgate-type: clean
X-purgate-size: 1435

nit: typo in subject, .iomem_mapping_vcpi --> .iomem_mapping_vpci

On 7/28/26 9:15 AM, Jan Beulich wrote:
> It's unreachable / dead otherwise.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -525,12 +525,14 @@ static XSM_INLINE int cf_check xsm_iomem
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> +#ifdef CONFIG_HAS_VPCI
>   static XSM_INLINE int cf_check xsm_iomem_mapping_vpci(
>       XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
> +#endif
>   
>   #ifdef CONFIG_HAS_PCI
>   static XSM_INLINE int cf_check xsm_pci_config_permission(
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -79,7 +79,9 @@ XSM_HOOK(int, irq_permission, struct dom
>   XSM_HOOK(int, iomem_permission, struct domain *, uint64_t, uint64_t, uint8_t)
>   
>   XSM_HOOK(int, iomem_mapping, struct domain *, uint64_t, uint64_t, uint8_t)
> +#ifdef CONFIG_HAS_VPCI
>   XSM_HOOK(int, iomem_mapping_vpci, struct domain *, uint64_t, uint64_t, uint8_t)
> +#endif
>   
>   #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
>   XSM_HOOK(int, resource_plug_pci, uint32_t)
> 

Outside of the typo,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com

