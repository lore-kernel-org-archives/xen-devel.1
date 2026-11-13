Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C4606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JmB8IVCw
Received: from list by lists.xenproject.org with outflank-mailman.1487317.1689754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpOT-00049I-2W; Fri, 13 Nov 2026 11:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487317.1689754; Fri, 13 Nov 2026 11:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpOS-00049B-VN; Fri, 13 Nov 2026 11:24:32 +0000
Received: by outflank-mailman (input) for mailman id 1487317;
 Fri, 13 Nov 2026 11:24:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xRpOR-000495-GT
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:24:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRpOQ-00FqYW-3C
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:24:30 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af6f356-bab6-0a2a0a5309dd-0a2a450aedc0-34
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:24:29 +0100
Received: from [74.125.82.181] (helo=mail-dy1-f181.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af6eef6-f2d2-0a2a450a0019-4a7d52b5bc4a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:05:27 +0100
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-3791619605cso1756774eec.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 03:05:27 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:7e8c:590a:782b:a57b])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-379565d3e37sm7110033eec.24.2026.11.13.03.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 03:05:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794567925; x=1795172725; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRGKkjeOSqGcAp5GlRiWRSP+3SQ9eykn8zcI3aD1Tfs=;
        b=JmB8IVCw0FsGKCIVQ5bu11DV4pQeeStYR/eBDde9OfBX1UxGBR24Ve04nup6CqquJ3
         8jWF07WcsNsXNJ+rtRo83QUNqwumCLfQKOg6IlcfmZhY1ic3yxCX/CjApDjzhyleaq0L
         t8yTrgv0OZAZYrL2Z0z9vyVcO0H/BC3byVtQs3aH7oeNfYXFNqPT+7aon6Gix5IsJ6kf
         Fq8yN3eMwVYenZZCToX+btkTqSTC7OKGLk2JSDOKIf9m6uXpP+JcxqL7201k5pKRfxEo
         E65THd6EAzrGWNiNDvKwFVOMO1GSe1oy8hzgfCAZr07+4QxFA9/w/ZbJBGGgPLEFq4Bx
         YaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567925; x=1795172725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRGKkjeOSqGcAp5GlRiWRSP+3SQ9eykn8zcI3aD1Tfs=;
        b=WE4J878b5ksfSXyqlLIZ+l1eEmr2yR0V2oLvv28MA1tf/cQhFlJ+6Mj5OS0duYujGQ
         x8/5dapfIjc+mmhUPXFSbYQTw/t66xuTioBQIy9kerOniDKoi0gShIqWa/ixmXKlzArL
         0ypC6mzIn/fyzNPHAaw88L1c1CzZf2OzUIG4W5dOTQz44dcvEVRNpzeenSFkYhHdUtai
         c4NOR2SKYK3V1TatP9gSGkkM16YaMxRLaLvG22iXO771lXz0BqWtZ1ngD+4T04dOV3tR
         aJWVpqZye4DI/VyIACkQlviFnVz3ZjkL6Tm1Y3GNRdz1UzXQ2nDX8CZpm72Gvzg+UNk/
         DhFg==
X-Forwarded-Encrypted: i=1; AL+hErHp3RXd0aqq27Bre9+LXmqREB/9QBf58vLAUA2Fxvi8tfS8jxgnkP/8XX/rc6b+BU+/cGsUy8Qf/Eo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9BNeChXUhGixoqTWoZQizQKwkh1WZTVD/HuCFvRbDLUlxofqWl
	OWox4jv5ZweXsQVOPnY9Q7cW+hblkUd8LsKUzbokDSXra5INsi0v1i/28X+xLx1uStQ=
X-Gm-Gg: AYBFou0o6xNVzFldLrUZu6nTMZ+JXor7fjtp3BJfAdNxNDArh4Hlr6VKhdSv04dNaV/
	CVWOmL6ZE8cLNXPQr9nHeSc+qngPsqfMu+2yCMNIgwMDGQ5Oc5fR/5GGtZiLdIgLZ63WEKHeE57
	pWCrlKY+Rt8F8UsH99HqiZOvughtbmJODqx6x9G11Xb5vxdBfFHJdCmloRQQEqSfp4r1UKqyAFE
	J3g06id7lKKNxEedoOF9dnn+YEePyIoXRrHwmYC24TcV5Sjys4Gu4/W4LB2X1Vba5wkQ6oBSldM
	WzlNaY76+O7dk0hXcwynraKWx6oh7QYfjU37BhYj619r/5HOg12ECvfzlWsG/144Hdo8LhW+Ya4
	w+u60Nw29mErL4IocKHrv8F8lAAgIMnjkEEMW9r3hmT/uNRqzQMKeCJH9/bH+ZDmDLq20AgGyaQ
	ORMzuGqkSteOAy66Wfm0QnI0fYQMXLK65XaZ0O1PzTSmFjrKIPRqrpGCpvqMBigVt6Cc9Jr1+lB
	6NTrxQZDIecxnjfVAGdElgODZkWDAltspT+ypvg3ihA2NOv7tB+nvSgI0+BNTd+3oCpeY85qY8y
	VK+ICxqDG+GxZd5Nj33XKo+T5hW4SX1f6Tfk0cGx8zEPEuRWAlX+ZU0izsKuIIjkO641L5ZvPvf
	XjqunWnvgRTd8UxhweEOonrOEZFYJ04h/RKQ8MQ==
X-Received: by 2002:a05:693c:2808:b0:36d:f004:ae6e with SMTP id 5a478bee46e88-3796721cff0mr1863856eec.34.1794567925307;
        Fri, 13 Nov 2026 03:05:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Fri, 13 Nov 2026 20:05:15 +0900
Message-ID: <20261113110515.147043-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <353a0b62-0396-48c4-9e5d-fae5351d6abd@suse.com>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr> <353a0b62-0396-48c4-9e5d-fae5351d6abd@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794567927-528DDCFC-97A23693/10/78177266408
X-purgate-type: clean
X-purgate-size: 413
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 08:58:51AM +0100, Juergen Gross wrote:
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, Juergen.  v2 changes the code after the Sashiko report: it now
disables the IRQ before the drain and unbinds it only after the drain,
so I did not carry your Reviewed-by over:

https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

