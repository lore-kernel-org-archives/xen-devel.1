Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0C9CA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439371.1657762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxU-0004Im-Ay; Fri, 02 Oct 2026 17:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439371.1657762; Fri, 02 Oct 2026 17:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxU-0004IV-6G; Fri, 02 Oct 2026 17:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1439371;
 Fri, 02 Oct 2026 17:22:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxS-0004AR-2k
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxR-00D6hg-Fe
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe823-8faa-0a2a0a5109dd-0a2a450a9dfe-32
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:05 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe83c-f2d2-0a2a450a0019-aa0a817c8225-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:05 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-EaRmABzaMOWtSEBiUtjpPQ-1; Fri,
 02 Oct 2026 13:21:59 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3CD8C1955F11; Fri,  2 Oct 2026 17:21:58 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6CF991800351; Fri,  2 Oct 2026 17:21:57 +0000 (UTC)
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
	s=mimecast20190719; t=1790961723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/uj6QtTGbG8wlVOQwgZObmAkOhqUVZBsFUfwWSlAvg=;
	b=SFL2MLqZHAXbwmUwpW8J9Ru9W5QvgOq29iDq9UFlSHyUnc2+sUAJKQEfYt5x8EYfESo6EG
	AIsqPQu6F3KSlMI/bFq12xEe4ZEMKNHoNNQhL8zNVvfirTyorSBz6glivWOmeC65iHxY4/
	4vDw9g0DvdzKDP2nvfyq7aUqiYf8VgA=
X-MC-Unique: EaRmABzaMOWtSEBiUtjpPQ-1
X-Mimecast-MFC-AGG-ID: EaRmABzaMOWtSEBiUtjpPQ_1790961718
MIME-Version: 1.0
Subject: Re: [PATCH 14/28] hw/ide: mark ICH9 and ide-hd/ide-cd as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-15-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-15-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166122.3025252.10335557019299370237.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=374;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=kUpbm6Ni0vdDYzpLnvqSHByQqKV0BEAQE3Hpa670dzw=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCTW6VD+8g/Vv93u/oC4SiZb6u98W752kHJ
 He+BhxwBquJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5WLZD/9tGW+SDAa1j6P1JeoqOEPRqErAuWYA+JTAgh/zALUXnfIIV+ZPo3qA74IqW/ZtzqvyYZk
 3Qrtqg8uixnHJ+VSiT9CKt43uQNFMcr3XAcvU1FUvLNrP9pr6pzP899V2TnKj3U9sq1D/QnpIjg
 qohw7Hi9qQLefaxYXOIdRqfItSmiZsqFNFsHWE17P8qINAPkp1kwZ7kbxdMTS9pjQWFsb4v6Un8
 nSASS12yJlw3auSjTqs9S7MkqzBiTr20HnMHOi+lfD0j9wP5QX3SRo+LuDOskVJQOS8+aqYv+C2
 NtuqHZUW/dFH+QFoOv3oznkNC3n+UUXeHXYZGxEsEED3XuG0XHh6+rjYSRQ5KPPpK3l9dE+ralB
 vZ9Zji3fkGlpm+DdfvTF7bj7V3sKLdw6eyZPB0WZbJrgdV9CBXXB8+XN2wy77HzNPv19BjXzr70
 UzVEETkJhXuXYfh/waCY/xWN2gzlXIihfr+tbjNQ40rLwY/8ctc0WuRU8NZy4X9S9iaSbYz3ofs
 dworsje8jTh1IkB1bSKyFCS6Asq8pJxZj1rYx3l/UB4O+h8nB5j1cNI5nROjbzhLlHplvOsUytj
 2uvMZhuuusknc7eGPUKK/Kz3QYQy4Il1cvznzOLlHyGIYd56qOr5KX555Taqg6HYhRg8Mud83cN
 onjAFgUIMMJXwzA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: EReo8kCQU3KkrEdCc1Bsoq2ffW8JU-IPi3OEBOvFIdo_1790961718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790961725-520C1CFC-AB0A2176/0/0
X-purgate-type: clean
X-purgate-size: 376

On Fri, 11 Sep 2026 15:36:13 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These have a long history of usage in virtualization scenarios on
> x86, for OS which lack modern virtio drivers for storage, and thus
> must be considered secure.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


