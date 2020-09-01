Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D52EC433E2
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 10:56:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E964820665
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 10:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E964820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD3x8-00077r-2z; Tue, 01 Sep 2020 10:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4C0=CK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kD3x6-00077g-Mo
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 10:55:48 +0000
X-Inumbo-ID: 767e7d5f-02f4-4539-a21b-1e8f3faedc57
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 767e7d5f-02f4-4539-a21b-1e8f3faedc57;
 Tue, 01 Sep 2020 10:55:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67A64AD56;
 Tue,  1 Sep 2020 10:55:47 +0000 (UTC)
Subject: Re: [PATCH] tools: don't use = after "define" in Rules.mk
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <1cd1289b-f63a-a74e-a331-b93351781457@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <81fece45-1bbb-22f4-f229-3894c07e186e@suse.com>
Date: Tue, 1 Sep 2020 12:55:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1cd1289b-f63a-a74e-a331-b93351781457@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.09.20 12:27, Jan Beulich wrote:
> The assignment operator is optional, and use of it breaks with make 3.81.
> 
> Fixes: ded08cdfa72b ("tools: generate most contents of library make variables")
> Suggested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -94,7 +94,7 @@ INSTALL_DIR_ROOT = [ $$UID -ne 0 ] || $(
>   # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
>   # $(SHLIB_libfoo)
>   
> -define LIB_defs =
> +define LIB_defs
>    XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
>    CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
>    SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
> 

I'd suggest to fix stubdom/Makefile, too (that was introduced with
commit ddb2934a914df). I have a patch doing both fixes lying here. Do
you want me to send it instead, or fix it yourself?


Juergen

