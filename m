Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBCBC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:17:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7BC72077C
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7BC72077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE9Ln-0002R3-Vl; Wed, 10 Apr 2019 09:16:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sbnS=SM=intel.com=jordan.l.justen@srs-us1.protection.inumbo.net>)
 id 1hE9Lm-0002Qy-DM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:16:58 +0000
X-Inumbo-ID: 62dcba74-5b71-11e9-92d7-bc764e045a96
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62dcba74-5b71-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 09:16:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 02:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; d="scan'208";a="336563638"
Received: from askirtik-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.254.188.249])
 by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2019 02:16:55 -0700
MIME-Version: 1.0
In-Reply-To: <9d0a2a9b-21b9-de51-c232-c6847d7b03b3@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-2-anthony.perard@citrix.com>
 <9d0a2a9b-21b9-de51-c232-c6847d7b03b3@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, anthony.perard@citrix.com,
 devel@edk2.groups.io
From: Jordan Justen <jordan.l.justen@intel.com>
Message-ID: <155488781468.19925.8808103067126994195@jljusten-skl>
User-Agent: alot/0.8
Date: Wed, 10 Apr 2019 02:16:54 -0700
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 01/31]
 OvmfPkg/ResetSystemLib: Add missing dependency on PciLib
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410091654.-zJQnn-F3wi_ZsmITxFU8TIg7IleTtAP-J7TIL5ysn4@z>

T24gMjAxOS0wNC0xMCAwMTo0ODozOSwgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDA0LzA5LzE5
IDEzOjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGFuZCByZW1vdmUgZXh0cmEgaW5jbHVk
ZXMgb2YgT3ZtZlBsYXRmb3Jtcy5oLgo+IAo+ICgxKSBJbiBjb21taXQgbWVzc2FnZXMsIHBsZWFz
ZSBkb24ndCByZWx5IG9uIHRoZSBzdWJqZWN0IGxpbmUsIGFuZCB0aGUKPiBmaXJzdCBwYXJhZ3Jh
cGggb2YgdGhlIGJvZHksIGJlaW5nIHJlYWQgYXMgYSBzaW5nbGUgc2VudGVuY2UuCgpJIHRoaW5r
IEJhc2VUb29scy9TY3JpcHRzL1BhdGNoQ2hlY2sucHkgZG9lcyB0cnkgdG8gY2hlY2sgdGhhdCB0
aGUKc2Vjb25kIGxpbmUgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIGlzIGFuIGVtcHR5IGxpbmUuCgpB
bHNvLApodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL3RpYW5vY29yZS5naXRodWIuaW8vd2lr
aS9Db21taXQtTWVzc2FnZS1Gb3JtYXQKCi1Kb3JkYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
