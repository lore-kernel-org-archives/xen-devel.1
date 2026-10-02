Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E19CA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439345.1657726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx8-00020b-Qi; Fri, 02 Oct 2026 17:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439345.1657726; Fri, 02 Oct 2026 17:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgx8-00020Q-MO; Fri, 02 Oct 2026 17:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1439345;
 Fri, 02 Oct 2026 17:21:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgx7-0001ww-65
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgx6-006d54-I2
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe7f3-bab6-0a2a0a5309dd-0a2a4508aee6-46
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:44 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe827-f659-0a2a45080019-aa0a817ca7f1-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:44 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-zFRBNzENMlSchus4DwaXww-1; Fri,
 02 Oct 2026 13:21:39 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 511EC1809CAD; Fri,  2 Oct 2026 17:21:38 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7A772195604B; Fri,  2 Oct 2026 17:21:37 +0000 (UTC)
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
	s=mimecast20190719; t=1790961702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gECulURY/oZLI9VNqz+HsEt2goE7of/WCgXwCZCLckM=;
	b=h44U1fig+5ZZBe4Pb5Xn+WGfpd/dhEGKYUTvQs85Gna9P2P6m7ze8dzMhVrorFF6uOY7oA
	Yn82sHGKJJ3kxWzEVa1Sut+mQWQtcysoUtb2R66y7u9QA6A5slhZhoIXLaZJ9UDIFoz8Sc
	ThwfDrOnn/Lk/6/OCxyjYjE6vIP5e9s=
X-MC-Unique: zFRBNzENMlSchus4DwaXww-1
X-Mimecast-MFC-AGG-ID: zFRBNzENMlSchus4DwaXww_1790961698
MIME-Version: 1.0
Subject: Re: [PATCH 08/28] hw/xen: mark all Xen related object types as
 being secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-9-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-9-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166116.3025252.12679898543529528318.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=339;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=7Vh5I2mhOnROAfcJUHuBXxYpyiWOJEXNCmbxX6t9bCY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBlYEWUugjEw6F6RwUrtgnjToRRUxqe8oo2
 Q/lqXVuxcWJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5TSxEACo+euuTcDsNdOhlOuR3cJnM5my1i4aCmSDh7lQJC/ynM5fFU9cvMkrJYZXwuxJotzfTGn
 j6F/MeecnSWsV5TEDRogTUiiaEzjz0tqrslPESywfke4fGNjoR0QqZxPw1p+7UutESlyLUnxqm6
 oHuaSh2dkq+zlmbeTPlmrupj9aR5I28x7Ee9rE8AITrGi34FcmraSX9YpugU+aFTVunrMAPQ064
 WRaxTzZlwl5qQExuKoHME+eAeP+6NX9BJYC494ELwsA2UXxwaCnrGCpsONM7S5pFXuZsBNrf0gi
 3Yx+iOaZ0nKx3FkRCHujrIBmKYF4e2wE29QgI5TCmij8tH5utnBBtI9ZpLWnnXX8tLIMsR1Qv+D
 fxnS+3DaCMEGPduPx90ddj4tEwdnTnUIGlQHloSM4o9oj2ejOPlRr9/nxytuKazl1am8qXOYsQ6
 ljDOvfH5oGRqTIOTbhA5Gq8AKTSw8P/sjM0YHpMplHCXPRJvx65KGW2w3sW80SDsOdxRkbdMbYZ
 tlWoiauNcXYZHw2KXghWw3xOIXatzxw4t/nUIdhSFdaTeeFp2lpo6O/dYu+Q1xcMcoNdyNVBGpV
 3xAKjczkE4s+jhoQtxsfbeZ5dZk4RwLy86IuI5T/aGL6ZXJw28LkC9tkYYYl6/piLx8bzcC/IgP
 cDB1t40DWiIRptQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: k321QZ6BVn3rEvqrBV5sULFqeGWGKD7cd7yU_RGPOKM_1790961698
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790961704-D4B7187B-2CD2A28E/0/0
X-purgate-type: clean
X-purgate-size: 341

On Fri, 11 Sep 2026 15:36:07 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> All Xen paravirtualized devices are intended to provide a host /
> guest security barrier, so mark all Xen object types as scure.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


