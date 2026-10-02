Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E45CA5FE0
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439335.1657690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwv-0000fs-Ky; Fri, 02 Oct 2026 17:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439335.1657690; Fri, 02 Oct 2026 17:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwv-0000fd-Ff; Fri, 02 Oct 2026 17:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1439335;
 Fri, 02 Oct 2026 17:21:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgwt-0000dO-M9
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgwt-00D6da-34
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe7f6-8faa-0a2a0a5109dd-0a2a450aecbe-42
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:30 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe819-f2d2-0a2a450a0019-aa0a817c9ecf-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:30 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-fWtsDnO_NtCHrdxiJGM9zQ-1; Fri,
 02 Oct 2026 13:21:26 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CF881180214A; Fri,  2 Oct 2026 17:21:24 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0EBE730000E4; Fri,  2 Oct 2026 17:21:23 +0000 (UTC)
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
	s=mimecast20190719; t=1790961689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9atV6F91Np3AJSP8EvR9BlLmhXqze/BVTWs/nALyZU=;
	b=c4gMq0K68zqPsWljQdnSONnrhN4yII1eqRzEDJeQE9sgN9CZ1LBhPWJXFccfnl1YqfaNWy
	lOBeiXdc9KLgrlXo04RJOmrMPF8uQ4i0HoRGTycqIfwwrdM2mOPKY4i186EXt3Yws66Xoq
	MnVwBnMPuLVw69BS3Z0HlJn2RFerL3s=
X-MC-Unique: fWtsDnO_NtCHrdxiJGM9zQ-1
X-Mimecast-MFC-AGG-ID: fWtsDnO_NtCHrdxiJGM9zQ_1790961685
MIME-Version: 1.0
Subject: Re: [PATCH 04/28] hw: mark all virtio CCW devices as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-5-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-5-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166111.3025252.12203965466791871761.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=PSekII06o7zCWPWy2CIE3EZ+vXhRl/0UxFggYHWlhX4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gB2ziSadzcbnREqwHWphh15NhfRLxCk9+vE
 SuLWNZ0Mf6JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5Ve0EACSyl/3CG+IloIAgLWy3FSQZfjdogFSHHxqk8man2cyhdeL096tEALwnJzEnLKE5qo3Kbs
 zPuaLS3sr7Y/T7ucAtlrcy9a4wBH8NIUQvCx/Hb+MeO8dfUMkmcGNHPkiULa0oPpZH5OcrQ9TB2
 7PkzrFpE1aaR0fyMPVxHkjuRZMi3OOAOegVRWUYhxXSLN4/HuIxb3s5A9qcv3fHKMaYmJJzhKfb
 BbGt66SR9vP15051I0Jli+FVqrqdC6BC/ikUvdVWWHDg7rXcsYm6P5UeiKn0vfoHYyTIEZDlhOz
 gF87qL2Bg1V2xkWIaQL5fPgH+qS+k+WPrN5MKA2JbUQrQ0WKF96DpjBDm1Vnf3TsJ920a3hKqM1
 28wsvdlc7HCCtpU1Vyy6TFQ3o8jGdYpv6fWX7CuJeh8AkyN658Nk7qvhaJpxPw8j4+DSgX/OxGO
 qhFj5usmW3RnsRl/wire5q7CUpb7EQh+ZOWvEMAooWGoZeAc10WddMrI6yKH6J6tQPvUvagYR3Y
 cV46JF9vWI6eC17Hxl5EjlusaiIOHPYhrA7nW7mPjfWeZ2Rz8/ZjYJzM4BDTRets7skDfN5fjQN
 RjPTmxeF1jexsrBb26XNA1rnR8SjXOTM9rzMk9oRicwRbuXQLMLbjN8VzWtrJHa4c/xo4nHSxaA
 xMDuq2tMdOy6tfQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: zmuRWTYL2VI51iJvNcL9PcT4p5WDTNId-zzIoq5Raio_1790961685
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790961690-50CCBCFC-89BA5502/0/0
X-purgate-type: clean
X-purgate-size: 311

On Fri, 11 Sep 2026 15:36:03 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


