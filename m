Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0806EC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:39:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679A42483D
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="ap5kweSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 679A42483D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30096.59829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQUT-0002YZ-An; Wed, 18 Nov 2020 16:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30096.59829; Wed, 18 Nov 2020 16:39:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQUT-0002YS-7l; Wed, 18 Nov 2020 16:39:29 +0000
Received: by outflank-mailman (input) for mailman id 30096;
 Wed, 18 Nov 2020 16:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1kfQUS-0002Xi-7x
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:39:28 +0000
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92ed5e94-fe64-4ef1-befa-107b880a24b1;
 Wed, 18 Nov 2020 16:39:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l2so2434179qkf.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:39:27 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
 by smtp.gmail.com with ESMTPSA id
 k188sm5134259qkd.98.2020.11.18.08.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 08:39:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
	id 1kfQUS-0002Xi-7x
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:39:28 +0000
X-Inumbo-ID: 92ed5e94-fe64-4ef1-befa-107b880a24b1
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 92ed5e94-fe64-4ef1-befa-107b880a24b1;
	Wed, 18 Nov 2020 16:39:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l2so2434179qkf.0
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=P2PUiBIwlS7hTlFqmI9iau/Je8dDPQzg5I4bed6wHOI=;
        b=ap5kweSwJK4gLRSeQAaLk2vvGUK+y3k0dx0EN4YlYY42l9T5pccNlfe8IVQg2//15q
         /Kld8FNKumoPF4kj5rT2SrBlEnkXGxnDc63fGfGbjIXMFkTlJFsMYiFJEPijdw9I0L90
         zrBNfeUdYZ6uUHBGnfDO8SExNE+h/7eyXXRh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P2PUiBIwlS7hTlFqmI9iau/Je8dDPQzg5I4bed6wHOI=;
        b=O5qh3xxZ8d4Aq3rW+qUph7xj1qRurwlYvoNwH3t3X9HVu5ZPUwfnmvNmrFZwsLyBoV
         11S0vIWoMYeuzCBfDs1vydkqiqj4Ex0f6xo1qL6kCMbwjjOticsxUSfGU5xOVYS6fkWp
         v/EsyxujaxyXACr2Pw16KISd5BRzOuHZQ7rPYmYKdnnMac1Mes0+RGD3KhRq1BQgEA1o
         MzzfpT2jkvGZcrA42ztcsTBY+jzs8aL7W6xqJO/YDoBY/I7q3wOog4qDuVxrsRW1BNXj
         sTtwRgHMnPySh9wmlcZpa7lw0VAXBVU2ypeitX5sgMElTUNFM4slQV1IQrXYLFkfuNmf
         XXSA==
X-Gm-Message-State: AOAM531FcOqbXR4DHP1/nVs91aNWCZjgEdaVoqcqtoWYXHayqy9QX8Fo
	9v5gpcln1vT3ZeTHTUrR7CndpoTZCtHRNA==
X-Google-Smtp-Source: ABdhPJyFlJH0ypwvT+hnhd/rkvCkm/occccPDzW0f0TGblWdTZHyFTufZd/Udf6LisG9qeKcHQ/6Rw==
X-Received: by 2002:a05:620a:140d:: with SMTP id d13mr5810065qkj.470.1605717567101;
        Wed, 18 Nov 2020 08:39:27 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
        by smtp.gmail.com with ESMTPSA id k188sm5134259qkd.98.2020.11.18.08.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:39:26 -0800 (PST)
Subject: Re: [PATCH v1 1/4] automation/scripts/containerize: fix
 DOCKER_CMD=podman
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1605636799.git.edvin.torok@citrix.com>
 <28469d0fea059a51694c6fa3b5bd3971696a4f13.1605636800.git.edvin.torok@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <29264173-4a1d-d973-cf8d-759ee96bbf2d@cardoe.com>
Date: Wed, 18 Nov 2020 10:39:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <28469d0fea059a51694c6fa3b5bd3971696a4f13.1605636800.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/17/20 12:24 PM, Edwin Török wrote:
> On CentOS 8 with SELinux containerize doesn't work at all:
> 
> Make sure that the source code and SSH agent directories are passed on
> with SELinux relabeling enabled.
> (`-security-opt label=disabled` would be another option)
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

Looks reasonable.

Acked-by: Doug Goldstein <cardoe@cardoe.com>

