Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E52CA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439378.1657776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxa-0004uQ-Qy; Fri, 02 Oct 2026 17:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439378.1657776; Fri, 02 Oct 2026 17:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxa-0004tB-Ji; Fri, 02 Oct 2026 17:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1439378;
 Fri, 02 Oct 2026 17:22:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxZ-0004pw-VB
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxZ-00D6hg-Bw
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe823-8faa-0a2a0a5109dd-0a2a450a9dfe-44
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:13 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe844-f2d2-0a2a450a0019-aa0a817c7779-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:13 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-T9bDLC4vMrmbaFc3F_DJpQ-1; Fri,
 02 Oct 2026 13:22:09 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 368601955DDA; Fri,  2 Oct 2026 17:22:08 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 534DA1956042; Fri,  2 Oct 2026 17:22:06 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790961731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbqqAHFykwJDNLT95Vrv3Sql/bIC0QmQk8beXY8uxl4=;
	b=gKpxAhtXEzWFs8LgECFny2VijeZLnmUFM7mmlcw2v90ymRMgSs1fZicMzx1cEok57hMvKk
	bHMybN8yDRUEW0RulnGNobHZsQESM3cyNJxdt9eNwNW99GnBGe5hP6czHDxkzM2jN17US/
	7NUfP/d+6l+JPKTIju0qi56cQKzwhIY=
X-MC-Unique: T9bDLC4vMrmbaFc3F_DJpQ-1
X-Mimecast-MFC-AGG-ID: T9bDLC4vMrmbaFc3F_DJpQ_1790961728
MIME-Version: 1.0
Subject: Re: [PATCH 17/28] hw/display: mark bochs, cirrus, qxl, VGA, ramfb
 as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-18-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-18-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166126.3025252.2006364005625327282.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=649;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=k9KrD0sN9JLFH9k9W9tr1Ywdw74on+tstjIdDpisM14=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCaBu8sx78wBWfS4O6GESt5JDegukF9FyFw
 xgJB0pJB3iJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5S6nD/9O1ZbDcqP53KzgX78tT16EGV8Wl3jc3tyrAR6T3SSz6snvMD9TrCYrKnJte0PUOKHpxLG
 DCvqNo5Mb78Mu6Vnu0AKjWybPlUqS9qN9TVE6jAPRjVW88ckgMZmC2z9qzMUvKQ07vzuws9jbjY
 3SxwHmqoNcBMwuHs+YIfxrGJmHFWka7cHV3T5e+hzwKe7yQ3rIYSWO9cxUfvrsRQb20sZ8DDEPf
 ZSwNHIhXJ5n+ke79kUgDPiHaA0bQCx7yKFw92uocfW91jEuPxRjOmvyLfJYG7eA6/bN/B5QLqUn
 aI2skgQAmgHYUSccJL7eP8OUwluKHthDp8KqRpDFeSW/YkMtUNnetBL1cQgP9oV75ijenD+C4Bc
 P+rqn7yIxda0AP28mzHKkTC1WUUoMpoWURSK4b5cqBTzLUsSQ80g4+G4lDTzjOwwG1lVaP6hXGf
 Kz4itDPLD0MJXYt+Rvmx2Arh6Oywbmmv7Sscnrf9iupuem/ROkI56N5P959za8nYtXBnMaDHaOx
 meYaXH5CMU7QF2BS5PMG1Q+wJHcjAYds8q9UaPb70tjJ1D25B8BFT1upPE3U9iTNAw2g0VLLrpR
 fKz+hy5+tstw8jTN4sFA5+i/W6mJZC85XsYIIiGS6lIWKv/4Zbn9/HBaVYqJjKrlFGnVFpwtWxQ
 vgWXYY94Dqa6dAA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 0hqrR3MwUAX-HkPnpKixWagmvSEvWXNl2lFCSbqqxuQ_1790961728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790961733-50ACCCFC-B6DC73C7/0/0
X-purgate-type: clean
X-purgate-size: 651

> Most of the display adapters are emulating old hardware which is not
> relevant to virtualization use cases.
> 
> The exceptions that should be considered secure are Cirrus (PCI, not
> ISA), Bochs, QXL, RAMFB, VGA (PCI, MMIO, not ISA) and VMWare VGA.

I don't think we should support all those display devices as security boundaries.

I would shorten the list to: bochs, ramfb, vga, and virtio-gpu* (excluding virgl & rutabaga). Anything else has been known to have various risks and is much higher complexity..

Gerd, based on your expertize, I think your opinion matters here.

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


