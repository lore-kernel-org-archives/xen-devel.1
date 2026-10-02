Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE0CA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439401.1657824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxv-0007Ii-4c; Fri, 02 Oct 2026 17:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439401.1657824; Fri, 02 Oct 2026 17:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxv-0007IU-0s; Fri, 02 Oct 2026 17:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1439401;
 Fri, 02 Oct 2026 17:22:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxt-0007Cx-QK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxt-004A3N-6v
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe859-bab6-0a2a0a5309dd-0a2a4504d576-0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:33 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe857-b57f-0a2a45040019-aa0a817c5991-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:32 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-LC704IdPMLqkiaegcC1f5g-1; Fri,
 02 Oct 2026 13:22:26 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 064DE1954121; Fri,  2 Oct 2026 17:22:25 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 39B3F1800351; Fri,  2 Oct 2026 17:22:23 +0000 (UTC)
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
	s=mimecast20190719; t=1790961751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fak4bGxidLKDm8+4zf2stLqtEk3iS7PCah1litKSQk0=;
	b=NIEXQDIb6GzYRl/xP13FzeyJ7vSJ9acMfC1v0IAsh4M3f3+vzmAtBsy4d73TIHVdqJlYVN
	769YqIIdazj0+HpPs9bb7uqGrVhQbvcRh8Be5YvBzDgk/A5PbOVCksK+AuuXmXPnYTEIWA
	b8s/qWRXgPwA95OGlLx9O1cvMFdHrV8=
X-MC-Unique: LC704IdPMLqkiaegcC1f5g-1
X-Mimecast-MFC-AGG-ID: LC704IdPMLqkiaegcC1f5g_1790961745
MIME-Version: 1.0
Subject: Re: [PATCH 22/28] hw/mem: mark nvdimm, pc-dimm & spapr-nvdimm
 devices as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-23-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-23-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166132.3025252.8374840789569151236.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=310;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=+hBolatsDZQIj/Z0rZnIsFgzxbSxAAfLtca3N0SKnL8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCTxVY/NfEOmxEI5DosbXgWeTaDwYFNy5pJ
 JpMRccDkcCJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5Y4RD/90mrXaHjotyW/NycDhxtaRk30LLlthREYNx5Jr1HC5CDTTPW+Z3mU4AXOB8MpD1nllw/a
 6HxtrcjZExMg4B47l/yLIV8kBUiPH3oCfVor07tirbl8CRQ4xVx9NMbArqYJX+/PE8wXp2ljdto
 xDn/uw/804gJhFQ5aBKHx5qOIVgYCXWCX5jqHRkp4crJIq+N75NB4eWQ9dDN1eKSUn0ElqrIR/S
 b9tVv+FNphFso+vxbZQdytykHGA/tu22KGueOTGHnxX9zqkfELsjsfxykF21dtGQGPCz0G0Xd4I
 5j9cOEfIzMUH5vDutkcLYT1WrsS2PSBlUIMl0yTbvYH/Z3zHHVsg0ozvyO32qHPdKBg96yl8cHD
 ia6b1RQhC5M0bJ/5l9tzmqlDp93m0st3160yd4LndN4eVOAlFxCAO7wyZJ+qOuH2cP+F3rtbyvo
 81qylevm4jxouDm29zISR6vj78IcU0krAmhgqaui2iEUIavvUcahORbN+brJ2qxuYNP7w4bA4rM
 64OIyI25+61AfDpXXvnckQ0+udHRSLmNPXQa4mTRSseJUI3Lq+uff3YDhtJ9K2gGEihB4v8FD2j
 gtWWpYgSDfmCWVDuGo2QsyCtMtaSzoVqJk3pK6KrRkSwDbtG2EEdMN3QX5mStbaZpL7dTmTL8SS
 K0NstiiLHtfkyHg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ETjgmQ49oXynxUmSDvvDwzuPtQcgnfs4mVOrmW6BLyU_1790961745
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790961753-53EC6B50-4288F360/0/0
X-purgate-type: clean
X-purgate-size: 312

On Fri, 11 Sep 2026 15:36:21 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These devices are used in virutalization scenarios to support memory
> hotplug and other uses cases.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


