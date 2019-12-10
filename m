Return-Path: <SRS0=O6u+=2A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D7BC43603
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 15:48:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89781207FF
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 15:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaMY1cMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89781207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehk6-0002v1-WD; Tue, 10 Dec 2019 15:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehk5-0002uh-RB
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:05 +0000
X-Inumbo-ID: 6d9100c2-1b64-11ea-a1e1-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d9100c2-1b64-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:53 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l124so4839236qkf.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bl4kmcGwcbL0QI9zZzG8ebrx0FfXrmxwyQuh29q0y+o=;
 b=RaMY1cMQFE0k+UZGVwDW96RQXSH3urkB8MCBkF84GbfIcTDZqLRdlxaw32IYbReM5R
 +JK0Tea/wxQ9X8SJu6j9coD6kgPdAOez1v5KJvy9FpFeKVse89bohNde0xwoQ7nFLAB8
 ppMddtAXCEoyOYh80couUHkIeWruJoy1qrxs01FdH0dgNsU0atJ8/o+agbOas4fzvd52
 CD5i7OyMR67ET4OcRmkEbi40VN9zqspLV/X3BTWwuj00JsejJq3DoHsInERa0VupgY+G
 Kb/HJL8TBaG3OxvIBBVaai9vktREulU06QczcuzcU0Vs8niREOcXmBwnCb9B9VmBe9Y5
 zvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bl4kmcGwcbL0QI9zZzG8ebrx0FfXrmxwyQuh29q0y+o=;
 b=OEBISpZRI5BzDIY+HuDYiX3PS4ipgV9+oXFiCqnYPRLyD7b76aNzsCjMqgdJFAxMfe
 rI8LyXVKtXfFL2/CWlsg0Q8s6uScguPMiUFOidsqGo9aYzmmvzMIYZz1wl5ya/s5xmOs
 IGl9f7nbj8L51dxuIGdGaXohirNYfl76vCnA3fvaUxed39mIDBNgIMXDxsSt0HpwX+Tn
 JKmwWxEjA/GhWWiJ40g+kYEpISK4xQVyt0HQgyw0YJWarUTUL7YNQ3qdSVti625R6yil
 r8xkCFykyCjsapCdXEOrDAppTXqStojQYKEWTOsIMNxykBpfdq1vEPZw4XH0RZb8Iw+t
 MpAQ==
X-Gm-Message-State: APjAAAXjTntva+KDMrt4GXkqVbEV+OruxeN1/UXTJDXsNpp9jmdR8T6G
 3N+tGL9dDByqyzrlt6zODNPPnzBY
X-Google-Smtp-Source: APXvYqySvExekk3DuX3qbxD+6Td0TxBmfNa0jzkgdTl46w9PXNAUoSq9sTgtvuNdXiBZrGDZnCa4yw==
X-Received: by 2002:a05:620a:13da:: with SMTP id
 g26mr33985682qkl.410.1575992873138; 
 Tue, 10 Dec 2019 07:47:53 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:52 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:18 -0500
Message-Id: <99f726c939543cb538c2f2851ba070ed8ec1176f.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 03/22] golang/xenlight: define Devid type as
 int
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+ClJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNjQwZDgyZjM1Zi4uOGFjMjZl
NjNmMCAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODEsNiArODEsOSBAQCBmdW5j
IChlIEVycm9yKSBFcnJvcigpIHN0cmluZyB7CiAKIHR5cGUgRG9taWQgdWludDMyCiAKKy8vIERl
dmlkIGlzIGEgZGV2aWNlIElELgordHlwZSBEZXZpZCBpbnQKKwogdHlwZSBNZW1LQiB1aW50NjQK
IAogdHlwZSBVdWlkIEMubGlieGxfdXVpZAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
