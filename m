Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012FCCA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439387.1657797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxj-0005xo-55; Fri, 02 Oct 2026 17:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439387.1657797; Fri, 02 Oct 2026 17:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxj-0005xf-24; Fri, 02 Oct 2026 17:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1439387;
 Fri, 02 Oct 2026 17:22:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxi-0005uL-2n
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxh-00Dbhx-EX
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe839-2eae-0a2a0a5409dd-0a2a4507a19a-20
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:21 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe84c-b4ea-0a2a45070019-aa0a817ceaaf-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:21 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-v8ouDKR6NlSSUtDTyP2BdQ-1; Fri,
 02 Oct 2026 13:22:16 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0C7E21954B20; Fri,  2 Oct 2026 17:22:15 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4027B1956086; Fri,  2 Oct 2026 17:22:13 +0000 (UTC)
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
	s=mimecast20190719; t=1790961740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMimm96Yzckh6J/xjCo++Izm66UFIO5I4/eH3KrRSmI=;
	b=AU0QyGo5+iX7lyvnZnx4LWs5QkHzXYZXHCJqNoFC8SJmGNT7C4wpOGnQ/kqSTsTy4zwvzn
	3OaVgf2RnBjzJD9b1FsY320NXASHoAwRqq1TRuMVKCT0qLm+jHJKwXRM7c8aSsLe+5888/
	rEkghNLbb/HfzUYp0AM/vERIqXnWgys=
X-MC-Unique: v8ouDKR6NlSSUtDTyP2BdQ-1
X-Mimecast-MFC-AGG-ID: v8ouDKR6NlSSUtDTyP2BdQ_1790961735
MIME-Version: 1.0
Subject: Re: [PATCH 19/28] hw/misc: mark pvpanic, vmcoreinfo as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-20-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-20-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166128.3025252.2520972277677656810.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=307;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=gLEzL6V1J5mLj97slKrKoYt9+Fjt2KNc7dTNIJXcKgY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCM0uqO+eCD5hgODJho/LKl0+Oc8OdiGqnu
 tZeQE1P18eJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5WOqEACHrLMPQxduSunRW/Ocbo4XsahQZMtVTSyghHJLKVbcCv1NrLJOPp6p/SfsYRmPdP1UMIR
 P1d9PbPfd9ZnmFNlrnqwBDNb/MwJXBh6aARpgS3yi3YNdsLjAyMkD4JVm+kjAJ1/TiiqEjBD3bd
 rypRrS7Z0OLaUyRicvtdUWOmMkiPxF18nZDj6bvTZRved55YurKk9R/KvfIIS/tPcxSSZ+2qF9/
 1giVeuRBGETVMTrykedEcO3m4kwp4xNJU1uCrvFiDmibOk3LU2Sk9gaWkANtP58RDnf7JkorGJY
 ZOwWX4VfmdLgBz4/07vb7uoBBIXD6a/FEk22DDFMPvFh0B690dzudNsQwNE/sdLjtP8NSmjBBbf
 kxixKYZcymykF7VXzRggGlm7ot5+rPTB5/fT277irwXB85698Y/3MyvFrb3c5I5z1c5jEe0WObG
 GpaI6VLTQLZPWZT3hCAwFYgi3Fkq5Ex+YbGaYthHUpctoQRGl1J7U51jidCDP5J1dbudeDNGCWW
 Pnwi/ktgXgxO6prMX7CxXxyNN1YUFOG7e0Ri13BVlkHYUyvTNq7SYRFZWiY8iLuvCdbH7yv6Mhs
 pRhpIWX/OSKOt8XcrczRLyQkxDCop2VPvXxDuNmE2omoxNSdtpXKChvm/Vo9Iaol20ZwUWCHNH7
 kphu3iVgT6cwL+g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: zIkLMCj51WM9vVNqUs2PVnr_OV4tvqPqb5xcTXYawEo_1790961735
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790961741-368D9AE4-65F96969/0/0
X-purgate-type: clean
X-purgate-size: 309

On Fri, 11 Sep 2026 15:36:18 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The first two devices are common debug aids for virtualized
> guests so must be marked secure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


