Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA2ECA5FE2
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439402.1657833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxw-0007YK-Ct; Fri, 02 Oct 2026 17:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439402.1657833; Fri, 02 Oct 2026 17:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxw-0007Y5-99; Fri, 02 Oct 2026 17:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1439402;
 Fri, 02 Oct 2026 17:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxu-0007Gv-No
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxu-00DbnD-4e
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe80f-2eae-0a2a0a5409dd-0a2a4506ad7c-46
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:34 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe859-195a-0a2a45060019-aa0a857cc925-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:34 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-S7z4tXkPNrmfa_jO6cqFpg-1; Fri,
 02 Oct 2026 13:22:29 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0EAAB1955EAB; Fri,  2 Oct 2026 17:22:28 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4375B180049F; Fri,  2 Oct 2026 17:22:26 +0000 (UTC)
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
	s=mimecast20190719; t=1790961752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOriw+LghHj9+vMG1cT3+MK/B4WqYAF6qOuDOKE7MfI=;
	b=aKoZJjEIGtjQU1m+WQA9slQ8ibTL7CUOcbxSRdilRVkgg0AM2ZEQvO8/Xscq9qmMI7mzzS
	8K8UYeDcLPudrp70ww6WbW+n9lZFKJEHs6DucS0BfPQkZqjKCouCEy4qwp6Nmz7kzRiom4
	wUiRGvS3EHDEXfvTjhvvnCaAPchn80Y=
X-MC-Unique: S7z4tXkPNrmfa_jO6cqFpg-1
X-Mimecast-MFC-AGG-ID: S7z4tXkPNrmfa_jO6cqFpg_1790961748
MIME-Version: 1.0
Subject: Re: [PATCH 23/28] hw/uefi: mark the EFI vars service as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-24-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-24-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166134.3025252.936615391375619409.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=293;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=M37xF/NbMOdOpLB4jOwsy1nFVdoOjkEEGL3m01AKXQM=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCiEK0jUwP3HNtqom6v+0KbBo/5lzpS2K3m
 G5wgXBxj7+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5f8dEACLQMHp121WvdYZRzZAYUqu/4KkuUD3HC9jtzTBEZgO+bBgV73vMY2KYCFE9Elvfdq508C
 NJt5HCLiXMvWtkUw6ZAjVr+nC9qNuWkgCYLsHNVHw6pIvSEKTH8RKcEouv7IRt2uEeN/A1pZChB
 TEPmNiYUEbf0VSYZclwdUZvfE91Bz3FuhjefZJjIgdPev3hkNyefq7PB6oD5GKLElm9gbsk0e78
 hdQ1Ye3C5sYMN9hDBT1QPmewH34x4+uRV8q/UTfzB4bJ1Tf9xWd2iRhKSaoxB4hXfocWtjxGGnw
 y+CqT9va0jaV2h8g3MYQETz5xQeUgmWCs9InMpHkzTQXW5XCjJZV2sz6w4ezQVrrrNJK9keUZdm
 NJ13a4PN2VQyen15XCiSs9aNtUaHuhmmtCp1ZZTllFeo1bfB5Vxwm5Ta0ws5iflDlJTkXmJ/Goz
 RT+qXnNYnEU4S2H4q0LMrcdO1jFq5eiBIOEjdaGHci47P/jpP6yZqTDsK4z8zlhvV1jljs695zS
 zaIlUoHOL9n+LZODwU+j6wXPceWZ8OIyExYzZafsoa6gK4rQ9dBe24N846ewMeBVaP8+vFJ2/PB
 rUEnroF+q1uqP34MpXhws02i6JcALcCNoF/FomRJgoyDFQOGLZwI7AhkDdnYCVZjU6WDzjpOwZ/
 SbTbn/tVwmvy4nw==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: iTOlOFcl1WAFyCKwA4VJBTZsD2GBv7wUDqAj6a7iHlc_1790961748
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790961754-FCE0677B-20AA946B/0/0
X-purgate-type: clean
X-purgate-size: 295

On Fri, 11 Sep 2026 15:36:22 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> This is used to persist EFI variables when NVRAM is not available
> or undesirable.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


