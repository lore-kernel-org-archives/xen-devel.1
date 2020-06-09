Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8AEC433E1
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 14:57:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AED020774
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 14:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLLxMtZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AED020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifgI-0000Bx-Ae; Tue, 09 Jun 2020 14:56:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jifgH-0000Bs-4A
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:56:49 +0000
X-Inumbo-ID: 7175b7aa-aa61-11ea-8496-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7175b7aa-aa61-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 14:56:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x6so21615235wrm.13
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 07:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=X/gum8gMNp9JDKAbvHKr2DOxNKPyYrM3RL4ioVlLV20=;
 b=RLLxMtZ+ow6+2/HgvtjAytqDw3j+cm+1qxHqbDBrtzQdcHimBkLRvMKZ7d5JGiFLMU
 pjJZLNTco3bsU4AAnWCJiST+TUR8jAz7IcHBY9rp1aFWYy8dPRUKZ5NzAgYhgyImwghL
 KD6xF3muiBDOiWxe5lT7ZL7vUqKLRRYZZ8z2mEXIXMljC5UxTHyaPVvLZ7btAXvWYSOO
 lmy/LHE0rA7OkBwarB0KH4MGdYUfCqMZUm9E+ZhWGKd48zzJtjPRF2nh94iTDMsaPYTU
 nqXvNzIH/3Mc1SCsq3t3W2W11pHcM/w7FJxnMByaP4+sfALuG0PnFdmup2xt2kogghXs
 S1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=X/gum8gMNp9JDKAbvHKr2DOxNKPyYrM3RL4ioVlLV20=;
 b=Am98jQMMhI5JmupyC/XJolh7hG/eAhmfsg2P5MYkZoSleS/WAlez4RztBDdHbQE96u
 rj4gvW8JvtXtpyJrMjft30NEnU7NOZpGZ9Faf3mSAO4E1+eHvXZQsFopnzasBeW5vDBX
 0j5fC08KhtUteuCDCUjPQt/oTRDzNRVUakL9MEjhHhXyGJXq87QxFdx+WWdnyVUaexOw
 IgHQAysfFETmFVqZ6jiCLn5zwEeQIyHIj3zLXQW5HdmRf0RGF1Uh134Se6xe6THuZDEh
 6QUiZ1yYZDLTPMbfg6F9W9azGoEXsCq+GOOb4p2w+86yNh+IZERjo3XnQpKDtuPPfWSY
 a4yA==
X-Gm-Message-State: AOAM531Emgq6TlS7Vl+Lg5tr6Y9WaF/3VB0i/BPC4okiQqt1oMZJ5cva
 8gjnbtPppCQeAtBhppLYYqY=
X-Google-Smtp-Source: ABdhPJyrpJz1eGm+5fBHyIZzo8cBU9ql/vBGQQtHJYkLJ9kLQeHfUPs2oIAt6Ig5EJOUYdQzXGVzgg==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr4916547wru.211.1591714607688; 
 Tue, 09 Jun 2020 07:56:47 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id q4sm3184818wma.47.2020.06.09.07.56.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 07:56:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200609144850.28619-1-jgross@suse.com>
 <20200609144850.28619-2-jgross@suse.com>
In-Reply-To: <20200609144850.28619-2-jgross@suse.com>
Subject: RE: [PATCH for-4.14 1/2] tools: fix error path of xenhypfs_open()
Date: Tue, 9 Jun 2020 15:56:45 +0100
Message-ID: <00ab01d63e6e$32a5ce20$97f16a60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJImk/I1P2ywCrTN6Alqf97EMn8vwLv1NDIp9Qo41A=
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 09 June 2020 15:49
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu
> <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH for-4.14 1/2] tools: fix error path of xenhypfs_open()
> 
> In case of an error in xenhypfs_open() the error path will cause a
> segmentation fault due to a wrong sequence of closing calls.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  tools/libs/hypfs/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
> index c91e165705..fc23b02586 100644
> --- a/tools/libs/hypfs/core.c
> +++ b/tools/libs/hypfs/core.c
> @@ -74,8 +74,8 @@ xenhypfs_handle *xenhypfs_open(xentoollog_logger *logger,
>      return fshdl;
> 
>  err:
> -    xtl_logger_destroy(fshdl->logger_tofree);
>      xencall_close(fshdl->xcall);
> +    xtl_logger_destroy(fshdl->logger_tofree);
>      free(fshdl);
>      return NULL;
>  }
> --
> 2.26.2



