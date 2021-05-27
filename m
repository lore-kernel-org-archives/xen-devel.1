Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7017C47089
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 01:02:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFC061378
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 01:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFC061378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132748.247505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm4PD-00077N-24; Thu, 27 May 2021 01:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132748.247505; Thu, 27 May 2021 01:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lm4PC-00076U-VF; Thu, 27 May 2021 01:01:46 +0000
Received: by outflank-mailman (input) for mailman id 132748;
 Thu, 27 May 2021 01:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xUuB=KW=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1lm4PB-0006XI-Qr
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 01:01:45 +0000
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da9e5a95-7e13-40f6-9ef1-7ace80d61878;
 Thu, 27 May 2021 01:01:44 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id v4so2369631qtp.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 18:01:44 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:7bcd:c108:e4aa:408a:f729:1f63])
 by smtp.gmail.com with ESMTPSA id j62sm405368qkf.125.2021.05.26.18.01.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 18:01:43 -0700 (PDT)
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
X-Inumbo-ID: da9e5a95-7e13-40f6-9ef1-7ace80d61878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:message-id:date
         :to;
        bh=UXUbGB+CdOX9UuOaqQylR62vI8ma7gNyTi1KjayPRRA=;
        b=OzHzTLCDHw41SUUci2vi+fRloV0E5BxwlCawkyTog/ITuB9Tiq+aL1HI7XJGCpWEMr
         180P6AmAPbTSDZfZR0S44npvtguaXKV8tipyOKolBWWRmp7lyeFDm4WniGggcw42h31K
         zDCpeYaCSYh+YFmvFBKWOjPVKVSC0GRoAaFnhsC7hS+twR/LtGutXG9z+TZDrx+Y5d7T
         AeU/c3KGHec25gIoiCb4UB4ec9GC1E0COfsFkBuZDtf9XngBelPW95SNDARYXBAKMcVl
         hbsM7pAhyXxtu/b063u/cA3xxKdnpUU9VtVGpXLlTQIuPPSqRXQKJ2cAhle5kqV3mzct
         f8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:message-id:date:to;
        bh=UXUbGB+CdOX9UuOaqQylR62vI8ma7gNyTi1KjayPRRA=;
        b=k51HqyO5b3cbEKE0Ehgcht+WZcItz7QnTKA7XGRrGHG3j6Ip6k01m1kYn+2MqDAx6X
         jzCrFOPYz6ZT/7Ip/5LiW1RvmQUyKrnaqCm+wzSikP3NZVFooCfPF6P8WJvmh24DNPka
         dasLgwYSD0DyQf/g+Qd+YdS7My2Jx/CZHSwt07Ql4fQmHz+4zCHpD6r981+MT5QXsdjG
         PUFZugYNFKekny5V4nxgPy8rA37h5QWZllTKIUtzJyxIpDC06uEN5dnfTKzht2iGPNeg
         lnYY3T9p/+v6bDtW+6b4aC3ufjxf/oVA7Ryt19j4tTvggvS4EXdqy0qUQvdu17DvC5KE
         XnMg==
X-Gm-Message-State: AOAM530Bc8l9qWkyYh806/VVteRQY5VrxziTr2jsd+7vHrRKAG6ccQEF
	/dn1pYMr6aOOT6xpH8QJs2bseH99pKU=
X-Google-Smtp-Source: ABdhPJx91+Qr+CMWwroLT30kojAeEC+CO5z02DM3DOKn2LdV9VSw7dYVtKtKlSHz3gRIccB2IqLVlg==
X-Received: by 2002:ac8:5a0a:: with SMTP id n10mr899975qta.232.1622077304193;
        Wed, 26 May 2021 18:01:44 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-3207986E-FD44-4192-86D0-1F861B3932F8
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: [events] BigBlueButton enhancements 
Message-Id: <56E50BB1-A836-4273-A513-E96D691E81C1@gmail.com>
Date: Wed, 26 May 2021 21:01:01 -0400
To: xen-devel@lists.xenproject.org
X-Mailer: iPhone Mail (18F72)


--Apple-Mail-3207986E-FD44-4192-86D0-1F861B3932F8
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
LPC and LF have issued an RFQ that includes upstream usability enhancements f=
or BBB and integration with Matrix chat.=20

Some feature gaps (page 7, HTML5 client) may be familiar to Xen Summit parti=
cipants. If Xen Summit has additional enhancement requests for 2022, these c=
ould be coordinated with LF/LPC, as a follow-on project.

https://www.linuxplumbersconf.org/event/11/attachments/732/1341/LPC2021-RFQ0=
1.pdf

Rich=

--Apple-Mail-3207986E-FD44-4192-86D0-1F861B3932F8
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8"><div>LPC and LF have i=
ssued an RFQ that includes upstream usability enhancements for BBB and integ=
ration with Matrix chat.&nbsp;</div><div><br></div><div>Some feature gaps (p=
age 7, HTML5 client) may be familiar to Xen Summit participants. If Xen Summ=
it has additional enhancement requests for 2022, these could be coordinated w=
ith LF/LPC, as a follow-on project.</div><div><br></div><div><a href=3D"http=
s://www.linuxplumbersconf.org/event/11/attachments/732/1341/LPC2021-RFQ01.pd=
f">https://www.linuxplumbersconf.org/event/11/attachments/732/1341/LPC2021-R=
FQ01.pdf</a></div><div><br></div><div>Rich</div></div></body></html>=

--Apple-Mail-3207986E-FD44-4192-86D0-1F861B3932F8--

