Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B1CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439415.1657869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyA-0000pd-5Y; Fri, 02 Oct 2026 17:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439415.1657869; Fri, 02 Oct 2026 17:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyA-0000pJ-0T; Fri, 02 Oct 2026 17:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1439415;
 Fri, 02 Oct 2026 17:22:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgy8-0000ig-Nj
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgy8-00DbnD-4g
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe84e-2eae-0a2a0a5409dd-0a2a45039dc8-26
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:48 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe866-fae8-0a2a45030019-aa0a817c5715-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:47 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-PkVk7RhaOhCkLiKssukuCw-1; Fri,
 02 Oct 2026 13:22:42 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8969A1978387; Fri,  2 Oct 2026 17:22:41 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A4FAE1956042; Fri,  2 Oct 2026 17:22:40 +0000 (UTC)
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
	s=mimecast20190719; t=1790961766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Po2nSWSoSayh0ZmQrKbOsEezNV+hebfVDCbY0uFMRw=;
	b=M3nJqK+tQ0dow8gPCv2cnq+X4FE3kBzA8DNLAzLvPjd6+D3fK4LpwyQXuI+/5bJYdFoPYb
	Ism+pTOg23h77QA3mAY7sD5QqZZMVDDD6xiEhIdgJipHilei49hU2vdsuhPv/ZoMrM7VDO
	CEZs9idiXzUhyLUOVQwsQbMqq3UPQsQ=
X-MC-Unique: PkVk7RhaOhCkLiKssukuCw-1
X-Mimecast-MFC-AGG-ID: PkVk7RhaOhCkLiKssukuCw_1790961761
MIME-Version: 1.0
Subject: Re: [PATCH 27/28] hw/input: mark PS/2 and PC Keyboard devices as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-28-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-28-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166137.3025252.556263905170599031.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=302;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=tTtlzWMBLVL6WKPHRL13fizlkZpuTmnkOPP5LOIVXqw=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCCkdjQH4kX6PW5FdNo32FTnqzwmd0E2m+2
 jaQ7RkhhrqJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5VQgD/9rcFRVxD/6+8UOsDu9lz2b4VreQs5EVRH9m1SendqEq/V3fy0YFHVoQrPqiT3LSuH/xSz
 QP5u9BcFdttl/KHkw1dKNY0kAVVLtpmtlAOTDibUKSyEHzvqxPQA7vnE29Eeq9N0Q84REnObo6u
 V4fpp+b+D9/fY7gt1whCiWP1NBCrCmduex2TE/8FHZtQ8a5RY8ekxaQ1JillX/uyUdhNuUJwLTt
 Omhmpo3ftIuplNexoYcnxBKL1+ehp9VxdR3PlHGtkahCYZr2R91fWg7Ua00Ny+8b55aQLdU5vtd
 9NSMyp4rVBsi82YdTGq2NZuiav9r4g/OHnePW8dtTf0RuLVxt52rhdWMV8gXQ/8MPkFdErXK3XM
 mDgb8iQxRYx8UUXoOCwzEyuqJd0N+25HeOlEpW8VgVJy4RH+JV50sqobkqDZenwRu7nQhf4WvH6
 JPTig+2MFEEQkcnLLtem53bsLO8+fc0LeqWa8jJH3VWQKA6/IsVoq6jbjXHPZnoh6+pZ1NT9CJK
 MMneVAr+WiDHrYGv3BSGR4Vz/IMMYUxwVBlByHWKsn66ozOW0DQ6eiqpBnPx7BgMBopplIx70lV
 MsG1dPgu80yrUb33BkYtw2RXCmxhe65oNOBaqFx6oWpAiOQGoJUlS1AHGOlM9TMqodJlrraVgPV
 nFmtm6Z5xJhkkTg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 2p79VLAduhI3AC5GgRhIhGOseU6KZfe4RlVj4CHgl44_1790961761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790961767-774F44E9-E57A6F96/0/0
X-purgate-type: clean
X-purgate-size: 304

On Fri, 11 Sep 2026 15:36:26 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are part of the baseline x86 featureset so required for
> virtualization use cases.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


