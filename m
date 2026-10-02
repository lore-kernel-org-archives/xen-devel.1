Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE87ACA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439342.1657716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx4-0001fW-HA; Fri, 02 Oct 2026 17:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439342.1657716; Fri, 02 Oct 2026 17:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx4-0001fO-Cr; Fri, 02 Oct 2026 17:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1439342;
 Fri, 02 Oct 2026 17:21:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgx3-0001bB-AQ
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgx2-005hbq-NT
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe803-2eae-0a2a0a5409dd-0a2a4501875e-22
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:40 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe823-5984-0a2a45010019-aa0a857ca1bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:40 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-c9FSi01UO8OHIvlJX4rXGw-1; Fri,
 02 Oct 2026 13:21:36 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C47871806D3D; Fri,  2 Oct 2026 17:21:34 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DE74E180056E; Fri,  2 Oct 2026 17:21:33 +0000 (UTC)
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
	s=mimecast20190719; t=1790961699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKANUuPqXGdyJ1zgQ9RAlHchse6y4uMbZE/AFJwSoN0=;
	b=jWeTdBeP9xyZNP8+SDvGe+ZkTpfcCyXTOL+fZ3SwE0lKzscTzFbREOKjLbm4JmGbo6OfyI
	dhqyw+90WXGojq4kWDqjQDQKjGZvvVKlR3oQOlO0PXmiwl84odDzTmq9qk06tJXrtxeP1t
	CXFFSq4fpmoUyLTblDXGPqg+R+8GR1w=
X-MC-Unique: c9FSi01UO8OHIvlJX4rXGw-1
X-Mimecast-MFC-AGG-ID: c9FSi01UO8OHIvlJX4rXGw_1790961694
MIME-Version: 1.0
Subject: Re: [PATCH 07/28] hw/vfio: mark all VFIO object classes as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-8-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-8-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166115.3025252.14588124024101266556.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=362;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=F52lk1x+TAHOSo9Af3NnIftRKijvVx1MgwN5APgv7h8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBTrvDpLkiA+l6PqvvMZvyr1QT25Ecvxflc
 3hAoLc93A2JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5Z1SEACY83RJqp+DMc6RoQSvuqwl1D94oUskXQZsLAuoDF/VCxS2hLN7Y0m3b1V2F8ada7Zk2gd
 czQwpvGFz3kCAUdr32GT7LktXmDRIwYuh92KdMUxdgd4G2mBRuaVAHGkw/xbwJyk461eFd7Df0t
 WnxbPJmkoTTnE4TbF2In3/rWYGfge1YoTo4NFfcQ+yLD4Crtlj4/O9QAwGdaJwqzzrskFGMRW2g
 riY1YEYm/1xFJ5Fzav1WIfGd5kzR4EfbrzVGBBRMS7Y9evvohGgaptm+shqPeQibnA13/4jPIdV
 6pNpioOWX86xir7RI6dpNXob9Ejq7UMegoz48DWRYllZt4nMVUA/PTgCT60ZseZ7rcBYkY8wTpT
 4BXPSbHkl6XrgMVlEOAWUWDzydzs9wrwO3A25y5vScjlhpCDoS5/DT1gNVKq6On6EDd5UACkfnx
 7jLUAYtIgw1gtuqUGeXxplI6pt6slh56J3dOWVf7qy2376USQII8Nn1aFBNIfz8cmbnrLa9jwUa
 YPgUvybZLiUnQbqV0BUWeSQM4ruP4XVQLn7rXOts1/bEDkNQSn5ruu9aofpPJs5w/70Momw6cfK
 6ce6hJyoQ4eWV0P6RRLVEyOTBvKN+IXKuq0shkosKtsWW+X6VeDReYEifA1oxiqRuQRICGstVGC
 wjHpvCrPaMu6wlA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 57buNmmLhxqbei48E-wx35-fz4_5zsjuGaDyDPZn05s_1790961694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790961700-BCF47757-755E5E23/0/0
X-purgate-type: clean
X-purgate-size: 364

On Fri, 11 Sep 2026 15:36:06 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The VFIO subsystem is about securely passing host PCI devices
> to a guest, so all the classes should be presumed to be offering
> a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


