Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B31CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439339.1657707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx2-0001MT-2y; Fri, 02 Oct 2026 17:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439339.1657707; Fri, 02 Oct 2026 17:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx1-0001MJ-Ua; Fri, 02 Oct 2026 17:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1439339;
 Fri, 02 Oct 2026 17:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgx0-0001Dr-1P
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgwz-006d9A-Ef
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe821-e002-0a2a0a5209dd-0a2a4504c23a-0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:37 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe81f-b57f-0a2a45040019-aa0a817cb82f-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:37 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-6sk8FPqCPEWpIN_3l9tEDQ-1; Fri,
 02 Oct 2026 13:21:32 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 70F1A197838F; Fri,  2 Oct 2026 17:21:31 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A3AFA1956086; Fri,  2 Oct 2026 17:21:30 +0000 (UTC)
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
	s=mimecast20190719; t=1790961695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DQzmbhzGyk0iOML82lQWr2IfcBKcOLgEId1IHR9dGqw=;
	b=KU/DD20dxXYKGoWZ/YS5G9bdThPGXW1KC2ID+nCzm7ga+L6wu2pxqNI05ro2cGA9MmM30e
	Tdb3jbmTlg8nuKzRppg7kT+HjSnX8MVjEm93CvzsQ6X3d8Dvy4pRblPZ/jjdOv7PX3ek2E
	1UJoUNtIhdGqLE1viuZbLhBfGMHrk40=
X-MC-Unique: 6sk8FPqCPEWpIN_3l9tEDQ-1
X-Mimecast-MFC-AGG-ID: 6sk8FPqCPEWpIN_3l9tEDQ_1790961691
MIME-Version: 1.0
Subject: Re: [PATCH 06/28] hw: mark all remaining virtio object types as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-7-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-7-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166114.3025252.16977253754744941880.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=sxCkKp/ZMUyqes3eitE1tZzksOwuJ5PON2jVXe0dusE=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBjW/Atw0+zWBXIkienYKY3LmqFlBm9Dx8y
 dyfJ48xnZuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5S9tD/sEWlPdG00zqA/z/61RRB3Sn1bjGpyDXIwPxKPbcvpU/kaWDhYR81SloAp2WBOiV0PYMmS
 xavQ10ku81T00U7EmG3WIZO3T1tBMxOFrpvhUE2fhWQ0pRmMreNX8/ujG4SQfs22Sk+UHXNBt/Z
 hMQgXljQ+GeMJ9L1NDKnw2a4uRtB08Mt2Q6tPztTvQQYh2/dqDiF9jVnmgYSBTTBENtQ2sFFWSO
 7MbQVI3zdMXPqy62Hg/h6X9U2Lt2zHSpO/TYy9EcEQB8bE8z8otFED4VljZkNHaNBeZ5sa8Xysd
 sTYPYvM5pLDlxVL8HmxUQqD6/eHm8AJ86K0iSZkc0y0BkGEHijkBNGkiRRT6bQFMRQTN1n7NEy8
 If7oWMNI3jfoTSFmsv8bfDWcLdZxKGp5Sd1RL8z6dSByd8/ljY36coZ/QdFEPvVK0nahj+Zglsk
 4gvdRXS1WTDw+fGXrhxfmG1btfoyDaAGcPDR2A9eNy29AYTbzfCor+sc3/uE43peUhqdxWlfL51
 gPlZ/OjNoEU99NhbeF2L5nP6mQPjFj7H055zgFfb+xxeyNIafKLXweW60MlOR/Lqe/fZJFE17DY
 VhwqhppvR2yv64Cd91I2St6IQ18UEZDAOhzWS6lmHigsMOoDVsm5w7PkxtHvd+H7Ga9lYUIscFz
 ULpbpv9yzMo80GA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 3gaZ4kG36vge-8wXDiME_a_oWCNs6WwXpo14ibzghKk_1790961691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790961697-C28C9B50-36D96DF0/0/0
X-purgate-type: clean
X-purgate-size: 311

On Fri, 11 Sep 2026 15:36:05 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


