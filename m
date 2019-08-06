Return-Path: <SRS0=jzL+=WC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70864C433FF
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 07:00:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B83520B1F
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 07:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B83520B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hutS4-0002kl-Ef; Tue, 06 Aug 2019 07:00:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LM3v=WC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hutS3-0002kg-KN
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 07:00:07 +0000
X-Inumbo-ID: d0546c04-b817-11e9-8224-0336220bd45e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0546c04-b817-11e9-8224-0336220bd45e;
 Tue, 06 Aug 2019 07:00:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FA7AAD7F;
 Tue,  6 Aug 2019 07:00:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  6 Aug 2019 09:00:00 +0200
Message-Id: <20190806070000.13718-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/x86: lock cacheline for add_sized()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YWRkX3NpemVkKCkgc2hvdWxkIHVzZSBhbiBhdG9taWMgdXBkYXRlIG9mIHRoZSBtZW1vcnkgd29y
ZCwgYXMgaXQgaXMKdXNlZCBieSBzcGluX3VubG9jaygpLgoKV2l0aCB0aWNrZXQgbG9ja3MgdW5s
b2NraW5nIG5lZWRzIHRvIGJlIGF0b21pYyBpbiBvcmRlciB0byBhdm9pZCB2ZXJ5CnJhcmUgcmFj
ZXMgd2hlbiBzb21lb25lIHRyaWVzIHRvIGdldCB0aGUgbG9jayB3aGlsZSB0aGUgbG9jayBob2xk
ZXIKaXMganVzdCByZWxlYXNpbmcgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWljLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2F0
b21pYy5oCmluZGV4IDY4MmJjZjkxYjEuLjBlZjZhNjBlNjkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvYXRvbWljLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaApA
QCAtMjEsNyArMjEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2xhdGlsZSB0eXBlICph
ZGRyLCB0eXBlIHZhbCkgXAogI2RlZmluZSBidWlsZF9hZGRfc2l6ZWQobmFtZSwgc2l6ZSwgdHlw
ZSwgcmVnKSBcCiAgICAgc3RhdGljIGlubGluZSB2b2lkIG5hbWUodm9sYXRpbGUgdHlwZSAqYWRk
ciwgdHlwZSB2YWwpICAgICAgICAgICAgICBcCiAgICAgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgIGFz
bSB2b2xhdGlsZSgiYWRkIiBzaXplICIgJTEsJTAiICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCisgICAgICAgIGFzbSB2b2xhdGlsZSgibG9jazsgYWRkIiBzaXplICIgJTEsJTAiICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICA6ICI9bSIgKCph
ZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAg
ICAgICAgICA6IHJlZyAodmFsKSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAgICAgfQotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
