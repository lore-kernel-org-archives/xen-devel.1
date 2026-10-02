Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFADCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439358.1657746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxH-00036y-Ny; Fri, 02 Oct 2026 17:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439358.1657746; Fri, 02 Oct 2026 17:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxH-00036k-Im; Fri, 02 Oct 2026 17:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1439358;
 Fri, 02 Oct 2026 17:21:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxG-0002zS-Ld
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxG-005hbq-2T
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe82b-2eae-0a2a0a5409dd-0a2a45089242-2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:54 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe830-f659-0a2a45080019-aa0a817c9377-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:53 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-z4Du8iPnOfuwp-zbMAcwmQ-1; Fri,
 02 Oct 2026 13:21:49 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3F6211955E90; Fri,  2 Oct 2026 17:21:48 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7389E1800351; Fri,  2 Oct 2026 17:21:47 +0000 (UTC)
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
	s=mimecast20190719; t=1790961712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hue97jH25PL9Fu7HwzO2FuDAiS35DDowtfLLJwWj3E4=;
	b=cVU3FJlWcetouO4P7f8A8X7fZeB6chQL0Hhae63hGAKG1vlOy+UtsDJ07JRMsiOKhiSy1i
	ezpBB9xxc9W0ftjmY5AQ0+JYsc4v9r7EkMJY4U0Dj6+nUY2Ln0rnpA8KlD8i/OJYK3S96L
	9Vyyyvnttkd+sERVg56oFt1U+ClFbdM=
X-MC-Unique: z4Du8iPnOfuwp-zbMAcwmQ-1
X-Mimecast-MFC-AGG-ID: z4Du8iPnOfuwp-zbMAcwmQ_1790961708
MIME-Version: 1.0
Subject: Re: [PATCH 11/28] hw/watchdog: mark some watchdog devices as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-12-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-12-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166119.3025252.2496453573519063960.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=492;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=KNbJ1woWSzxxfZwd7GZw+aqcvsmuZGYhsDdISMTGzjI=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBvrET4+5dsYi7lFkC//cHNBhosHJu0lBRN
 ggAr3rPqauJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5UPFD/sH9PB9QicrrlwiihP8UOYHRt3rotgC4OeBD8agVZ/Tx5Bv3TEeH8R0sTWKWsdSpMvl9ZP
 y3p18Xwk0PXnMVCnQ91gD7Jf10O0m8R5RwHtWwaGalfpk/HIneYBEUPAHt1UKrtMZaixmMrvler
 tYU7qNeKNDlEv0G0y/gMt6/7g/gWtBz9O4QUtT7vyHy0lGSaI8FcFujlxsGdefqNTNh1kr4jiiy
 6SXRdbKcFdjbeZxGaJglhoBimunIpbXzc8vCj03r8GMNuKVRyEbCF9jCljJFvK6qWdgXKDopGoR
 JE6IHrDlwhY0ADqZPvphJsylKUiff9ZLflN19GYC9fAKgma32ADNeY8dKX/1t42OV1ZevIzajF/
 M0VL3YJWuvMKvXJwOlM6Rc489O64fXuANNgAlec/WFDz1jfEjZTbFGHuPpwpraEFqXZ5u90NORo
 M1nAYRpJtdK2pfU++QvAj6qNSkXjLZt4TLrkQN+qQXuT84krTr1TqrlqRC3Bsg7TD77Avy9d34n
 fYRpYDLlr4p3ngtqwK6JNrh4FcbSs99KDHwM2A7M+SdQYaW4XVBaa9g1rVfdf39/a298zFKpmh7
 ZQXh17l4KZ7SUCRfJoXSlDz7JIqYGpYW2B6mtOgbNUIREoHz6ertwswBq9hL4uvOZyi7Nat7Ls8
 6+c/7s2ywX8vPrA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: E89eLAe0hGV37I79P1L8wUdZ2Qh4pYTe7ZeHog1r1YA_1790961708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790961714-D554C87B-DF82359B/0/0
X-purgate-type: clean
X-purgate-size: 494

On Fri, 11 Sep 2026 15:36:10 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The ib700, i6300esb, gwdt, spapr and diag288 watchdog devices are marked
> as secure since they have traditionally been, or are intended to be,
> used in virtualization use cases on x86, arm, ppc and s390x architectures
> respectively. Other watchdogs are primarily for emulation.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


