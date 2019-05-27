Return-Path: <SRS0=AVGS=T3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEF1C04AB3
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 10:32:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7BC20673
	for <xen-devel@archiver.kernel.org>; Mon, 27 May 2019 10:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7BC20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVCvQ-0008Oq-KS; Mon, 27 May 2019 10:32:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVCvP-0008Ok-Cx
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 10:32:15 +0000
X-Inumbo-ID: b0d91ced-806a-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0d91ced-806a-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 10:32:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4502AAE27;
 Mon, 27 May 2019 10:32:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, devel@driverdev.osuosl.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org
Date: Mon, 27 May 2019 12:32:04 +0200
Message-Id: <20190527103207.13287-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/3] remove tmem and code depending on it
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Gao Xiang <gaoxiang25@huawei.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Fasheh <mark@fasheh.com>,
 Chao Yu <yuchao0@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG1lbSBoYXMgYmVlbiBhbiBleHBlcmltZW50YWwgWGVuIGZlYXR1cmUgd2hpY2ggaGFzIGJlZW4g
ZHJvcHBlZApyZWNlbnRseSBkdWUgdG8gc2VjdXJpdHkgcHJvYmxlbXMgYW5kIGxhY2sgb2YgbWFp
bnRhaW5lcnNoaXAuCgpTbyBpdCBpcyB0aW1lIG5vdyB0byBkcm9wIGl0IGluIExpbnV4IGtlcm5l
bCwgdG9vLgoKSnVlcmdlbiBHcm9zcyAoMyk6CiAgeGVuOiByZW1vdmUgdG1lbSBkcml2ZXIKICBt
bTogcmVtb3ZlIGNsZWFuY2FjaGUuYwogIG1tOiByZW1vdmUgdG1lbSBzcGVjaWZpY3MgZnJvbSBm
cm9udHN3YXAKCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dCB8ICAyMSAtCiBEb2N1bWVudGF0aW9uL3ZtL2NsZWFuY2FjaGUucnN0ICAgICAgICAgICAgICAg
ICB8IDI5NiAtLS0tLS0tLS0tLS0KIERvY3VtZW50YXRpb24vdm0vZnJvbnRzd2FwLnJzdCAgICAg
ICAgICAgICAgICAgIHwgIDI3ICstCiBEb2N1bWVudGF0aW9uL3ZtL2luZGV4LnJzdCAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSAtCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNyAtCiBkcml2ZXJzL3N0YWdpbmcvZXJvZnMvZGF0YS5jICAgICAg
ICAgICAgICAgICAgICB8ICAgNiAtCiBkcml2ZXJzL3N0YWdpbmcvZXJvZnMvaW50ZXJuYWwuaCAg
ICAgICAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL3hlbi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyMyAtCiBkcml2ZXJzL3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiAtCiBkcml2ZXJzL3hlbi90bWVtLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQxOSAtLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy94ZW4veGVuLWJh
bGxvb24uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQogZHJpdmVycy94ZW4veGVuLXNl
bGZiYWxsb29uLmMgICAgICAgICAgICAgICAgICAgfCA1NzkgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiBmcy9ibG9ja19kZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NSAtCiBmcy9idHJmcy9leHRlbnRfaW8uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
OSAtCiBmcy9idHJmcy9zdXBlci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiAtCiBmcy9leHQ0L3JlYWRwYWdlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NiAtCiBmcy9leHQ0L3N1cGVyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiAtCiBmcy9mMmZzL2RhdGEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MyArLQogZnMvbXBhZ2UuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgLQogZnMvb2NmczIvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgLQogZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgLQogaW5jbHVkZS9saW51eC9jbGVhbmNhY2hlLmggICAgICAgICAgICAgICAgICAgICAgfCAx
MjQgLS0tLS0KIGluY2x1ZGUvbGludXgvZnJvbnRzd2FwLmggICAgICAgICAgICAgICAgICAgICAg
IHwgICA1IC0KIGluY2x1ZGUvbGludXgvZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA1IC0KIGluY2x1ZGUveGVuL2JhbGxvb24uaCAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA4IC0KIGluY2x1ZGUveGVuL3RtZW0uaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE4IC0KIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDM4ICstCiBtbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSAtCiBtbS9jbGVhbmNhY2hlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDMxNyAtLS0tLS0tLS0tLS0tCiBtbS9maWxlbWFwLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxMSAtCiBtbS9mcm9udHN3YXAuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDE1NiArLS0tLS0tCiBtbS90cnVuY2F0ZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxNSArLQogMzIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgMjEwNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL3ZtL2NsZWFuY2FjaGUucnN0CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy94ZW4vdG1l
bS5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy94ZW4veGVuLXNlbGZiYWxsb29uLmMKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2NsZWFuY2FjaGUuaAogZGVsZXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUveGVuL3RtZW0uaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1tL2NsZWFuY2Fj
aGUuYwoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
