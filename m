Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CD8C282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99860214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99860214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8f-0004QZ-D9; Mon, 22 Apr 2019 16:49:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8e-0004QU-DS
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:49:52 +0000
X-Inumbo-ID: a54112ab-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a54112ab-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:49:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64B73374;
 Mon, 22 Apr 2019 09:49:50 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5044D3F557;
 Mon, 22 Apr 2019 09:49:48 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:17 +0100
Message-Id: <20190422164937.21350-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 00/20] xen/arm: Clean-up & fixes in boot/mm code
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
Cc: sstabellini@kernel.org, Andrii_Anisov@epam.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164917.d_1PcAIyVPHBcs9VuMgeO9QWWJg8UAXXfKp7ssf8HX0@z>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGJvb3QvbWVtb3J5IHJld29y
ayBmb3IgWGVuIG9uIEFybS4gVGhpcwpwYXJ0IGNvbnRhaW5zIG1vc3RseSBjbGVhbi11cCAmIGZp
eGVzIGZvdW5kIGR1cmluZyB0aGUgcmV3b3JrLgoKVGhlIGZpcnN0IHBhcnQgb2YgdGhlIHJld29y
ayBpcyAieGVuL2FybTogVExCIGZsdXNoIGhlbHBlcnMgcmV3b3JrIiBbMV0uCgpGb3IgY29udmVu
aWVuY2UsIEkgcHJvdmlkZWQgYSBicmFuY2ggd2l0aCBhbGwgdGhlIHBhdGNoZXMgYXBwbGllZCBi
YXNlZApvbiBuZXh0LTQuMTMgKGl0IGlzIHN0YWdpbmcgKyBwYXRjaCBxdWV1ZWQgZm9yIEFybSk6
CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2p1bGllbmcveGVuLXVuc3RhYmxlLmdpdCBi
cmFuY2ggbW0vcGFydDIvdjEKCkNoZWVycywKClsxXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNC9tc2cwMTQzMi5odG1sCgoKSnVsaWVuIEdyYWxs
ICgyMCk6CiAgeGVuL2NvbnN0OiBJbnRyb2R1Y2UgX0JJVFVMIGFuZCBfQklUVUxMCiAgeGVuL2Fy
bTogUmVuYW1lIFNDVExSXyogZGVmaW5lcyBhbmQgcmVtb3ZlIHVudXNlZCBvbmUKICB4ZW4vYXJt
OiBwcm9jZXNzb3I6IFVzZSBfQklUVUwgaW5zdGVhZCBvZiBfQUMoMSwgVSkgaW4gU0NUTFJfIGRl
ZmluZXMKICB4ZW4vYXJtOiBSZXdvcmsgSFNDVExSX0JBU0UKICB4ZW4vYXJtOiBSZXdvcmsgc2Vj
b25kYXJ5X3N0YXJ0IHByb3RvdHlwZQogIHhlbi9hcm06IFJlbW92ZSBwYXJhbWV0ZXIgY3B1aWQg
ZnJvbSBzdGFydF94ZW4KICB4ZW4vYXJtNjQ6IGhlYWQ6IFJlbW92ZSB1bm5lY2Vzc2FyeSBjb21t
ZW50CiAgeGVuL2FybTY0OiBoZWFkOiBNb3ZlIGVhcmx5cHJpbnRrIG1lc3NhZ2VzIGluIC5yb2Rh
dGEuc3RyCiAgeGVuL2FybTY0OiBoZWFkOiBDb3JyZWN0bHkgcmVwb3J0IHRoZSBIVyBDUFUgSUQK
ICB4ZW4vYXJtMzI6IGhlYWQ6IENvcnJlY3RseSByZXBvcnQgdGhlIEhXIENQVSBJRAogIHhlbi9h
cm0zMjogaGVhZDogRG9uJ3Qgc2V0IE1BSVIwIGFuZCBNQUlSMQogIHhlbi9hcm0zMjogaGVhZDog
QWx3YXlzIHplcm8gcjMgYmVmb3JlIHVwZGF0ZSBhIHBhZ2UtdGFibGUgZW50cnkKICB4ZW4vYXJt
MzI6IG1tOiBBdm9pZCB0byB6ZXJvIGFuZCBjbGVhbiBjYWNoZSBmb3IgQ1BVMCBkb21oZWFwCiAg
eGVuL2FybTMyOiBtbTogQXZvaWQgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkgQ1BV
cyBwYWdlLXRhYmxlcwogIHhlbi9hcm06IG1tOiBVc2UgdGhlIHNob3J0ZXIgdmVyc2lvbiBfX2Fs
aWduZWQoUEFHRV9TSVpFKSB0byBhbGlnbgogICAgcGFnZS10YWJsZXMKICB4ZW4vYXJtOiBtbTog
UHJvdGVjdCBYZW4gcGFnZS10YWJsZSB1cGRhdGUgd2l0aCBhIHNwaW5sb2NrCiAgeGVuL2FybTog
bW06IEluaXRpYWxpemUgcGFnZS10YWJsZXMgZWFybGllcgogIHhlbi9hcm06IG1tOiBDaGVjayBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIGVuZCBpbiB7ZGVzdHJveSwKICAgIG1vZGlmeX1feGVuX21h
cHBpbmdzCiAgeGVuL2FybTogUGFpciBjYWxsIHRvIHNldF9maXhtYXAgd2l0aCBjYWxsIHRvIGNs
ZWFyX2ZpeG1hcCBpbgogICAgY29weV9mcm9tX3BhZGRyCiAgeGVuL2FybTogQWxsb3cgY2xlYW5p
bmcgdGhlIGRpcmVjdG9yeSBldmVuIHdoZW4gQ09ORklHX0VBUkxZX1BSSU5USyBpcwogICAgc2V0
CgogeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICB8ICA1ICsrKwogeGVuL2FyY2gvYXJt
L1J1bGVzLm1rICAgICAgICAgICB8ICA3IC0tLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMg
ICAgICAgfCAzMyArKysrLS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgICAg
ICAgfCA0MCArKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9ndWVzdF93YWxrLmMgICAg
ICAgfCAgMiArLQogeGVuL2FyY2gvYXJtL2tlcm5lbC5jICAgICAgICAgICB8ICAzICstCiB4ZW4v
YXJjaC9hcm0vbW0uYyAgICAgICAgICAgICAgIHwgNTcgKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgfCAgNyArKy0tCiB4ZW4vYXJjaC9h
cm0vc21wYm9vdC5jICAgICAgICAgIHwgIDQgKy0KIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAg
ICAgICAgfCAgNiArLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2RlZm5zLmggfCAgNSArKysK
IHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggICAgICAgfCAgNCArLQogeGVuL2luY2x1ZGUvYXNt
LWFybS9wcm9jZXNzb3IuaCB8IDkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vY29uc3QuaCAgICAgICAgIHwgIDMgKysKIDE0IGZpbGVz
IGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
