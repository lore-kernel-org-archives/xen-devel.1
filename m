Return-Path: <SRS0=h4f+=V2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBAFC433FF
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 13:19:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88EF2070B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 13:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88EF2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Yp-0004W4-L1; Mon, 29 Jul 2019 13:19:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZKY6=V2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hs5Yn-0004Vq-Io
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:19:29 +0000
X-Inumbo-ID: 7cde296f-b203-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7cde296f-b203-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:19:27 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 09:19:18 -0400
Message-ID: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.27.12.5]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
Subject: [Xen-devel] [PATCH v2 0/2] Raspberry Pi 4 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHNlcmllcyB0byBlbmFibGUgVUFSVCBjb25zb2xlIGZvciBSYXNwYmVycnkgUGkg
NC4gTm90ZSB0aGF0IEknbSByZWx5aW5nIG9uIHRoZSBmaXJtd2FyZSB0byBpbml0aWFsaXplIHRo
ZSBVQVJUIChpLmUuIGVuYWJsZV91YXJ0PTEgaW4gY29uZmlnLnR4dCksIHNpbmNlIGZ1bGwgVUFS
VCBpbml0aWFsaXphdGlvbiBvbiB0aGlzIHBsYXRmb3JtIHJlcXVpcmVzIGFjY2Vzc2luZyBzb21l
IHJlZ2lzdGVycyBvdXRzaWRlIHRoZSByYW5nZSBzcGVjaWZpZWQgaW4gdGhlIGJyY20sYmNtMjgz
NS1hdXgtdWFydCBub2RlLgoKSSBoYXZlIGJlZW4gYWJsZSB0byBnZXQgWGVuK2RvbTArZG9tVXMg
Ym9vdGluZy4gVGVzdGVkIHdpdGggWGVuIDQuMTIgYW5kIDQuMTMtdW5zdGFibGUgKGI0YzhhMjdk
NWIpIGFuZCBMaW51eCA0LjE5LnkgKFJhc3BiZXJyeSBQaSBsaW51eCB0cmVlICsgYSBjb3VwbGUg
b2YgcGF0Y2hlcykuIFBsZWFzZSBzZWUgWzFdIGZvciBidWlsZCBpbnN0cnVjdGlvbnMgYW5kIGxp
bWl0YXRpb25zLgoKTmV3IGluIHYyOgoqIERyb3AgZWFybHkgcHJpbnRrIGFsaWFzCiogU2V0IHJl
Zy1zaGlmdCBhbmQgcmVnLWlvLXdpZHRoIGluIHRoZSBYZW4gZHJpdmVyCiogQmxhY2tsaXN0IG90
aGVyIGF1eCBwZXJpcGhlcmFscyBpbiBwbGF0Zm9ybSBzZXR0aW5ncyAoc3BpMSwgc3BpMiwgYW5k
IGEgY291cGxlIG9mIGJhc2UgYXV4IHJlZ2lzdGVycykKClRoYW5rcywKU3Rld2FydCBIaWxkZWJy
YW5kCkRvcm5lcldvcmtzLCBMdGQKClsxXSBodHRwczovL2dpdGh1Yi5jb20vZG9ybmVyd29ya3Mv
eGVuLXJwaTQtYnVpbGRlcgoKU3Rld2FydCBIaWxkZWJyYW5kICgyKToKICBuczE2NTUwOiBBZGQg
Y29tcGF0aWJsZSBzdHJpbmcgZm9yIFJhc3BiZXJyeSBQaSA0CiAgeGVuL2FybTogcGxhdGZvcm06
IEFkZCBSYXNwYmVycnkgUGkgcGxhdGZvcm0KCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2Vm
aWxlICAgICAgICAgICAgfCAgMSArCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJl
cnJ5LXBpLmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vZHJpdmVycy9jaGFyL25z
MTY1NTAuYyAgICAgICAgICAgICAgICAgfCAgNyArKysKIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJj
bS1yYXNwYmVycnktcGkuYwoKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
