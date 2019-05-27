Return-Path: <SRS0=AVGS=T3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D848C07542
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 08:28:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2682075B
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 08:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2682075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVAz1-0004NX-1W; Mon, 27 May 2019 08:27:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vl5o=T3=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hVAyz-0004ML-MY
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 08:27:49 +0000
X-Inumbo-ID: 4f661d75-8059-11e9-8980-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4f661d75-8059-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 08:27:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:27:48 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 27 May 2019 01:27:46 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 May 2019 16:31:31 +0800
Message-Id: <1558945891-3015-11-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v7 10/10] x86/microcode: always
 collect_cpu_info() during boot
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190527083131.7FczrUtQllzqmKrZWrTAHPfX4qG1nRyrvpNXNvr0Tj4@z>

RnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKQ3VycmVudGx5
IGNwdV9zaWcgc3RydWN0IGlzIG5vdCB1cGRhdGVkIGR1cmluZyBib290IHdoZW4gZWl0aGVyOgoK
ICAgIDEuIHVjb2RlX3NjYW4gaXMgc2V0IHRvIGZhbHNlIChlLmcuIG5vICJ1Y29kZT1zY2FuIiBp
biBjbWRsaW5lKQogICAgMi4gaW5pdHJkIGRvZXMgbm90IGNvbnRhaW4gYSBtaWNyb2NvZGUgYmxv
YgoKVGhlc2Ugd2lsbCByZXN1bHQgaW4gY3B1X3NpZy5yZXYgYmVpbmcgMCB3aGljaCBhZmZlY3Rz
IEFQSUMncwpjaGVja19kZWFkbGluZV9lcnJhdGEoKSBhbmQgcmV0cG9saW5lX3NhZmUoKSBmdW5j
dGlvbnMuCgpGaXggdGhpcyBieSBnZXR0aW5nIHVjb2RlIHJldmlzaW9uIGVhcmx5IGR1cmluZyBi
b290IGFuZCBTTVAgYnJpbmcgdXAuCldoaWxlIGF0IGl0LgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5
IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgotLS0KY2hhbmdlcyBpbiB2NzoKLSByZWJhc2Ugb24gcGF0
Y2ggMX45Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZS5jIHwgNCArKysrCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29k
ZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IGY0YTQxN2UuLjhhZWIxNTIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYvbWlj
cm9jb2RlLmMKQEAgLTU5MCw2ICs1OTAsMTAgQEAgaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVf
aW5pdCh2b2lkKQogCiAgICAgaWYgKCBtaWNyb2NvZGVfb3BzICkKICAgICB7CisgICAgICAgIHJj
ID0gbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbygmdGhpc19jcHUoY3B1X3NpZykpOwor
ICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgIHJldHVybiByYzsKKwogICAgICAgICBpZiAo
IHVjb2RlX21vZC5tb2RfZW5kIHx8IHVjb2RlX2Jsb2Iuc2l6ZSApCiAgICAgICAgICAgICByYyA9
IGVhcmx5X21pY3JvY29kZV9wYXJzZV9hbmRfdXBkYXRlX2NwdSgpOwogICAgIH0KLS0gCjEuOC4z
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
