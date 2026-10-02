Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E68CA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439377.1657770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxa-0004r1-HS; Fri, 02 Oct 2026 17:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439377.1657770; Fri, 02 Oct 2026 17:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxa-0004qn-Dy; Fri, 02 Oct 2026 17:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1439377;
 Fri, 02 Oct 2026 17:22:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxZ-0004oc-CN
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxY-006dFI-Ph
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe831-e002-0a2a0a5209dd-0a2a450bbab2-24
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:12 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe843-b7e8-0a2a450b0019-aa0a817ce6ef-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:12 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-3fHADws5NEKkG64FdeYlCw-1; Fri,
 02 Oct 2026 13:22:06 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DFB711955BC6; Fri,  2 Oct 2026 17:22:04 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1FAB81956086; Fri,  2 Oct 2026 17:22:03 +0000 (UTC)
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
	bh=57WwPXiri8ItGsFv7myBZwLi/3rudhXRfRGMr5PeG68=;
	b=FEaSZt20r4ZilZK/5r3U4CPUHOpbtjzRw8vqSWdhgjkq5GtNrPJ7dXVAjwT9rMOgNA92ui
	ozFDbcVo0VQzm0Sa1IGfk6I/Yqh2q7jck3AH1rcUDwRXFKJL3VTtYZP0l6SHe23is8sa/M
	bOYw/IOxfTlyP+85Q2QzLLxcLVHF1d8=
X-MC-Unique: 3fHADws5NEKkG64FdeYlCw-1
X-Mimecast-MFC-AGG-ID: 3fHADws5NEKkG64FdeYlCw_1790961725
MIME-Version: 1.0
Subject: Re: [PATCH 16/28] hw/pci-host: mark common x86, ppc, arm and s390
 PCI hosts as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-17-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-17-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166125.3025252.6382515951011639582.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=434;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=a6PS2bf06cWqaNRA9LviE1UK4mmPhD6vsHBc0nvPGR8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gC2lhKiGV5+4pem5Y08Jr42+7fML77Zq8ZY
 D+UpTlNwgeJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5TFOD/4r782ffdw/HJtRv2KNyjAQEKod4DsYtlXrtjK2X24h+3XLRvAP0USENWkPc95obEsvg0D
 Lz5cw7OBRfkJVrjU22t7tRXUqCwN826lTe0GpYPPoohID/MZqyJVzgAd/C/+SN0EGLQRGbq/nZ+
 v20D8swUtXr6LOhzBxNfD+6HyeiElB2xbSLsEXlaWDKV0x0RFtY6lcPgbVAuzyERTN+luacFywS
 wNT6higrjGwTaz9ay9xh/dnvaga7aL66mRkK1XKSQeG85XXuT6aI67Qy/b3JIqeLvsCEIyA1s/u
 8Yclm0DBI3dBtmzxOulYMS6xkDuGke3fDBOEL+fNyyTW9OzoEJRXOCMuml4dab7/7kNi6uGvdDI
 /C4oy0387rRrOY7IU/LdlKhXmbJKfXQul4NpPgs55fyB/26WpbCZIPEDQtmpV+ixw2VslXROqS5
 RF/479K4hsxLe2IcjutMY9xCbWePyFK8kShyDI/gOsNUFNh614mHdO0LtG0Ed0XUSEV4ZJJy9gw
 n0FeVjlLa/wNZW/mwGTXgWgvitFWepS2RYs3SrV9jJZBzzK+LSJOIh/soeo62h/y9WL9D/DgRNF
 mZQ/Kp7jfQMEjFWxSSrmqcotEq0Gq+9J/ZYivJ9m2h+hK7fafg6aoKgnHp0HSno6BnOfQYNWAfn
 CT65tKa/jeamHiQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: kDnN5pRKJtS5JywXrHlb8q83KNZR5qG0kbRmTyc6RUE_1790961725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790961732-2C39B9EA-C275E4CF/0/0
X-purgate-type: clean
X-purgate-size: 436

On Fri, 11 Sep 2026 15:36:15 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> Mark the PCI hosts secure if they are used from machine types
> that are considered for the virtualization use case.
> 
> There is also a special case for the 'remote' type and the
> Xen passthrough type.
> 
> 
> [...]

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


