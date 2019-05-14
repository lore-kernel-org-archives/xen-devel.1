Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDF9C04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 15:30:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2FF20862
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 15:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="tiL32Lha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2FF20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZO2-0005ql-3R; Tue, 14 May 2019 15:30:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jxAo=TO=amazon.com=prvs=030dd7525=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZAo-0004Oe-86
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:16:58 +0000
X-Inumbo-ID: 4f7824fc-765b-11e9-8980-bc764e045a96
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4f7824fc-765b-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1557847017; x=1589383017;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=52wCeBOwauHSQlDrGetPA9MN4QQCshjnt1eWacd/EZk=;
 b=tiL32LhaSlonuaNFjy3106nObSd6VTfvrp3hN+IHgjfwOfnttuIJKkoo
 /GPk1OZgQw4uAUiMn3gmAkGVZKvBfY3IKjA0EyLldWSRZuEtKPTMxH9cQ
 kTCMu7JOnAv40bahFFYKLlVPLkU830CQlB2nngWmw8+4GjeI/z0SmjE2Z 0=;
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="674278996"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 15:16:50 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4EFGmBv009206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 May 2019 15:16:49 GMT
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 x4EFGl86027925; Tue, 14 May 2019 17:16:47 +0200
Received: (from sironi@localhost)
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
 x4EFGkaB027921; Tue, 14 May 2019 17:16:46 +0200
From: Filippo Sironi <sironi@amazon.de>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, 
 boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com,
 xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
Date: Tue, 14 May 2019 17:16:40 +0200
Message-Id: <1557847002-23519-1-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539078879-4372-1-git-send-email-sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
Precedence: Bulk
X-Mailman-Approved-At: Tue, 14 May 2019 15:30:36 +0000
Subject: [Xen-devel] KVM: Start populating /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TG9uZy10aW1lIFhlbiBIVk0gYW5kIFhlbiBQViB1c2VycyBhcmUgbWlzc2luZyAvc3lzL2h5cGVy
dmlzb3IgZW50cmllcyB3aGVuCm1vdmluZyB0byBLVk0uICBPbmUgcmVwb3J0IGlzIGFib3V0IGdl
dHRpbmcgdGhlIFZNIFVVSUQuICBUaGUgVk0gVVVJRCBjYW4KYWxyZWFkeSBiZSByZXRyaWV2ZWQg
dXNpbmcgL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZG1pL2lkL3Byb2R1Y3RfdXVpZC4gIFRoaXMgaGFz
CnR3byBkb3duc2lkZXM6ICgxKSBpdCByZXF1aXJlcyByb290IHByaXZpbGVnZXMgYW5kICgyKSBp
dCBpcyBvbmx5IGF2YWlsYWJsZSBvbgpLVk0gYW5kIFhlbiBIVk0uCgpCeSBleHBvc2luZyAvc3lz
L2h5cGVydmlzb3IvdXVpZCB3aGVuIHJ1bm5pbmcgb24gS1ZNIGFzIHdlbGwsIHdlIHByb3ZpZGUg
YW4KaW50ZXJmYWNlIHRoYXQncyBmdW5jdGlvbmFsIGZvciBLVk0sIFhlbiBIVk0sIGFuZCBYZW4g
UFYuICBMZXQncyBkbyBzbyBieQpwcm92aWRpbmcgYXJjaC1zcGVjaWZpYyBob29rcyBzbyB0aGF0
IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIGNhbiBpbXBsZW1lbnQgdGhlCmhvb2tzIGluIGRpZmZl
cmVudCB3YXlzLgoKRnVydGhlciB3b3JrIGNhbiBiZSBkb25lIGJ5IGNvbnNvbGlkYXRpbmcgdGhl
IGNyZWF0aW9uIG9mIHRoZSBiYXNpYwovc3lzL2h5cGVydmlzb3IgYWNyb3NzIGh5cGVydmlzb3Jz
LgoKRmlsaXBwbyBTaXJvbmkgKDIpOgogICAgICBLVk06IFN0YXJ0IHBvcHVsYXRpbmcgL3N5cy9o
eXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMKICAgICAgS1ZNOiB4ODY6IEltcGxlbWVudCB0aGUg
YXJjaC1zcGVjaWZpYyBob29rIHRvIHJlcG9ydCB0aGUgVk0gVVVJRAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
