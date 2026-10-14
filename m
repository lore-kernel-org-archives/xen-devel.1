Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9770CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448898.1664897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxkT-0002Mn-8t; Wed, 14 Oct 2026 12:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448898.1664897; Wed, 14 Oct 2026 12:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxkT-0002Mc-4v; Wed, 14 Oct 2026 12:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1448898;
 Wed, 14 Oct 2026 12:06:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGxkR-0002MU-Dq
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:06:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxkQ-001GyN-QX
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:06:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acf702e-e002-0a2a0a5209dd-0a2a450cb10a-20
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:06:18 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acf7039-f479-0a2a450c0019-d15580aca582-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:06:18 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8ab43af5e97so39429727b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:06:18 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791979577; cv=none;
        d=google.com; s=arc-20260327;
        b=A51KR3dAGNxtFWjtEplQqECcscBqwIS/F1L60g3SO7e/cG0dtr9HEVJ2tTqBvwLIco
         PVbuto4diQfk7/B04Ypc3nkrzyA2Wuet2+iwxqnvIR8IDK4Peq0+THQBNcmUobDDDu+U
         V8fqLeshBAUp7DG029icRIZ6Z6Qzy6l37zCBp7t2QoOJL4YV370eRXU7xROrukTOB45G
         83IFHD5uL+cTJvN/FCz+pyB3xnMgR4xvKXFZLsWXkQK6gVm+VLwmWEV4Edf/GgaZj89I
         2gRfvmmfF/HQ4F8bB+qVic9Oh9a/2aOLX+PfRWYcU+shtB2SYbeOlbOMyRYvAqC8eI+e
         vvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d/3zqLfYuRm+7YCJo4+EtPoysMl01w41Nwru3cxg2z0=;
        fh=t5G37c3p/fbcuVy1NaMr51YxgmP3jVoaitBm7NEdzUI=;
        b=hC24GbuH92sQlfFV89BS1zopI/9iFRuCOCZHO2huiz890SNyROKjem2qv2OsuKv0Uz
         rj94GZ8Ze9rGmK9Kl/VuhLSb36xnims+vAqbwmpaepqUkzKF4r7hXd/SRxN59hvUBoPM
         be+31AxrAwSnfdUQaTYt726xARJyh+F7lFH/z+kpNlPAbVANr9uymtLSG/XzKuzg1q6e
         bygxNrdhznnL8UPIrqH9h4bxXy7HU0WEQbgqYA4o3dgChhKRC3ladRFssqR+nUfC/FLl
         a9vNMUPH4lPIqsB35DWE/h6UO3lSzH5pRHdBFCluW2Sred3LsIDNHNsRq2iPaJFDdEFg
         MaKA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791979577; x=1792584377; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/3zqLfYuRm+7YCJo4+EtPoysMl01w41Nwru3cxg2z0=;
        b=iaoN+PKjd6kyF02tImBCYSTgFbXcvblQ/WUrO9/vcz4g0JVybxvUGMkLjTWIAQ/NU1
         HNJsqJL3GAE8r2FqFIBR19j7Gkth7peaybYUwbrysJkZgbFMVv5CxvpUIF39urW796FB
         jRnXuwi+U+hRj/1OWwFnWbtzX6WNN02Y00Pfq/5j8ao9MqXisSZtiJpZY08zp/+pX0kp
         y5YY2pRi9bGwIKhq34jV27mB2CIGcL/tEEbnkeWW4kDZWfp7jmRpSV0tEYgoDJcr97yK
         oz8HbO7CRBlGGDQGzQDsB6n8VB8xpr5A6M6MUTHiYmKNtE46G8b5+zIqTz0L8HpeusKj
         VN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979577; x=1792584377;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d/3zqLfYuRm+7YCJo4+EtPoysMl01w41Nwru3cxg2z0=;
        b=tnxjmGJ5lVS5eCTTnGrg30D/8XQdf7Ar/rDPfI57GRcb5zbR3wDzTC2ybLI/C5rjiy
         axUADvUTwszmCmB1BRbD3zgAW3+/uIF5XWJn4Mzar2hgagsOeVd/NrIeOdQgjsbO4hj0
         Qo519qIHuGalz3/6dlvFX8sUnCFuqYezA3etyEx3U3hgBfJ+gxYPAn7pyHygJwr6Tedj
         vR3POTzJ3ff9UUhqrF977L+mPQDrcuZr5hvGK0LWIBGQIgABwyr22CNfOaiZsFh1Cq3q
         xkfWlavA8ekvggPXrhzeYMlUphqUXqhdhW2fjUyRmyq1wQiqNpDhPY6ghJ1wNn9QKJQL
         dGAg==
X-Forwarded-Encrypted: i=1; AKwUvByPpJVdxwtWNEI49oB12jUWQGHuF/p+gPGcl50N0Q97efq/JQ70skTJUjmjKRdP00HjUzvUd+p0FlA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI/b6wNXMJi7ODcon2cRdsFSXZfxqmQyIFEXPlADFBwIxBRKjMD
	InVgxw26ziLB8FAIDlVTf4Lk17mBdtjnsbbu2tn5VLmbXhGwTkQX9CNYkjP2ydH7ZQV43hdzvSn
	I950XNNRRuESWEhHRyJYbJb62IulRIKa82COtmkluEwrpaFt4MNJmD2Q=
X-Gm-Gg: AYBFou0WhmK4BhVKE2jUO72ukuKWw65YuzIrqCL2ltF4zSlXTMTURyYkiwOuLRdt0cL
	p6isiQHPLT18AKbzZXaKJNn5AOTMx5LLl7ct1lBwtLlOyFDSiE9XXjXxZP4M2n2NClvYIasK0cv
	Rvb+ZZx9Mte/VW/McuJhXsrpd8Bd76zfMVZR0/VKPRhjeiIId507Sw7CxgxnOco6zgWqJy5yUv1
	Eq3C4G5xe4jpRyiij34qdvpNrj3Yf1utwhG3eW5r5eHGyhTBJdq2+MdoPnvGMKqGXahHZQ9SGxY
	kJXnBvYpQr+Y+61jv/WMjro5af5mZg6565lYF6wyndUZNdABemyA/iwrOHeOOuayPvuyZnknjSA
	mFnS8KS3fdiUT0VEEEUfjHHxHxA3BO7b1xz+F8W4=
X-Received: by 2002:a05:690c:47c4:b0:8a7:ef2a:ff9c with SMTP id
 00721157ae682-8b07ebfde3amr43167667b3.2.1791979577149; Wed, 14 Oct 2026
 05:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
 <20260916104435.600211-15-mark.caveayland@nutanix.com> <CAFEAcA_fv66MxW4QKHjUypSwTZL=LK6YVLgNvoMH83ivn=EMbQ@mail.gmail.com>
 <0148737f-834a-4e7a-8e7f-7fff2ffaa90b@nutanix.com>
In-Reply-To: <0148737f-834a-4e7a-8e7f-7fff2ffaa90b@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Oct 2026 13:06:05 +0100
X-Gm-Features: AclHuK8r8W29TXukvU3-Y7mDsa8VmOnEakDfcbLqZ_5sU32lHwrsaLd93jsyRyA
Message-ID: <CAFEAcA_uWm4kq=NRDcUHrU_gDBEiVRc7_FQz+k6omAre0+p7gA@mail.gmail.com>
Subject: Re: [PATCH 14/22] i8259.c: properly cascade secondary i8259 from
 primary i8259
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1791979578-5270FA5B-111B9C03/0/0
X-purgate-type: clean
X-purgate-size: 1799

On Wed, 14 Oct 2026 at 12:20, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> On 13/10/2026 17:18, Peter Maydell wrote:
>
> > On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
> > <mark.caveayland@nutanix.com> wrote:
> >>
> >> Currently the cascaded output from the secondary i8259 is returned directly in
> >> the pass_irqs[] array, instead of being connected to the relevant input of the
> >> primary i8259.
> >>
> >> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> >> ---
> >>   hw/intc/i8259.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> >> index fcc94e12f8..964ceb04b2 100644
> >> --- a/hw/intc/i8259.c
> >> +++ b/hw/intc/i8259.c
> >> @@ -501,7 +501,8 @@ static void i8259_pic_realize(DeviceState *dev, Error **errp)
> >>       }
> >>
> >>       /* Wire up secondary cascade */
> >> -    qdev_connect_gpio_out(sec_dev, 0, s->pass_irqs[2]);
> >> +    qdev_connect_gpio_out(sec_dev, 0,
> >> +                          qdev_get_gpio_in(pri_dev, 2));
> >
> > We just added this line in the previous patch, so we might as well
> > squash this change into the previous one I think.
> The reason for having this in a separate commit is because it is
> technically a behaviour change. Before this commit, an interrupt from
> the secondary PIC would *always* raise the passed interrupt, whereas on
> real hardware it is possible to disable interrupts from the secondary
> PIC by masking the relevant input on the primary PIC [1].

OK, if it's a behaviour change that's fine. The commit message
is written as if it's just a refactoring, though -- it would
be helpful to spell out what the behaviour change there and
that it's fixing a corner case bug.

-- PMM

