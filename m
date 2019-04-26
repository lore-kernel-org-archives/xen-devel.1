Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E1BC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 17:22:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F9D2146E
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 17:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F9D2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK4Xm-0004NH-JV; Fri, 26 Apr 2019 17:21:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TjWw=S4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hK4Xl-0004N2-JG
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 17:21:49 +0000
X-Inumbo-ID: c5b20fc5-6847-11e9-843c-bc764e045a96
Received: from mail-it1-f195.google.com (unknown [209.85.166.195])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c5b20fc5-6847-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 17:21:48 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id x132so7068884itf.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 10:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZ0xQmtXsb1Z+NDOML+qI/sBYrUyNMQwKbHOTdXldXQ=;
 b=S66BmoqT5EjISt5/6rTNEsMueRPH4TKqHFRSDFkaqT/GOomIgUsd1GdH2TyhZrlE9/
 5Rg0EuYZHXDweJ/bif+n20HZ3bJgdjxrR8uhBuogu3iTB/vVz7QsErqLvlBN0Iw0LqRA
 cuN5WMJMLXdJMHOM2IFwFGPsWE2P6gEPxBVsYS2Tmf7QmQ0mrOo352INdKLVleLQ3Auy
 kaTxnmhEgGFldf22T7WzkxY3NkECzSYB+qg+UqDWCTtBEM4hkg7QTgf9U4BQHRizjrxf
 yxJIfWW0vnnvk2W6AFUSZPhQYA6ffUjnkNGXcmMVbQ66ObQweiXDH1FR3uX86ORApE4N
 LoXg==
X-Gm-Message-State: APjAAAV6KibeNrFzXeqUasGDSVkr2aJR0fbk0i1zQkWT1q1/eB3hgxXA
 90im4QkXPI1/e56i83bXMhJSIQO3
X-Google-Smtp-Source: APXvYqyemw+gIm1WnVjlMpr444LA7STGvsHk1ezQADmrw9uZbbREWUwNd2WkATNU616a9afwe1g6lg==
X-Received: by 2002:a02:3f0c:: with SMTP id d12mr26253158jaa.9.1556299306993; 
 Fri, 26 Apr 2019 10:21:46 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id u16sm3706808iol.66.2019.04.26.10.21.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 10:21:46 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2019 11:21:37 -0600
Message-Id: <20190426172138.14669-3-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426172138.14669-1-tamas@tklengyel.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] x86/mem_sharing: enable mem_share audit
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
Message-ID: <20190426172137.CjFzb_Ukjk61E_T3TvFI723cCWnMbbP_ddvwlQewc8A@z>

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
