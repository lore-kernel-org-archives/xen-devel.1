Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F497CCF2E3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 12:12:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454306.1667861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xImDy-0007wa-NN; Mon, 19 Oct 2026 12:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454306.1667861; Mon, 19 Oct 2026 12:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xImDy-0007wT-KU; Mon, 19 Oct 2026 12:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1454306;
 Mon, 19 Oct 2026 12:12:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xImDx-0007wN-On
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 12:12:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xImDx-00Gh8i-5A
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:12:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad6091c-2eae-0a2a0a5409dd-0a2a45088550-22
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:12:16 +0200
Received: from [209.85.128.174] (helo=mail-yw1-f174.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad6091f-f659-0a2a45080019-d15580aec8fd-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:12:16 +0200
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-8b0a28a720aso14608057b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 05:12:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792411935; cv=none;
        d=google.com; s=arc-20260327;
        b=MLlskiuAhfN4Cdsr3SH8WqrH2m6Jx1JByOYAO1LquJNZkxiJpjJ6pQ+ONPY/6iuB2s
         NJwGd5Kv6JUmp3WPmfDtlkMCD5TRlDDBV5MXugKSVo3s7uC5T/PhDpzqLLpoZI+y9ijM
         bNMrjrDj2ShQ+tosoP6I3a8pAV66oYA6+ibFWLuelx0rW2FQ07wg24vKd3qbN+mlj7ln
         KYEpKfRDtjzJ1rkeLyCDryoGUHqTqj6PnEqza0oXbKRR9SWqav04fef90HGFSvFlL2E+
         3iWuJf5GGMxyII+0sLCDui5mlTOzj/LWNQN+6R9iW1MXzL7pEfmcvHk5hqVcKB+dm0OC
         EKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7cmhy7Rroz4LNmdo/2C48BjcF94jPiYFsUptYORfGWk=;
        fh=6mpZ5wFoQQyqlzF5elRrLGZpMMuDqidbHG55QrNLb18=;
        b=pSYlVuHK/ZETwrBDDSOhJq/PmauBDhLWYhL0nSQsPE1TkGKUNmneW5RjHzcRocH2tZ
         l3ToArweqtPKA6UrYzmIp7SBJFVFnBR/uro+O4/ZpapxPX5qwGJLwaD9zLQkaP5t+44i
         uGEAEb4oUbO19Duuj28V2EYSiKEczjKas4AEJyz7L702ChkXHmfzAsl9mTo3fpMAQBQj
         JWC0hdjCDUufFdyI5xb5p35XDfFjHINqQUBPrvCl3brM3z67gv+NhOX1IZXV5CRoQaeq
         oFRf3uFT9bZRSsrd/g4/vhHE1r7P9FpBAj8Wk6AbGTOrAKbdU+ECjvBKG9l4QL0iUWBq
         HRVA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792411935; x=1793016735; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cmhy7Rroz4LNmdo/2C48BjcF94jPiYFsUptYORfGWk=;
        b=whYfNmJiXyZHUkai/l/mMaE49d2th6lkR9QJ914E8She8vu2NZDG5f1MKO7Saa92QN
         KKCCaitjngMkuYgnc1Ynh/4eYTG1F/2dg4aPa8w0z29WFzCStS8rPMfko9Qc+DtDINa5
         GQgkhGYxdZKAwL/PHPgc4VirfV9Uv0oYI7IFx4fmvC4nBgD7W1PopAgihF19+mNs65uR
         7UILfWzXNg7BUbZFnzhVzfFjsiSJwqBp1vygO5e7lbuSE9pBYytQlsNYJGM9p6QxhpHz
         U47+j7QReRZsjS+f4rJffb0Xpj6WnUXCN5ngZ+/DY02hN17sZ7nStYG17Nl93j017f4q
         cTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411935; x=1793016735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7cmhy7Rroz4LNmdo/2C48BjcF94jPiYFsUptYORfGWk=;
        b=SaMAcq1/er1lv1zuyE+Rc44sOn0rMr6z5hioWGbZWE3FKMOTiU3w1/mhynTyEx+LHr
         1kVQgY9ej8psjKJVDWGxHMLJhBLEbTkWpIXpG262UlVaPy3I8nBhTdYz6NLRVManBchb
         cMNX0X6QU4voxt7Gi1U/Tl+wKpvVx9xKG8pcZYjofliY4nsCHNok8x1UZquMGqDtbmnV
         2lgiSX1vxTdLN3dN51S0I7a3K63fVh7el3s6MF4Q6skAFhi7/Ww74XmAQaJzR7tBAVf2
         Md+RgVXMT5AtwpM5VvqZHkiTvkeJfG0q+LqNdBkj79dHnyxDgmCGQoQg2MC0Bt1nWN0R
         /Yrg==
X-Forwarded-Encrypted: i=1; AKwUvBxzuX21I5BgqecKPMHunMQFzeb09s1yX6hWzI20yAuAjwPdIbTX2oP6L2/9xRt11XkL/WsCCtzxdGM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLyxxu9utmwQAECLVGFcenKcOSjKBqiNZJnlLDT/FSQn66aCklR
	pRzcQxZy+kNFd9RabfFgo0dzyh2nnfUxUMEmG9E2HMdeZsjxUxBeN5gN2h1r5cjpg+W0wcwX/XV
	lGwMOa654Iwi1qX9T3JsqV2FbN251rcGUhpmZFfGlDQ==
X-Gm-Gg: AYBFou315EnpEzBFq7yGhLs2xMSyKZ0YwxROshbZdIIYKDkkkOlNzdn8KaMEssRvlAh
	mTVzUoumwODjsiqoJZe76ZcNSNaBmMab0RJVuIsEAxvT8FlrOFfTxfifsow4RdbkTAzKWCkzgiC
	p0o2AcbSHwR9vfpt/BJFk3lyNHKdJxgejI1WNabTBmxL96dKqhqz8a03UL3XusRIouoFpysTTaZ
	fLqmW9b257LVgLOQbKXZ+GCJSU+Zq/1iqcly/8d3Loxr5PfMBiG/SARTg0FNWqgZYvopiLTf2wS
	KXLr75KWXzMnno3qjfULpWKMP7FvLWELW8WpJV7t3JFt3mjfJipJ9oNNFnpX3w1cTlPI6Bu5Kqv
	7YeABAWEQ7/MG/GbNbL+YmfdQelwDQqJshn/exf6MSu9Us4ey2w==
X-Received: by 2002:a05:690c:a6c9:b0:893:44af:ceaa with SMTP id
 00721157ae682-8b0f205bc82mr18570277b3.5.1792411935218; Mon, 19 Oct 2026
 05:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-19-mark.caveayland@nutanix.com>
In-Reply-To: <20261019120517.1448687-19-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 13:12:03 +0100
X-Gm-Features: AclHuK8ZXrS7z7rNR5xPtI86u1a7DgqF7yBwPx-IzPuf4gXWad_LCi0c6yZfuKo
Message-ID: <CAFEAcA_22wyh0cm+H_m9Cd_5zTLk-=wbXEOY3W67fi_07YAFgA@mail.gmail.com>
Subject: Re: [PATCH v3 18/28] isa-bus.c: introduce isa_realize() function
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1792411936-CC37587B-50E5DC14/0/0
X-purgate-type: clean
X-purgate-size: 486

On Mon, 19 Oct 2026 at 13:08, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This is required for implementing a container device containing one or more ISA
> devices to ensure that the refcount is handled correctly.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/isa/isa.h | 1 +
>  hw/isa/isa-bus.c     | 5 +++++
>  2 files changed, 6 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

