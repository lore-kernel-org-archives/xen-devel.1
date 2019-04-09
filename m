Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D40C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774332133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774332133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDovB-0000gO-9B; Tue, 09 Apr 2019 11:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovA-0000ex-9y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:08 +0000
X-Inumbo-ID: 8b232108-5aba-11e9-b606-a778167473ee
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b232108-5aba-11e9-b606-a778167473ee;
 Tue, 09 Apr 2019 11:28:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096441"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:44 +0100
Message-ID: <20190409110844.14746-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 31/31] OvmfPkg/XenOvmf: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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
Message-ID: <20190409110844.j4RK7n1Z7uAYuI-RPG2SMlK7vTyuysj20MoQQWo5ql8@z>

QSBYZW4gUFZIIGd1ZXN0IGRvZXNuJ3QgaGF2ZSBhIFJUQyB0aGF0IE9WTUYgd291bGQgZXhwZWN0
LCBzbwpQY2F0UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhbmQg
cHJldmVudCB0aGUgZmlybXdhcmUKZnJvbSBmaW5pc2ggdG8gYm9vdC4gVG8gcHJldmVudCB0aGF0
LCB3ZSB3aWxsIHVzZSB0aGUKWGVuUmVhbFRpbWVDbG9ja0xpYiBmcm9tIEFybVZpcnRQa2cgd2hp
Y2ggc2ltcGx5IGFsd2F5cyByZXR1cm4gdGhlIHNhbWUKdGltZS4gVGhpcyB3aWxsIHdvcmsgb24g
Ym90aCBYZW4gUFZIIGFuZCBIVk0gZ3Vlc3RzLgoKQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29y
ZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBPdm1mUGtnL1hlbk92bWYuZHNjIHwg
NSArKysrLQogT3ZtZlBrZy9YZW5Pdm1mLmZkZiB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuT3Zt
Zi5kc2MgYi9Pdm1mUGtnL1hlbk92bWYuZHNjCmluZGV4IDcyZDZlYThiMjkuLjE0ZWY5ZWE5ZjIg
MTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuT3ZtZi5kc2MKKysrIGIvT3ZtZlBrZy9YZW5Pdm1mLmRz
YwpAQCAtNTc3LDcgKzU3NywxMCBAQCBbQ29tcG9uZW50c10KICAgfQogICBNZGVNb2R1bGVQa2cv
VW5pdmVyc2FsL1Jlc2V0U3lzdGVtUnVudGltZUR4ZS9SZXNldFN5c3RlbVJ1bnRpbWVEeGUuaW5m
CiAgIE1kZU1vZHVsZVBrZy9Vbml2ZXJzYWwvTWV0cm9ub21lL01ldHJvbm9tZS5pbmYKLSAgUGNB
dENoaXBzZXRQa2cvUGNhdFJlYWxUaW1lQ2xvY2tSdW50aW1lRHhlL1BjYXRSZWFsVGltZUNsb2Nr
UnVudGltZUR4ZS5pbmYKKyAgRW1iZWRkZWRQa2cvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUvUmVh
bFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mIHsKKyAgICA8TGlicmFyeUNsYXNzZXM+CisgICAgICBS
ZWFsVGltZUNsb2NrTGlifE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJl
YWxUaW1lQ2xvY2tMaWIuaW5mCisgIH0KICAgTWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9Ecml2ZXJI
ZWFsdGhNYW5hZ2VyRHhlL0RyaXZlckhlYWx0aE1hbmFnZXJEeGUuaW5mCiAgIE1kZU1vZHVsZVBr
Zy9Vbml2ZXJzYWwvQmRzRHhlL0Jkc0R4ZS5pbmYgewogICAgIDxMaWJyYXJ5Q2xhc3Nlcz4KZGlm
ZiAtLWdpdCBhL092bWZQa2cvWGVuT3ZtZi5mZGYgYi9Pdm1mUGtnL1hlbk92bWYuZmRmCmluZGV4
IDlhYTk5OGYxNWYuLjFiNjJkYTJlYzUgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuT3ZtZi5mZGYK
KysrIGIvT3ZtZlBrZy9YZW5Pdm1mLmZkZgpAQCAtMjkzLDcgKzI5Myw3IEBAIFtGVi5EWEVGVl0K
IElORiAgTWRlTW9kdWxlUGtnL0J1cy9QY2kvUGNpQnVzRHhlL1BjaUJ1c0R4ZS5pbmYKIElORiAg
TWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9SZXNldFN5c3RlbVJ1bnRpbWVEeGUvUmVzZXRTeXN0ZW1S
dW50aW1lRHhlLmluZgogSU5GICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL01ldHJvbm9tZS9NZXRy
b25vbWUuaW5mCi1JTkYgIFBjQXRDaGlwc2V0UGtnL1BjYXRSZWFsVGltZUNsb2NrUnVudGltZUR4
ZS9QY2F0UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mCitJTkYgIEVtYmVkZGVkUGtnL1JlYWxU
aW1lQ2xvY2tSdW50aW1lRHhlL1JlYWxUaW1lQ2xvY2tSdW50aW1lRHhlLmluZgogCiBJTkYgIE92
bWZQa2cvWGVuSW9QdmhEeGUvWGVuSW9QdmhEeGUuaW5mCiBJTkYgIE92bWZQa2cvWGVuSW9QY2lE
eGUvWGVuSW9QY2lEeGUuaW5mCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
