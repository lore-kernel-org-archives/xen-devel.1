Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z8XVtZ5D
Received: from list by lists.xenproject.org with outflank-mailman.1456069.1669658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCgr-0004Og-CT; Tue, 20 Oct 2026 16:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456069.1669658; Tue, 20 Oct 2026 16:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCgr-0004OZ-9p; Tue, 20 Oct 2026 16:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1456069;
 Tue, 20 Oct 2026 16:27:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xJCgr-0004OT-1F
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:27:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJCgq-005C7E-Ae
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:27:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad79684-2eae-0a2a0a5409dd-0a2a4509ae98-8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:27:52 +0200
Received: from [209.85.128.173] (helo=mail-yw1-f173.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad79687-be1a-0a2a45090019-d15580ada4fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:27:52 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-8ac8a2ac52bso10132677b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:27:51 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792513671; cv=none;
        d=google.com; s=arc-20260327;
        b=c4z0OZDvpKTUeSuUVK6oUt3V/MobWlFJhHnSSPgVD6ZXdzdzDtP0yw5l2ttl/Bw80I
         A7BE2bsHQcxxYMEdiFC14aOUODizRf5FJBLK5KuIIFvtCQ3AYbDsbhgI3vUi0jt3+Jeu
         +5JAssMJGfTkzaHu1E099GZE/SJGey1ifWlBfOFCCOy7wdQkC7rt9upGX4GvuFpgnPpb
         mE14Uo/uy1Mqzqbcj84ADTD+C0DpiakQ2pvLAV+A0OInbyuR5dDsNbs+T0Sl9jWUsGyv
         46ZjUeuasSoyokgDhMeYIajMIvPxdUGIN1zGgIXxhUsM9x6U5g3NCiWg2EXImxuWFErv
         8RNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=avYRdodUQ6KiGgYB+yLXS5NG80XwFq+SqjqDPGJcPQ8=;
        fh=t6Pfkup9bzRm+DllxMjYUuFoGvPj2Ty/Ugz1X/ldDi4=;
        b=sSsqr51sX+lNmYuIwUO96CWaMfGl+lnD/Xdk9n1SY4/4Mro5vLVfaTQBdRaHdJSC19
         fAcDHiZBBTEkEvEAYY3Uc9JtFX7afdU3UDjSigp03oceMPIrvE5eMtYqNWkSg8qc5uEd
         8qBniQ0nTuPht5k+R2unzk6elUgqwLvl9KWwpxXcm2cAaZ8osxEcSyuenKQMMyDe5Glf
         Ug6o8fyG4/aEJKN+/i8Be357VSlK06LOgAILx0TZxoseYnSu3Db4y38cPiMhirXg8cgy
         4xJNksX56lf8tY0T3joikk+G8rn2jNN4w/jEGsODtbbz8oA0a4EmMr8PnY0CnuuOt6aE
         M9WA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792513671; x=1793118471; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avYRdodUQ6KiGgYB+yLXS5NG80XwFq+SqjqDPGJcPQ8=;
        b=Z8XVtZ5DEfKZFcOafdJkA0jWWE4w8RXxoWx642OCQnrzKQ+CY8lZ+RIuL9fpkQANZw
         7a/IgP2455BgyedU4MTc33jJkFQtQ6j+ZinQ3p6RmEO2y/ogiqPRsCwVz6u+rAJsmlhW
         56uL0f88WXNoWVul6efMmdPqm7uUzEcwGxa8529MFxUhUziLdUbvSSPbWfh8GcFsZwsd
         fPXOFIOnLL5LoyRP55Do275KAe2izocazQvDKDOQ3yGxSnHpvkAhzJwnCTBlYcIZmpR5
         H4ljhzO0aCVBOVQaHAoI+VREpE1fXPkIM9dlQ57M6c0kBm+vtfLELCZyMBVSbDyZEfyS
         KTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513671; x=1793118471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=avYRdodUQ6KiGgYB+yLXS5NG80XwFq+SqjqDPGJcPQ8=;
        b=mcTKAIzOzwrKe43suQ6o8ZeByTEXN/LkJP6pIxmGsd2jSkHWX7/9aqEZhgmL0iAryM
         08C9jy0aWFFtoXD23FlWceRxR3S4rXYFlNvUTHDwsjzg3aGrhQHX01knCEKWbBW5crjm
         0FfTcTx8iFeCOKjGnUNwqu28kYp5idUvqRXt0NKf78E6VyVCOG+kZv53oKS1f8PZREi/
         5p6lmW7y6HuKwdQ2p9BDg6wqsDy23BMzgsT0piEoTep+WTWIxZ775reVgor4zwCcV7C+
         6ChvqR/4rDs/4Bu/rSmSJxqv7H4zPGIE3+vl/urP2Pv0LWuj7ASWY2ZDtooU7mHCVdGE
         IsGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYz6F1UrkPg1zpsZe+j31X5e5GaAdE2W3WTT7fkZm9K3aEGCKh81Nqcz5HsvA2l2Q7DPAn0NVJ7WE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJxOSdK2Eiy40v9W03g4My18s6izqC7b7XjSH4DxuZzXDMy39nA
	eZaBUIDb4CXhOmIQlEEysFF0LJA9npqVRu/GnKuWcl+aHMFn/eCUh8lT/Gf1qSwwElrrH8A8J2h
	9mXqOjLlfhRynPpnJSeIqsrdOCmk532toVTsGD+mZrA==
X-Gm-Gg: AYBFou1OM8ewOeszcJSh5Z8YVX101aB4AbqfpbiudoSgGCzOahjKqYCZoLIaTUiAU30
	jxx7Wta/FmPC5tTZfj5XOVULsE8rUW59dwX/9w7Hu/ibYKtJj225YqKYbkJUEVEHI0a6ZaVVTWE
	2/9h1Srjuaxy1dobbsOJm33OEUXpkwT88Flc6J9AUDTlIc9Uk4P7twiuZZPSah6QGxPfNF9bHPG
	kek83Ub1eQgT6p0wmF6ZWmT+hPxiYmrL8ETXfbfs6gid3fkSZ9aDhw2ZaklTKqy22QXFpm1o7dT
	rXD+7DWzcUc1Y7ccTdKUpXxB603kYcsSbUso4SX4MUe5OyYNsRQhakoNURMJq5ok3aRcJD582zO
	sdQTlC9PURCNejSmCtDnevBq9giI+FbcKXhk2jnI=
X-Received: by 2002:a05:690c:397:b0:873:5c7b:c136 with SMTP id
 00721157ae682-8b12023edd5mr9254677b3.30.1792513670500; Tue, 20 Oct 2026
 09:27:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-24-mark.caveayland@nutanix.com>
In-Reply-To: <20261019120517.1448687-24-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 17:27:38 +0100
X-Gm-Features: AclHuK-LxX8V8SUjcf5mPQUtqxySvk3Fvyjs4x_5sidwHX23zHXcCnE77fpNL7s
Message-ID: <CAFEAcA8-Ke6ATD+Z=kGToBNXLonAJhBhF9KcvNK3gLPQ4R_gdA@mail.gmail.com>
Subject: Re: [PATCH v3 23/28] xen/xen-hvm.c: introduce TYPE_XEN_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1792513672-BD8C1034-93771274/0/0
X-purgate-type: clean
X-purgate-size: 422
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 13:11, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents the Xen PIC for an x86 machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/xen/xen-hvm.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

