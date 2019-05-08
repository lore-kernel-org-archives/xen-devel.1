Return-Path: <SRS0=jkfT=TI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9963FC04A6B
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:08:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7327720850
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7327720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMIp-0006T8-PM; Wed, 08 May 2019 13:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMIo-0006T1-PJ
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:08:06 +0000
X-Inumbo-ID: 50d78a5e-7192-11e9-8b05-7b4590507492
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50d78a5e-7192-11e9-8b05-7b4590507492;
 Wed, 08 May 2019 13:08:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:08:04 -0600
Message-Id: <5CD2D4B2020000780022CD37@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:08:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 04/12] x86/IRQ: improve dump_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190508130802.OHdxahZqc-Y3KnSBA6Bl9DkAtZdW643aj5P1RTuNLjk@z>

RG9uJ3QgbG9nIGEgc3RyYXkgdHJhaWxpbmcgY29tbWEuIFNob3J0ZW4gYSBmZXcgZmllbGRzLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJj
aC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0yMzI4LDcgKzIzMjgsNyBA
QCBzdGF0aWMgdm9pZCBkdW1wX2lycXModW5zaWduZWQgY2hhciBrZXkpCiAKICAgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKIAotICAgICAgICBwcmludGsoIiAg
IElSUTolNGQgYWZmaW5pdHk6JSpwYiB2ZWM6JTAyeCB0eXBlPSUtMTVzIHN0YXR1cz0lMDh4ICIs
CisgICAgICAgIHByaW50aygiICAgSVJROiU0ZCBhZmY6JSpwYiB2ZWM6JTAyeCAlLTE1cyBzdGF0
dXM9JTAzeCAiLAogICAgICAgICAgICAgICAgaXJxLCBucl9jcHVfaWRzLCBjcHVtYXNrX2JpdHMo
ZGVzYy0+YWZmaW5pdHkpLCBkZXNjLT5hcmNoLnZlY3RvciwKICAgICAgICAgICAgICAgIGRlc2Mt
PmhhbmRsZXItPnR5cGVuYW1lLCBkZXNjLT5zdGF0dXMpOwogCkBAIC0yMzM5LDIzICsyMzM5LDIx
IEBAIHN0YXRpYyB2b2lkIGR1bXBfaXJxcyh1bnNpZ25lZCBjaGFyIGtleSkKICAgICAgICAgewog
ICAgICAgICAgICAgYWN0aW9uID0gKGlycV9ndWVzdF9hY3Rpb25fdCAqKWRlc2MtPmFjdGlvbjsK
IAotICAgICAgICAgICAgcHJpbnRrKCJpbi1mbGlnaHQ9JWQgZG9tYWluLWxpc3Q9IiwgYWN0aW9u
LT5pbl9mbGlnaHQpOworICAgICAgICAgICAgcHJpbnRrKCJpbi1mbGlnaHQ9JWQlYyIsCisgICAg
ICAgICAgICAgICAgICAgYWN0aW9uLT5pbl9mbGlnaHQsIGFjdGlvbi0+bnJfZ3Vlc3RzID8gJyAn
IDogJ1xuJyk7CiAKLSAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVz
dHM7IGkrKyApCisgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3Rz
OyApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaV07
CisgICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaSsrXTsKICAgICAgICAgICAgICAg
ICBwaXJxID0gZG9tYWluX2lycV90b19waXJxKGQsIGlycSk7CiAgICAgICAgICAgICAgICAgaW5m
byA9IHBpcnFfaW5mbyhkLCBwaXJxKTsKLSAgICAgICAgICAgICAgICBwcmludGsoIiV1OiUzZCgl
YyVjJWMpIiwKKyAgICAgICAgICAgICAgICBwcmludGsoImQlZDolM2QoJWMlYyVjKSVjIiwKICAg
ICAgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBwaXJxLAogICAgICAgICAgICAgICAg
ICAgICAgICBldnRjaG5fcG9ydF9pc19wZW5kaW5nKGQsIGluZm8tPmV2dGNobikgPyAnUCcgOiAn
LScsCiAgICAgICAgICAgICAgICAgICAgICAgIGV2dGNobl9wb3J0X2lzX21hc2tlZChkLCBpbmZv
LT5ldnRjaG4pID8gJ00nIDogJy0nLAotICAgICAgICAgICAgICAgICAgICAgICAoaW5mby0+bWFz
a2VkID8gJ00nIDogJy0nKSk7Ci0gICAgICAgICAgICAgICAgaWYgKCBpICE9IGFjdGlvbi0+bnJf
Z3Vlc3RzICkKLSAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCIsIik7CisgICAgICAgICAgICAg
ICAgICAgICAgIGluZm8tPm1hc2tlZCA/ICdNJyA6ICctJywKKyAgICAgICAgICAgICAgICAgICAg
ICAgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzID8gJywnIDogJ1xuJyk7CiAgICAgICAgICAgICB9Ci0K
LSAgICAgICAgICAgIHByaW50aygiXG4iKTsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICgg
ZGVzYy0+YWN0aW9uICkKICAgICAgICAgICAgIHByaW50aygiJXBzKClcbiIsIGRlc2MtPmFjdGlv
bi0+aGFuZGxlcik7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
