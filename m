Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB40EC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 04:43:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801562075B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 04:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801562075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGFvr-00059c-R6; Tue, 16 Apr 2019 04:42:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E5BS=SS=huawei.com=maowenan@srs-us1.protection.inumbo.net>)
 id 1hGFCh-0001NT-1Z
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 03:56:15 +0000
X-Inumbo-ID: 9375a81b-5ffb-11e9-92d7-bc764e045a96
Received: from huawei.com (unknown [45.249.212.32])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9375a81b-5ffb-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 03:56:14 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A9AA11633A79D2CA0A49;
 Tue, 16 Apr 2019 11:56:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.408.0; Tue, 16 Apr 2019 11:56:09 +0800
From: Mao Wenan <maowenan@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
Date: Tue, 16 Apr 2019 12:06:51 +0800
Message-ID: <20190416040651.186468-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:42:54 +0000
Subject: [Xen-devel] [PATCH] xenbus: drop useless LIST_HEAD in
 xenbus_write_watch() and xenbus_file_write()
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
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBMSVNUX0hFQUQgd2hlcmUgdGhlIHZhcmlhYmxlIGl0IGRlY2xhcmVzIGlzIG5ldmVyIHVz
ZWQuCgpUaGUgZGVjbGFyYXRpb25zIHdlcmUgaW50cm9kdWNlZCB3aXRoIHRoZSBmaWxlLCBidXQg
dGhlIGRlY2xhcmVkCnZhcmlhYmxlcyB3ZXJlIG5vdCB1c2VkLgoKRml4ZXM6IDExMDdiYTg4NWU0
NjkoInhlbjogYWRkIHhlbmZzIHRvIGFsbG93IHVzZXJtb2RlIDwtPiBYZW4gaW50ZXJhY3Rpb24i
KQpTaWduZWQtb2ZmLWJ5OiBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfZGV2X2Zyb250ZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9mcm9udGVu
ZC5jCmluZGV4IDA3ODJmZjMuLmZhZjQ1MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19k
ZXZfZnJvbnRlbmQuYwpAQCAtNDY1LDcgKzQ2NSw2IEBAIHN0YXRpYyBpbnQgeGVuYnVzX3dyaXRl
X3dhdGNoKHVuc2lnbmVkIG1zZ190eXBlLCBzdHJ1Y3QgeGVuYnVzX2ZpbGVfcHJpdiAqdSkKIAlz
dHJ1Y3Qgd2F0Y2hfYWRhcHRlciAqd2F0Y2g7CiAJY2hhciAqcGF0aCwgKnRva2VuOwogCWludCBl
cnIsIHJjOwotCUxJU1RfSEVBRChzdGFnaW5nX3EpOwogCiAJcGF0aCA9IHUtPnUuYnVmZmVyICsg
c2l6ZW9mKHUtPnUubXNnKTsKIAl0b2tlbiA9IG1lbWNocihwYXRoLCAwLCB1LT51Lm1zZy5sZW4p
OwpAQCAtNTIzLDcgKzUyMiw2IEBAIHN0YXRpYyBzc2l6ZV90IHhlbmJ1c19maWxlX3dyaXRlKHN0
cnVjdCBmaWxlICpmaWxwLAogCXVpbnQzMl90IG1zZ190eXBlOwogCWludCByYyA9IGxlbjsKIAlp
bnQgcmV0OwotCUxJU1RfSEVBRChzdGFnaW5nX3EpOwogCiAJLyoKIAkgKiBXZSdyZSBleHBlY3Rp
bmcgdXNlcm1vZGUgdG8gYmUgd3JpdGluZyBwcm9wZXJseSBmb3JtZWQKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
