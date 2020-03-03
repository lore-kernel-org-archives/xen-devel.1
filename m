Return-Path: <SRS0=Wnau=4U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31849C3F2C6
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 12:28:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0743920863
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 12:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0743920863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j96eR-0004Ne-S0; Tue, 03 Mar 2020 12:27:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j96eR-0004NZ-6P
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 12:27:55 +0000
X-Inumbo-ID: 67405ddb-5d4a-11ea-a14a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67405ddb-5d4a-11ea-a14a-12813bfff9fa;
 Tue, 03 Mar 2020 12:27:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7DD7ACD7;
 Tue,  3 Mar 2020 12:27:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  3 Mar 2020 13:27:50 +0100
Message-Id: <20200303122750.26996-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBvbmxpbmluZyBhIGNwdSBjcHVwb29sX2NwdV9hZGQoKSBjaGVja3Mgd2hldGhlciBhbGwg
c2libGluZ3Mgb2YKdGhlIG5ldyBjcHUgYXJlIGZyZWUgaW4gb3JkZXIgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gYWRkIGl0IHRvIGNwdXBvb2wwLgpJbiBjYXNlIHRoZSBhZGRlZCBjcHUgaXMgbm90IHRo
ZSBsYXN0IHNpYmxpbmcgdG8gYmUgb25saW5lZCB0aGlzIHRlc3QKaXMgd3JvbmcgYXMgaXQgb25s
eSBjaGVja3MgZm9yIGFsbCBvbmxpbmUgc2libGluZ3MgdG8gYmUgZnJlZS4gVGhlCnRlc3Qgc2hv
dWxkIGluY2x1ZGUgdGhlIGNoZWNrIGZvciB0aGUgbnVtYmVyIG9mIHNpYmxpbmdzIGhhdmluZwpy
ZWFjaGVkIHRoZSBzY2hlZHVsaW5nIGdyYW51bGFyaXR5IG9mIGNwdXBvb2wwLCB0b28uCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9zY2hlZC9jcHVwb29sLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5j
IGIveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKaW5kZXggOWY3MGM3ZWMxNy4uNGE2N2RmODU4
NCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1v
bi9zY2hlZC9jcHVwb29sLmMKQEAgLTYxNiw3ICs2MTYsOCBAQCBzdGF0aWMgaW50IGNwdXBvb2xf
Y3B1X2FkZCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIGdldF9zY2hlZF9yZXMoY3B1KS0+Y3B1cG9v
bCA9IE5VTEw7CiAKICAgICBjcHVzID0gc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGNwdXBvb2wwLT5n
cmFuLCBjcHUpOwotICAgIGlmICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9j
cHVzKSApCisgICAgaWYgKCBjcHVtYXNrX3N1YnNldChjcHVzLCAmY3B1cG9vbF9mcmVlX2NwdXMp
ICYmCisgICAgICAgICBjcHVtYXNrX3dlaWdodChjcHVzKSA+PSBjcHVwb29sX2dldF9ncmFudWxh
cml0eShjcHVwb29sMCkgKQogICAgICAgICByZXQgPSBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2Vk
KGNwdXBvb2wwLCBjcHUpOwogCiAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9j
ayk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
