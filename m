Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51886C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:05:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401652.1637214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqeJ-0006ch-HD; Fri, 28 Aug 2026 07:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401652.1637214; Fri, 28 Aug 2026 07:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqeJ-0006ca-ER; Fri, 28 Aug 2026 07:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1401652;
 Fri, 28 Aug 2026 07:05:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqeH-0006bD-RX
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:05:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqeH-006Opq-8D
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:05:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913324-8faa-0a2a0a5109dd-0a2a450bc0ba-20
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:05:13 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913329-b7e8-0a2a450b0019-d1558029f05f-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:05:13 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so5924255e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:05:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942298fsm106061005e9.1.2026.08.28.00.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:05:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900713; x=1788505513; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TWfdIfEKkF0sERNM/mSdQ9IUQZ7pPCDfv2hRzvZW3AU=;
        b=O/6PatNDn6O5s2IuJZaIzuY2bwpgNcSPxSZCEeNClu/19wkqaR8r757nZkgznBSYrn
         mtJVtUiAHgZ9AHOiVIZ/1oN0iTVBZT0nN0x+nwVIcGOvdvk+9SFfLkwxZfDBDbE9ee5a
         J/Cql7JKs1rtMysvBpuTJPo3SQNpRiLfgkX/ZBoTcCs+KP6Yj8Kzcu1nqo3hxamCC2pG
         srQlgH5w64mlsbfpG8P1waN3jr4eefdJnyvfQ26+doEsluSbECW1TPo1Tw/Ha/4yQxse
         qACnPd3dAVBOYUbZesoF0JNKgXZV/nppSn4LZ+6hvAWK/6blkLNAHuetrD9jpScm93qE
         bn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900713; x=1788505513;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TWfdIfEKkF0sERNM/mSdQ9IUQZ7pPCDfv2hRzvZW3AU=;
        b=Bjli/3XIeyMk3Zhmbz6Z/vPRQjDVaNULC6vSGSCS7WVN3XAjfBwK8fLLCDK7VnNkca
         ul+Dvu4onJaIahuuRu0DGb0iecLXdCk1tFq0m2pu28krbcAcSy2H/GNJyr5OhwwpoHUh
         HfkF5aRth3Uq5MxGmeSMQx7EUwdGJ/AVRVWhXc0FtlezfA/ZzYV4xDacmMvN1X6VYxPu
         vDUcCpAJc73x9mwBh4ziNwJ9CsMlI32feOdNpqfTB3EYu14mHjFdVJuvE3IZM+RLGGP+
         /ktk8tjBKnj2yKsFNpWuOnQ21V7sE6Sq97/U7mpIsfX/DxVF3/7HApDo/WMsHD/g95gG
         UNjg==
X-Gm-Message-State: AFuF++nrC3PozNFkfVh+Q6D9sC+jX1M+ODOI/jSSOoDrgK/RVy2ZFuKL
	uxo3TFyH8euL9WHoD/2ZKhEtFbDaSygi9yKJ//zpxz1NS/Xpv4TKflDq57xUwuPlwcMVE7kY8hU
	rI1xElQ==
X-Gm-Gg: AR+sD10F1FIHF+7jc9mdIksi6ABrWxUyWnyE/SwL3FqYX1FYDuGkDlqQqIQDQj7MtFc
	OjC9hrhQssVSXobdmmLRs1iFGxLGaWKMKqsL5om5mIZ+T7318/RYcKlkyDLlmJRPjq1RX62WTcO
	VWBbCJ+vQWU3YYUkHGnAker7nkzJdI6N3Va/0wBKq2xx8a1VmGE/VIPx0WzoYwvpRizFq1cdD4O
	oVDkWszJe1/QGsEuqE2dCWmGr934kU2mZrM2MZTglLPHm6M1BRMfRuEGrRIxkPvo1+uzp9Sh5h8
	RBCrCXFpVgrja7iYyKHz7UliRVaqlSwLErY09O3SmD/0fFjosPZ1KAPF5RD/B2UaIp6DXE1tH7U
	1Spf3SbZPWdKy6GaMe8hot4cvQHsgGLuj8f+juIPhQVI4DaJGDdE2sq6Znuv5tMFZZFarvfLwN0
	OwkPXVLYLeMGrLiFYCxhE0mdlJbEnFEdWYUIF9g9fPz11irFYDshxKV4vnCjS25G1wDhjp54TyM
	m1lPBgC9UmVMFluauaeaZz9FjxYFxm2yf8QbVwksqKXxddrb+dghg==
X-Received: by 2002:a05:600c:a55:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49b91c4cc2cmr63870935e9.13.1787900712683;
        Fri, 28 Aug 2026 00:05:12 -0700 (PDT)
Message-ID: <de8eb6ec-b830-47c2-95e7-e0b689f05cad@suse.com>
Date: Fri, 28 Aug 2026 09:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/12] PCI/physdev: address Misra 2.1 rule violation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787900713-ABAD09EA-59BF5E21/0/0
X-purgate-type: clean
X-purgate-size: 620

Cases 0..3 are handled, and a 2-bit mask is applied to the switch()
expression. Therefore the default: case is reported unreachable by Eclair.
Insert BUILD_ERROR() to annotate this for Eclair.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -114,7 +114,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_
             break;
 
         default:
-            ret = -EINVAL;
+            BUILD_ERROR("PCI_DEVICE_RESET_* inconsistency");
             break;
         }
         write_unlock(&pdev->domain->pci_lock);


