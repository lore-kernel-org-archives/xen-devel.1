Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510FCCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:19:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445899.1661759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBFX-00068L-3X; Mon, 12 Oct 2026 08:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445899.1661759; Mon, 12 Oct 2026 08:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBFX-00068E-02; Mon, 12 Oct 2026 08:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1445899;
 Mon, 12 Oct 2026 08:19:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBFV-000684-Lx
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBFT-00DmAU-Pl
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:19:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc97e2-e002-0a2a0a5209dd-0a2a4508d940-40
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:19:07 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc97fb-f659-0a2a45080019-d1558036cd2b-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:19:07 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso13353915e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:19:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1a1feb78csm54311515e9.0.2026.10.12.01.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:19:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791793147; x=1792397947; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hDxn+GQ1+PpL1OmvTJ3Q3xBKxpxRCK2r29ws8joPDYI=;
        b=AewDTRGRV4NhLSNRux4atDrtS0pZs07b01McIxTgJowDhklLX4Q+pieBFLCbhXMKds
         0SrlHaNoVoI1gX47Cs9jUd8JbxiBwpOwLzvDXMUqR9kd0NKmPEvcAuL5G6NoT5fz0YlX
         DfLZVjh4wX7L5vaJaMrMc260Hm59bVFCSKJRBxnVLeZCSzpwg60F8EgDyvrVQCVIx872
         FJxOmb/XZbW6vXmymtbNOURYslZV+HZufMQhpfdNlPlZeXeAkM4ziuFUwC0SKoo4x2Hp
         ZM4g0zSEYH1Iz3t/8Fch7euP3pNaHP/Wj6EDki2mNZhJiPnYwImkqZsL0zljwTQ4JkpQ
         ICyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793147; x=1792397947;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hDxn+GQ1+PpL1OmvTJ3Q3xBKxpxRCK2r29ws8joPDYI=;
        b=QoSPv98vQ16EyZXi5v7dJtjSWYjkL6pmkxBoK14nx9RosAJVJ78TMplnZwq8Yh6EJ3
         sv0UdR0BFupHoKnf0D+ZHmNa6ItoQ4pMjQz7Jb7PxLif/wJ4tn2o0PhNVE4xjFcfjmWx
         b7zIdTLqSLaaZY2+kbASFgRy9bVRu6Rpnd/eLvGXonoYTyW00C3GMwX9bP7GXHJCIqTa
         b+oThbpAx2jVqxfGtfz5aKvvkHIzXVim27b9p71YVQ+6BVWRSIhHdMpbsSUeB+DXsb9E
         vnspwoKwUZF9q+P/uCqr2dEzFHYdXfWs6f0s/8sUu7cN1cxcjl6oMIgwMK9vc+OO9uWY
         gI9g==
X-Gm-Message-State: AFq9FYLEBiDDFTWGZHorcfzuwv7CcCDodfnZ+Tc4obKoL1NnaIBZQqjm
	S0p26z7eTu4SE5PRff7qzH45URRl/n6kTQZe6639c0GPjOeZ4wqJ5H8z+G6Dr3puQAPozTmWC9u
	kC9Yh3A==
X-Gm-Gg: AYBFou1I0scY9dQfsnWqfQ1uauM8dHcuzBtx+APO9qXXYqIYnIZVqL6LiEY7wmfYKej
	LfDHmLsPJgmBd/5mm9spuaxO6XG64tWOCKwQS7e7WbSnbDl7qUhHOrDwcgHriobZ6wvBxcG+mDX
	5i5FSCK1x14FvJy6+178q6bha/hz26URl2Id1pt2FPqUJudpBiGEp30GTMtMMC2CniUoHSyvIJu
	bNzEZEuD1rkN71HSLa8AWaptOqHb3+buoso2hf4Hc6xibpxLenu2YeJKDtQdzDgHU93d0866DEC
	KpXy+g5KdPO0tr9EdANAMz52FrC+p0PcCRs27JDOVHchIeH5BQquZOTU37J+beKa/DbTHHF78cz
	kIOr44un3RNyYT5Pj1Vhg1fPTv2o5gFPfQDFx0g/jqb5B3oJkJcD70DxBVufWEUzUe8bzCmVsEe
	En04pIB2Os65CPoDsThB73IFKQKBQalzcEPokAmM12oJno3no3Y4N9V3nU2avaRKKmIv1mA7vEj
	thXPVQOitayBfUwNT5kW0HFaaI3Zl4fkix+BGhrerL9TOk0PatqozqffUgJ0jJMk9sHaBosHg==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr153478395e9.15.1791793147052;
        Mon, 12 Oct 2026 01:19:07 -0700 (PDT)
Message-ID: <bc140f68-a6a8-48be-950d-813ea33de071@suse.com>
Date: Mon, 12 Oct 2026 10:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/15] x86/EFI: guard against oversized modules
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791793147-CF55C87B-40CECC3C/10/78276251493
X-purgate-type: spam
X-purgate-size: 962

x86/EFI: guard against oversized modules

module_t's mod_end field (which we repurpose to hold a module's size)
cannot hold values 4Gb and up. Don't let truncation go silently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
MB and MB2 also constrain module to below 4Gb. The constraint here may be
possible to drop once hyperlaunch work has progressed enough to no longer
require the intermediate mb_modules[].

--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -736,6 +736,13 @@ static void __init efi_arch_handle_modul
     place_string(&mb_modules[mbi.mods_count].string, local_name.s);
     mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
     mb_modules[mbi.mods_count].mod_end = file->size;
+
+    if ( mb_modules[mbi.mods_count].mod_end != file->size )
+    {
+        PrintStr(name);
+        blexit(L" is too large");
+    }
+
     ++mbi.mods_count;
     efi_bs->FreePool(ptr);
 }


