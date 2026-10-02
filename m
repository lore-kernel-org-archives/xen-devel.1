Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6BCA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439336.1657698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwx-0000xF-Rr; Fri, 02 Oct 2026 17:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439336.1657698; Fri, 02 Oct 2026 17:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwx-0000x1-O2; Fri, 02 Oct 2026 17:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1439336;
 Fri, 02 Oct 2026 17:21:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgww-0000r8-Kb
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgww-006d54-1W
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe804-bab6-0a2a0a5309dd-0a2a4504dac6-42
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:34 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe81c-b57f-0a2a45040019-aa0a817cd86f-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:33 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-3tjG17T4MX2N__8DFzBoiQ-1; Fri,
 02 Oct 2026 13:21:29 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED7A919560B9; Fri,  2 Oct 2026 17:21:27 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D3031956086; Fri,  2 Oct 2026 17:21:26 +0000 (UTC)
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
	s=mimecast20190719; t=1790961692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoXXZDLvNvgKaFqa8YpP9dQLUt2vapGLok6gxunIT68=;
	b=Yz/TDqFIEfhHovOEkVradoNKy/YSBjSuFF/xI4GNlkZxQpZs9pEImN7TncWVz2+n7O5Ojl
	lJNuzHbLAXYrn/j2GSeLkYf5WGY6cutWF80Nbyj2CgCrrOSNukJhFAsAJRudLbMii5Uxyg
	RYDTkMFFuu3+Up1+QjTH0XziXi6ZYpA=
X-MC-Unique: 3tjG17T4MX2N__8DFzBoiQ-1
X-Mimecast-MFC-AGG-ID: 3tjG17T4MX2N__8DFzBoiQ_1790961688
MIME-Version: 1.0
Subject: Re: [PATCH 05/28] hw: mark all vhost devices a secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-6-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-6-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166113.3025252.10241920330836566113.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=36U2hwFalyBi2NiZOYsSioy4ZmS63nVhD5J9V8lUoug=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gB7tWh3txU4HBTMWIxNhGppWUHsWS45EzUN
 tUvdmqOz4CJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5SRKD/99P4YvNE9rpA4OcfaRex2f2wHKtECYpahgvxE9Pbxa/ag+IBOa63cJTnft2kdhu9JR51T
 nSTYsFlPBUK3dP3jU6UNr3T4bWIZaqXwzRqhGBxDxN4QqIBQzOgw6RauS7F6FaWBpezk/5nsIF5
 yKsrBd4zavLJVVJKf4MoFn+EvfWZS0wvTD1Y81s9azDWrbi/jB+Vy82ofVLSMXa6/Jmktsi7qyO
 GHUlYnJVq9PFr1iGD9MDfL+q6YwBNYtdbUkcRACeaoP7+y0ZcuTsP3Ye+FX5twjpoDPCBobzSDV
 8QK8xdsZA0n8D+8a4jcOu/mf5g7dHc15xpYKT6ncXiAGYVvveEsAjbTkV9K99iVYFqp7qOdUwvA
 1qen7dnFn2pTgmrXwHvMp4/LACNoQAGVeYRmjD1+rgDj8aHypR9GGkswCXrifEEFhJKcEovtQfU
 VdXd+9a3SCaeGmTHESrCBPeO4JEEXCaTrxENMS94ksUxf+6D4iBhHECK2eVWRD4wJv/U3NmlKtY
 0O3rO970BxTef4C+m6tAMEziyPiAeoE2BgMxJyeBHseZKjNYUcuJEhwqvco2/X0G9iBfpfjjHcP
 +CjLkIlsulVIQ5Yg09LPPSPMHaltomlpYAv+jIrI3w/iPmze51jcDHX/phR4MdnFv6biAUi2iPT
 PT1/NZ/4TddhPew==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: RUHGNbJXPXblFrDWYkL47JfOky1i_oF2fiE5rY2Q65w_1790961688
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790961693-C06DAB50-2DC6FE4C/0/0
X-purgate-type: clean
X-purgate-size: 311

On Fri, 11 Sep 2026 15:36:04 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


