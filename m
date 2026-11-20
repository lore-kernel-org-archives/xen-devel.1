Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921D606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bD78EXHf
Received: from list by lists.xenproject.org with outflank-mailman.1498247.1696109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQAC-0000d7-6F; Fri, 20 Nov 2026 15:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498247.1696109; Fri, 20 Nov 2026 15:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQAC-0000d0-3g; Fri, 20 Nov 2026 15:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1498247;
 Fri, 20 Nov 2026 15:04:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xUQAA-0000cu-Sz
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 15:04:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUQAA-009erI-5e
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:04:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6b00616b-2eae-0a2a0a5409dd-0a2a450482ce-26
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:04:28 +0100
Received: from [209.85.215.170] (helo=mail-pg1-f170.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6b0060c6-b57f-0a2a45040019-d155d7aae874-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:01:27 +0100
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-cc758830601so776326a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 07:01:27 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cde6cfc6130sm1474521a12.7.2026.11.20.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 07:01:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186886; x=1795791686; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=On43ZjoDW4xM+JQZ6p61QSzbWqphWK8UKiGElZsBgt4=;
        b=bD78EXHfUnwiyfdyUfdSIgA6dtMrQ6WVVYLpAUlHq97jo2EYTGt2W742G7dgzUObKQ
         S48nKlXLCcuDocVmtS7NrhNRlKzMi90mh6xtNRUfbqPm0LFPBBXfDFByDDrjCS9+j6/O
         SWP3l4zOnGqSwHnln2QLGRNF1DPi1P5yKajt1QvVVKVCiy77VrgpjZX+J1o9FGzXpB08
         Inpir2MVL+kJB56ySsawEea/eor6YNnHskJvCGxGF55gEloIigJvDEJ2jSte9jmqfU0p
         vijvqsRfmdaTGLWSlA2nxN/bEXH4HKpn1Z/da0jR9jDspisY22RqWIhHeuItmQwbuPdV
         EfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186886; x=1795791686;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=On43ZjoDW4xM+JQZ6p61QSzbWqphWK8UKiGElZsBgt4=;
        b=YSGRYC7GVNOiRJG0J+S0Bsbsy3LB4S1SdP1qXLgM6d+B/+A8/03er4VurXctA1pNv3
         d37Fl/y6dTstkGZpibxon/wnQv2zka6XLlWYChpx00OxJuGkWeLkpxNm1O1AL6Zt6Aa0
         iPybt6PRsR2ZjHcKpbrAGE4yH3OdafOOruFAiGtMQ4Mcc4jqUtraBUdFAnFfKcJ4+Vz7
         HDlRwNXXAoFqPJDT4Lg4ql37yuq7rSCP8LqVzzcHHBZpGHE8R/oqw16EC3D82aPDhxX/
         o8Hopomtbii9v0vyK26sBtUYMnW1UdSagdAo4odTheYeFI+nRjV7T9gLnTTGiuNpL2dY
         6vMw==
X-Forwarded-Encrypted: i=1; AL+hErHF0DucZ3RJlNJyXqnutb8Bc9VaWafpjHLoAAgQaFf1Dd9HfRdpR+aG9EbIWotGFsxXiG6x1RZsOh8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+GsjS3Ocusv+4lBbIhsgWFjv4fKuFVpQfQvC2DZ/UQNIoDhvdp
	oRwj2ITRMeNAWEMrKrtqTyohUsaDgxfVlbUPBubMccSyZerKmJmdHgL7oKVm2wenREc=
X-Gm-Gg: AYBFou08tu75EB+N6LLFph2nc2xqTcCxcoIRSTCAXP3n4/aLi3mzsj6256yfOYfXIlx
	UQRCZaZz5GpgrSu9p6lwt0KR3xpuhW3pw2GBeyP1MTI3fIdQHqYgOb7kj23lB/s3OJMdLMpeFRB
	1WEqhHrg3Ta7IlRyTa3TeS1neSnTgWaKNHLAlK+J9l42mMiPbIBVJ0ZBZOhveiHLgweSCqbLvdB
	+jvKVh6aKPe+kQ0kUZS1XAy9nEa5qS1w2NcP75kXO3SpCyzjel9LcAIdhA2GFlRdK9GcSALCjmV
	j+nI2Z9l4zQdyDJ6YjAQQ2fUUSS7VeXeZE/1mv3a0bB02trxp0CKxEl2s4vWnKOJqqQQQnxWEa5
	n02Lh/r9NCdNq8g3ltm4TfrYUlNLpjKn10hBoGb8jwp6galgLOSeq2zu/eu0/WayD1x85p7ZJkr
	b6nn6r01VlXbu/A98TRILUxvaZUCZAZfFa2OvcoofL5u/zldIKaIjk8cC+/+IxiFBL4kKjLPJiD
	+OMSdR617l8vHyrfSe0bKoAIsZo2o4WVnBWt1ZAW5XNhLO5sUmh8VBwij2PI2VJKEqcyorc6P3M
	vtsOHpW+pSG9JeCTblrYSKLN84dfvu8DK/dqR4EqpAbghynQAieHHP1/+2aAorKP6IqeXlmbDkx
	r+5/7pdeNYOIUbZENdFxrZYa3LhvWWSET824GSH+JpObGnaawxuoT6ji9sA==
X-Received: by 2002:a05:6a21:6f89:b0:3de:7add:6551 with SMTP id adf61e73a8af0-4014ca444c4mr3490315637.16.1795186885908;
        Fri, 20 Nov 2026 07:01:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Sat, 21 Nov 2026 00:01:20 +0900
Message-ID: <20261120150120.3128351-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795186888-522D4B50-CF83BC23/13/0
X-purgate-type: clean
X-purgate-size: 671
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 09:26:54PM +0900, Yehyeong Lee wrote:
> scsiback_disconnect() drains the in-flight count before stopping the only
> thing that can raise it.  scsiback_cmd_exec() (xen-scsiback.c:426) runs in
> the backend's threaded IRQ handler, so a request can be admitted just after
> wait_event() has seen zero, and its response is written later from target
> core context by scsiback_send_response() (:347) - after the ring has been
> unmapped, and on the scsiback_remove() path (:1268-1280) after kfree(info).

This is superseded by v2:
  https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

