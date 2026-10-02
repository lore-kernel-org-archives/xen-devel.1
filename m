Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603CCA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439390.1657806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxm-0006KD-Dp; Fri, 02 Oct 2026 17:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439390.1657806; Fri, 02 Oct 2026 17:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxm-0006K2-9h; Fri, 02 Oct 2026 17:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1439390;
 Fri, 02 Oct 2026 17:22:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxl-0006FQ-72
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxk-00DbnD-Ia
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe80f-2eae-0a2a0a5409dd-0a2a4506ad7c-34
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:24 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe84f-195a-0a2a45060019-aa0a817cc067-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:24 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-st-InwMuM0WT_i0imwlKng-1; Fri,
 02 Oct 2026 13:22:19 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7C9CD1801319; Fri,  2 Oct 2026 17:22:18 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B1FC918002B6; Fri,  2 Oct 2026 17:22:17 +0000 (UTC)
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
	s=mimecast20190719; t=1790961743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkbZwo6BKqdN9FyfW6CZ9LI53lQSA5aNUof+lObrH1I=;
	b=HtIaOyP+8AEpBlHVkrfKSp+Z+eHmzZKB7I4m+7EOVkGdIy3v1RRV6cYD/zv9IlrBsV1dUZ
	bPHerd87zYb4/D4A2r/zPq1LLOzMezD8HrFLuJoDyhlkW6SN69oeB3xLqwcPPt6cZdFI0C
	t+YUGlU8y6iFITSkr64aIj9seqqIFkU=
X-MC-Unique: st-InwMuM0WT_i0imwlKng-1
X-Mimecast-MFC-AGG-ID: st-InwMuM0WT_i0imwlKng_1790961738
MIME-Version: 1.0
Subject: Re: [PATCH 20/28] hw/audio: mark Intel HDA devices & codecs as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-21-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-21-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166130.3025252.17906816628479360291.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=315;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=4AJECLAYQLdgX3cfz3V5wucj9qzYfJl063dVaeFkVRg=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCihf7o+jVJw4FOs+7k77hi3gXkxkUTPCXj
 nqZ2JbIdGuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5cA/D/4o6z31dUWgzSCY1uFrrInvlur+c4OhgQSpNVWKjQ/+LHxJlxKP7WybTbfxkJzGw3dxsbB
 bKNpOwhxbFYZ3pN+b6h7cv2FwPU+qzvdt95KLO5mVJ94o+uorUU8S14ZMEi4qTdfkXkoHjcK/p2
 X55+ybKj6uM8zYcJEq89UBwe9RkQQwXKOgsr8B48NlsUJXk0r4cmXAJB+ha/tqaJ3lxgqI/pJ0Z
 +BM2oxbTynSDvXmzjN8ndgWT9BWymmKU8WeGrxHpMqq4yv1Q8cCXrXmBDc4Z+8w9hYNkuHF0sYL
 UOVJC5YvyNqVVCWJ9MRhBwlADOGaSsuc+kqf+y/k5vAaomuLTk3ZYncpT3hjy4Php2fnHTkDzuW
 eSlIa+01PeOb6QamgbzySbtl8ygkuajhqtVoPjuKYzuzsjEdAp/yp1jGzwiX3EMdtzZDmgyJCpz
 DtLg8WCgG/C7qrJ4LVn6HclCCCL/FihCyp/h8TT7+L4uPnJTkAhjgBZAtzRvE2rnSMDcB1OHMaD
 nJcL1U9UqsJMSa5nLgU41BGQ5klET3e4CjOHzms07F6q8N5b1+zLAM1v3gx5vI+L4rtE5KQOsKs
 KrDwRFhS/NmHiZTRYCbBFZfrM9vc0HUsq2tEKTqSneIHsoybi2SF302bMW06Pr9iMV1MV7axrQQ
 aLxlCMZEl61+5OQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: IKXCHJ5vCqgZ3d8Ose5FC_4gzRMgrz3bB0igjPacq-A_1790961738
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790961744-FE07177B-6962630A/0/0
X-purgate-type: clean
X-purgate-size: 317

On Fri, 11 Sep 2026 15:36:19 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> This is traditionally the primary audio backend for x86 as
> virtio-snd is a relatively new invention.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


