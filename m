Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C97CC6B16
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448047.1664039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGec2-0003wE-UZ; Tue, 13 Oct 2026 15:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448047.1664039; Tue, 13 Oct 2026 15:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGec2-0003w5-RX; Tue, 13 Oct 2026 15:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1448047;
 Tue, 13 Oct 2026 15:40:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGec0-0003vn-RB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:40:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGec0-00FwiY-7o
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:40:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace50a2-2eae-0a2a0a5409dd-0a2a450c9942-42
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:40:20 +0200
Received: from [74.125.224.50] (helo=mail-yx1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace50e3-f479-0a2a450c0019-4a7de032bc53-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:40:20 +0200
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-677b5148acaso3022512d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:40:19 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906018; cv=none;
        d=google.com; s=arc-20260327;
        b=CqMTZ7sDpFpRCnHkATqMJL4aktC9DlG3zllXW5NqAAtOfedtCBw61r3fmaOsQATEba
         h0fTWqIUmj+v1StGBf7gUywTsQuvbtETnoINFgHnZfwWrGT905EqLyRp1mhqpgpic6PC
         2zxcr7uRJdFKl0dlnWUO7N7Yc90luZTWtHYGJ0Ud0fFRmLNmceE0tQXCfC6X1Mtz5M55
         NN/rE6VD1z7IMAqNnpURPnAkNWJepVS4DTk2/WQvjqzuKPFIX9KRSdGmGhll1RU4lU7U
         HjACbvj/jJHY6czH1Ze28deH6X4I1mjQdLAWzFXvHsCnlqF0qyKw5Rap4lcFYl6gxobX
         j4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7nlBlArFve0HJmN8yN8NWx2yCMMfhH01nmfaIpVhzEU=;
        fh=UMniVy577JGlzHgVgeG3Qryg5FlMJg4uPMhLeeNfZfM=;
        b=T4P/cRSzROIFXTP6sLvuzBTF4VcWP4Jz66hpMKB7TJWBq3hURTSZF7bxAXSjpIHH37
         iow98wfqEf+KsVQn1eN4EyR66csuV1mB9y+T/l4co0wIWsiwUbXnV8WRmqpEuqg9cgf4
         nB4lxE4Flg0homNRL7Ao4PhtKDP14Sn4TlqjOs9pxGbKO9+EB4/YSx+G8XjaDSWApb/c
         34kYlJ0rVB9IurCIQtv16fK7eOcLnd3Ekpq9rypuNDmEa/wT9cWQ/iTZGDmu6tKyhTDb
         i/qnbpmorKjKjYxjDukeap+QD52V46X4cD69Te+OiyeL+BTFkiNxJY7sTxQsXPRsCvPK
         I5cQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906018; x=1792510818; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nlBlArFve0HJmN8yN8NWx2yCMMfhH01nmfaIpVhzEU=;
        b=ZcbYL8+pjsLG66oLh3yW3iZlzTMLaIFeRuXWQSmNmDZo/p7U2w83SdspIC4vocJNQP
         1KJLDVq2zxbPbmpaBJCNCp569WJJ3Ge9WYGv/ZXlbKsFPNEO3ZjW7CmLfL6Z1D9pQUZd
         K9AJKMitPZeQWu+TyeDb6dYCYMH6YEB+2RYY/oXb25yKWuPVEhiEnH0WoQ0baVPTFB24
         /Hba9BYVfH2ib2UDhdLjk7wKRWul875mStQ3NGQsOAgmgyelyrAKplZUQph8YWp/Toqa
         I5bJFRntZJNvBhKvlQxQrf56MazvQSPhA1dtzaRHGuEaqQFjCE69Z0st2ZekFFxs3ZuF
         nPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906018; x=1792510818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7nlBlArFve0HJmN8yN8NWx2yCMMfhH01nmfaIpVhzEU=;
        b=DD0FeusKAcAgTeW575tU3QUE5EBzaAu7df+xrktvqvr2X2NxqRhLeqKrqcspEezQ8I
         vqQM/l0K+tqBZn2iuvqve0pBY5UWopXgfVDVnLO45MTnPzdkPFJaF/df7I15bUnhN64F
         kjwMAIydEi/LUfsdewLgdooUMfbcc6rEp67elEfEEUjqbWzOkl3wjSdd3UmTxgQ36o1e
         s9egZSuQIdh5MLaeJwkhsbS19NBbA18jxRZip9+1j6K9cpM0k8EatSp0MW3IGxg+rAq1
         6jeHeT3a4rXgn99jkcB8PfgfPOA41L7IJqDZql+MpT6Q6TF+ZNrx0lsiendgAdjtUQKk
         SWvA==
X-Forwarded-Encrypted: i=1; AKwUvBx8WY0C6dQ3O9WyoENYHdGnMZlVkDoWoCZsrcf+l2bgJDpKcY6GCQFzYzEiWVXbi9Lxf20rKADRCqk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLkcz5yuZ7U7ujGoug7a9JrxkB2Zcgq8zpHAKenFgxsR5cT+7jd
	Sj3TBj++MJsODNLwi7z6YzP/XqfuRX0DpLxVpn26Kuc3FOd/TLO6nwGrnqGQktop3gKrE4qY5k6
	owVWwxBuCXnTyMqrauGbVQtZYYMdnqKouPJz31AtmBw==
X-Gm-Gg: AYBFou12Cjzbh8aFf+gFQNY6j+yX+NmFKXyuj2lMjUO3/RgLasBR3VaioeftWWHMadh
	/urjP3W3rS/5GgwKsC0SmWGXif8xAtFkfggwB9tzf3uzZWHNnUQwlev6fIMLnrFKdzZXD3drLu1
	WhcaPsqhV1OgTsUcyrd7xaKpM4A0munBbRuCMC2G1Zbt4qnPRSgxX901pUMeSuLoaiGgH6zFzLf
	HZ5Vn6RwxzPADYXUh4DWrUBvqwLk/owuzF6eHVuoiJfiwj8JUZ4kBpr5WeYMNs/+FaOLGFHOoEf
	dJke5GyotfdqB0YSqShb2kzNMSwLWqKM6Ra35Kjt4FV/KCFfaqhg22Xg8nX2DtG9Ba16Cltea+8
	Vsl6O1PV0SY2dZ2K8C/BO+obWvgSsvsfMPIcab1g=
X-Received: by 2002:a05:690e:4091:b0:677:a99a:8107 with SMTP id
 956f58d0204a3-6793628b68cmr4386999d50.105.1791906018426; Tue, 13 Oct 2026
 08:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-2-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-2-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:40:06 +0100
X-Gm-Features: AclHuK-87uWTjw6PP9kfFnc6AhLREEHYfbaenIc_Hyv-azDLMNc0Tk_TV4qrG5Y
Message-ID: <CAFEAcA_ZQBiVLZLBmEKF_DFX9GkvjuHpeup_7_Nb9sB+14zeLA@mail.gmail.com>
Subject: Re: [PATCH 01/22] i8259_internal.h: rename PIC_COMMON to I8259_COMMON
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1791906020-50B3DA5B-EE3F22CF/0/0
X-purgate-type: clean
X-purgate-size: 328

On Wed, 16 Sept 2026 at 11:45, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This is to emphasise that child types of PIC_COMMON are all instances of an
> an 8259 PIC.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

