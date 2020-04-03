Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B38C43331
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 13:49:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81141206E9
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 13:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1KQZMQ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81141206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKMhG-0000m8-AO; Fri, 03 Apr 2020 13:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DmfO=5T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jKMhF-0000m2-Dm
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 13:49:21 +0000
X-Inumbo-ID: eb237644-75b1-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb237644-75b1-11ea-9e09-bc764e2007e4;
 Fri, 03 Apr 2020 13:49:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id de14so9336956edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=1gfGhVWQXF8hIlG98IuWvoaZAaf3WHOr2ahCGfB2wqQ=;
 b=C1KQZMQ0SJY6zAU+5APpyt39G8J5JVq/J99oyoBlZhq2YXHhlM8NjVZY6dGUaHxWAF
 NYO8jr4vuFyJKYDFVH4vvA/CWF+/jDHMaViHVSY9dbeh/EY2+Uk8qIVOX79dsdtMn8sV
 fQB025kDJclZsk5GfMWq6Tfo/x85jVdbS82+GK6rCh75s2phmT7qE0jmJbM6N3UJslYF
 /LBFnDhxoHRRzB09w4ecMpsHVhtRIjp19O984Cf1g4Z3ejhiSPyPxyPo9t/MVW59rQmv
 HL2NsYIjFhKSitnqJcw3dyh71I7JzIl3V0P9P5W4OPO0sntgYmL5pTWv2Sl22Ru+uYh7
 PR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=1gfGhVWQXF8hIlG98IuWvoaZAaf3WHOr2ahCGfB2wqQ=;
 b=D0PtlvnkWD0AbP56ov2zcZJ7ceZWOQmuxFvUg8A4ue5yd/om5QD+1Z26fcfkFgaxTa
 07UaQhPmObhoF/ZROwqHk8v53PHboP7hswYpZ/1czOZFDMMzaMtPKJguumOKrsc5JlhJ
 0d574pQZUFRYsq5BHS7jOLRLcviYvY9tTP2tuL9q5gl7I3acLZLX6uDHeFaTNWrQOUoa
 XRsahQvGy++cHpXKk41xy1D0Kbol6WTO19a8g5OlTBOo3o9//FA9q6tagP37Zyeq+SAh
 0XQSxK8nPJULE1OnFYqzOUATmG0OP5KP52tMnrElRDQOMsmiGNXX8fshwYcbEQ+BEFgD
 aPZg==
X-Gm-Message-State: AGi0PubtuVe5Y75GW635RL+cgxPJBqIkCyAPNQPvQqhsypzAx6UP6IcF
 uwn30eXKUAwOzSaYUCJJtpg=
X-Google-Smtp-Source: APiQypIlwiGMdrGhWSuLt7+LBl3g8EASwrqCQgok0i/osWMzUXHNlg65lUJZsdlqHuc70kaEmHR0Lg==
X-Received: by 2002:aa7:c812:: with SMTP id a18mr7594330edt.213.1585921759949; 
 Fri, 03 Apr 2020 06:49:19 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id gl25sm1651756ejb.18.2020.04.03.06.49.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 06:49:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200403131720.30140-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200403131720.30140-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] docs: Render .md files using pandoc
Date: Fri, 3 Apr 2020 14:49:17 +0100
Message-ID: <000b01d609be$ac4975e0$04dc61a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQENksyss/2rMKILJ7OFcY8p7A1SCKn4V1oQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>,
 'Paul Durrant' <paul.durrant@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Andrew Cooper
> Sent: 03 April 2020 14:17
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: George Dunlap <George.Dunlap@eu.citrix.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Paul
> Durrant <paul.durrant@citrix.com>; Ian Jackson <ian.jackson@citrix.com>
> Subject: [PATCH] docs: Render .md files using pandoc
> 
> This fixes the fact that qemu-deprivilege.md, non-cooperative-migration.md and
> xenstore-migration.md don't currently get rendered at all, and are therefore
> missing from xenbits.xen.org/docs
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Paul Durrant <paul.durrant@citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>


