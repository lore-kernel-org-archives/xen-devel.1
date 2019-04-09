Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE122C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 07:55:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951C920883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 07:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 951C920883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDlav-000511-Rz; Tue, 09 Apr 2019 07:55:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2Q/q=SL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hDlau-00050w-1v
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 07:55:00 +0000
X-Inumbo-ID: c58d6c32-5a9c-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c58d6c32-5a9c-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 07:54:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BE7130833B5;
 Tue,  9 Apr 2019 07:54:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-114.rdu2.redhat.com
 [10.10.120.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B371E1001E65;
 Tue,  9 Apr 2019 07:54:56 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fb066d31-18fb-c0de-c2f2-814423664071@redhat.com>
Date: Tue, 9 Apr 2019 09:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 09 Apr 2019 07:54:58 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v2 0/3] Xen PCI passthrough fixes
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
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com,
 edk2-devel-groups-io <devel@edk2.groups.io>, julien.grall@arm.com,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409075455.QnZamvAospCnjfJCQsUzsLzripvOPoFe6nKb4_-L1tc@z>

SGkgSWdvciwKCk9uIDA0LzA5LzE5IDA1OjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBJZ29y
IERydXpoaW5pbiAoMyk6Cj4gICBPdm1mUGtnL1hlblN1cHBvcnQ6IHJlbW92ZSB1c2FnZSBvZiBw
cmVmZXRjaGFibGUgUENJIGhvc3QgYnJpZGdlCj4gICAgIGFwZXJ0dXJlCj4gICBPdm1mUGtnL1hl
blN1cHBvcnQ6IHVzZSBhIGNvcnJlY3QgUENJIGhvc3QgYnJpZGdlIGFwZXJ0dXJlIGZvciBCQVI2
NAo+ICAgT3ZtZlBrZy9YZW5TdXBwb3J0OiB0dXJuIG9mZiBhZGRyZXNzIGRlY29kaW5nIGJlZm9y
ZSBCQVIgc2l6aW5nCj4gCj4gIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1
cHBvcnQuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMzcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKCnNvbWUgZ2VuZXJhbCBhZG1p
bmlzdHJhdGl2YToKCigxKSB0aGUgZWRrMi1kZXZlbCBtYWlsaW5nIGxpc3QgaGFzIG1vdmVkLiBQ
bGVhc2Ugc3Vic2NyaWJlIGF0CjxodHRwczovL2VkazIuZ3JvdXBzLmlvL2cvZGV2ZWw+LCBhbmQg
cmVzZW5kIHRoZSBzZXJpZXMuIEFwb2xvZ2llcyBhYm91dAp0aGUgaW5jb252ZW5pZW5jZS4KCigy
KSBCeSB0aGUgdGltZSB3ZSBwdXNoIHRoaXMgc2VyaWVzLAo8aHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzczPiB3aWxsIGhhdmUgYmVlbgpmaXhlZCBtb3N0
IGxpa2VseS4gVGhhdCBtZWFucyB0aGF0IHlvdSB3aWxsIG5vIGxvbmdlciBuZWVkIHRvIGFkZCB0
aGUKIkNvbnRyaWJ1dGVkLXVuZGVyIiBsaW5lIHRvIHlvdXIgc2lnbm9mZnMsIG9uIGFsbCBwYXRj
aGVzLgoKVGhhbmtzIQpMYXN6bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
