Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D59C04AB6
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 09:54:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30A52672D
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 09:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30A52672D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeEN-0005i6-Mf; Fri, 31 May 2019 09:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeEL-0005hi-S0
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:53:45 +0000
X-Inumbo-ID: f92a6736-8389-11e9-a346-c7d6252199ef
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f92a6736-8389-11e9-a346-c7d6252199ef;
 Fri, 31 May 2019 09:53:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 03:53:41 -0600
Message-Id: <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 03:53:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
In-Reply-To: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH RFC 3/4] Arm64: further speed-up to hweight{32,
 64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190531095339.n0sdf7yr8q9-mzfeqa3poVK0y3Z-pOI4GZ9VqUDEsxM@z>

QWNjb3JkaW5nIHRvIExpbnV4IGNvbW1pdCBlNzViZWYyYTRmICgiYXJtNjQ6IFNlbGVjdApBUkNI
X0hBU19GQVNUX01VTFRJUExJRVIiKSB0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVy
IHRoZQp2YXJpYW50IHVzaW5nIG9ubHkgYml0d2lzZSBvcGVyYXRpb25zIG9uIGF0IGxlYXN0IHNv
bWUgaGFyZHdhcmUsIGFuZCBubwp3b3JzZSBvbiBvdGhlci4KClN1Z2dlc3RlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KUkZDOiBUbyBiZSBob25lc3QgSSdtIG5vdCBm
dWxseSBjb252aW5jZWQgdGhpcyBpcyBhIHdpbiBpbiBwYXJ0aWN1bGFyIGluCiAgICAgdGhlIGh3
ZWlnaHQzMigpIGNhc2UsIGFzIHRoZXJlJ3Mgbm8gYWN0dWFsIHNoaWZ0IGluc24gd2hpY2ggZ2V0
cwogICAgIHJlcGxhY2VkIGJ5IHRoZSBtdWx0aXBsaWNhdGlvbi4gRXZlbiBmb3IgaHdlaWdodDY0
KCkgdGhlIGNvbXBpbGVyCiAgICAgY291bGQgZW1pdCBiZXR0ZXIgY29kZSBhbmQgYXZvaWQgdGhl
IGV4cGxpY2l0IHNoaWZ0IGJ5IDMyICh3aGljaCBpdAogICAgIGVtaXRzIGF0IGxlYXN0IGZvciBt
ZSkuCgotLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZworKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
ZwpAQCAtMTIsNiArMTIsNyBAQCBjb25maWcgQVJNXzMyCiBjb25maWcgQVJNXzY0CiAJZGVmX2Jv
b2wgeQogCWRlcGVuZHMgb24gNjRCSVQKKwlzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkKIAogY29u
ZmlnIEFSTQogCWRlZl9ib29sIHkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
