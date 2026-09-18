Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98BC982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 07:45:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424798.1649016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7THJ-0003rs-IR; Fri, 18 Sep 2026 07:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424798.1649016; Fri, 18 Sep 2026 07:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7THJ-0003rl-Eq; Fri, 18 Sep 2026 07:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1424798;
 Fri, 18 Sep 2026 07:45:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1x7THI-0003rf-4F
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 07:45:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7THH-00FwfA-Dy
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:44:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aacebfb-8faa-0a2a0a5109dd-0a2a4508d896-0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:44:59 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aacebfb-f659-0a2a45080019-4a7de18ca804-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:44:59 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so3070815e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 00:44:59 -0700 (PDT)
Received: from [172.20.2.169] ([87.190.33.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7d8cee0sm28936475e9.15.2026.09.18.00.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 00:44:57 -0700 (PDT)
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
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717499; x=1790322299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2RlL6M6yuns/eV6zZ3NgaxHrjObOqzIRFqXVj8kzP0=;
        b=ZXyfbaoZnGCt5kI16P6EJR27NYbUgkYgmRs5DTWhAQuMc9cet5AjudQ3zq6W7PrWwd
         eSTwwsAt004HVjBKEbJeeNXki6wjkHOaIXt2i76PmgiaFcxWTZ7/SHJwTtgFWgxqiuyS
         xoEzjah37xmN96+C8yxcs8U+VP6j0FfSr0hqnUEDefDeC3Wf/gzItZk+JhtJ/DSyqix0
         eX1t7qgB2gpK1dhHXSeyjA7jAFl8HhUrua9JW5CCxLuluhx3VZDTXkvyeZZT8OyoLTp/
         S3zpZC3nheWW5nhyTU50GfC+gAJOkbolFNdY0/HgZnJeK2a2kfOZABKuRQhaAH4nxFEM
         iDKw==
X-Forwarded-Encrypted: i=1; AKwUvBwIhgovgyREb/pkmvImaVQ20xCQ0hAoaUuyM5KlkLtpm8T5OtMHtCXcpmazt6xF5qUhPVrfbGhizkE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kun24SwffmG9fC97GMWv+S/ayIRk8xP/jcLjV0knz6MUR3ahiF
	x2LuOVC062C+pYDS+O11RkB/IQNdgcga7NTp5KfV842KFqLZUmo1onl1
X-Gm-Gg: AYBFou2xJudWBDfVJVAY3YSxOj7UwzImOTeP6mnAdjL3Z5ZSfXtyEMhGQa958/P6zKW
	+xUVHuvb+2vTGj6/GizAi2wJKd1hwn5XQfSyrNsV31acJpQkXSztJ9RK1Vu5iQquUiWrTtCzQI0
	ZvmJQQoSBj31aIbn1YxpHaXeUSEs6R04NvYR3K5UDaxecXdfZwVmpcVvD7121knhafk/dz/kg8J
	+nFA7OtB1I2bVR3rLy6iMAAPRe2azdg5pKYKbQiDgFfBPPFlHlXVCo5jxKaX+INldFL9yNTQp10
	+FlXVWMtfRRJOEbbpZOgajBZXz+3UggYPAH/SoupJnH8QR1Asfq4Mcf/RwIdXtlI2bTOGH3VZyT
	tWFjXgo/5hv4GOPF+Gyud6TYHOrP7mR7wv4Pw7qjkTHCo6cdotyaTFB74kpjhJwjLEldSU2hvA2
	kLaPNJNW+NIzkLHZY0sXdezGSMUPIZwpPmDS4icozjz6zUi1846a8PrPxOYNi7xbFmMRdjQZ4j3
	HtuUuXl
X-Received: by 2002:a05:600c:3104:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49fc5749bbdmr18162585e9.32.1789717498125;
        Fri, 18 Sep 2026 00:44:58 -0700 (PDT)
Message-ID: <bba8998e-348b-4017-aaf3-e6190a50818d@xen.org>
Date: Fri, 18 Sep 2026 09:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: clarify tag sequence in sending-patches
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260918065614.11003-1-jgross@suse.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20260918065614.11003-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789717499-CC77387B-5B1FFB79/0/0
X-purgate-type: clean
X-purgate-size: 329

Hi Juergen,

On 18/09/2026 08:56, Juergen Gross wrote:
> Make clear what an "Assisted-by: tag tag relates to in
> sending-patches.pandoc.
> 
> Add the possibility to clarify how AI was used.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


