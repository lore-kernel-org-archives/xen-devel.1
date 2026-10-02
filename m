Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07455CA5FE2
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439394.1657815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxp-0006ib-U0; Fri, 02 Oct 2026 17:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439394.1657815; Fri, 02 Oct 2026 17:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxp-0006iH-Oe; Fri, 02 Oct 2026 17:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1439394;
 Fri, 02 Oct 2026 17:22:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxo-0006e4-NT
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxo-006dFI-2z
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe831-e002-0a2a0a5209dd-0a2a450bbab2-38
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:28 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe852-b7e8-0a2a450b0019-aa0a857c5f25-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:27 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-vs1CX2kXMLiBxPQbEb8Dtw-1; Fri,
 02 Oct 2026 13:22:23 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B72991955F2B; Fri,  2 Oct 2026 17:22:21 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D057130000E4; Fri,  2 Oct 2026 17:22:20 +0000 (UTC)
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
	s=mimecast20190719; t=1790961746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZ9t2YOOebL6cB98bzzlqu70Uno91Rp50azC77ksw0k=;
	b=XuiT0jsM5xF0yElERUIMP9kU/kFgodaTX6VirNZAjOYlyJO9mxduFbHw9qRHtVG1uESlko
	a8HlhFVS0Pm+7MFjUQuNp77lHGE578K4j0dQlK1+gybvfm7Hy5qh0Mv9G/fUlchyi0oPJO
	okNIsSFQfjO8S5QTwB4nNrrTBKpLPUU=
X-MC-Unique: vs1CX2kXMLiBxPQbEb8Dtw-1
X-Mimecast-MFC-AGG-ID: vs1CX2kXMLiBxPQbEb8Dtw_1790961741
MIME-Version: 1.0
Subject: Re: [PATCH 21/28] hw/char: mark common serial / console devicess a
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-22-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-22-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166131.3025252.15804110579226789174.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=3i625zs0zRqrDOwzUvcSLrcAcxtVCD3LCYZXUCFhaWI=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCZ083AgK4//+Yw4uwWOXwBw2gUcDMAUlT2
 AOhv5khVMiJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5eQ5EACPW0m2YqQZqCJiSd0Plfmrpe16ta6hZ6NP+BOqb+MMUPZ+nvN2BMw82h/ygGFCpACXqYl
 /0JhvhMFriK+eVh4k1hFjrRyfc4iMor6JhMpAhGdE+AKHjGXSR+Qq+oW/kABKKuNy1nDT84U16l
 94pUSmKIdsN/FE5cEB1c+LCz5TU1ST9kkdmjcurECOTl/Ncl6L7uuLtE80NLjkBQEek1/+AZGO7
 5UXgzrIztDpJkGEtQNcgRhwBXC2e/wYSv0G7XFHvnHA/unl8VjGReVBmQvFblzkae8erW/KEhkj
 Hp9/vcFQVMooRpo9zJc6D4fk4kXIzik4b/UT7UxvTuDcht4BrpYDkZaFeoOW08qOMgmtwX+VGyy
 J5vRyI6/Nwn5fDOyyQLbc5d4OzStMa/G66w9fOI7vfCsC+EEjI3mB86/mMi3+U4lbb1Tl0yDyca
 j6l4mRaJvK33tWPhtHQQqsKXHxVOHw1Fum49uk6eZr8BPKgJgFly6aLPjXy0Oel7V5YtCKMLLkl
 ou2ALD2sikLZLHp0X99JxkCyHhyMaGQkHqt8wedbW+Ad3c4DqjNfDKVU3beEwHSUAtuEMFw65cT
 Q8iIIcNPUo59m6dCEe6B0tYPA25oRhLodevLhlYdQM3AZECgLHchSn2R63yAzZFQWNEDcf4NdX7
 xCmFqJkto4MX9FA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: InLFylsbss-SpUuOa58xNJkbG_co5UQBdJq_9RPUZ9o_1790961741
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790961748-192CC9EA-356CE436/0/0
X-purgate-type: clean
X-purgate-size: 311

On Fri, 11 Sep 2026 15:36:20 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are needed as a baseline feature for many virtualization use
> cases on x86, PPC64 and s390x.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


