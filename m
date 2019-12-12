Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2254DC43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 21:12:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC782214D8
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 21:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC782214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifVk8-00067k-Ba; Thu, 12 Dec 2019 21:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pArv=2C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ifVk7-00067f-3M
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 21:11:27 +0000
X-Inumbo-ID: f37d80fb-1d23-11ea-8e25-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f37d80fb-1d23-11ea-8e25-12813bfff9fa;
 Thu, 12 Dec 2019 21:11:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ifVk4-00010t-6B; Thu, 12 Dec 2019 21:11:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ifVk3-0007L7-UQ; Thu, 12 Dec 2019 21:11:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ifVk3-0004y3-Tm; Thu, 12 Dec 2019 21:11:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-144743-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: xtf=27c415ad6e4a48eb3aac6e9d0adc6d0ef04d40cf
X-Osstest-Versions-That: xtf=08a19af3c78e8a03f83bc354b50545136c03edd2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Dec 2019 21:11:23 +0000
Subject: [Xen-devel] [xtf test] 144743: all pass - PUSHED
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

ZmxpZ2h0IDE0NDc0MyB4dGYgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDc0My8KClBlcmZlY3QgOi0pCkFsbCB0ZXN0cyBpbiB0
aGlzIGZsaWdodCBwYXNzZWQgYXMgcmVxdWlyZWQKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGlu
ZzoKIHh0ZiAgICAgICAgICAgICAgICAgIDI3YzQxNWFkNmU0YTQ4ZWIzYWFjNmU5ZDBhZGM2ZDBl
ZjA0ZDQwY2YKYmFzZWxpbmUgdmVyc2lvbjoKIHh0ZiAgICAgICAgICAgICAgICAgIDA4YTE5YWYz
Yzc4ZThhMDNmODNiYzM1NGI1MDU0NTEzNmMwM2VkZDIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0
MzcyMSAgMjAxOS0xMS0wNCAxMzoyNDo0MiBaICAgMzggZGF5cwpGYWlsaW5nIHNpbmNlICAgICAg
ICAxNDQzNTUgIDIwMTktMTEtMjggMjM6Mzg6NTQgWiAgIDEzIGRheXMgICAgNCBhdHRlbXB0cwpU
ZXN0aW5nIHNhbWUgc2luY2UgICAxNDQ3NDMgIDIwMTktMTItMTEgMjI6MTA6MDcgWiAgICAwIGRh
eXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIg
dGVzdDoKICBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKam9iczoK
IGJ1aWxkLWFtZDY0LXh0ZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QteHRmLWFtZDY0
LWFtZDY0LTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
dGVzdC14dGYtYW1kNjQtYW1kNjQtMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiB0ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC0zICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QteHRmLWFtZDY0LWFtZDY0LTQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC14dGYtYW1kNjQt
YW1kNjQtNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwps
b2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29u
ZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0
cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0
ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9Ymxv
YjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAog
ICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkK
CgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L3h0
Zi5naXQKICAgMDhhMTlhZi4uMjdjNDE1YSAgMjdjNDE1YWQ2ZTRhNDhlYjNhYWM2ZTlkMGFkYzZk
MGVmMDRkNDBjZiAtPiB4ZW4tdGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
