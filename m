Return-Path: <SRS0=j0Tp=UG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD07C2BCA1
	for <xen-devel@archiver.kernel.org>; Fri,  7 Jun 2019 13:13:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A02A212F5
	for <xen-devel@archiver.kernel.org>; Fri,  7 Jun 2019 13:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A02A212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cert.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZEgI-0006NC-Ho; Fri, 07 Jun 2019 13:13:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M9Nk=UG=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1hZDeD-0000Mn-FV
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 12:07:05 +0000
X-Inumbo-ID: c2a023f4-891c-11e9-8980-bc764e045a96
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2a023f4-891c-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 12:07:03 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 782FAA2BC9
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:07:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 73428A2B70
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:07:01 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FueB1HdNQSbG for <xen-devel@lists.xenproject.org>;
 Fri,  7 Jun 2019 14:07:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 132E0A2BC9
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:07:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tdou34moRPEU for <xen-devel@lists.xenproject.org>;
 Fri,  7 Jun 2019 14:07:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E2DE7A2B70
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:07:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id CC51620C8C
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:06:30 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Q_BcvIQgIrXg for <xen-devel@lists.xenproject.org>;
 Fri,  7 Jun 2019 14:06:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7B00B20C8D
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:06:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2ueYNaN98TvH for <xen-devel@lists.xenproject.org>;
 Fri,  7 Jun 2019 14:06:30 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5B49020C8C
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2019 14:06:30 +0200 (CEST)
Date: Fri, 7 Jun 2019 14:06:30 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF67 (Win)/8.6.0_GA_1194)
Thread-Topic: Relevance of global lock (/var/lock/xl) in xl tool
Thread-Index: pEodq5Ko/lTM9QxESyajbye9qRVVNw==
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:13:17 +0000
Subject: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgp3aGVuIGVpdGhlciAieGwgcmVzdG9yZSIgb3IgInhsIGNyZWF0ZSIgY29tbWFuZCBp
cyBpbnZva2VkLCBhIGdsb2JhbCBsb2NrIGlzIGFjcXVpcmVkIGhlcmU6CgpodHRwczovL2dpdGh1
Yi5jb20veGVuLXByb2plY3QveGVuL2Jsb2IvbWFzdGVyL3Rvb2xzL3hsL3hsX3ZtY29udHJvbC5j
I0w4NzYKCkknbSB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGF0IGlzIHRoZSBleGFjdCBpbXBvcnRh
bmNlIG9mIHRoaXMgbG9jaz8gSXMgaXQgcmVhbGx5IGNyaXRpY2FsIGZvciBYTCBvcGVyYXRpb24/
IEkgaGF2ZSBhIHByZXR0eSBwb3dlcmZ1bCBtYWNoaW5lIG9uIHdoaWNoIEkgd2FudCB0byBydW4g
YSBmZXcgZG96ZW4gb2Ygc2hvcnQtbGl2ZWQgVk1zLiBUaGlzIGxvY2sgaXMgc2VyaW91c2x5IHNs
b3dpbmcgbWUgZG93biwgbm90IGxldHRpbmcgdG8gcmVzdG9yZSBtb3JlIHRoYW4gb25lIGRvbWFp
biBhdCBvbmNlLiBUdXJucyBvdXQgdGhhdCBldmVyeXRoaW5nIHN0aWxsIHdvcmtzIGZpbmUgKGFu
ZCBtdWNoIGZhc3Rlcikgd2hlbiBJIGNvbW1lbnQtb3V0IHRoZSBsb2NrIGluIHRoZSBhYm92ZW1l
bnRpb25lZCBwbGFjZSwgYnV0IEknbSBub3Qgc3VyZSBpZiBpdCdzIGEgY29ycmVjdCBpbXByZXNz
aW9uLgoKRG9lcyBhbnlvbmUga25vdyBpZiB0aGVyZSBpcyBhIHNpdHVhdGlvbiBpbiB3aGljaCBY
ZW4gd291bGQgc2NyZXcgdXAgd2l0aG91dCB0aGlzIGxvY2s/CgoKQmVzdCByZWdhcmRzLApNaWNo
YcWCIExlc3pjennFhHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
