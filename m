Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A95DC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 01:24:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66557206B7
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 01:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy9ksS7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66557206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl0L3-00026K-FY; Tue, 16 Jun 2020 01:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/yp=75=gmail.com=vlad.babchuk@srs-us1.protection.inumbo.net>)
 id 1jl0L2-00026F-AX
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:24:32 +0000
X-Inumbo-ID: 212b3112-af70-11ea-bb8b-bc764e2007e4
Received: from mail-vs1-xe43.google.com (unknown [2607:f8b0:4864:20::e43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 212b3112-af70-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 01:24:31 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m25so10530402vsp.8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AWPRPexqcmyKI3v44fbOhZSz+HGtd9V7akn/oXB6X4A=;
 b=iy9ksS7dWc9insCdT65B93eg0YIQ0r+FJGVR6DCpsjTnZ465ZK6REocHE03NldZPoF
 XxXXlh+IcRe0HJUCihF7Ug+3ozrYJqzgT8sUSxkk74o34ZgNCWRES7sjXwU1BY414mO8
 TUq79CdGAm9fiylanXeTtUPeLxqtiXDK0kcxc+sMoyJMeBQmICuFbUciAvk3K5xWnLcb
 rBOp6zuYueT+uryD5QTAcVC8ISUTqG9w+SSIwDNHV2+gIGNwTVf2R6+nTJblBqdkLjo0
 OefZU7tuQeolaJm020iKLZJPmE/kVob/sP+bAB+AKegyVbNxzsz0kYlWPRV9RL8c0xEA
 ONUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AWPRPexqcmyKI3v44fbOhZSz+HGtd9V7akn/oXB6X4A=;
 b=rKqs8YXSK3yAsI+M77v5lZ1SXlukkh5OM6mHMdg8X0FwlkdZWgQFerIXAY/oWpzFTn
 ATJrEzsNLVaeR8E9mibGRDt6wbRe03pGIrJOorHlex+iXyBmh0AGMQFnkN0+BHj2DdCj
 XD/e8wiJtUzlh54oX7dNPpNhIWrQYWSTTa3yamnjFx9fCOk946IZjJ6etLqFz/fj+mcN
 Z66nBGKPpb703SX1hEZG5YIKQjkPDl3ieqxSlZt/UGaHvRjYLcwNOYfqVCnV1GLXqVXj
 80K8ljrJB3So2/KkeI80X369SsDkqOTx0tObZLiXsOWlwXC9v6FfzuugoWzNOCFrJZY2
 SuNw==
X-Gm-Message-State: AOAM531lijXqg0dECefL0RjIjWp+0pOqzjrzpf7LirwbZCC2Py0klMIc
 r2/V/e5AEQ4xrG5PDYeUNRT3DN1Qy5IRGEsQSSI=
X-Google-Smtp-Source: ABdhPJwMFqMuV/UdbdISJyaYS8N82sH5CUJkXQAF1CT+kyq94F4qTka7Egt9oTSyexZZwvo+u8+OUgts0cchTwtm95Q=
X-Received: by 2002:a67:7d81:: with SMTP id y123mr343026vsc.126.1592270671186; 
 Mon, 15 Jun 2020 18:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Date: Tue, 16 Jun 2020 04:24:20 +0300
Message-ID: <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
Subject: Re: [Tee-dev] TEE with XEN
To: Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Peng,

On Mon, 15 Jun 2020 at 05:07, Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi All,
>
> While enabling trusty os with xen, I took same approach as OP-TEE,
> with OP-TEE running in secure world. But I am also thinking this might
> introduce potential issue is that secure world OS communicate with DomU.
> If there are some misbehavior in secure world OS, it might let XEN
> hypervisor not work proper.
>
> In my setup, trusty os sometimes panic in secure world, xen will not able
> to control the panic core anymore.
>
> So I am thinking whether we need to emulating secure world in a XEN VM
> which is the VM running DomU. Just like what ACRN did to run trusty
> os.

Well, it depends on whom you are trusting more. Both XEN and TEE are minimal
OS implementations with aim at security. I'm speaking about generic TEE OS, not
about particular OS like OP-TEE or Trusty. Problem is that, if TEE is
running inside
VM, it will be susceptible to a hypervisor misbehaviour. You need to understand
that Xen and privileged domain (dom0, mostly) can access memory of any guest.
At least, in default configuration. There are means to harden this
setup. But anyways,
Xen can't be stopped from reading TEE's secrets.

If this is okay for your needs, then you can run TEE as a VM of course.

So, this is heavilly depends on your security threats model. There
can't be universal
solution. Also, I'm proposing to check Google's requirements for
Trusty environment.
Do they allow it to run outside of TrustZone? For example, GPD TEE System
Architecture document clearly says that TEE should be separated from REE by
hardware mechanisms that are not controlled by REE (section 2.2.1). I
believe, that
should be a similar document for Trusty.

-- 
WBR Volodymyr Babchuk aka lorc [+380976646013]
mailto: vlad.babchuk@gmail.com

