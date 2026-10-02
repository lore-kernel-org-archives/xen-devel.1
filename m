Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86771CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439429.1657888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyK-0001yt-1e; Fri, 02 Oct 2026 17:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439429.1657888; Fri, 02 Oct 2026 17:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyJ-0001xc-PT; Fri, 02 Oct 2026 17:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1439429;
 Fri, 02 Oct 2026 17:22:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgyI-0001tX-JK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgyH-00GrM4-VD
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe85c-e002-0a2a0a5209dd-0a2a4505e088-18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:57 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe834-4cb1-0a2a45050019-aa0a817c8f7f-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:57 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-op3WwH2ZNA2u0Cg8MOEiXQ-1; Fri,
 02 Oct 2026 13:21:53 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA7FC1955EAB; Fri,  2 Oct 2026 17:21:51 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E63161956086; Fri,  2 Oct 2026 17:21:50 +0000 (UTC)
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
	s=mimecast20190719; t=1790961716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nIRzmOZNrJ9s+xcf4J8MYpSLOxpzXpuBIwo4NigH5A=;
	b=aY4Q5zgUAWGjJVQoU47vj49LXfxz43nlN8posKU86Ved9S1Rq5P8ux8IIM0wIinEdHx3FV
	A7WbgY3jGzzrkUml6o29cRDvFFm91WHIDDzW8nxMt1zj25yxa9okip6WvtVWZ0oQRLbOka
	EeEQqzrlYe/9RUHOfzJxpFsrlkrwmJo=
X-MC-Unique: op3WwH2ZNA2u0Cg8MOEiXQ-1
X-Mimecast-MFC-AGG-ID: op3WwH2ZNA2u0Cg8MOEiXQ_1790961711
MIME-Version: 1.0
Subject: Re: [PATCH 12/28] hw/scsi: mark spapr and vmware SCSI controllers
 as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-13-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-13-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166120.3025252.9810140897534239421.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=373;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=bJJ3aIFsZ99ktF+Pq5lKTPnYoOPh8mqQDX2p00a8g08=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBaL7aPZEvnSAKIzO8UKS9uB5CuA5E9XGSZ
 n9yRIT/2ciJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5eNOEACCc2b2xlEhPjvdMWpeR8ZDcVVNGeP2txruwI553hlMp1/aJMpBohXCClMaLrnmLEp8HNt
 bFnHLcWB52W1+OG7AqqEoUAD+yBvSPlsDKLx7sdqxjMPnYMzMRNKEHkUwJ5sF0X23HNOPYpu3Pb
 gRSRYuiNijD4rYRxBfx2yF5sohNNV4O60QJWOLtpiKRkmiHiazE/+7W+rHt2Jvde6EPYyYUb33s
 P9lADxG9ryRqiOcFYbBLNdRre2PQr9x+OT14+vMhkRMpLrQ4l6G/YX2+ZAqgrtJUqddlWlyFsRc
 INAw2MPGIusoQ409eyJWo8e1D45xhU7SVLDG1DcLeykobHsLcpb8VCyDwBgQ8DCzSUhY+mdypUz
 1A/oa/aovg+uSMOMNYFgviMxsh3QUaUJdfbzxC4TAyLlCzQxGNJcEHy6RXHnUTnaYil6yn9bGp5
 kXYA2CVnZLbKNNQxHMQXBr8nzkPG6xfBoPpkecsB3c6nhBvQHFsQ9+F8oBN9iYPbD+l8fpi9MYY
 dORMvi2PUJ/Wp0KiBgMvoBnle648wr5EGqONsULUjk2fbiZmcy0/+YZl69HXtUdvJnzFmBaHqtj
 /zrZQsoSKDbIevferN3SLV8bKDPXOjlFBF1SF6FDUz6iU+anGOKbRWs3Y9g3efVtoKiA803JDS1
 Ihl9jai5EMa1uoA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: c5aupW-PeKzvgtpsRwLkxboGPtJWWS3MK238aX7pOZE_1790961711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790961717-736BD2A1-04F022A4/13/0
X-purgate-type: bulk
X-purgate-size: 375

On Fri, 11 Sep 2026 15:36:11 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The spapr vscsi controller is used by default with spapr machines
> in a virtualization use case. The vmware SCSI controller supports
> a virtualization use case.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


