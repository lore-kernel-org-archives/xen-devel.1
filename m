Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F151BCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439440.1657906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyW-0003J9-ID; Fri, 02 Oct 2026 17:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439440.1657906; Fri, 02 Oct 2026 17:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyW-0003Hj-Bk; Fri, 02 Oct 2026 17:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1439440;
 Fri, 02 Oct 2026 17:23:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgyV-00037y-4x
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:23:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgyT-00D6mJ-G0
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:23:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe86a-8faa-0a2a0a5109dd-0a2a4508a864-4
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:23:09 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe840-f659-0a2a45080019-aa0a857c827d-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:09 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-8-lVaX_vJSOX6-g8URbd2QEA-1; Fri,
 02 Oct 2026 13:22:02 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 851721954B20; Fri,  2 Oct 2026 17:22:01 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A41B01800351; Fri,  2 Oct 2026 17:22:00 +0000 (UTC)
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
	s=mimecast20190719; t=1790961728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nTk5h441BlUCx/NZYxRViDuR1MPXYhtJViIj4n3aPc=;
	b=E8vhUd5fPa9P7pmD8DliruU77E2m4Ee8mdDri6zvrh91DTb3MXI/0UvYkCiz9ttoNjZpkH
	AHU08nL7AiBFaIPnsq8TI4KQxoqjNnMzcsraaxk9/X0Nmjn0VvlMVRU559ml/FMr6dvl7c
	xpAONUXoYNidfMvp1A5yqSLjhq27eVo=
X-MC-Unique: lVaX_vJSOX6-g8URbd2QEA-1
X-Mimecast-MFC-AGG-ID: lVaX_vJSOX6-g8URbd2QEA_1790961721
MIME-Version: 1.0
Subject: Re: [PATCH 15/28] hw: define most common PCI types as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-16-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-16-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166122.3025252.2345560702508398440.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=305;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=S5LgpxEbmDgv4nz2+w3MAekw+e8ZUjn4pTaaJOhl7I4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gClYQc6x9HdvVuTz3orxL5k19B0JWDKbBeO
 2UgDlZ3atSJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5QCGD/4v3MxlW9xcT2gilvuqgxjpT1DxHwa00sDRs5T+gRudU6o1ntWoLU1qAc7JZwaJ/aqChOd
 IKsduJD+1Yalyd+onaPKwClZFmIj9njmtkFoJwrqiK0G5YZJDw5Lru0MvY97a1t2EuSQMVZfjim
 z2F+s4CJm7MsgLBZV4Uvcv7ON+jwC3kLFiMH1rl89BmM/FmVWCPE175WC2mdtLoj5xq6bt3+FY3
 ZLEMvjIn0YLigHAmkKeWitG8N8SZuCCP8GK4EVxHTj3+b1sTbexIng7XhmDleJlUtMeHJf6gck2
 BrknT+6fYa9FNDyuoI5kOPwGONw3mbBxpLSTcFWBsAKyAJZyaVjVVAzIk4B6Amki3NFeFde8ZFl
 1bnaSYcMCZh7UAnNJDTvWTWWNJZkAJWG+uZVVoHI9YdB1hhkpI4qrz61UNvUy0vgvAz8BgIbSL2
 fUgE1s76avvtH6uGlnp+tK68m/7haS/kJsSrQNw/03rkPBLsTNEdBVBGX1oF4d2NOOX7eLRkRBT
 S4kLfXZ/jIK232Bg2hpMqUEWvIxPbemtrDq/ofdByqfw1RiUvhLLH5UKUHjJWgUU7UkbN7taxj3
 xYthEKHzY5c0A8E0thzpO8xoGF91S61FwW5b+VrOIDC9CycnIJWAuTzg8Ggx0/c70BXc7hzd34R
 1AGq6NK7FV7PPiQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: usW13rGZnBexJtBakL0IxxVgNWC17CyNbxfvVhMGDhE_1790961721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790961729-D6D4087B-9496FDFB/13/0
X-purgate-type: bulk
X-purgate-size: 307

> Essentially all PCI infrastructure is in scope for the virtualization
> use case, aside from the niche simba bridge.
> 

You should exclude the CXL bits though, as stated on cover letter.

Also questionable perhaps: xio3130, pcie_pci, pxb

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


