Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B785EC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913F5214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913F5214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8s-0004wZ-Uw; Mon, 22 Apr 2019 16:50:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8r-0004pv-V7
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:05 +0000
X-Inumbo-ID: ad9151e3-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ad9151e3-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93589374;
 Mon, 22 Apr 2019 09:50:04 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 835A63F557;
 Mon, 22 Apr 2019 09:50:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:27 +0100
Message-Id: <20190422164937.21350-11-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 10/20] xen/arm32: head: Correctly report the HW
 CPU ID
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164927.jT7G_BH3KMRTwOBlCWgf6lj9sY3NGz7_aM7ZE_2Jprg@z>

VGhlcmUgYXJlIG5vIHJlYXNvbiB0byBjb25zaWRlciB0aGUgSFcgQ1BVIElEIHdpbGwgYmUgMCB3
aGVuIHRoZQpwcm9jZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJl
c3QsIHRoaXMgd2lsbCByZXN1bHQgdG8KY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0IG9m
IFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQpNUElEUi4KClNvIHJlbW92ZSB0
aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0IG9mIGEKdW5p
cHJvY2Vzc29yIHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDggLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IDlmNDBmYWNl
OTguLmQ0MmExMzU1NmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysr
IGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtMTI0LDE2ICsxMjQsOCBAQCBHTE9CQUwo
aW5pdF9zZWNvbmRhcnkpCiAgICAgICAgIG1vdiAgIHIxMiwgIzEgICAgICAgICAgICAgICAgLyog
cjEyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KIAogY29tbW9uX3N0YXJ0OgotICAgICAgICBtb3Yg
ICByNywgIzAgICAgICAgICAgICAgICAgIC8qIHI3IDo9IENQVSBJRC4gSW5pdGlhbHkgemVybyB1
bnRpbCB3ZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpbmQgdGhh
dCBtdWx0aXByb2Nlc3NvciBleHRlbnNpb25zIGFyZQotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIHByZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICovCiAgICAgICAg
IG1yYyAgIENQMzIocjEsIE1QSURSKQotICAgICAgICB0c3QgICByMSwgI01QSURSX1NNUCAgICAg
ICAgIC8qIE11bHRpcHJvY2Vzc29yIGV4dGVuc2lvbiBzdXBwb3J0ZWQ/ICovCi0gICAgICAgIGJl
cSAgIDFmCi0gICAgICAgIHRzdCAgIHIxLCAjTVBJRFJfVVAgICAgICAgICAgLyogVW5pcHJvY2Vz
c29yIHN5c3RlbT8gKi8KLSAgICAgICAgYm5lICAgMWYKICAgICAgICAgYmljICAgcjcsIHIxLCAj
KH5NUElEUl9IV0lEX01BU0spIC8qIE1hc2sgb3V0IGZsYWdzIHRvIGdldCBDUFUgSUQgKi8KLTE6
CiAKICAgICAgICAgLyogTm9uLWJvb3QgQ1BVcyB3YWl0IGhlcmUgdW50aWwgX19jcHVfdXAgaXMg
cmVhZHkgZm9yIHRoZW0gKi8KICAgICAgICAgdGVxICAgcjEyLCAjMAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
