Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89DAC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910572183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 910572183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xQ-0002Ay-U9; Thu, 18 Apr 2019 16:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xP-00027g-64
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:15 +0000
X-Inumbo-ID: 858c0478-61f7-11e9-8d3f-9f6ad06a8bc4
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 858c0478-61f7-11e9-8d3f-9f6ad06a8bc4;
 Thu, 18 Apr 2019 16:32:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913797"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:52 +0100
Message-ID: <20190418163158.11408-16-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 15/21] starvation: Propagate starved job
 status into dependent jobs
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163152.noOyun5rHrUiD7qQMI26BnU0AxR-MqRFohi4hYlJrdU@z>

SWYgYSBidWlsZCBqb2IgaXMgc3RhcnZlZCwgdGhlbiB0aGUgc2FtZSBzdGF0dXMKCihObyBqb2Jz
IGFyZSBtYXJrZWQgYHN0YXJ2ZWQnIHlldC4pCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5w
bSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5wbSBiL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtCmlu
ZGV4IDJlMTFjOGYzLi5iZTU1ODhmYyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9Kb2JEQi9FeGVjdXRp
dmUucG0KKysrIGIvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KQEAgLTM4MCw2ICszODAsOCBA
QCBFTkQKICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgICAgZGllICJqb2IgJG9m
bGlnaHQuJG9qb2IgKCR3aHkpIHF1ZXVlZCAod2UgYXJlICRvdXJzdGF0dXMpIjsKICAgICAgICAg
ICAgIH0KKyAgICAgICAgfSBlbHNpZiAoJGpzdGF0dXMgZXEgJ3N0YXJ2ZWQnKSB7CisgICAgICAg
ICAgICBicm9rZW4oImpvYiAkb2ZsaWdodC4kb2pvYiAoJHdoeSkgJGpzdGF0dXMiLCAkanN0YXR1
cyk7CiAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICBicm9rZW4oImpvYiAkb2ZsaWdodC4k
b2pvYiAoJHdoeSkgJGpzdGF0dXMiLCAnYmxvY2tlZCcpOwogICAgICAgICB9Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
