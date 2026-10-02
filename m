Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0835BCA5FE4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439403.1657841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy0-0007zZ-P7; Fri, 02 Oct 2026 17:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439403.1657841; Fri, 02 Oct 2026 17:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgy0-0007zN-Lo; Fri, 02 Oct 2026 17:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1439403;
 Fri, 02 Oct 2026 17:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxz-0007tI-13
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxy-00DbnD-E6
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:22:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe82b-2eae-0a2a0a5409dd-0a2a45089242-44
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:38 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe85d-f659-0a2a45080019-aa0a857ca1d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:22:38 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-Nuf6dyyKM0SdfCEFBrS6Zw-1; Fri,
 02 Oct 2026 13:22:36 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A459118F4BEE; Fri,  2 Oct 2026 17:22:34 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D8A071956086; Fri,  2 Oct 2026 17:22:33 +0000 (UTC)
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
	s=mimecast20190719; t=1790961757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZbreQQHhvp91loUpdeP4aZ/RKrcLPZbF/PAGSeQWno=;
	b=OOaMQ/va3MHy6eXrLCpHQVMMv5/EjZ478F65LIbrcPT33mX0ku2kDFigQcvsQ2uWB1XlhV
	/reyT35LGAEsJJrjuzY4a8VMvrhgyMssWc+oMTbxv3RUiGIFRjbztEqN4/d/lCpLfD6YiU
	MHRv1Fga6vFOYiWN3z1gvy5bD9AZeEI=
X-MC-Unique: Nuf6dyyKM0SdfCEFBrS6Zw-1
X-Mimecast-MFC-AGG-ID: Nuf6dyyKM0SdfCEFBrS6Zw_1790961754
MIME-Version: 1.0
Subject: Re: [PATCH 25/28] hw: mark KVM clock and RTC devices as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-26-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-26-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166135.3025252.15042445966657484711.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=302;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=RgriddRIoJ5Fdcu+Zvv88tHI9dTC0oc9vQqbXoJtYoM=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gC2A0XRcSs7EOe5/RnSBZGhpsE+XBGBXq2F
 6yA7zcaGCeJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5SVSD/4is/H8riITQOd0QCjoRhVdRECSA7+r++NfQE/FpZ5QM4k+wdqKqmrvd8oj66rN9yRaqUE
 jr9I57OwAhPxYQHSc1OBlC9BMU19ogNbLLUesBeQjly+oo72m76m9/vt6mOCOnlWvuSUEeppaDx
 FsQZhEmPXXdpGgY8EfygrNjIkMjjjA7n9UP9/rto6MuNzj4iTONGPmIKGhU9990itaUSaAH5su9
 JoXFAy+N05CEEaEIMud3pCHNtUwPxRUjIIRET3nWMIXyxHRUCAnhShDhoRSksNPNqwPSX892DLG
 XPhpVMdtl2PTZUZUCEE8SnsdVCepw5THrVPwfrI188MjlbBszrfreYYcmjNYIBS++X9aPIrjvti
 qwdd5zRoIBUL2qZpHcBrZirMTB6s3y+RAzTPuph8nx34k0jRVywAZc+XReB5JWNFlLWrS8tFtX5
 W/MmD6Ck2AwnNnfYKskA++WQq7e9aBihxrIpc7nzvG9BBufI4P6x3+So3DcFxYeaRiPRzHj91A4
 UT50+dPZsvYlHJnSq3S8Lu7jDCHuLBLFaAzoySfIUYRz12lVC5wukW0Rw/ZpjmjNN1fHEB2+xrt
 hLfs6JS1XBvt48y9VCdWOT6v6uJGlE3BeoNo1bfF4KzOu22yFu+kfmDaDncuPoeLTkqzEVQhhPz
 w4BUd0J2Zn8ojhg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4yuqDN4N9bxUlB0I4BQPr_EoRKc5WNTJ1rM0GAheniU_1790961754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790961758-D694287B-AC6FC528/0/0
X-purgate-type: clean
X-purgate-size: 304

On Fri, 11 Sep 2026 15:36:24 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are core infrastructure in virtualization cases so must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


