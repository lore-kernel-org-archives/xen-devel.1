Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD37CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:59:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448108.1664156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeuH-0002Db-H4; Tue, 13 Oct 2026 15:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448108.1664156; Tue, 13 Oct 2026 15:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeuH-0002DT-Dt; Tue, 13 Oct 2026 15:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1448108;
 Tue, 13 Oct 2026 15:59:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGeuF-0002DB-OI
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeuE-00AIKQ-D0
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:59:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5536-e002-0a2a0a5209dd-0a2a450c80d6-34
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:59:10 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace554d-f479-0a2a450c0019-d15580b3ecc6-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:59:10 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-8a83d2706fdso931247b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:59:09 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791907149; cv=none;
        d=google.com; s=arc-20260327;
        b=dXEXXCSI65zZbHCT5c20vQ9MK+67JcG/ODpMxoMee0jC3lpMZ3zCcxPkQj+5YHni/A
         GXgcyN0vULCkgYiUzNH72YiYQ26REHpQLmfi7ku8Vo418YcO1yFJUtqjv7fn5tBEe1RG
         TFFhQoCeHyUNWmW4UUVYYx/EFxB6ahW/Sw3DftSYOpa0GQBjmu4sMQ3BoosuacxmYof2
         +oU3/iwzLYx7J0ZF4GIRmmDGq8wKhyfo76t4SBUI1Uvjh/eO8IDZq3ZAn0c+n8TRuA93
         vnroRTU2F/0r5LwVdRhIn9JdcHVH+BNbCBzfTTMShd9vkHkit+/Sm1wNxjYZ5E7S8+OA
         4VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FJNmQg65EL7s7OyNY6H0dUpsRkuSOaX4owUg57y7TK8=;
        fh=QBnQ43fOX7gX7to+3sXCJcXhqNugz3SU7PVDJOm0b4w=;
        b=G6kD6b7N6CSJkVkfGhMlfJp8Llxo/gemRMXxmzz4Y04no35/XnDfcQc7pWrzMEgUxw
         XQtfCH+qRR+dYLSRu1q5ukSeRyobWkr+Hrn1CkGy0+lFmjK9QTAaA0LN9kQwvcJD+cNF
         ZPNrrD0RVwu6CC0IQXLG9vQd9hATOGMAaaOW/CxMrchPxeT95SCbjdBruWIAClcA9LiI
         jGpL7GvlLKostqYRNYiDRN5NR1uNibnV0jQkWllKIipXyWw+o8tpGHhjpyyWZu8VP8N9
         BNjvCklzem9KAC6MI8I5gIvdLupWBpXHS7+poFZlb4SToiUGeS1kYenMV0XRz/RYv8Vz
         ve1w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791907149; x=1792511949; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJNmQg65EL7s7OyNY6H0dUpsRkuSOaX4owUg57y7TK8=;
        b=N0sOYdKw084jUVmiLoqkghU3MgIKtCjB8JHqzn/DBpTYLgNTuH9XR4RCCiiwa4oCWN
         MdXtU5ZQG3/+6o0t4TVE5LYB3O2ZAHG+HEKJnhvPW/PbIoLPNCsbokodkivenbyBrAwh
         RpWyhMhEE8XBt8kCM6F3/2nF83KfHyd9//EOCswzF5VnUOsLbCrMYKDfrmKzCNT8NXRt
         eOA5QaHGZ47HpBSSB7D1RGnvtWOSdczFZeVGPkKUoGWoDjippuABEm/oN7iNm/9pe5l4
         qVa79YnTNVKemUjCVXJvCTZ9EseqM1vb6BwigeqgYE5cNFiEMIJVjUdA9Q0X1qwQHaAM
         4NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907149; x=1792511949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FJNmQg65EL7s7OyNY6H0dUpsRkuSOaX4owUg57y7TK8=;
        b=fEvUMLGxT/5+6R7C4vkWTBKrdkuyR5w75ZbCbm4XDWsdWwO6yAQRPhZE8ocxWHRgtF
         i+zPdtm6oHXs/en8+rvqPDcHFieEezTjmudbEGnR4pLwwULa3pS7gu5JujSKvCRdGFHm
         uivn36vG3GfWNf3UGgYxVUe1HV64mg0ts95+DA7K8jzC8IVI4s/DDJHIgcDtSnUeBrn5
         H4/F64cSizQTr9wuScvZMBUx0YvbYG3AhZbjmO9mBbZgxrRUUltzva1+fUulqxAr8I9F
         JcofqT6nTKXwnlnnps6jBCGtzRVKuuYPEDFUPOQ7jZifR0jKmhnQYD+x05zKTRwQjmiU
         dE9A==
X-Forwarded-Encrypted: i=1; AKwUvBw/ps01XCuEZeQbvNc15f9o7D0rgL+IWc9rBsQQi3f+uQe/bb6O9MzGv6sNHaNpazVgV76Kqtwnv/g=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI8UwyJ3BJCwwNfqtYoWO/kImXHh24S4VNC0QCuyMtES8aBWw2S
	7Fs/5pFbN939Rx35woLsxtsSWE23C+7QAz10Ng2zkLr771pNOEQJjhd3cqIUMwFFq8ZT28S/7FK
	WQwwbiMSpZcdGzT6alfuDlU61EKFtUzl8x++X5+h7+w==
X-Gm-Gg: AYBFou1F2DwaKvwlhRVpUDceYztoxLKyjsFQvx1399RHv9i0O6hVwGLPew8hXoFchfv
	tl9f0sLl1VsXtWb5/lpglvoVGmZAMh5ohEHYWQ27xMZ/TMgwja7yxzmAATF9I7sCecZJjOLCdDa
	d94cgO4gDOb+iiU1V2gsdoTqasoSXfaI+2JV2YY6z2RESLZ92VL49CJ3lC1jFZQjl7NMoe62pV9
	v65pR6fuo9cOqxQnPEiN6Nq2QLq6ZWYUnRr/JPOzTUy+or+sYX1ph/L/o4YH9YTdDilW8Nlbh7c
	Y+O/nTsxwbYMSlPcDvn4rd1OK/LkGhvuhBjg9UMoQzaHTQFTJUr61rYUOS0TRX5aGNV5Qv7DNdU
	uO0vMIhh+WxFH1blNEc9OiufcZ585MzIjTwQj+3E=
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr25300217b3.53.1791907148775; Tue, 13 Oct 2026
 08:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-10-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-10-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:58:56 +0100
X-Gm-Features: AclHuK9l7BoKCi9zhsOGKWUFSW56RXKgiiWtviGpuEUGHICMhXY_rAt3MbM6dI4
Message-ID: <CAFEAcA9f6pSCmwFD63v3NerXDMYWXF+Pq4skgGKs3_N78xo1rQ@mail.gmail.com>
Subject: Re: [PATCH 09/22] kvm/i8259.c: use kvm_i8259 prefix for functions
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1791907150-00ACCA5B-151AF0AA/0/0
X-purgate-type: clean
X-purgate-size: 419

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This ensures consistency with our normal QOM-based naming convention.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/kvm/i8259.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

