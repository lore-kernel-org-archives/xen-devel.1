Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D880CD98E3
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 15:33:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339429.1600642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVmm-0005S2-Nr; Tue, 16 Jun 2026 15:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339429.1600642; Tue, 16 Jun 2026 15:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVmm-0005Rv-KG; Tue, 16 Jun 2026 15:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1339429;
 Tue, 16 Jun 2026 15:33:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZVml-0005Rp-6d
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:33:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVmj-006Ldu-DZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:33:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316c97-bab6-0a2a0a5309dd-0a2a4508a884-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:33:05 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316cb1-63b5-0a2a45080019-d155dd2dc853-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:33:05 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso2514044f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:33:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2dbfb1sm48454228f8f.35.2026.06.16.08.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:33:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623985; x=1782228785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGoN0O/DfvsomhpEe6BIvmUABunsD58NIZlU0N44T6U=;
        b=ERBVukqoK0I05kScCUXWIxVu2UIxnYl/KmZAjgzmUwbIi0Wuiv/j4PV1a54agFUKzz
         +wZ7RCEPqgZ1V/XkKFLfSrlYWebsL+3ctHrLkufnDZXnRUtVFterz6hvnht6Pq+1Dv04
         3wJOBI0JwK10/HMuMyseJ7Ci6e5uhYjZPcIjU61mG1JD6sFKhCMhl9TT8MEuEScGg74j
         z/Sip81pnMgdPxkAjo6J3KfFvmoGytF3kCfTo/yO5KNlSBTcjxbp1kHJXRiSPGyC+ISr
         Q4gC6ZutEWNbhxlyyZWy+yJsrmqtHO3PDaalCcjsBPr/TkZ7k33ZIzClGBVF0Lmd1f80
         1r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623985; x=1782228785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGoN0O/DfvsomhpEe6BIvmUABunsD58NIZlU0N44T6U=;
        b=ggS+KliatuJvLtOZQesAWfPblPh5vrqu06994nEvFdAQtBMFXCEmZ4YQwYojJACosf
         ArWG3nqCi6V/etcOLgOwG4HH5W5JcKplAbA62SVu0Cx3VF5tggAhc//weVXFx27y1MFq
         9G4Hgx9lH23OaNWzEjQTCBAqTvCzhYr0xolEHafTBMYNwMYZ67cU3DLHBG9vNVYtidYU
         Y70rbidVZAVamCi1zvVyqrdJTwilgS42fUmu+mAGhyi74+PcxalzBOatcUiiiX1l34uR
         mJcRBxppLP+cqfW5OLusaF1kAgTvIn270a9x37kJ5PPe2WewCPrzDqt+Yb0evBJywrMz
         a/eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Pums5rb15/IX4wQcJmkJUPlnHXYX1gGJ+Xq+851KJ/QEs+IKamULoWT9TZpIzDlsi33tz8cy1J3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcXqHAWDdGpIJFViZnYmrf/V9Fa5N/jy/6rxoXyQfssqM35sso
	OXVO8uneg987SOBVjIJrVHvC+v8ElGiIbRXWpfgnIP1REmzTGWkVAT5t
X-Gm-Gg: Acq92OEWAJmb0SxLmiidHfsamhpfJgDMArZWPS63hjXhRVQxh4YQDBTCIXNb/cv0u3A
	uD+JcQMAQfGpzAROor2ZV4Qm1aqI/hYBzHqyQDCE0fTQvazSlR0jLxiPfjVhtFp86mLrJDdBlD4
	8+ZWONtFCauMKnwA++ehvSihTK6sL04sjzPstlKHdujKA5eutmYenLvOlyH6TuQqp+a+GhqJVY/
	zivpH0dPXwH0+pTtMzWuVsS8hcQ8+RZc1hPUx1O83mZZZyhKQPxNHz2/9MnU4YD6tuiNI0QQhq5
	2jH2Jlfic32NGXKehCSAeuz+0ff+VmifplCojpHhA4ItpbidsVVbwx84lU1juGWoPnFVUBKDH2V
	PZkLdOW7GGE4AviYs+JBTsEDczHBg3I9jF4VqVhpA2Yb+hlqJ1a1KQhs5bmQwGw78/Pt2EwbTjg
	vd/iC8RqiQOt303ObocZHmDgvJ1nAROIiHjkk2OrAfAOVvhcA21qGccWu+PekDUpDbANw5SR5H3
	diNYQ==
X-Received: by 2002:a5d:5f86:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-46074a625damr22680899f8f.15.1781623984466;
        Tue, 16 Jun 2026 08:33:04 -0700 (PDT)
Message-ID: <32e0d6fb-d66c-48e4-b659-64236b09484c@gmail.com>
Date: Tue, 16 Jun 2026 17:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86: sync tidying logic at end of linking
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781623985-B5F6ADB1-C44B94D3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1602



On 6/16/26 9:52 AM, Jan Beulich wrote:
> Mirror what 761bb575ce97 ("x86: fix build race when generating temporary
> object files") did there to other ports: These ..*.cmd files aren't useful
> to have/keep.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -117,7 +117,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>   		> $@.map
> -	rm -f $(@D)/.$(@F).[0-9]*
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>   
>   .PHONY: include
>   include:
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -32,7 +32,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>   		> $@.map
> -	rm -f $(@D)/.$(@F).[0-9]*
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>   
>   $(obj)/xen.lds: $(src)/xen.lds.S FORCE
>   	$(call if_changed_dep,cpp_lds_S)
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -52,7 +52,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>   		> $@.map
> -	rm -f $(@D)/.$(@F).[0-9]*
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>   
>   $(obj)/xen.lds: $(src)/xen.lds.S FORCE
>   	$(call if_changed_dep,cpp_lds_S)

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv

Thanks.

~ Oleksii


