Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE4DCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439332.1657671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwq-0000AC-4e; Fri, 02 Oct 2026 17:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439332.1657671; Fri, 02 Oct 2026 17:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwq-0000A1-1A; Fri, 02 Oct 2026 17:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1439332;
 Fri, 02 Oct 2026 17:21:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgwo-00009B-UH
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgwo-006d13-BK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe7e7-e002-0a2a0a5209dd-0a2a450788fe-18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:26 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe815-b4ea-0a2a45070019-aa0a857cb57b-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:26 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-az_NJf-kOyu3aex70inJ2A-1; Fri,
 02 Oct 2026 13:21:19 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 402651806D3D; Fri,  2 Oct 2026 17:21:18 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6A1BC180049F; Fri,  2 Oct 2026 17:21:17 +0000 (UTC)
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
	s=mimecast20190719; t=1790961685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH+EjKBOvZNxaxHtrr0XaL3d72ADKzkKMiSpKNfR0uA=;
	b=OniEfsV61ynFSgAGsQeEIggieis39oA9y5UO5fbsuDGN98Lt1qSe0eaJF3xTbGG3GA/7hU
	ks0YOWIDgfNWWPmsZmuh8hyl2Vt8QCH40IBTJCXwMrHmGCJRd3OVzVF5IO/9c6DdrWXQbi
	f1fHZX0NoLTMxgdSI3oEVQGGRY+5Oj8=
X-MC-Unique: az_NJf-kOyu3aex70inJ2A-1
X-Mimecast-MFC-AGG-ID: az_NJf-kOyu3aex70inJ2A_1790961678
MIME-Version: 1.0
Subject: Re: [PATCH 02/28] accel: mark kvm and xen accelerators as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-3-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-3-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166110.3025252.11073058761964969846.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=525;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=yz+AxESUJKfoqLf9T6OMvfiNfNPqI2ffYywuPWoFITA=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBL/4DdV1bzfqvy1Lc0bKI3IgDZ3n1OxYVe
 PnKzvMU5pmJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5ST0EACA7qPlq4uLz4A2t+3VSo1TE1nKGiHl2ypJyBuBXQbagr4O1+xM8ICqd5gXhNYVfUK+NPu
 P4qqWqZRCXyDlpawmpOYFOPHBCB7xi4fC1A07wdZXmxSqoJq3X3RYgjUGzBUECqBXhqCCzcb0iH
 oXPHxHF8LFkQmzEfHkuIzHaGDO3mEQou2chNp3BzCxmu9aNxNS7CeaTjdEQqu/CGKBhHBqFvbBs
 bq2cJmj5eaPEeBJiO1KdMRBnZ+YvceJPKyzxcYR6wsG+PAeyO+VFfdLPNO9AtxTdgmHHKS2/spH
 h3kQyh3BPPGQjjGJoOfgTWlBY8v2ehj7ONk5dKnqb6xLprMYoQdadWVL1hZhGbp4xctsHlHU3ar
 ykhAslxBt0HDv32FzisCsNNrgHuWnoOSaGYhmzYo7cqDoIFtuWwnWghugfFRWPe2RE4NN8KR1jZ
 5+5/Tj7NvAeTdGypid/9pN9Zmsgahyvi21TJYVaUVkhsXf5RCliwYJ1ptLKYKvBuo8VUSR5w7Ag
 yvx2rfKlDXAx5NpfOhMfedwS9Cn6SCRzkS9bzeAraPlA7mt7jDLkxHd+DoRVkzVpHOOJ0d2PBSr
 56KQeH/2ltCikTn2GhfE/4fQCYd9qMcAjC3F+I7iUnxxjTCUVAGKMI2xd31P85YrE+iLwD40qZc
 BK7SswdL2a3g+PQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: lnbF-DEw_NfpVHk4bXV87DaqU62TMsURRMnpSagUcj4_1790961678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790961686-34CCFAE4-EFEC620C/0/0
X-purgate-type: clean
X-purgate-size: 527

On Fri, 11 Sep 2026 15:36:01 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> TCG is too complex to be considered to provide a security boundary
> for malicious guest workloads. QTest is only used for functional
> testing and thus is not relevant to mark secure.
> 
> KVM and Xen are servicing virtualization use cases which must
> provide security and actively maintained.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


