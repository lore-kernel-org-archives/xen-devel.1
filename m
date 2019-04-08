Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F84C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0093020663
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0093020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVFX-00025v-RI; Mon, 08 Apr 2019 14:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFW-00024w-Ge
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:27:50 +0000
X-Inumbo-ID: 7c2797de-5a0a-11e9-bb90-cb6f7ec6082c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c2797de-5a0a-11e9-bb90-cb6f7ec6082c;
 Mon, 08 Apr 2019 14:27:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83010294"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Mon, 8 Apr 2019 15:24:03 +0100
Message-ID: <20190408142408.30419-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 26/31] OvmfPkg/XenOvmf: Override PcdFSBClock
 to Xen vLAPIC timer frequency
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408142403.yEMa3fzOifkru8S_pRN4sO5Z3VkCiVD7zROl3GGNttI@z>

VGhhdCB2YWx1ZSBpcyB1c2VkIGJ5IFNlY1BlaUR4ZVRpbWVyTGliQ3B1LCB0aGUgVGltZXJMaWIg
aW1wbGVtZW50YXRpb24uCkl0IHdpbGwgYWxzbyBiZSB1c2VkIGJ5IFhlblRpbWVyRHhlLgoKQ29u
dHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CgpOb3RlczoKICAgIG5ldyBwYXRjaCBpbiB2Mi4KCiBPdm1mUGtnL1hlbk92bWYuZHNjIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlbk92bWYuZHNjIGIvT3ZtZlBrZy9YZW5Pdm1mLmRzYwppbmRleCA5NTI5YjQ4MzRmLi41NDYw
MWM2OTdmIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlbk92bWYuZHNjCisrKyBiL092bWZQa2cvWGVu
T3ZtZi5kc2MKQEAgLTQ1Miw2ICs0NTIsOSBAQCBbUGNkc0ZpeGVkQXRCdWlsZF0KICAgIyBQb2lu
dCB0byB0aGUgTWRlTW9kdWxlUGtnL0FwcGxpY2F0aW9uL1VpQXBwL1VpQXBwLmluZgogICBnRWZp
TWRlTW9kdWxlUGtnVG9rZW5TcGFjZUd1aWQuUGNkQm9vdE1hbmFnZXJNZW51RmlsZXx7IDB4MjEs
IDB4YWEsIDB4MmMsIDB4NDYsIDB4MTQsIDB4NzYsIDB4MDMsIDB4NDUsIDB4ODMsIDB4NmUsIDB4
OGEsIDB4YjYsIDB4ZjQsIDB4NjYsIDB4MjMsIDB4MzEgfQogCisgICMjIFhlbiB2bGFwaWMncyBm
cmVxdWVuY2UgaXMgMTAwIE1IegorICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkRlNCQ2xv
Y2t8MTAwMDAwMDAwCisKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAjCiAjIFBjZCBEeW5hbWlj
IFNlY3Rpb24gLSBsaXN0IG9mIGFsbCBFREsgSUkgUENEIEVudHJpZXMgZGVmaW5lZCBieSB0aGlz
IFBsYXRmb3JtCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
