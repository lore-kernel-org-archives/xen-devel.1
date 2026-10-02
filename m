Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0484DCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439382.1657788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxf-0005Zo-Tj; Fri, 02 Oct 2026 17:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439382.1657788; Fri, 02 Oct 2026 17:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxf-0005Zd-Px; Fri, 02 Oct 2026 17:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1439382;
 Fri, 02 Oct 2026 17:22:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxe-0005Wc-Nd
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxe-00Dbhx-4T
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe803-2eae-0a2a0a5409dd-0a2a4501875e-48
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:17 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe848-5984-0a2a45010019-aa0a857c866f-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:17 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-tB0D-qP7One0EVL5uzWu0Q-1; Fri,
 02 Oct 2026 13:22:13 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 033DD1955DDC; Fri,  2 Oct 2026 17:22:12 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3792330000E4; Fri,  2 Oct 2026 17:22:10 +0000 (UTC)
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
	s=mimecast20190719; t=1790961736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odsg6seDL1A3x8nMCICjbWM1bqx8pH3GiORy5lEZxIs=;
	b=KbCBoJuXtSL2OWdINgYUef0c8GsOKvh+IloSEpz3SZqizah7rfnzkAHQhVqnuxhPWS04c+
	LqYZq4luw28Z+FCmN/8MqEG0kUVUxywPK64N5Kqv6MVYQBvy3Rf5eipfhJHMeYSy4KNrVP
	7b1tkcfYblCpL6qKzxEs27sONHdoceY=
X-MC-Unique: tB0D-qP7One0EVL5uzWu0Q-1
X-Mimecast-MFC-AGG-ID: tB0D-qP7One0EVL5uzWu0Q_1790961732
MIME-Version: 1.0
Subject: Re: [PATCH 18/28] hw/tpm: mark all TPM implementations as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-19-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-19-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166127.3025252.52837397415486624.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=311;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=5ib7kbnvMQLEGT4quBiHZZ2xblFgOBBV7yGe0Fw3Eh8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCa0cJy16Wm8FxYIqcRoer4PF17CoBL3y11
 1AUOS+zCLCJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5SmxD/9UFyXaFIeiqXGMM2zVmi7AkR5hpeBWSCU9yDDbATqMKXA3Ey7hKwxCx8t+KRLdwudNtxI
 o1ziuFYsn+WWmZwAU4gWuv12PiKjkGx401ZKI0DLyFTZU18MUCa+Y2xCEMcCcFLP9djc/KB2hSE
 ZIbUiUqzF5lPVBnmXzlbw9ktpxstl9ycinv5Kw/XWdlWMFJRuZVFQY68XQo5PBxYkwZQt60DnQ1
 XOsvz1xDFUBFu/DFqASYR6yq48vaSlatcqiUhowGgmY+/BO8enodwLO/wyXLz/p1f5lkEzcuSIW
 DBqFweDnbPqE9yUcykSiyS1UCvCBEVhuggqZjumDA2fFpH8qoorePuvUPVrsUMBHzmQhvwCP7lg
 53YiP1Z25rgudsIFFGAJI8wyLUu69bKO0ht88tyzcp+61+XDOYP8ooQUBQZ8MDKp09FP1Yb1CZB
 Bb1Yr74cG/YrRhBDRFhgP4vxjqig7E5o3zJIFGHRY+kZEfE3m3FUI1KodddfGrwPZGvjHR264PM
 eWX0Vx1J+m2Nma7ID9ZyPzoJvu9quUz3c65NkYnz/m+2sN0ryJUj/QAev/pveFbdmVA8HtQ4BTE
 eLM1VCaZkbZqNL0cLkjJOnyb8phNbf6Wjfa2nGu2mWEBgNMxTeDhHfsBK3OQxUZIlVqGMrwRcj9
 G+W6tP5K0QlWstQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: p9umoHIoYCCclHIxfj3BulkkKLkBp6xvWhcHIqVlzik_1790961732
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790961737-BD67C757-8A41CD69/0/0
X-purgate-type: clean
X-purgate-size: 313

On Fri, 11 Sep 2026 15:36:17 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> All of the TPM implementations are in scope of virtualization
> usage, so mark them all as secure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


