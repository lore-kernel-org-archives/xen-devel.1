Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E89C433EF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:34:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F0C21924
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F0C21924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7G3X-0006Zz-Ch; Mon, 09 Sep 2019 09:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7G3W-0006Zb-EF
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 09:33:54 +0000
X-Inumbo-ID: e9b6a149-d2e4-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9b6a149-d2e4-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 09:33:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FFD7B661;
 Mon,  9 Sep 2019 09:33:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 11:33:35 +0200
Message-Id: <20190909093339.7134-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/4] xen/sched: use new idle scheduler for
 free cpus
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgdGhyZWUgcGF0Y2hlcyBoYXZlIGJlZW4gY2FydmVkIG91dCBmcm9tIG15IGNvcmUgc2No
ZWR1bGluZyBzZXJpZXMKYXMgdGhleSBhcmUgc3VmZmljaWVudGx5IGluZGVwZW5kZW50IHRvIGJl
IGFwcGxpZWQgZXZlbiB3aXRob3V0IHRoZSBiaWcKc2VyaWVzLgoKV2l0aG91dCB0aGlzIGxpdHRs
ZSBzZXJpZXMgdGhlcmUgYXJlIG1lc3NhZ2VzIGxpa2UgdGhlIGZvbGxvd2luZyB0byBiZQpzZWVu
IG9uIHRoZSBjb25zb2xlIHdoZW4gYm9vdGluZyB3aXRoIHNtdD0wOgoKKFhFTikgQWRkaW5nIGNw
dSAxIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikgQ1BV
IDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikg
Q1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KCkJ5IGFzc2lnbmluZyBjcHVzIHRvIENwdXBvb2wtMCBv
bmx5IGFmdGVyIGFsbCBjcHVzIGFyZSB1cCBhbmQgYnkgbm90CnVzaW5nIHRoZSBtb3JlIGNvbXBs
aWNhdGVkIGNyZWRpdDIgc2NoZWR1bGVyIGZvciBjcHVzIG5vdCBpbiBhbnkKY3B1cG9vbCB0aGlz
IHNpdHVhdGlvbiBjYW4gc2ltcGx5IG5vIGxvbmdlciBoYXBwZW4sIGFzIHBhcmtpbmcgdGhlIG5v
dAp0byBiZSBzdGFydGVkIHRocmVhZHMgaXMgZG9uZSBiZWZvcmUuCgpDaGFuZ2VzIGluIFYzOgot
IHVzZSBaRVJPX0JMT0NLX1BUUiAoUGF0Y2ggMykKLSBhZGQgcGF0Y2ggNAoKQ2hhbmdlcyBpbiBW
MjoKLSBjb21taXQgbWVzc2FnZXMgdXBkYXRlZAotIHJlbmFtZWQgZnVuY3Rpb25zIChQYXRjaCAy
KQoKSnVlcmdlbiBHcm9zcyAoNCk6CiAgeGVuL3NjaGVkOiBwb3B1bGF0ZSBjcHVwb29sMCBvbmx5
IGFmdGVyIGFsbCBjcHVzIGFyZSB1cAogIHhlbi9zY2hlZDogcmVtb3ZlIGNwdSBmcm9tIHBvb2ww
IGJlZm9yZSByZW1vdmluZyBpdAogIHhlbi9zY2hlZDogYWRkIG1pbmltYWxpc3RpYyBpZGxlIHNj
aGVkdWxlciBmb3IgZnJlZSBjcHVzCiAgeGVuL3NjaGVkOiBzd2l0Y2ggdG8gZGVidWd0cmFjZSBp
biBjcHVwb29sIGhhbmRsaW5nCgogeGVuL2NvbW1vbi9jcHVwb29sLmMgICAgICAgfCAyMjggKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdC5jICB8ICAgOSAtLQogeGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgICAgfCAgIDcg
LS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgMTcyICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgICAyICsKIDUgZmls
ZXMgY2hhbmdlZCwgMjI5IGluc2VydGlvbnMoKyksIDE4OSBkZWxldGlvbnMoLSkKCi0tIAoyLjE2
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
