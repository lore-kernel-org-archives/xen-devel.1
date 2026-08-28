Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD798C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 09:55:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401852.1637358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztIc-00062v-QK; Fri, 28 Aug 2026 09:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401852.1637358; Fri, 28 Aug 2026 09:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztIc-00062o-Mb; Fri, 28 Aug 2026 09:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1401852;
 Fri, 28 Aug 2026 09:55:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wztIb-00062i-FA
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:55:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wztIa-000Iww-SQ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 11:55:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a915ae7-2eae-0a2a0a5409dd-0a2a450be12e-18
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:55:00 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a915af4-b7e8-0a2a450b0019-a237832fc55a-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:55:00 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 4C2784EE0050;
 Fri, 28 Aug 2026 11:55:00 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1787910900;
	b=ikMy5bMPghpfJVk38GCkStPTsvdsPJrjp51BXgm6h90AmcM/6JdadIO1MOryeFvV9a1y
	 sQaIF4EnzDm3DJvunPQvikxV0NJ7TY7iCCdPDeb8/ogNhWO41qwTEsS96IgFvm8yl9gvn
	 NRQevjdaSgDp4+WaNCPubEoFa2HEWCcilywEHW/W4cnESzEVFUnzsxPERDtpoUFfpOiJK
	 C1VcyDmTqcuzb4Lhy1dzd7zclaGTZMiSmtvm3rvTly8WA42zOHPetN0DmERIU7pFRI/xw
	 nL4sb4PKGIoixCoYFB/HlEyhK4kWaE102uPeTqTyAXEWzhq3xnxv8NABusJAyc/HFOV53
	 m5x6e/Y/FNnEwnFe15g1Ywi50eRTZahfw8pikuolsQ3oYWSs3NmVTu1RhAtPwvQ9A9nHp
	 IR9Ow/tfF0N5+tsreY4Ja7Q7F9SvGpqUpk3yCY6e5qz4Gv/MQouybNPUXdPTQzYX+bx1e
	 s8Qu5R0msTm5r9tX2WYAgV5+jHEJVahc8FtLbPne9ayJ5J425v0MLBk9xTRiONwfi8rsx
	 CkuwtGbE1VQp5mPaS1gDfP+eZAXN3FQdlIxLWsmEnfH1dD/Kt3HLwP/XPOBAIRr8AmTdk
	 HV1P7T3zJ00UvnjDNFNaS9KsHAvKc59893Ul4rWUiv/w3+dAYFShjmz8whXw2DE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1787910900;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=iCyUO/jVJ1XT4h9kGqdidMW3hXotDizvbYQalvOgQTE=;
	b=UPeuUEMe2MKJQqBGzhRmT3XsMYTrevD5MVb6Mxpzwp592gybluxwY4XpLDkmRUIJXcQX
	 yKQkk7Vfr0O3W467DXRHeFbtp8epvPh5ot45r1MHM8qGpF3nbRRURswIf43JqW7YMplqo
	 2aeSn3UypEZLi/8y5DnwIPTrc395z/6cZicfGMhHE8bJY2Px95qRa0RjZkrSGhPEOnffm
	 /+CWvDs2kIQnlt4sjPHEQi44d/REsElVnkVheaXdEGhyCAIdQ4j57SX8e74tbQNfLoEL/
	 Ha/xCkZzzKyKJ7IQ1owroc/NUrdJ5RLC8mBkpoDfRmLAgqCHjif9HTTCQDVDL8YXcjlmq
	 IOxUDn1H0Elon7+HtTlUYTcsSUxCKJxzREDU7eSKCnamKFgVsUjXV3J0VcbsqTnGh6ZyA
	 hEPTR0f/TD7ougDJDBlF68Cwc8vHUjORS3NBkZq7PlKaweNZDE3tVdThoNb7i0V825mSe
	 t7hv6hlc1GIH4IQCw8/zrXAPfPn0IhbkU/rdt7ybGpWu/E4i8NMceY8z+Wf0VG1gIVLmw
	 pjovNFdCORTlu+UYJ/a7wCqZoSmr+FPN56x/tGdG7c3tNHoiOLgrcEIGCVYrEiSzGE0xI
	 4QdZGfUe2LSmoS3MtGthVdSzljZkTJ0mb78ry/pFYqKpjPYnhasviTYlR5hsh14=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 11:55:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 06/12] kexec: machine_reboot_kexec() doesn't return
In-Reply-To: <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
Message-ID: <d7bb3db821a0018d7b0dc5c8a6729df9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787910900-1BED69EA-368658A3/0/0
X-purgate-type: clean
X-purgate-size: 1601

On 2026-08-28 09:02, Jan Beulich wrote:
> Mark it as such, and then remove the code following at its sole call 
> site,
> for Eclair flagging that as a Misra rule 2.1 (unreachable code) 
> violation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -401,7 +401,7 @@ void kexec_crash(enum crash_reason reaso
>      BUG();
>  }
> 
> -static long cf_check kexec_reboot(void *_image)
> +static long noreturn cf_check kexec_reboot(void *_image)
>  {
>      struct kexec_image *image = _image;
> 
> @@ -409,9 +409,6 @@ static long cf_check kexec_reboot(void *
> 
>      kexec_common_shutdown();
>      machine_reboot_kexec(image);
> -
> -    BUG();
> -    return 0;
>  }
> 
>  static void cf_check do_crashdump_trigger(unsigned char key)
> --- a/xen/include/xen/kexec.h
> +++ b/xen/include/xen/kexec.h
> @@ -48,7 +48,7 @@ int machine_kexec_add_page(struct kexec_
>  int machine_kexec_load(struct kexec_image *image);
>  void machine_kexec_unload(struct kexec_image *image);
>  void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
> -void machine_reboot_kexec(struct kexec_image *image);
> +void noreturn machine_reboot_kexec(struct kexec_image *image);
>  void machine_kexec(struct kexec_image *image);
>  void kexec_crash(enum crash_reason reason);
>  void kexec_crash_save_cpu(void);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

