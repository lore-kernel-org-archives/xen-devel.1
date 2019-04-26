Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C59CC4321A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:40:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14EF1206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14EF1206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK2wz-0001gv-KP; Fri, 26 Apr 2019 15:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uV9E=S4=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hK2wy-0001gg-5z
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:39:44 +0000
X-Inumbo-ID: 80562f5e-6839-11e9-8f00-77509408f6ac
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80562f5e-6839-11e9-8f00-77509408f6ac;
 Fri, 26 Apr 2019 15:39:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hK2wr-0001kI-Dr; Fri, 26 Apr 2019 15:39:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hK2wr-0002Qm-4p; Fri, 26 Apr 2019 15:39:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hK2wr-0006IS-4B; Fri, 26 Apr 2019 15:39:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135318-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=20029ca22baaeb9418c1fd9df88d12d32d585cb6
X-Osstest-Versions-That: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Apr 2019 15:39:37 +0000
Subject: [Xen-devel] [ovmf test] 135318: all pass - PUSHED
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426153937.1WUBvmsVOHcTioSUKyN4efkKirE_UhSsnZ5e2gUAz70@z>

ZmxpZ2h0IDEzNTMxOCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUzMTgvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICAyMDAyOWNhMjJiYWFlYjk0MThjMWZkOWRmODhkMTJk
MzJkNTg1Y2I2CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBjMmY2NDM0
NzllYjNmMDBkOTMwYzQ2MWNkZWMzYmE0MjBhMzYwNzJjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzQ5NzcgIDIwMTktMDQtMTkgMDQ6MDI6NTQgWiAgICA3IGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTM1MDgxICAyMDE5LTA0LTIyIDAxOjQyOjU0IFogICAgNCBkYXlzICAgMTkgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTM1Mjk1ICAyMDE5LTA0LTI1IDEzOjQxOjI1IFogICAgMSBk
YXlzICAgIDQgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgQWFyb24gQW50b25lIDxhYW50b25AbWljcm9zb2Z0LmNvbT4KICBBcmQgQmllc2hl
dXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KICBDaGFzZWwgQ2hpdSA8Y2hhc2VsLmNo
aXVAaW50ZWwuY29tPgogIENocmlzdGlhbiBSb2RyaWd1ZXogPGNocmlzdGlhbi5yb2RyaWd1ZXpA
aW50ZWwuY29tPgogIERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICBGYW4sIFpoaWp1
WCA8emhpanV4LmZhbkBpbnRlbC5jb20+CiAgSGFvIFd1IDxoYW8uYS53dUBpbnRlbC5jb20+CiAg
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBNYXJjaW4gV29qdGFzIDxtd0BzZW1p
aGFsZi5jb20+CiAgUmViZWNjYSBDcmFuIDxyZWJlY2NhQGJsdWVzdG9wLm9yZz4KICByZWJlY2Nh
IHZpYSBHcm91cHMuSW8gPHJlYmVjY2E9Ymx1ZXN0b3Aub3JnQGdyb3Vwcy5pbz4KICBSb2RyaWd1
ZXosIENocmlzdGlhbiA8Y2hyaXN0aWFuLnJvZHJpZ3VlekBpbnRlbC5jb20+CiAgU2hlbmdsZWkg
WmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBUaW5nIFllIDx0aW5nLnllQGludGVs
LmNvbT4KICBYdWUgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29tPgogIFh1ZSwg
U2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29tPgogIFllLCBUaW5nIDx0aW5nLnll
QGludGVsLmNvbT4KICBZdW5odWEgRmVuZyA8eXVuaHVheC5mZW5nQGludGVsLmNvbT4KICBaaGlj
aGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBp
bnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
cHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92
bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9s
b2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBl
dGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9z
c3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTto
Yj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJl
dmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5n
aXQKICAgYzJmNjQzNDc5ZS4uMjAwMjljYTIyYiAgMjAwMjljYTIyYmFhZWI5NDE4YzFmZDlkZjg4
ZDEyZDMyZDU4NWNiNiAtPiB4ZW4tdGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
