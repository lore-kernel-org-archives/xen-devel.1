Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35329CA5FE0
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439331.1657662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwl-0008Mt-Qt; Fri, 02 Oct 2026 17:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439331.1657662; Fri, 02 Oct 2026 17:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwl-0008Mm-OE; Fri, 02 Oct 2026 17:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1439331;
 Fri, 02 Oct 2026 17:21:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgwk-0008MW-KD
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgwk-00D6da-0v
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe7f6-8faa-0a2a0a5109dd-0a2a450aecbe-34
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:21 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe810-f2d2-0a2a450a0019-aa0a817ce257-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:21 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-6G5WWYj4Pwavoq5nivgnag-1; Fri,
 02 Oct 2026 13:21:16 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A11E118005AA; Fri,  2 Oct 2026 17:21:14 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6C8A31800581; Fri,  2 Oct 2026 17:21:13 +0000 (UTC)
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
	s=mimecast20190719; t=1790961680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrylDJpuZsoIFUUXahyTqE70K91jDraMOMDJ9U5h74g=;
	b=Qqq6sv3Op1iB+6c+xc/LFPErDps9mnoc1PI9qq40HksTB9g/hf+2Z79cz8708t0AC8+dAR
	VrV0JFrs7LljkOo054+ccilUEUpMengq9L/M9PD+xHPZQE0/1b0v04bhZFxxRSMxoUoSfR
	eGr0OZUY+8cLCUsjz397DdAe+YUYg/Y=
X-MC-Unique: 6G5WWYj4Pwavoq5nivgnag-1
X-Mimecast-MFC-AGG-ID: 6G5WWYj4Pwavoq5nivgnag_1790961674
MIME-Version: 1.0
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc,
 arm, loonarch, riscv
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-2-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166108.3025252.9718549338852340036.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=597;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=ca+dBKOXV8eblTF1UKIxDCLCnqb1+6+PKPCp8E4obQ4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBgNVED7Ge4a3FZfVyeJ38C0I9ULQ5WCY2b
 YIjlAH9jsSJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5bd4EAC2ao/4YK3V1u4GjHkazn/6ZsYoSxnIEqPJWp1T7/d2J5MPCGyBHlyIaBQnTyWumHZzE4e
 YuaketbXl3iETQW0apS2w87kTX1duwp1IVO8IwY+Swe4svc833Za0oQnKfYUO267Y8xZQp/9BpU
 8hF37E8FJ+kqiRSBtO2+b6hb5keM9sFGZjDiwBth4dA/95vEw6PsjVKH5bxRoh0/FXeIe66nfZv
 lr2WChCZVhwaV2BgsIvIHvKrGrQMGgAseXPd1ps2X/OGBsIvAaFoXQ1Svi6mBVDCxWCb+tdFPGv
 13+65LJDDOy8/2ZrMOsKnb3YkGocX+wp7L06YuJMb6tU6Md2Ok48cOMeDyFBJTxSboYWoQfMtCZ
 1DSLqzx858E+YAtEZ7tSRPBOWOmijAhPrZBP0l11ayLXOH/LAVcSirS+xqVJEf9gUSTWRWl5ZR5
 ZzexT/7u+r1yWJAfUPygKAbuTRuntENaYWEwbud23gQKW8LxpVXZcf0xgPhBpteXMkfJBj++VvW
 KdbGkEumADdwxp/9/LWlUg+Ei1eEb1IAjO+nEpMhcodOBB7Q3dc8X/e6NnpCIKkR8RzG5tgsiEQ
 AqL0XjQchX2rYKoGYCEF440qzS4CcM3DkY+PBBTDf0bbrV2YI77tpmeSrooACeiRuGCHPKqGH2m
 L226vTermADFMvA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: SFPwkmTljoqSd7Jn0M-Smb9k11dqULQfceAZJmxF6Lw_1790961674
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790961681-4B8D5CFC-B5442D01/0/0
X-purgate-type: clean
X-purgate-size: 599

On Fri, 11 Sep 2026 15:36:00 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The versioned machine types are typically present for use in
> virtualization use cases and can be expected to provide a security
> barrier. The only exceptions are the m68k versioned machine types
> which are only used with TCG. There are also a handful of other
> machines declared secure in docs/system/security.rst, notably
> the Xen machine variants and microvm.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


