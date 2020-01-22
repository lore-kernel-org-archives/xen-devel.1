Return-Path: <SRS0=7Ixj=3M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F7EC2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 12:43:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB23C24673
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB23C24673
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubpJ-0001BF-U8; Thu, 23 Jan 2020 12:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ed1=3M=ip-10-0-107-235.ec2.internal=elnikety@srs-us1.protection.inumbo.net>)
 id 1iubpI-0001BA-Qd
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:43:12 +0000
X-Inumbo-ID: ea933ed2-3ddd-11ea-be15-12813bfff9fa
Received: from ip-10-0-107-235.ec2.internal (unknown [35.173.76.244])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea933ed2-3ddd-11ea-be15-12813bfff9fa;
 Thu, 23 Jan 2020 12:43:12 +0000 (UTC)
Received: from ip-10-0-107-235.ec2.internal (localhost [127.0.0.1])
 by ip-10-0-107-235.ec2.internal (8.15.2/8.15.2/Debian-10) with ESMTP id
 00MM3Wcv027502; Wed, 22 Jan 2020 22:03:32 GMT
Received: (from elnikety@localhost)
 by ip-10-0-107-235.ec2.internal (8.15.2/8.15.2/Submit) id 00MM3W0O027501;
 Wed, 22 Jan 2020 22:03:32 GMT
From: Eslam Elnikety <elnikety@amazon.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 22:03:17 +0000
Message-Id:
 <29772dcab47696af624d9c0a9026af38ac3be577.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
Subject: [Xen-devel] [PATCH v1 1/4] x86/microcode: Improve documentation for
 ucode=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, David Woodhouse <dwmw@amazon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20200122220317.fdGuZv8HCS0Doh6uflCLPzpXfOxRJUxeUnRSPweWtng@z>

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
