Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8191CA5FE0
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439423.1657878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyC-0001Eh-GQ; Fri, 02 Oct 2026 17:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439423.1657878; Fri, 02 Oct 2026 17:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgyC-0001EU-C6; Fri, 02 Oct 2026 17:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1439423;
 Fri, 02 Oct 2026 17:22:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgyB-00019A-Qw
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgyB-00DbnD-7x
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe84e-2eae-0a2a0a5409dd-0a2a45039dc8-30
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:51 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe86a-fae8-0a2a45030019-aa0a857c9c13-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:51 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-pVw1YFsrN_m9NTnhgaUrkg-1; Fri,
 02 Oct 2026 13:22:46 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1F670195605C; Fri,  2 Oct 2026 17:22:45 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3C94030000E4; Fri,  2 Oct 2026 17:22:43 +0000 (UTC)
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
	s=mimecast20190719; t=1790961769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5LovObXsd+x7ixIR+7zkcVTunrEyBe7qrnijmlqipI=;
	b=GBYFGY0dq0tgXg53I4XiauuBIfvbEKVdgKXeHFZ4J+O0Oz81cnXVYrNVAP60/bGA+4DPce
	kHwiU0h1ic8EHG9B4szZ0XWa17CX7hXq64GgX7YwHVhNGFawFpx6dIaygqU1C6fqOwfbY/
	UWhOWnzkNChTc2/DSX+ledJY/nxWOJg=
X-MC-Unique: pVw1YFsrN_m9NTnhgaUrkg-1
X-Mimecast-MFC-AGG-ID: pVw1YFsrN_m9NTnhgaUrkg_1790961765
MIME-Version: 1.0
Subject: Re: [PATCH 28/28] hw/i386: mark vmmouse / vmport as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-29-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-29-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166138.3025252.12907499938719842280.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=286;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=gvK2RfkpNRKRYHzZLHhj68AoUv43xpfc5/CBZLJ5Ho4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gDJJv1uMI2ckvrQpbIefSwt02nXW6atmAJx
 MNeM2aZzbeJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAwAKCRDa6OEJdZac
 5cswEACebQq55wsDKd4ZCgpU86spmUmqDHyF+e5ksThpDW2qRAaFtDx4VkQvUwBigiFW7f8+7q7
 VM07EPYeSLS9zLpe6s9NYsaMuzvjr5dQ+agbd+gDFl4RXQPpFkA0BGxW3FHOSdRGnPczMBq6Bb0
 1padhlVaZl9iAqmg8uoBN3oNXaPzSneP/6j0pLr7me7jpqUgmHa2NVADBjnVdXtcvfASoxf3Qm0
 rBQULnJDG9wJ351JriC/eXQEtSVWtqvn6fqwoTWkAbZ8Kn5W3PbRNeZu3ujrWk2uxRYnLcI6WSn
 qgZi2JVHCKqU8b57reNcHUcO8J1lFUnn/RevdiVJdoQcxVp24XL00pdU8nYKdrIl1jjA3khNjye
 8Qz3AVfyOGoMEBPakdbbwPhJ2DxmcEEksJHGXKMN/CJzGGK479u0mjfffNEaHxA2nbJ/eedh744
 VMth4+3S0URK2X/kWwYNLuppfqMUwDIGQoPpOAns6vF6H+kTloLUlw0Y6E8eZk9a8TqkQbhuBZ2
 BuFxeDYhiFk0VTjIrWhMVwKo7Rp8rmKqB17ZV6Bbwx7ZN5H98qbEbYAf7alz8vl6Qmm66bwH5bV
 W1qDmRmckVynolgpLyckiIct9PgBFsbalh83pXucf2j0a9WsO1h+K/Vik3UlR9mnvEBpONkjxdD
 b2oUoBDj1Q0RWSg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: xSsekcDceSYWHZv_uDjC5yqGvoQ-v_Fu3z02FCXuCaM_1790961765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790961771-6D8D54E9-CB7FD559/0/0
X-purgate-type: clean
X-purgate-size: 288

On Fri, 11 Sep 2026 15:36:27 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These paravirtualized devices are relevant to virtualization
> use cases.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


