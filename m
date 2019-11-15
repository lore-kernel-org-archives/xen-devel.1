Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C29C43141
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 19:45:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB7320732
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 19:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrC0LATT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB7320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhWy-0001Md-UT; Fri, 15 Nov 2019 19:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhWx-0001M2-GN
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:19 +0000
X-Inumbo-ID: 6b1c1076-07e0-11ea-9631-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b1c1076-07e0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 205so9066616qkk.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCpc2PETu5vkVGi+//zexBJ1l4O8/+O3JExE14eM7Ho=;
 b=IrC0LATTrMi9aJ1MMpUzMoDXsw4g3zdVtQK7NaNidK0PrgMutoiF+1rsH4SEmV1HIy
 EoMvXavvCacxW6EFWYlPp2kFgHLLtY26QtDNfPL3dOOURjgmT3yTKZWUhlxLq9w74Y96
 FWPkRswJGkCKQB4MqQiGm+8qGxQ3HAGtaPVykF3TzljqXplNw+sF/A6XVMyznAFEgWXt
 /DRkFq6Gn8Q/7NyoyooEOUK7vP9OPbi6T4O80i2k75ws4TJqKmQ/fISmHR83Vdo/M3bN
 sGrclF9DLe7jLOSyCjN93/Co4XdobnyXassueuqjPgOB+Mi4aRut4bNW0OyH4kpvJwOP
 EKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCpc2PETu5vkVGi+//zexBJ1l4O8/+O3JExE14eM7Ho=;
 b=LBgIwGUCLIUHD0NUmYj2TgxQdbvcmHzxiWFxyHU1CwxMqqXIdM2ND6YnHcTU4b4mLI
 PYb38IpmBMQCWIhAeNq9Vq0itIlRM1inDtI4wTJLFaY5Yek9llWBEep8hjArtFdAv8ds
 /iMFyqcjqlLz1UcXG1VCbChS2mbWFy/I+YQiL8M4XCx7xuospTJHeye1drn9JsnJ+O5q
 xiFnVMy7OgJBEm1J7llAgQ06dgFTuwXXf/M5JMh083ALGMIy3WD3+iYWdDVhaI5fYi7N
 5Q1lCwn+MkTqYabkkhjviOJcemrm+XRFtQUXtMkjdPXuob9G/2/+AmeGnbdo0KZEW/V2
 AcLA==
X-Gm-Message-State: APjAAAVnb0KyO6osdcIWWU5xKxRNNuxu5ODvOPFWmTehjN6/gRu+ccdZ
 Ud8NaUCqLXz1DKm2iX72SHwzS4xM
X-Google-Smtp-Source: APXvYqxVHXPJrtKcvM5k9oh/7pawBVfW583Le6b9Hp7KwGbnvdbJKjwZwxlNSEbWc+/0D7aAG8407Q==
X-Received: by 2002:a05:620a:12c9:: with SMTP id
 e9mr13531524qkl.97.1573847103198; 
 Fri, 15 Nov 2019 11:45:03 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:02 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:11 -0500
Message-Id: <9f5901687b1e8ac95b92fb0b9185344721c9e23d.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 04/22] golang/xenlight: define KeyValueList
 as empty struct
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBLZXlW
YWx1ZUxpc3QgYXMgZW1wdHkgc3RydWN0IGFzIHRoZXJlIGlzIGN1cnJlbnRseSBubyByZWFzb24g
Zm9yCnRoaXMgdHlwZSB0byBiZSBhdmFpbGFibGUgaW4gdGhlIEdvIHBhY2thZ2UuCgpJbXBsZW1l
bnQgZnJvbUMgYW5kIHRvQyBmdW5jdGlvbnMgYXMgbm8tb3BzLgoKU2lnbmVkLW9mZi1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0g
UmUtZGVmaW5lIEtleVZhbHVlTGlzdCBhcyBlbXB0eSBzdHJ1Y3QsIGFzIGl0IHdhcyBkZWNpZGVk
IHRoaXMgdHlwZQogIHByb2JhYmx5IHNob3VsZG4ndCBiZSBleHBvc2VkIGluIHRoZSBHbyBwYWNr
YWdlLgoKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvCmluZGV4IDhhYzI2ZTYzZjAuLjNlZGZmMTg0NzEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28KQEAgLTIwMiw2ICsyMDIsMTYgQEAgZnVuYyAoY2h3Y2FwIEMubGlieGxfaHdjYXApIHRv
R28oKSAoZ2h3Y2FwIEh3Y2FwKSB7CiAJcmV0dXJuCiB9CiAKKy8vIEtleVZhbHVlTGlzdCByZXBy
ZXNlbnRzIGEgbGlieGxfa2V5X3ZhbHVlX2xpc3QuCisvLworLy8gUmVwcmVzZW50ZWQgYXMgYW4g
ZW1wdHkgc3RydWN0IGZvciBub3csIGFzIHRoZXJlIGlzIG5vCisvLyBhcHBhcmVudCBuZWVkIGZv
ciB0aGlzIHR5cGUgdG8gYmUgZXhwb3NlZCB0aHJvdWdoIHRoZQorLy8gR28gcGFja2FnZS4KK3R5
cGUgS2V5VmFsdWVMaXN0IHN0cnVjdHt9CisKK2Z1bmMgKGt2bCBLZXlWYWx1ZUxpc3QpIGZyb21D
KGNrdmwgKkMubGlieGxfa2V5X3ZhbHVlX2xpc3QpIGVycm9yICAgICAgeyByZXR1cm4gbmlsIH0K
K2Z1bmMgKGt2bCBLZXlWYWx1ZUxpc3QpIHRvQygpIChja3ZsIEMubGlieGxfa2V5X3ZhbHVlX2xp
c3QsIGVyciBlcnJvcikgeyByZXR1cm4gfQorCiAvLyB0eXBlZGVmIHN0cnVjdCB7CiAvLyAgICAg
dWludDMyX3Qgc2l6ZTsgICAgICAgICAgLyogbnVtYmVyIG9mIGJ5dGVzIGluIG1hcCAqLwogLy8g
ICAgIHVpbnQ4X3QgKm1hcDsKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
