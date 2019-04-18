Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3E6C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43FF62183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43FF62183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xN-000254-9i; Thu, 18 Apr 2019 16:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xL-00022Y-Kb
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:11 +0000
X-Inumbo-ID: 8312bb60-61f7-11e9-ab0b-872c192ca31f
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8312bb60-61f7-11e9-ab0b-872c192ca31f;
 Thu, 18 Apr 2019 16:32:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913779"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:37 +0100
Message-ID: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 00/21] Abandon jobs which are
 unreasonably delaying their flight
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163137.zdn7phVgK8VM6sKZ0tN2UvnoJcTpBZ8sEupLMh-hOb4@z>

U29tZXRpbWVzIHdlIGZpbmQgb3Vyc2VsdmVzIHNlcmlvdXNseSBsYWNraW5nIHRoZSBjYXBhY2l0
eSB0byBydW4KcGFydGljdWxhciBqb2IocykuICBUaGUgcmVzdWx0IGNhbiBiZSB0aGF0IHRoZSB3
aG9sZSBzeXN0ZW0gc3RhbmRzCm1vc3RseSBpZGxlIHdoaWxlIGEgc21hbGwgcHJvcG9ydGlvbiBv
ZiB0aGUgcmVzb3VyY2VzIHJ1bnMgZmxhdCBvdXQKd2l0aCBhIGdpYW50IHF1ZXVlLgoKSW4gdGhp
cyBzZXJpZXMgd2UgYXJyYW5nZSBmb3Igb3NzdGVzdCB0byBiZSBhYmxlIHRvIHNwb3QgdGhpcwpo
YXBwZW5pbmcsIGFuZCBhdXRvbWF0aWNhbGx5IHJlYmFsYW5jZSBsb2FkIGJ5IGdpdmUgdXAgZWFy
bGllciBvbiB0aGUKam9icyB3aGljaCBhcmUgb3Zlcmx5LWNvbnRlbmRlZC4KClRoZXJlIGFyZSBz
b21lIHR1bmluZyBwYXJhbWV0ZXJzLCBvZiBjb3Vyc2UuICBUbyBzdW1tYXJpc2UsIEkgaGF2ZQpj
aG9zZW4gaGVyZSB0byB0cmVhdCBqb2JzIGFzIHN0YXJ2ZWQgaWYgKGZvciBleGFtcGxlKToKICBX
ZSBoYXZlIGNvbXBsZXRlZCA5MCUgb2YgdGhlIGZsaWdodCwgYW5kIHRoZSByZW1haW5pbmcgMTAl
CiAgaXMgcHJvamVjdGVkIHRvIHRha2UgNXggYXMgbG9uZyBhcyB0aGUgZmlyc3QgOTAlLgooVGhl
ICI5MCUiIGlzIGJ5IG51bWJlciBvZiBqb2JzLikgIFNlZSB0aGUgcGF0Y2gKICBzdGFydmF0aW9u
OiBJbmZyYXN0cnVjdHVyZSBmb3Igam9icyB3aGljaCBhcmUgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0
cwpmb3IgZGV0YWlscyBvZiB0aGUgaGV1cmlzdGljIGFuZCBpdHMgcGFyYW1ldGVycy4KCldoZW4g
c2l0dWF0aW9ucyBsaWtlIHRoaXMgcGVyc2lzdCBpdCB3aWxsIHN0aWxsIGJlIGdvb2QgdG8gbWFu
dWFsbHkKYmFsYW5jZSB0aGUgbG9hZCBieSBhZGp1c3RpbmcgdGhlIGpvYiBtaXggaW4gc3VibWl0
dGVkIGZsaWdodHMuICBUaGlzCmlzIGJlY2F1c2UgdGhlIHN0YXJ2YXRpb24gd2lsbCBub3QgbmVj
ZXNzYXJpbHkgZHJvcCB0aGUgc2FtZSBqb2IgaW4Kc3Vic2VxdWVudCBmbGlnaHRzIG9uIHRoZSBz
YW1lICJicmFuY2giLCBzbyBzdGFydmF0aW9uIHdpbGwgaW1wYWlyIHRoZQpyZWdyZXNzaW9uIGRl
dGVjdGlvbi4KCklhbiBKYWNrc29uICgyMSk6CiAgdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZl
OiB3aXRoIC1VLCBqdXN0IGFwcGVuZCB0byB0aGUgc2FtZSBsb2dmaWxlCiAgc2VsZWN0aG9zdDog
SG9ub3VyIG5ldyAkbm9uZV9vayBvcHRpb25hbCBwYXJhbWV0ZXIKICB0cy1sb2dzLWNhcHR1cmU6
IERvIG5vdCB0cnkgdG8gY2FwdHVyZSBsb2dzIG9mIGhvc3RzIG5vdCBhbGxvY2F0ZWQKICBhbGxv
Y19yZXNvdXJjZXM6IFN1cHBvcnQgc3BlY2lhbCBhYmFuZG9ubWVudCB2YWx1ZXMKICBzdGFydmF0
aW9uOiBUZWFjaCBzZy1yZXBvcnQtZmxpZ2h0IGFib3V0IHN0YXJ2ZWQgc3RlcCBzdGF0ZQogIHN0
YXJ2YXRpb246IFRlYWNoIGFyY2hhZW9sb2dpc3RzIGFib3V0IHN0YXJ2ZWQgam9iIHN0YXRlCiAg
c3RhcnZhdGlvbjogVGVhY2ggbXMtZmxpZ2h0cy1zdW1tYXJ5IGFib3V0IGpvYiBzdGF0ZSBzdGFy
dmVkCiAgc3RhcnZhdGlvbjogVGVhY2ggc2ctZXhlY3V0ZS1mbGlnaHQgYWJvdXQgam9iIHN0YXRl
IHN0YXJ2ZWQKICBzdGVwIGhhbmRsaW5nOiBQcmVzZXJ2ZSBzdGVwIHN0YXRlcyBzZXQgYnkgdHMt
KiBzY3JpcHRzCiAgVGVzdFN1cHBvcnQ6IE1ha2UgImJyb2tlbiIgcHJpbnQgdGhlIGFjdHVhbCBq
b2Igc3RhdGUKICBKb2JEQjo6RXhlY3V0aXZlOiBzdGVwXyo6IGZpeCBsb2cgbWVzc2FnZXMgdG8g
dGFsayBhYm91dCAic3RlcHMiCiAgc3RhcnZhdGlvbjogUGVybWl0IHN0ZXBfZmluaXNoIHRvIHNl
dCB0aGUgc3RhdGUgYHN0YXJ2ZWQnCiAgVGVzdFN1cHBvcnQ6IE1ha2UgImJyb2tlbiIgc2V0IHRo
ZSBzdGVwIHN0YXRlIHRvbwogIHRjbC9Kb2JEQi1FeGVjdXRpdmU6IERvIG5vdCBzcXVhc2ggInN0
YXJ2ZWQiIHN0YXR1cwogIHN0YXJ2YXRpb246IFByb3BhZ2F0ZSBzdGFydmVkIGpvYiBzdGF0dXMg
aW50byBkZXBlbmRlbnQgam9icwogIHRzLWhvc3QtYWxsb2NhdGUtRXhlY3V0aXZlOiBCcmVhayBv
dXQgJG5vdyBhbmQgYWRkIGEgbmV3bGluZQogIHN0YXJ2YXRpb246IFVzZSAic3RhcnZlZCIgZm9y
IGhvc3RhbGxvY19tYXh3YWl0X21heAogIHN0YXJ2YXRpb246IEluZnJhc3RydWN0dXJlIGZvciBq
b2JzIHdoaWNoIGFyZSBkZWxheWluZyB0aGVpciBmbGlnaHRzCiAgc3RhcnZhdGlvbjogQWJhbmRv
biBqb2JzIHdoaWNoIGFyZSB1bnJlYXNvbmFibHkgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0CiAgaG9z
dGFsbG9jX21heHdhaXRfbWF4OiBVc2Ugc3RhcnZhdGlvbiBtb3N0X29wdGltaXN0aWMKICBzdGFy
dmF0aW9uOiBCZXR0ZXIgbG9nZ2luZy9kZWJ1Z2dpbmcgb3V0cHV0CgogT3NzdGVzdC9FeGVjdXRp
dmUucG0gICAgICAgICB8ICA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogT3NzdGVz
dC9Kb2JEQi9FeGVjdXRpdmUucG0gICB8ICAgOCArKy0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0g
ICAgICAgfCAgMjQgKysrKysrLS0KIG1nLWhvc3RhbGxvYy1zdGFydmF0aW9uLWRlbW8gfCAgNTMg
KysrKysrKysrKysrKysrKwogbXMtZmxpZ2h0cy1zdW1tYXJ5ICAgICAgICAgICB8ICAgOSArLS0K
IHNnLWV4ZWN1dGUtZmxpZ2h0ICAgICAgICAgICAgfCAgIDIgKy0KIHNnLXJlcG9ydC1mbGlnaHQg
ICAgICAgICAgICAgfCAgMTcgKysrKystCiB0Y2wvSm9iREItRXhlY3V0aXZlLnRjbCAgICAgIHwg
ICA2ICstCiB0cy1ob3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUgIHwgMTQyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHRzLWxvZ3MtY2FwdHVyZSAgICAgICAgICAg
ICAgfCAgIDcgKystCiAxMCBmaWxlcyBjaGFuZ2VkLCAzMjggaW5zZXJ0aW9ucygrKSwgMzUgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgbWctaG9zdGFsbG9jLXN0YXJ2YXRpb24tZGVt
bwoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
