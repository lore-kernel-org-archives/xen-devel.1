Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63BDCA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439434.1657896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyN-0002R6-7F; Fri, 02 Oct 2026 17:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439434.1657896; Fri, 02 Oct 2026 17:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyN-0002Qr-3B; Fri, 02 Oct 2026 17:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1439434;
 Fri, 02 Oct 2026 17:23:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgyL-0002Fj-GD
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:23:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgyK-00Dbr6-SA
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:23:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe839-2eae-0a2a0a5409dd-0a2a4507a19a-44
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:23:00 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe837-b4ea-0a2a45070019-aa0a857cd583-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:00 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-usuXcry6OqG5LrfvNwEreQ-1; Fri,
 02 Oct 2026 13:21:56 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BAAE61954208; Fri,  2 Oct 2026 17:21:54 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EE7B61800576; Fri,  2 Oct 2026 17:21:53 +0000 (UTC)
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
	s=mimecast20190719; t=1790961719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TH6G+K8UPoFw1AoYcty2EfdD2DLwTEBKK+pZWhxRZRE=;
	b=hG1FsY714rn06nt901CwfqqwDr8X2GLkFyzU2o0J9p8UjdtuDFQh7B10Bui5VxWKPhu6T7
	90wNfQ3KeqRysDNC16RnpE2n9TE0oFqJBRFG5zPEYQastRZ82up+ciNElAnUBqmLiJO88N
	6P3pjMQOCMDmjLmBo9RRZy10co8tJj8=
X-MC-Unique: usuXcry6OqG5LrfvNwEreQ-1
X-Mimecast-MFC-AGG-ID: usuXcry6OqG5LrfvNwEreQ_1790961714
MIME-Version: 1.0
Subject: Re: [PATCH 13/28] hw/scsi: mark SCSI disk endpoint devices as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-14-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-14-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166121.3025252.17283916103111838508.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=342;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=CBX3rJrWsHrUC9wTg2DbZ/CA+ASB943BIbzUVX09LbQ=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBuhkKlfH72B/SBYDXFmLPxwtygBpo9Lp8x
 a23S+v1kx+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5aiFD/9o8bxclc+ql+a6Jus10ffIHZXap/Zoa9f183f4V9hoGTlZJjVdDGZ3Hc7jUvdbqCQGd8+
 OtjHct1b3YGygsV+1Uc6d1G/eStSR5tM0Uh8Rsz7S3Z2pUXh7JBW5NPC4Ulks35vSrLT2TGBgnL
 xuESHM0d54klNY5ELuVU/Hmf6k33Qs7LIFppMnuIudLgJ5sfw4QBo5kuwluilflTkFeGkQ7vUuo
 y4XRCWZ9yo+VMG8BOt2tCS2zPkukOegIJPtghaQpiAZDxG0FfwseBd7Cd5lPoie0r0MXPk1DkHN
 3dMmbhYWzrhfzXzcJ5T15KNHGu1OIAU47dVoZI6QTbaOIscmhCTfTagwfk5Mhy2I4BYRvnYbD0I
 hZtYmb9CHUjzCHa9Is3fB/U0SAuWJqTvSazgRKsLB+VKlLPF1CoUzG2JNZ4x/atL41awtFg9KZ4
 nJJRp/BRUyCRoEBlCNnn0ysqm3MT8y+BkvWt9NK7OhLe3z6tvDwsCQ4GjBOn54kYhg1xRyrkY1R
 dWnt0VXTEbnKmPTbgPTQ8AFeJCQD+8YHfj2O/vl2IA7vGy/AhGAps9ZKtVOvv8PnN5Ym/K8S1CA
 CbIyDDWwTPccn/Cyr5vwabNSsWH0vGQ6p8QZFvJSH7LSvI3B6n/ZiEQF8Qo1eeooHwoyL+44hMj
 ckojHEWQalXWF8g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: kkA3mVVIxoKWD9hdyLhNo-CRDrruKXoc0PgRSwEkJSo_1790961714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790961720-A5AC0AE4-F6F8B93D/13/0
X-purgate-type: bulk
X-purgate-size: 344

On Fri, 11 Sep 2026 15:36:12 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> All these devices can be used together with supported SCSI controllers
> in a virtualization use case, so must be treated as secure.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


