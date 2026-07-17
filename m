Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1984EC44507
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:17:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364757.1615756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcoy-0000Ys-Hh; Fri, 17 Jul 2026 07:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364757.1615756; Fri, 17 Jul 2026 07:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcoy-0000Yk-Ea; Fri, 17 Jul 2026 07:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1364757;
 Fri, 17 Jul 2026 07:17:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wkcox-0000Ye-FE
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:17:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcow-00H1cV-HK
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:17:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a59d6ef-bab6-0a2a0a5309dd-0a2a4502abb8-42
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:17:18 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a59d6fc-6ca4-0a2a45020019-d155a72cb0af-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:17:17 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5b14d1f9315so5984457e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 00:17:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784272636; cv=none;
        d=google.com; s=arc-20260327;
        b=J5RrL4RybJkffu+/gWX59Oyp3okJHoQA3lfrrMWUOuf5YH5CKy9aFt+U0LIXsBSGwv
         0PUDG9rehBKxSuwNdBswJACK8MCLjnS/YRmvZlsnarAoKFd1ynWS+dTTfzs9TjagV75Q
         Vx93iodet6yZdYIpB8P5kdKAxt1PnQsTjS1+vcBxTF6+U0b+92kLJiRx2eOrbbEonD9E
         4I+tUZi+Ty2Il2tN8wXHZW5xvhnwPswtPstdZGBUXVokTFvEMpkj5x645HAYaHdzoBqv
         4Bs+S3NnRH9c33IxTvcfadjZ9bxLxj+Wlk3hx3EsFrMjoobv6T+4eaHlwFjdXashR73o
         quhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8AaRSejSB1ZYcq1vcSbuaSLdZiIjp79tMFp3STbznYA=;
        fh=liaHVLCRB7DEmgUuIPbome8e9IfJDDhO5FKm2gXV0Qk=;
        b=qM1woKVkPcvKGhp+suAK/TDJuJo1fGwSE5taD6fP2zRpUCHewzD0tppmRyeuCkBkjQ
         Vy+ZLkNnuCCN/KQPgLyj+Qswj4w6J9/r78CaAktZqg4Wcra7bhM919/NBHhGH/f2CoVq
         Eb1WCSpb9FZ9d+cDiestXjRN+GvTQqKaUMJP3LEz88u509BL7UWlxW4wF/8QL7ll0625
         MCJ+O0+jYdb0PMGNeXdsmDR2z6EFgCRKGV7TdR8glLVJx9KnOMnvkuGGLULmurCkePGb
         /hhuGkJrbwIwihke8HcgVio3a7sBXxGnSgmYH+r+u+rRccO3CarsgUhJSd8jtNEx++p2
         QcgA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784272636; x=1784877436; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8AaRSejSB1ZYcq1vcSbuaSLdZiIjp79tMFp3STbznYA=;
        b=mMsvopp+T5uMR+hiJPIymvQRcAk1AyAYgfRmmmg/nYULLx0OBHcorMFCLqd1zAyVNs
         gZfrgedpJ+xtWDnD1vut6/wHb4YpIXt6ojm3xD/+wLM+4tVCo+7No3PVQjTTvVCdZVou
         pJpEaYHXSJISknhHO/BIOlD+zq0nHZfYlcLKEt3p969quEOL9YmyEOmC5LPBqbowPYY+
         HXC1R/wn9BIcf+Q3l82erIWZxOYV2yMOHlm/C4NK0aVr9U+IjRY6qCay4kDWfy3g546i
         RnGJqJlsU+UKP1d96l56npdhCGcyhcUkSbWNKlWVHEYfDzgwXtXU2kcu8/itSKPnN+4h
         HGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784272636; x=1784877436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8AaRSejSB1ZYcq1vcSbuaSLdZiIjp79tMFp3STbznYA=;
        b=IrCY8q8Zq6+sKPCbX8Rn2hWrjwtR0JSFMQvgd81Vy+OCELhYHCPISkRmG1ukJrgzBj
         +OahSEQitbVqbivwwgsD8ou5zXF+NnjMz12OJmvUmiu64O4xDAP6ImgdJ1H/KRmrOOOA
         1TXNkV5gsR9RELrckA3yh3zIgjVHLjBPB9Nkz0cm7XL1MBxkVWYhYX2yZT9OMMFqAAcL
         N0edkH3zU1YcFtcXBfPev9jrybXezoj3TuRgF3+DC2XMaoFGMqJBRy23i8ikAigeEsPB
         cM7SDNita+wGoH2po3qqQgDkvhZNyRyyHfdHkrhMA+a59hxvd4yFrr2GtqBvOglCc357
         KW4Q==
X-Gm-Message-State: AOJu0YxXeKHhUzjHvCVOp6BxuoloyytyXDNtxE0acmM4sxboM4ezusr6
	ovGrlLdHX9go8tn7JSKrbaowr24wO5tvZ2IytmB/2mP1a+ewBtJk/9p37aJk0aXAIlOi08vgX0I
	n6/fTO1iIANpt+vInDLnXCGXbQuqqNnm3Edwn6hM=
X-Gm-Gg: AfdE7cnqKfI+t3INCyVOBlJ4fPrwK8c+FA6piGapyMyU593qd0Y/Nc31H1x57b3qzjT
	nr8c0bY5YVrV1qxqx64q+2Rism82EoMrSVfG0bUyoGY+66b6VhLjn0d6WYPyCFZmwJMuUyRC1p1
	0a+Q1wZctCZ6VNV4paj6ewt1rjSKE8VYjmtzzk/8/Hoy39ZhpwHDvDxbD9kpkcsc057zR9vs6km
	OC2E2GvqeNaSKEPumc1xRBkXCDayBNy0FAmnLNlxje0+rKmnYQjtqtAdhk=
X-Received: by 2002:a05:6512:6c3:b0:5ae:bcc4:c071 with SMTP id
 2adb3069b0e04-5b28f6fe954mr345067e87.0.1784272636119; Fri, 17 Jul 2026
 00:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784272211.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1784272211.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 17 Jul 2026 10:17:04 +0300
X-Gm-Features: AUfX_mxQVPoKH5o74W0_9pcasBOCj1WQh62U8JEFKyYtSwaYlIO8KYJo4gKv_CI
Message-ID: <CAGeoDV_K4gG8_WFUbUwiOk1CKTN+CPLA3nJ6oU89vqxzU7mZHQ@mail.gmail.com>
Subject: Re: [REQUIREMENTS][PATCH v2 0/6] reqs: add Arm GIC requirements
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1784272637-F0CA22AC-B967D8C3/0/0
X-purgate-type: clean
X-purgate-size: 2948

Hi all,

Sending to xen-devel mistake, please ignore.

Best regards,
Mykola

On Fri, Jul 17, 2026 at 10:12=E2=80=AFAM Mykola Kvach <mykola_kvach@epam.co=
m> wrote:
>
> This series updates the existing interrupt-management and guest GICv3
> requirement groups and adds missing requirement documents for host GICv3,
> host ITS/LPI, guest vITS, host GICv4 direct delivery and vGIC direct
> delivery.
>
> The interrupt-management change keeps Device Tree primary interrupt-contr=
oller
> discovery in the common interrupt-management layer.
>
> The guest GICv3 changes keep the document focused on the guest-visible vG=
ICv3,
> move register-list scope into SSR descriptions, and document Xen's limite=
d
> virtual GICv3 pending-state and active-state MMIO observation model.
>
> The new host GICv3 requirements cover Device Tree based physical GICv3
> initialization and interrupt handling. The new host ITS/LPI requirements =
cover
> physical ITS discovery, command handling and LPI state. The new vITS
> requirements cover the guest-visible virtual ITS command model.
>
> The GICv4 requirements treat direct delivery as a backend-specific mechan=
ism
> used by Xen's virtual interrupt delivery model. Host GICv4 requirements c=
over
> vPE, doorbell and direct-vLPI backend state. vGIC direct-delivery require=
ments
> cover guest-visible direct SGI capability, request control and direct-vSG=
I
> state handling.
>
> Mykola Kvach (6):
>   reqs: clarify guest GICv3 virtual register model
>   reqs: add host GICv3 requirements
>   reqs: drop duplicate GIC version AoU
>   reqs: add host ITS/LPI requirements
>   reqs: add guest vITS requirements
>   reqs: add GICv4 direct-delivery requirements
>
>  .../arm64/gicv3.rst                           |  46 +-
>  .../arm64/index.rst                           |   2 +
>  .../arm64/its.rst                             | 382 ++++++++++++
>  .../arm64/vgic_direct_delivery.rst            | 166 ++++++
>  .../physical_resources/arm64/gicv3.rst        | 564 ++++++++++++++++++
>  .../physical_resources/arm64/gicv4.rst        | 515 ++++++++++++++++
>  .../physical_resources/arm64/index.rst        |   3 +
>  .../physical_resources/arm64/its.rst          | 519 ++++++++++++++++
>  8 files changed, 2175 insertions(+), 22 deletions(-)
>  create mode 100644 software_safety_reqs/domain_creation_and_runtime/doma=
in_partially_emulated_resources/arm64/its.rst
>  create mode 100644 software_safety_reqs/domain_creation_and_runtime/doma=
in_partially_emulated_resources/arm64/vgic_direct_delivery.rst
>  create mode 100644 software_safety_reqs/domain_creation_and_runtime/phys=
ical_resources/arm64/gicv3.rst
>  create mode 100644 software_safety_reqs/domain_creation_and_runtime/phys=
ical_resources/arm64/gicv4.rst
>  create mode 100644 software_safety_reqs/domain_creation_and_runtime/phys=
ical_resources/arm64/its.rst
>
> --
> 2.43.0
>
>

