Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55125C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 18:17:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1513861166
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 18:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1513861166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128470.241194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihna-0008DK-Ko; Mon, 17 May 2021 18:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128470.241194; Mon, 17 May 2021 18:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihna-0008DC-Hh; Mon, 17 May 2021 18:17:02 +0000
Received: by outflank-mailman (input) for mailman id 128470;
 Mon, 17 May 2021 18:17:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lihnY-0008Co-Gm
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 18:17:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihnU-0001O5-MN; Mon, 17 May 2021 18:16:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihnU-0000rj-G4; Mon, 17 May 2021 18:16:56 +0000
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
	bh=SyUBnMh+Uf9qXIh1WsVbdqWxPUPoylyUGyRQWe/+SIQ=; b=29Fk9DDQ8SmZDeU1fVVsvumPZM
	h37HtRKo1HRGltprZz8EzDlqSyBjn57fPgVduBc4G6+ZxxNiFT1CuvXY4rNDh8RNVdV7eShbdRxAA
	VUQ7yY1/E2j69CGd1rCzPmY/nqYGO77vAVDLPL4RW3Orec9zm9Dzh8W3pj12gZviUGfg=;
Subject: Re: [PATCH v3 5/5] tools/ocaml: Fix redefinition errors
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <50763a92df0c58ed0d7749717b7ff5e2a039a4dd.1620633386.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <bb15b60d-ebbb-d0c1-9b95-605cf5ae5a41@xen.org>
Date: Mon, 17 May 2021 19:16:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <50763a92df0c58ed0d7749717b7ff5e2a039a4dd.1620633386.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Costin,

On 10/05/2021 09:35, Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror. This
> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
> confusion between control domain page granularity (PAGE_* definitions) and
> guest domain page granularity (which is what we are dealing with here).
> 
> Same issue applies for redefinitions of Val_none and Some_val macros which
> can be already define in the OCaml system headers (e.g.
> /usr/lib/ocaml/caml/mlvalues.h).
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   tools/ocaml/libs/xc/xenctrl_stubs.c            | 10 ++++------
>   tools/ocaml/libs/xentoollog/xentoollog_stubs.c |  4 ++++
>   tools/ocaml/libs/xl/xenlight_stubs.c           |  4 ++++
>   3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index d05d7bb30e..f9e33e599a 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -36,14 +36,12 @@
>   
>   #include "mmap_stubs.h"
>   
> -#define PAGE_SHIFT		12
> -#define PAGE_SIZE               (1UL << PAGE_SHIFT)
> -#define PAGE_MASK               (~(PAGE_SIZE-1))
> -
>   #define _H(__h) ((xc_interface *)(__h))
>   #define _D(__d) ((uint32_t)Int_val(__d))
>   
> +#ifndef Val_none
>   #define Val_none (Val_int(0))
> +#endif
>   
>   #define string_of_option_array(array, index) \
>   	((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
> @@ -818,7 +816,7 @@ CAMLprim value stub_xc_domain_memory_increase_reservation(value xch,
>   	CAMLparam3(xch, domid, mem_kb);
>   	int retval;
>   
> -	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (PAGE_SHIFT - 10);
> +	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (XC_PAGE_SHIFT - 10);
>   
>   	uint32_t c_domid = _D(domid);
>   	caml_enter_blocking_section();
> @@ -924,7 +922,7 @@ CAMLprim value stub_pages_to_kib(value pages)
>   {
>   	CAMLparam1(pages);
>   
> -	CAMLreturn(caml_copy_int64(Int64_val(pages) << (PAGE_SHIFT - 10)));
> +	CAMLreturn(caml_copy_int64(Int64_val(pages) << (XC_PAGE_SHIFT - 10)));
>   }
>   
>   
> diff --git a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> index bf64b211c2..e4306a0c2f 100644
> --- a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> +++ b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> @@ -53,8 +53,12 @@ static char * dup_String_val(value s)
>   #include "_xtl_levels.inc"
>   
>   /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
> +#ifndef Val_none
>   #define Val_none Val_int(0)
> +#endif
> +#ifndef Some_val
>   #define Some_val(v) Field(v,0)
> +#endif
>   
>   static value Val_some(value v)
>   {
> diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
> index 352a00134d..45b8af61c7 100644
> --- a/tools/ocaml/libs/xl/xenlight_stubs.c
> +++ b/tools/ocaml/libs/xl/xenlight_stubs.c
> @@ -227,8 +227,12 @@ static value Val_string_list(libxl_string_list *c_val)
>   }
>   
>   /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
> +#ifndef Val_none
>   #define Val_none Val_int(0)
> +#endif
> +#ifndef Some_val
>   #define Some_val(v) Field(v,0)
> +#endif
>   
>   static value Val_some(value v)
>   {
> 

-- 
Julien Grall

