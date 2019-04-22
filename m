Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F153C282E1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 05:13:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D83D20811
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 05:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D83D20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIRFs-0000Sw-0V; Mon, 22 Apr 2019 05:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AvqV=SY=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hIRFq-0000Si-6i
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 05:12:34 +0000
X-Inumbo-ID: 39230db6-64bd-11e9-8c6a-bfb9778d939e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39230db6-64bd-11e9-8c6a-bfb9778d939e;
 Mon, 22 Apr 2019 05:12:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hIRFi-0006gR-QF; Mon, 22 Apr 2019 05:12:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hIRFi-0005nT-Jv; Mon, 22 Apr 2019 05:12:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hIRFi-0000vq-JG; Mon, 22 Apr 2019 05:12:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135081-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-pvops:kernel-build:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=b29e6365c37f60c1e3757bc1fde448102e98854c
X-Osstest-Versions-That: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Apr 2019 05:12:26 +0000
Subject: [Xen-devel] [ovmf test] 135081: regressions - FAIL
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
Message-ID: <20190422051226.xlUh1fk9CnWHYPx4g70oxjuN9CrTu0U5mH19enOeJV8@z>

ZmxpZ2h0IDEzNTA4MSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUwODEvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgIDYga2Vy
bmVsLWJ1aWxkICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDk3NwoKVGVzdHMgd2hpY2gg
ZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtaTM4Ni14
bC1xZW11dS1vdm1mLWFtZDY0ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICAgICAgICBibG9ja2Vk
IG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAg
IGIyOWU2MzY1YzM3ZjYwYzFlMzc1N2JjMWZkZTQ0ODEwMmU5ODg1NGMKYmFzZWxpbmUgdmVyc2lv
bjoKIG92bWYgICAgICAgICAgICAgICAgIGMyZjY0MzQ3OWViM2YwMGQ5MzBjNDYxY2RlYzNiYTQy
MGEzNjA3MmMKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzNDk3NyAgMjAxOS0wNC0xOSAwNDowMjo1
NCBaICAgIDMgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzUwODEgIDIwMTktMDQtMjIgMDE6
NDI6NTQgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBYdWUgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50
ZWwuY29tPgogIFh1ZSwgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29tPgoKam9i
czoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1w
dm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAg
CiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9z
c3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdl
czogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxh
YmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xv
Z3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVy
YWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0Lmdp
dDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0
IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KY29tbWl0
IGIyOWU2MzY1YzM3ZjYwYzFlMzc1N2JjMWZkZTQ0ODEwMmU5ODg1NGMKQXV0aG9yOiBYdWUsIFNo
ZW5nZmVuZ1ggPHNoZW5nZmVuZ3gueHVlQGludGVsLmNvbT4KRGF0ZTogICBUaHUgQXByIDE4IDE4
OjEzOjIyIDIwMTkgKzA4MDAKCiAgICBOZXR3b3JrUGtnL1VlZmlQeGVCY0R4ZTpBZGQgdHdvIFBD
RCB0byBjb250cm9sIFBYRS4KICAgIAogICAgUkVGOmh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3Jl
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY5NQogICAgCiAgICBTZXR1cCBuZWVkIHByb3ZpZGUgYW4g
aXRlbSBmb3IgdXNlciB0byBjb250cm9sIElQVjQ2IFBYRSBib290LgogICAgT3JpZ2luIFVlZmlQ
eGVCY0R4ZSBkcml2ZXIgZG9lc24ndCBoYXZlIHN1Y2ggaW50ZXJmYWNlLgogICAgVGhpcyBjaGFu
Z2UgYWRkZWQgdHdvIFBDRCB0byBjb250cm9sIElQVjQvNiBQWEUgaW4gUHhlQmNTdXBwb3J0ZWQo
KS4KICAgIFBsYXRmb3JtIGNvZGUgc2hvdWxkIG92ZXJyaWRlIHRoaXMgdHdvIFBDRCBhY2NvcmRp
bmcgdG8gU2V0dXAgdmFsdWUuCiAgICBjb2RlIGNoYW5nZSBubyBzaWRlIGVmZmVjdCBvbiBjdXJy
ZW50IFBYRSBmdW5jdGlvbiB3aXRoIGRlZmF1bHQgUENELgogICAgCiAgICBTaWduZWQtb2ZmLWJ5
OiBYdWUgU2hlbmdmZW5nWCA8c2hlbmdmZW5neC54dWVAaW50ZWwuY29tPgogICAgQ2M6IFNpeXVh
biBGdSA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICAgIENjOiBKaWF4aW4gV3UgPGppYXhpbi53dUBp
bnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogU2l5dWFuIEZ1IDxzaXl1YW4uZnVAaW50ZWwuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
