Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEBDC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B84206C0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B84206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgNH-0000xj-SG; Thu, 25 Apr 2019 15:33:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5oh2=S3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJgNG-0000xM-CI
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:33:22 +0000
X-Inumbo-ID: 75026aa9-676f-11e9-843c-bc764e045a96
Received: from mail-io1-f67.google.com (unknown [209.85.166.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 75026aa9-676f-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:33:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m188so291376ioa.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 08:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZ0xQmtXsb1Z+NDOML+qI/sBYrUyNMQwKbHOTdXldXQ=;
 b=f5DxO4u3hG5J6h7zQwTL8mBnWG23R9yCRmLWSrbWpSzyavHK2VwU5nbjjr/We0mZ3F
 t4Iju3ZTpSkbp4BqGq3jKBlMw+a8cdCnxnxIpWNBQhyUcg+NV6qT2+l1I3HjABMeZc0q
 0Qz5EpsDz/SeGuXKYZekIo8fwJI946tmaVe6l0PX5F56TOclNjN7cJUNjvjOvegFH3fC
 PiVMmSaCbTMNzk2XpToxyUcV+BL37f+ZpF44CFnO+V4LqzqqUs6Am0CDPJG38DarF+da
 H2+q0LXgbERIds9j83bsT9+ARs4ODtXI1JEdgN7mlz0VgwsH78OG8SGgVupzCZzASJGu
 1J2Q==
X-Gm-Message-State: APjAAAXbBIR4YpN08rsIvz7rhr/NSYxZ+M7Hj8gtpnJSOE/U/IEM3vtJ
 OL8z4I6VQn5pslXS/KU2ohSGBlFW
X-Google-Smtp-Source: APXvYqz5qo+o1dA0wBISDmLx70leXw2EW/V9skgh+A7DP0JBzQHwk9i1V658UPuRuOV8PkcvlO3GKg==
X-Received: by 2002:a05:6602:55:: with SMTP id
 z21mr10415416ioz.101.1556206400830; 
 Thu, 25 Apr 2019 08:33:20 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id 2sm3589667ioz.77.2019.04.25.08.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 08:33:20 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 25 Apr 2019 09:32:52 -0600
Message-Id: <20190425153252.14795-3-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190425153252.14795-1-tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] x86/mem_sharing: enable mem_share audit
 mode only in debug builds
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425153252.Be9UQKPBvpkvXUwyyNpauvf_HfUb1RfUr-RrbLKkvBY@z>

SW1wcm92ZXMgcGVyZm9ybWFuY2UgZm9yIHJlbGVhc2UgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3No
YXJpbmcuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21lbV9zaGFyaW5nLmgKaW5kZXggMGU3N2I3ZDkzNS4uNTJlYTkxZWZhMCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbWVtX3NoYXJpbmcuaApAQCAtMjUsNyArMjUsOSBAQAogI2luY2x1ZGUgPHB1YmxpYy9t
ZW1vcnkuaD4KIAogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNoYXJpbmcgY29kZT8gKi8KKyNpZm5k
ZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElUIDEKKyNlbmRpZgogCiB0eXBlZGVm
IHVpbnQ2NF90IHNocl9oYW5kbGVfdDsgCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
