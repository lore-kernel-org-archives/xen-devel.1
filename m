Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3306C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:21:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB112084F
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB112084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3bK-00067P-R6; Fri, 26 Apr 2019 16:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3bJ-00067K-H7
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:21:25 +0000
X-Inumbo-ID: 53f8608e-683f-11e9-a5aa-4f9b625ad297
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53f8608e-683f-11e9-a5aa-4f9b625ad297;
 Fri, 26 Apr 2019 16:21:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84517990"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23747.12281.167553.340430@mariner.uk.xensource.com>
Date: Fri, 26 Apr 2019 17:21:13 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <4d0ff4ea-078e-9f49-8824-fc03a705be06@citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
 <20190425155056.23145-6-ian.jackson@eu.citrix.com>
 <4d0ff4ea-078e-9f49-8824-fc03a705be06@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 5/6] Debian: preferred arch: Apply
 setarch to sshd
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426162113._BP4VnPPgr6-YJKbnGiojVuM2GV812bCjHPSgCa99EQ@z>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggNS82
XSBEZWJpYW46IHByZWZlcnJlZCBhcmNoOiBBcHBseSBzZXRhcmNoIHRvIHNzaGQiKToKPiBXaGF0
IGlzIHdyb25nIHdpdGggc2V0dGluZyBYRU5fVEFSR0VUX0FSQ0g9eDg2X3s2NCwzMn0gPwoKSSBj
b25zaWRlcmVkIHRoaXMuICAoSW5kZWVkIGl0J3Mgd2hhdCBJIGRvIGluIG15IG93biBhZC1ob2Mg
YnVpbGRzIG9uCm15IHdvcmtzdGF0aW9uLikgIEJ1dDoKCkZpcnN0bHkgaXQgd291bGQgaW52b2x2
ZSBtYWludGVuYW5jZSBvZiB5ZXQgYW5vdGhlciBtYXBwaW5nIG9mCmFyY2hpdGVjdHVyZSBuYW1l
cy4gIEkgaGF2ZSBtb3N0bHkgYXZvaWRlZCB0aGlzIC0gYWx0aG91Z2ggaXQgaXMKY3JlZXBpbmcg
aW4gd2l0aCBzb21lIG9mIHRoZXNlIHNwZWNpYWwgY2FzZXMsIEkgZG9uJ3QgbmVlZCBhIGNvbXBs
ZXRlCnRhYmxlLCBvbmx5IHRoZSBuYW1lcyBvZiBidXN0ZWQgYXJjaGl0ZWN0dXJlcyBhbmQgdGhl
aXIgZml4ZWQgb25lcy4KClNlY29uZGx5LCBpdCBkb2VzIG5vdCB3b3JrIGZvciBhdXRvY29uZi4g
IEZvciBhdXRvY29uZiBJIHdvdWxkIGhhdmUgdG8KcGFzcyAtLWhvc3Q9IG9yIC0tYnVpbGQ9IG9y
IHNvbWV0aGluZyBhbmQgSSB3b3VsZCBoYXZlIHRvIGhhdmUgdGhlCmNvbXBsZXRlIHNldCBvZiBh
dXRvY29uZiBhcmNoIG5hbWVzLiAgYXV0b2NvbmYgYXJjaCBuYW1lcyBjb250YWluIHRoZQpob3N0
IE9TIGFzIHdlbGwsIHdoaWNoIG1ha2VzIHRoaXMgZXZlbiBtb3JlIGFubm95aW5nLgoKVGhpcmRs
eSwgdGhlcmUgYXJlIHByb2JhYmx5IHRoaW5ncyBvdGhlciB0aGFuIGF1dG9jb25mIGFuZCBYZW4g
d2hpY2gKZm9vbGlzaGx5IHVzZSB1bmFtZS4gIEkgZGluJ3Qgd2FudCB0byBwbGF5IHdoYWNrLWEt
bW9sZSB3aXRoIHRoZW0uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
