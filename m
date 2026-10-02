Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F0CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439405.1657847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy1-00083b-7u; Fri, 02 Oct 2026 17:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439405.1657847; Fri, 02 Oct 2026 17:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy1-00082a-16; Fri, 02 Oct 2026 17:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1439405;
 Fri, 02 Oct 2026 17:22:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgy0-0007xh-2r
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxz-00D6mJ-Fs
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe84c-8faa-0a2a0a5109dd-0a2a4501bb9a-16
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:39 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe85e-5984-0a2a45010019-aa0a857cd671-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:39 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-p1TWn7s_PYW4Ecdwm5PBsw-1; Fri,
 02 Oct 2026 13:22:33 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8A0511933B54; Fri,  2 Oct 2026 17:22:31 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F4E930000E4; Fri,  2 Oct 2026 17:22:30 +0000 (UTC)
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
	s=mimecast20190719; t=1790961758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEhqnm3EOmM9eVr8GLVonlTQqlbVQbBXp3m1BlQx9GY=;
	b=aZ8xaEQYrEFSpZohm2ObDIiMN4HpUNLOf2w1l3dlVUqZLsZs072dDqbpAGEABqe+vTOIbB
	54UxBKYSAhcn/lvj5LXjBTyWGHO+C7xWZkBg2pC8MDZ1PrKdN2DZHOE45JpOPZtk1eOrSO
	+FSQ2RqxeFd3a3rUkSvHT2VIQnvDl/4=
X-MC-Unique: p1TWn7s_PYW4Ecdwm5PBsw-1
X-Mimecast-MFC-AGG-ID: p1TWn7s_PYW4Ecdwm5PBsw_1790961751
MIME-Version: 1.0
Subject: Re: [PATCH 24/28] hw/acpi: mark erst, vmclock and vmgenid devices
 as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-25-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-25-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166135.3025252.5276440234709859311.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=311;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=Fc4JGWriNlh1aGVhw+L3RaNahMSkAov3VpkIEc3qsrs=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCFZNQTLJcghDdZduMRhYInrKRZN96owzBZ
 NuUAnHSWY+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5RzhD/9IzWE0cq3SuUd3EvzJ9eyA4wNfZNMJWR3MfNxrIVYKPWMzF3n5Ozxwp7as/uktUWP7keG
 27P6I3tMsqrwpKUqAyq8CUsLW6XpA3bmM8Psp6KqQuiarvkJsYwwF5P7lC3I6SUlLvQql97plz4
 pQYiSAVmOUbewFfE0CfSkUCBwSJ0zN4qDliK+Uh0DIBs37h3zk4Sylpi2vFHo/MTrARoRyvoUT2
 NFyqRHrua1vj8NEaJtm8c4TLSUjDmFmcFuQ7aylb/0y/qz+VLIiYjzXiQ0dqESzSEj9ppZBG+XP
 8QjRjm3JNpKLhB8T4Aya+tNsqp7nhSvBbEAFKPh2n5iRAFYDKxWWEQTPV9BhbSjJ0UmXvILoVer
 fP2ML12qnHwidx9UELRuyMyIYVBabAVK5yvs5e9BcYjDlLTw0WY6rCoynLw6gJjck/7/nJB9Apn
 Dqfftm/va4YSeTAgiZlteU4D+u6Hg+Z3+0BAvSP18gRKHUhQijkpDBSh/zTc+OR3+mC27ltQHV5
 F9hhTzu0MzGpnJ45tkqI6vzH9O322zY6uSoMM+7kI5Z9R8ISBolwOC3q/fa/OZl38TKe+qtFkVp
 qwSBKQ8TWddFtAhUuwcgwb1eFI+wU48t79BwshaZMo+AfGPlrcFJ9xIFpiWUsynnnK7w2o6lFfL
 o2HeHPy3X+P8Icg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: wnJxtcdxtnxzJVM8MyaSSsgBL8MIdBv7i4bHxjhfqAs_1790961751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790961759-1E465757-532F5F9E/0/0
X-purgate-type: clean
X-purgate-size: 313

On Fri, 11 Sep 2026 15:36:23 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all used in virtualization scenarios so must be
> declare to provide a security boundary

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


