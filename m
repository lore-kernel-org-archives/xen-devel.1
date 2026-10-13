Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B65CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:00:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448123.1664182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGevg-0005ET-97; Tue, 13 Oct 2026 16:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448123.1664182; Tue, 13 Oct 2026 16:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGevg-0005EK-67; Tue, 13 Oct 2026 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1448123;
 Tue, 13 Oct 2026 16:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGeve-0005Dl-Pc
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeve-008WkP-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:00:38 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace559d-e002-0a2a0a5209dd-0a2a450cd706-22
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:00:38 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace55a5-f479-0a2a450c0019-4a7de02fd023-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:00:37 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-67921b515a7so2678896d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:00:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791907236; cv=none;
        d=google.com; s=arc-20260327;
        b=koivntNkOowzuv544DAAEpb3XgyVi1l0po8hTVD+G1SY+q/RVBhp2SayxDLlCmeAUd
         2BjynnST7m2HunF7GQjFlJ5j4SXXgsu58Iad6818hdRVm693v+5XVb4JgxO50+XrtvaZ
         aclNdMBfUiAWjk3Ymbwun+iBuAqgwmj6BmSZzBQbELVRtr25ZIcR+aY3nhAzW6P2chJH
         mE3TuTho39xVPDUAwnm0ezuZbtzHqmwemdyY7wI/Cvjz512LYtcvjfGSC+As28S7YUxq
         dfu23y3UATXebj9lJwDY2Kaa75K7AkT45mkjyV7b1U57WH4OytY7+tCq9iS8a3z9VpB+
         wvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D/uivC4tktPPj9uqDCsidcrW7/PSmgccuKFkXyRWMQc=;
        fh=x6rj9lFMFJuq5x1BqHla6RtYZiIhpudS9nqr8q6YR+Y=;
        b=e7dhzz0dbJcrno5Il2D3AFN5aLyRjm6+WdiNugjFxcGG5YOvUUHLhEbbEpFovP/kqT
         siIYTA9ueUoIovgeUFGl97lAzCpbXXN7HDkpx1YcaLlsd5Rx/xVjj2JxWSxJZVW8m+jQ
         Vo1rbeuwbroJ1JZ+K3taYHifYkfAX2vSJBLbMJEkjKVQO1qtJTE6f2H5J0CSsSpcC6fp
         Kk/ardkiBbz29lB1iZV87tsvz8YIlK+ZLS9kGlpZHG/tOTnjP7ZaT70PAfFtk/mX96VH
         UteX5nOuBN91RaX3UEDYItQ9UIqep1KgcTCmsotbEEtg0Yrk/g1mjjuD0gPeP4Qd5wpq
         mc1Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791907236; x=1792512036; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/uivC4tktPPj9uqDCsidcrW7/PSmgccuKFkXyRWMQc=;
        b=gpgabEIPWaKQ4N5H38jbVGD+FE5pjWwKeFw4q6YXXybYsSApei0pOfrEn3ThLZRFL3
         +G7pqPiO7lA6QgcWzm2nqIWpEaLU9+s9By3IfYDJ6XO2o6lSAjy0HmAUf0jXxmMolrKJ
         is+nQe4Gs7ZUx9764nj2PLWvG1WaKg/bqNq/ezMM4ZHN+Zyw1i8P567xsVPrbN8GzIlP
         nmZndOr33liyQ45fE5pUEHf+UpsofkmpHPY1KC9Wosybe3PZdTFVWG/zn8lI8uNCQfSF
         P4YzDF7enP9xRb3FVy+XPg2e3QCiIXQiskNU8En4yexVUO0sSXAXNy0yqc9RgMCogo6B
         1xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907236; x=1792512036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D/uivC4tktPPj9uqDCsidcrW7/PSmgccuKFkXyRWMQc=;
        b=GAw4zAwjpfa4C9GIBht5UULz9t+Lk1VKlt4fG9+mjiZ1j+NdUdbWF571YftKczGZ0I
         dN4mHfm5iXUMs9JgLdOYoWS06WsMQZY9AMakKO7b9RBa/mujGZoVsFstuMDE/8EORfZK
         uZJHex1r6MY7SD/Dl6XripKlLxWyKlQQJWzYEju/dDs1yj227rFidhUuEx7IrAwNV4QP
         /O03zhZgkwxV9zYllTtwK6HtkTDpDUZ6pUZx6xNDr9ORNYW81Re2eK+GuI0fseCUqSRe
         VXGeGK5fCkpfn+msKAzrXs/DxKdDjfG23O5ha8bY1bFzKk8Kje70iLzZQpxba5vtMJFu
         MMEg==
X-Forwarded-Encrypted: i=1; AKwUvBx7mscdulRWbMuE24+dhPoMD1Hf9qrLVLt7tGZ0ZZcewDUukEgFEJtxyRVQA+4ElTXCeg1vqxNBOV4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK5UkwXNb/JDywhfN+7UXjABRCprq9+ZDI1UkSNXTWfkkqipb/z
	ALVdWf5iNoHsy3mqP5HBkzDVfVF+yaWS+QJzI72Gge6Id2/7CRaw2NFT38+yibbepLOkatJzvBJ
	KikmoiiJHRkypRuJD9+H0ne2tKSv8wjNVY/F446OeXw==
X-Gm-Gg: AYBFou0P0j3Tno2G6C3MeImrq1ANLTDdk9v4g1rXHMmAUF7vvokVL6oOaOPolvUpGY1
	Ar5Aleez5u6KX5zBX/jOKaCn8qFdUgxUlYAJRRTErxj6lRPTQ+XKVarTeOswxLFIDmbX5RQ29p1
	M09HYCIPzJPr6FCvumZKa6A7Ph6NTfSgo8YBEfSUVEj0E4H+5UsyMO4dSZxLMksWtOvtEhVrQIo
	CL2pMEvoucKlpHe/EBMJGEaMpJyNdUIdiahnEOrM8IQHKkY3yLxCLbZTa3du9bSFWdI80rXSF+F
	rTAQARIkpg9+VbK0pEkqQIS6H3yljc6WEh7yO+F+3t0dvJGHwvJlBylGjG/CBnwGXjM3vybV/qD
	Wj2Ien+sUU35FARegISIwy9PR/bhTm78GlG1WQ9E=
X-Received: by 2002:a05:690e:4893:20b0:677:d251:ccd9 with SMTP id
 956f58d0204a3-679362827bemr3036296d50.48.1791907236209; Tue, 13 Oct 2026
 09:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-13-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-13-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:00:24 +0100
X-Gm-Features: AclHuK9oncqSnpk2WtX0BIztDFi6jgbDUd4jevuwU9CNMC7v0XFSzmKBIWC2eE8
Message-ID: <CAFEAcA8NTf=j7_D1_zN20cX1ogGsw5s0wxO2y8mvze0f1phiTQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] kvm/i8259.c: convert to use DEFINE_TYPES() macro
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1791907238-022C0A5B-80BF1D6A/0/0
X-purgate-type: clean
X-purgate-size: 340

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/kvm/i8259.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

