Return-Path: <SRS0=bi2U=XH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15039C4CEC7
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 18:00:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEBBE20663
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 18:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEBBE20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8TOZ-0007Gn-5k; Thu, 12 Sep 2019 18:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UuS5=XH=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i8TOX-0007Gi-QO
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 18:00:37 +0000
X-Inumbo-ID: 3938e2fe-d587-11e9-95a2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3938e2fe-d587-11e9-95a2-12813bfff9fa;
 Thu, 12 Sep 2019 18:00:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8TOW-000724-OF; Thu, 12 Sep 2019 18:00:36 +0000
Received: from localhost ([127.0.0.1] helo=MacBook-Pro-2.com)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8TOW-000273-IB; Thu, 12 Sep 2019 18:00:36 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 19:00:31 +0100
Message-Id: <20190912180031.3373-1-lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH XTF] Introduce a MAINTAINERS file
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aW9uYWxlOiB0aGlzIHdpbGwgYWxsb3cgdXMgdG8gdXNlIGdldF9tYWludGFpbmVyLnBsIC8K
YWRkX21haW50YWluZXJzLnBsIHNjcmlwdHMgZnJvbSB4ZW4uZ2l0CgpTaWduZWQtb2ZmLWJ5OiBM
YXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxMSAr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBNQUlOVEFJTkVSUwoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMGVmOWI1ZQotLS0gL2Rldi9u
dWxsCisrKyBiL01BSU5UQUlORVJTCkBAIC0wLDAgKzEsMTEgQEAKK2lUaGlzIGZpbGUgZm9sbG93
cyB0aGUgc2FtZSBjb252ZW50aW9ucyBhcyBvdXRsaW5lZCBpbgoreGVuLmdpdDpNQUlOVEFJTkVS
Uy4gUGxlYXNlIHJlZmVyIHRvIHRoZSBmaWxlIGluIHhlbi5naXQKK2ZvciBtb3JlIGluZm9ybWF0
aW9uLgorCitUSEUgUkVTVAorTToJQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KK0w6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZworUzoJU3VwcG9ydGVkCitG
OgkqCitGOgkqLworVjoJeGVuLW1haW50YWluZXJzLTEKLS0gCjIuMTMuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
