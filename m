Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD35C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:04:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF49206D5
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8rqDeu7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF49206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiaBQ-0007Kg-Bw; Tue, 09 Jun 2020 09:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiaBO-0007Ka-FV
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:04:34 +0000
X-Inumbo-ID: 3bccb06c-aa30-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bccb06c-aa30-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 09:04:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l11so20389774wru.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=EwXjFS4gOJyHR/4Nd3R4W/9hxeU0/owz7YOEd8D3ozM=;
 b=K8rqDeu7lfQCPMhCRyb1ygtmFaIdFMuxNksjcCLfK5RJmqDWkAzquHXb2vNl89ewC3
 EgOTxfGgf1pWOAmf4WAywanWbM4KhRIuyKzMBECXxN4Pg/MEKTumV6ATOW0QHzj32D5C
 CSuRtb52VBW0oYbrbkk1PfRSIRQFrceiSfC4ump5vz5+bMjrQHSdebZZ+2q8K4vmUZJw
 YssSxwcxjpdSRkVgh1ViXWX2kLa66yyCSupZPW/N9jguoZxiv4/rMM6JouUiv3TwNjhH
 Y3+Ma+AjKuH1/MULutOUroEXRBKPB0sY8GqhfLxXbuIrPiq+lxYx2mpWh0UuAyF7zZ0t
 YRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=EwXjFS4gOJyHR/4Nd3R4W/9hxeU0/owz7YOEd8D3ozM=;
 b=b91TTgucigjpm22M5+C+O4Uo1dWMlCmnl6JJFQw4Do8B1t0sTje8bC0UF48BoU/ebN
 r0PLsjs/LdPPGLSRrpiTvu3TF2c6WUmhJSdPUnD06/8uB9rPiaPPh99BahqVv9TJyg+P
 3i1V4YaLKC2MgVsrhb2VjXrT0MJNS9CCvgd4gwHj48HEHph28kvYNeaRuDHI4ROtphk6
 h8wpQtnUvenOX3Jp4iL0Njof+jhNpo1EQmaUWFVRW5M7PZicYxuFZmhBa1PZYDEx+5HF
 kWq9XXXrYmlK+915JSjWyQZ5J4F4pPntP4NCrOA7mi5yK4S7BqH1WBmIYyF1aIrlKs4s
 AlQw==
X-Gm-Message-State: AOAM530k6Wht0UNP/8sbUOT+hwOAP3jDWr4NGNzhLLwpY3ZBlUrFCF4w
 XsT7P1mpDbu+DxQTc/ESbf8=
X-Google-Smtp-Source: ABdhPJzZ1FtJ/MDNDi9PHASPF6lk9ujWFQQn6cTZWaMv/QA2N/7FPBSr+EUb+62nGuRkziMUXhdRDw==
X-Received: by 2002:adf:fc4e:: with SMTP id e14mr3250098wrs.348.1591693472336; 
 Tue, 09 Jun 2020 02:04:32 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id 30sm2607068wrd.47.2020.06.09.02.04.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:04:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Olaf Hering'" <olaf@aepfle.de>,
	"'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200608203849.18341-1-olaf@aepfle.de>	<005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609110016.16a52277.olaf@aepfle.de>
In-Reply-To: <20200609110016.16a52277.olaf@aepfle.de>
Subject: RE: [PATCH v1] kdd: remove zero-length arrays
Date: Tue, 9 Jun 2020 10:04:30 +0100
Message-ID: <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqIZk/Qusa7Qsu5bkjM27jAUAPHgHVoA+LAZtbwz6oDK6X0A==
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Olaf Hering <olaf@aepfle.de>
> Sent: 09 June 2020 10:00
> To: Paul Durrant <xadimgnik@gmail.com>
> Cc: paul@xen.org; xen-devel@lists.xenproject.org; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Tim
> Deegan' <tim@xen.org>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> 
> Am Tue, 9 Jun 2020 09:55:52 +0100
> schrieb Paul Durrant <xadimgnik@gmail.com>:
> 
> > Is it not sufficient to just change the declaration of payload in kdd_pkt from [0] to []?
> 
> AFAIR this lead to compile errors.
> 

OOI which compiler (might be worth mentioning in the commit comment too, for reference)? I'm not seeing a problem.

  Paul

> Olaf


