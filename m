Return-Path: <SRS0=j2vx=45=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7B7C2BB1D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2020 08:29:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C81F4206F1
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2020 08:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C81F4206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCJCo-0004tj-JZ; Thu, 12 Mar 2020 08:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCJCn-0004tZ-EH
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 08:28:37 +0000
X-Inumbo-ID: 775946b2-643b-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 775946b2-643b-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 08:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BB42B166;
 Thu, 12 Mar 2020 08:28:34 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 09:28:27 +0100
Message-Id: <20200312082831.22280-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v5 0/4] xen/rcu: let rcu work better with core
 scheduling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIFJDVSBoYW5kbGluZyBpbiBYZW4gaXMgYWZmZWN0aW5nIHNjaGVkdWxpbmcgaW4g
c2V2ZXJhbCB3YXlzLgpJdCBpcyByYWlzaW5nIHNjaGVkIHNvZnRpcnFzIHdpdGhvdXQgYW55IHJl
YWwgbmVlZCBhbmQgaXQgcmVxdWlyZXMKdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNo
IGludGVyYWN0cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KClRoaXMgc21hbGwgc2VyaWVz
IHJlcGFpcnMgdGhvc2UgaXNzdWVzLgoKQWRkaXRpb25hbGx5IHNvbWUgQVNTRVJUKClzIGFyZSBh
ZGRlZCBmb3IgdmVyaWZpY2F0aW9uIG9mIHNhbmUgcmN1CmhhbmRsaW5nLiBJbiBvcmRlciB0byBh
dm9pZCB0aG9zZSB0cmlnZ2VyaW5nIHJpZ2h0IGF3YXkgdGhlIG9idmlvdXMKdmlvbGF0aW9ucyBh
cmUgZml4ZWQuIFRoaXMgaW5jbHVkZXMgbWFraW5nIHJjdSBsb2NraW5nIGZ1bmN0aW9ucyB0eXBl
CnNhZmUuCgpDaGFuZ2VzIGluIFY1OgotIGRyb3BwZWQgYWxyZWFkeSBjb21taXR0ZWQgcGF0Y2hl
cyAxIGFuZCA0Ci0gZml4ZWQgcmFjZQotIHJld29yayBibG9ja2luZyBvZiByY3UgcHJvY2Vzc2lu
ZyB3aXRoIGhlbGQgcmN1IGxvY2tzCgpDaGFuZ2VzIGluIFY0OgotIHBhdGNoIDU6IHVzZSBiYXJy
aWVyKCkKCkNoYW5nZXMgaW4gVjM6Ci0gdHlwZSBzYWZlIGxvY2tpbmcgZnVuY3Rpb25zIChmdW5j
dGlvbnMgaW5zdGVhZCBvZiBtYWNyb3MpCi0gcGVyLWxvY2sgZGVidWcgYWRkaXRpb25zCi0gbmV3
IHBhdGNoZXMgNCBhbmQgNgotIGZpeGVkIHJhY2VzCgpDaGFuZ2VzIGluIFYyOgotIHVzZSBnZXRf
Y3B1X21hcHMoKSBpbiByY3VfYmFycmllcigpIGhhbmRsaW5nCi0gYXZvaWQgcmVjdXJzaW9uIGlu
IHJjdV9iYXJyaWVyKCkgaGFuZGxpbmcKLSBuZXcgcGF0Y2hlcyAzIGFuZCA0CgpKdWVyZ2VuIEdy
b3NzICg0KToKICB4ZW4vcmN1OiBkb24ndCB1c2Ugc3RvcF9tYWNoaW5lX3J1bigpIGZvciByY3Vf
YmFycmllcigpCiAgeGVuOiBkb24ndCBwcm9jZXNzIHJjdSBjYWxsYmFja3Mgd2hlbiBob2xkaW5n
IGEgcmN1X3JlYWRfbG9jaygpCiAgeGVuL3JjdTogYWRkIGFzc2VydGlvbnMgdG8gZGVidWcgYnVp
bGQKICB4ZW4vcmN1OiBhZGQgcGVyLWxvY2sgY291bnRlciBpbiBkZWJ1ZyBidWlsZHMKCiB4ZW4v
Y29tbW9uL211bHRpY2FsbC5jICAgICB8ICAxICsKIHhlbi9jb21tb24vcHJlZW1wdC5jICAgICAg
IHwgIDUgKystCiB4ZW4vY29tbW9uL3JjdXBkYXRlLmMgICAgICB8IDk0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9jb21tb24vc29mdGlycS5jICAg
ICAgIHwgMTQgKysrKysrLQogeGVuL2NvbW1vbi93YWl0LmMgICAgICAgICAgfCAgMSArCiB4ZW4v
aW5jbHVkZS94ZW4vcmN1cGRhdGUuaCB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25z
KC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
