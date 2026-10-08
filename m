Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB61BCA600E
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 09:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443108.1660496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkjw-0003lB-CF; Thu, 08 Oct 2026 09:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443108.1660496; Thu, 08 Oct 2026 09:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkjw-0003l4-9K; Thu, 08 Oct 2026 09:48:40 +0000
Received: by outflank-mailman (input) for mailman id 1443108;
 Thu, 08 Oct 2026 09:48:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEkju-0003ky-Aq
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEkjt-004DXj-Nv
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:48:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac766f5-2eae-0a2a0a5409dd-0a2a4503be1e-2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:48:37 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac766f5-fae8-0a2a45030019-d1558031a48c-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:48:37 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso6031855e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 02:48:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f4480a4sm101044835e9.0.2026.10.08.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 02:48:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791452917; x=1792057717; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DWfH1DGE58SIHUKFq2jZgD9LIrfRjNCQ+Kf8MfrXNwo=;
        b=IZz1HWsYYRp2hIbfisybyHPsIUtQQPt2hR+F3Gozxbt/UXqw3/2dL+wGh9lOmnMtWJ
         j+nQqT5SBkG0eytWUM/6EJmBZH+cz4WT5s/V8ZswUm+WdxoN4HS67URknoM8s9SwusZ4
         pUfYXbck7wkfUHP3ChxKkMXlpsWcdxZ2zZzUCd+nJsAPVmpQJUFNEnguJ2uK1D7H4VNw
         BXxJSYgppF6aFK7/EDad9pGdJpPKZzHJci8FshF4ynpuj5oHNb3bGzAMfxkVpm7tP5W8
         eUqG2/sM/ucgP9uHshs3F3VcfnWESXZHQVwoSY0fM9KlK08rT2PzLm1IzZ6rE39we2tt
         1aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452917; x=1792057717;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWfH1DGE58SIHUKFq2jZgD9LIrfRjNCQ+Kf8MfrXNwo=;
        b=bE89iACoECTF9WGXSiWDLgMk2qPVcn5MH7J5nj3OGWlZMmAJObuOVlMfiXhwgEOF2J
         vgRMKCl4JZrDNgvDjD1T8MCeuO1dRb0DOcMJL/RtVoZ0Y7o1rHB+SkIEntmPiW3jq9Lr
         a56OxC3oGkCVLi/IFf+15kqsZoyj3AM2LtW9MJz33OsUQ/rriFrPgAWT9Tg5aax58Yy6
         5CqUce2J7xByeP61xi3muZsIil6NRH+3gez/+SQjdVZQszG6z+Vn0RlWLE/QqrOiJQG1
         ZbxX1cWKGwV6wl5bWiEApHKpwNSiTH3icf9CMoZpF6nwyin6SlrCOqUnzi3nhyfcQ3Po
         MQGA==
X-Gm-Message-State: AFuF++lQ4TSL+RxQ79ZKzzhBSLctab/uimlSpwF9WC6n+geUPIKfRlod
	URHBTPdCZ/ZEbck9MhBwXjB1JRwSOQP9E6HcvL6tkyZ4BDuVxgL7SVNcVx8NHZX2PgEmI2oPvwc
	x8s+dlg==
X-Gm-Gg: AYBFou3H8EpJP2YsWOHDBbsStXQ81sg9WinP9N/D6cW5n382xADew31Rob+XNz0vMgg
	OxPOCfcm7oh+L6O4ml+n/Q4o12AyjLCb8gBtTBp9EZskTWtctVUTpLn7lXrG1n0KhSjHLL7a2QA
	0fmwYIOTPYokWRvDnbbq041LoD64fcMfhq6Oy0cosIkspaKkdQpM+btFo4JIM5ltoFij6kWqQov
	UcafYRVTyRYOtW31x1NvTHQAmgSpuF9NB+MJIjHJKJB9IY5lwUdfVOL12PF6wMP+m9CBR6XSxTn
	XGypedROIC5+KZDEVZzD5L52uaoIfCVAadrf/xwR5lkIld8iYrGFIX5gTK9YmjcDFfzzRBbN/dr
	YYqETs/KDsQuzJK8RdECRoOnIBYjcua+eIqUwl8Hb4NoobjhMc/BifsPxCZ2vsz/A3kv5tW90wn
	/hEZtPH3Qmt+TCbp3DKEyyZ2cYRYa9rf/akb2/uydXKVzCalNIHYc77weNyqETlZAT8zgAgQePe
	zJXpCzQRuovWuQhg11BMNuK7SA9dc8+66DEOqWRdCce+jKKgvWapG2pki5iGw==
X-Received: by 2002:a05:600c:3ca0:b0:4a0:1b14:d009 with SMTP id 5b1f17b1804b1-4a1851a34b3mr32197565e9.1.1791452916413;
        Thu, 08 Oct 2026 02:48:36 -0700 (PDT)
Message-ID: <9698d810-6664-4a9d-a847-18ad124261e0@suse.com>
Date: Thu, 8 Oct 2026 11:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH LINUX] x86/PVH: don't truncate initrd address/size
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791452917-75C804E9-485E0624/10/78276251493
X-purgate-type: spam
X-purgate-size: 750

Consuming merely the lower halves of the provided values isn't very
useful. (While generally loaders try to place it below 4G, especially
when it's huge it may not fit there.)

Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -78,7 +78,9 @@ static void __init init_pvh_bootparams(b
 		struct hvm_modlist_entry *modaddr =
 			__va(pvh_start_info.modlist_paddr);
 		pvh_bootparams.hdr.ramdisk_image = modaddr->paddr;
+		pvh_bootparams.ext_ramdisk_image = modaddr->paddr >> 32;
 		pvh_bootparams.hdr.ramdisk_size = modaddr->size;
+		pvh_bootparams.ext_ramdisk_size = modaddr->size >> 32;
 	}
 
 	/*

