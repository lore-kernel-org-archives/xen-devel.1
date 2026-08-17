Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CAC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 11:39:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392869.1631833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvgm-00017J-LH; Mon, 17 Aug 2026 11:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392869.1631833; Mon, 17 Aug 2026 11:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvgm-00017C-Ig; Mon, 17 Aug 2026 11:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1392869;
 Mon, 17 Aug 2026 11:39:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvvgl-000176-Ax
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:39:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvvgk-00Bh4W-O3
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:39:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82f2f0-8faa-0a2a0a5109dd-0a2a4507d4f8-22
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:39:34 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82f2f6-b4ea-0a2a45070019-d155802aad71-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:39:34 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso25177645e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 04:39:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b2a176sm279487905e9.4.2026.08.17.04.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 04:39:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966774; x=1787571574; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFKDuF1pjDgkaULm2rvBb1rJibgRJcOekByrNFPlH3c=;
        b=Zf1Ccuog/Kg6yymt600Vp9DhAiTBghlD+C8fsqjMbJHPQlUN7WEWYH0m23uTwtRqW2
         ijpxzLRozONuOvYiF9izLvzdX1hkg2/z3eTt3KIY6pV7fxqzmK0sxtirSMM7Lcso/746
         bbyWOUhJeZs+VW2ybJfu+WEY5qb7CTKqf3byjCC/7NhzvlJJGiitnIxcnd9gqiXfD2ET
         NgpTqJ0dVcseNb0jCEUjrL4sx3PUjIK7F1EQfauRyCYYXUyYOzY/MWONhh32iP+IjtSb
         1APM8n2+bUsO7Tg6naE8vKxcmLaKoTkNSw92K/EQW9ASBQVpqSdtWt6B7pgExgcMupng
         T/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966774; x=1787571574;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFKDuF1pjDgkaULm2rvBb1rJibgRJcOekByrNFPlH3c=;
        b=VJiqVsP6vjZQLShLld8WWTfYBFcf6NhQ3HxFc0WlFr+azOD7GALnV4drR7q4mah4gW
         MwyjRnU2gLYDUaSYOa0YUWC3yd+FoKb341LlaHd4octv1FxggbXCqALWzQ8/a4pMgt6r
         BgLsE2nou6UQhYLGJOYt6qv9i6mIKVM2VBBXAs9xQztSSvSbDnSLLviaZ2mUg8WAjJAv
         D2q3I579vPR5dqPkKk0u7TZq+vGXXFIaXlvQpnLam49MMOCLtI1xvAPRyboKHLfTBvuv
         I0bndlV0D5bOG+tj13zOaYxpPaXVIGH4+ibz20GVRyknyx7R1ym1iSNTg3gaDHQsLBEP
         aydA==
X-Forwarded-Encrypted: i=1; AHgh+RrA/ysfite2rSs4+/PEGbJdVFAzjFHCJQuhP7DsRiMrTOcVKFDo+ulP/Ejv0AnKfv+te1cFA0QKsZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWXTyB1jjCOL/6OAd7xU6X89R/1Ub7/N7xwe+u8t8j3GFAqQSZ
	B0qiDuJnLlWiObLw5gTWjcX12iTNLbVrg9ZrO1IorhOWe7slyo8A7kbc
X-Gm-Gg: AR+sD10JOvduvVXS8uqugqZ3pu2vtZtMj4Fxqp3MURwbk/6Gb++5eXcu6guOBQTvzJu
	KPwYJv2YZdH+djmARqkDpTTx6fG0vIY1t8cx6fwc8heJ3TelWn18IgRllXor8m0VtKjG0v9oY8/
	owtf4LR4+OzzR5XHxQAfl4luji/Dzf/f9R12/uF3Lb7AN9P2Mw0WWsrDdcHKVUTJnO3kmT29Wtg
	pMjxjvGmtk33CeqiQmercuutZVi0KDqiLmJ9lWelSNMgBqhqiyepesIe0JHvMr5Qz871mBjD4jK
	0z/KILlbwn4Kgouv78JXX4kvWqoYroKaeJ1l7Ea7gYvE+mO2JkbCrTNxtgkt2Tm+jmw7+Oud8Mh
	2I4mEBOLxLIoim2MQfy//nCELPE4p7+giGutRgypnK8b0/D0lvEJvu2FaZ5bNYwjY7Fgl+QgXxs
	m7o+2U9f9UJq1CHaU+Kxe/I71nDW8ewVFP3nNz5Qvd7pyZfw1r5uRVbuN56g3b3NlYT4VxB8J4/
	++B2muQIlrwQZ+sslVgCYnjBW18I6DZTqwOp2/EPCIKTRxKMjU0eA==
X-Received: by 2002:a7b:cb1a:0:b0:498:519:e660 with SMTP id 5b1f17b1804b1-49987935847mr238140225e9.4.1786966774135;
        Mon, 17 Aug 2026 04:39:34 -0700 (PDT)
Message-ID: <87339fc0-fbf7-44eb-8b08-cc95ac7d1cb6@gmail.com>
Date: Mon, 17 Aug 2026 13:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
Content-Language: en-US
In-Reply-To: <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1786966774-36AD8AE4-0C3AB9A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 561



On 8/17/26 1:33 PM, Oleksii Kurochko wrote:
>>
>>> +    BUG_ON(!trap_info);
>>> +
>>> +    trap_info->sepc = csr_read(CSR_SEPC);
>>> +    trap_info->scause = csr_read(CSR_SCAUSE);
>>> +    trap_info->stval = csr_read(CSR_STVAL);
>>
>> Do you really need to re-read all three registers here? Didn't you 
>> read at least
>> scause already, in order to make it here in the first place?
> 
> Agree, ->scause and ->sepc are already read.

scause should be re-reaad as we don't save it inside cpu_user_regs 
structure.

~ Oleksii


