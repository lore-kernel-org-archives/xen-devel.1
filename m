Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE23DCA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439408.1657860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy3-00006r-I3; Fri, 02 Oct 2026 17:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439408.1657860; Fri, 02 Oct 2026 17:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy3-00006D-ED; Fri, 02 Oct 2026 17:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1439408;
 Fri, 02 Oct 2026 17:22:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgy2-0008Rm-Ly
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgy2-00D6mJ-2j
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe832-8faa-0a2a0a5109dd-0a2a45028480-42
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:42 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe860-6ca4-0a2a45020019-aa0a857c56a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:41 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-9QrLD9LIMqGfKHUCbjL-1g-1; Fri,
 02 Oct 2026 13:22:39 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 38F7C1954121; Fri,  2 Oct 2026 17:22:38 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6CE321800351; Fri,  2 Oct 2026 17:22:37 +0000 (UTC)
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
	s=mimecast20190719; t=1790961760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGXglyin6o1YnCJq2kD2rscpcytOiPmgHEZgX3OWp/4=;
	b=HZ4OupWgokjmbCdyFGk9OioA0o5vmm+zKE58I0gWzSo8AM3tJYsgNpfnFymtWUfRt8eNfc
	LSbV5U7NN/seQapKtX4CVpFGJLXMpS/EIa67j2a7ZFfUZ33FQxiMMamhnKl96DtXojOPNN
	A11US86qg4jqZFQjcIWNpMZ7576+Q1M=
X-MC-Unique: 9QrLD9LIMqGfKHUCbjL-1g-1
X-Mimecast-MFC-AGG-ID: 9QrLD9LIMqGfKHUCbjL-1g_1790961758
MIME-Version: 1.0
Subject: Re: [PATCH 26/28] hw: device AMD, Intel and ARM IOMMUs as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-27-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-27-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166136.3025252.292036806890302152.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=336;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=2w47OdY8X64cy6/RH7KGYjLAQjIW5+wbMAeD8NQNfd0=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCGnd+3y0WJKj+OVcxuNWalsPpltzlw8Ly7
 LD1wvDwz5yJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5SCED/sG8OtKpP2uG4CPl9svS/RoUQ+uIVmWcP1bOuuqWnuuATHdZ3yt06+9qgQLzqx3LG5S7Tn
 c3D/0yUpkLQJpLN/LzPfvVqPDdMPTFnEsefZ4oA+8VhBEE0kcyRhps1+E7uWF7GtOZoK7YZ6VPA
 PjUXDMLZFZf5v5O6/jEBCinlHKn73oIrgO+iCTGEWpMzZEkmEZHXHFOwMd0x+zyA5lPWX5W8tnE
 /x2wXAwufP57iXtPtd8sSuEjBgo1QA/nXSRSUH0ZE69B4BegRm7t5bfF+dhM9cl7ljHr4Sz+J1X
 fXWHCamFfajkPiFrejzV3pXuWP+N0xvfFraaTzACqXAnjj5MJQ+Sx7eYNn8uTHfrhdlJ58qeT9d
 HSzzYalFie75frQMdbaKOAVSOntH0ATLeyLHKgo54Xt7Q4Cpp0rR8KKPRUMsQ+nQwaGXlvmT+0K
 vyOqA+RA6M7SSM7Vl34lMlFVOfQpx+o7o5She3uI535o/qo5AQ+eWu678uEyTWN/PTr5vwOQred
 WRi5q/Uf95+3y0lRd2gi5QGNwrr0iBoNiIhKuq29YQgAONM1XFp5VoWy5966Qx7rxYMMdmOgdVj
 HxtrjoYwBwFcG6aYdy7lwbvUk2SGBybIWIfB7fUfHW3BlIoxZbMiXvRZtELA6l4tAgfk5b4kW38
 XH5VeP5KWbf9MrA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: zSiqib6RXyf6d1vDQw5t9PW-7I3OU8_4zuo5Epk50hg_1790961758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790961762-F0CA22AC-465E87C0/0/0
X-purgate-type: clean
X-purgate-size: 338

On Fri, 11 Sep 2026 15:36:25 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are needed in virtualization use cases to support PCI device
> assignment use cases so must provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


