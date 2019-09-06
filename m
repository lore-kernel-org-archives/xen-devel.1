Return-Path: <SRS0=7BPq=XB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB375C43331
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 00:50:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CE82082E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 00:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN6gjf5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CE82082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i62S8-0005aR-Mc; Fri, 06 Sep 2019 00:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i62S7-0005aM-47
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 00:50:15 +0000
X-Inumbo-ID: 4984e406-d040-11e9-abe4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4984e406-d040-11e9-abe4-12813bfff9fa;
 Fri, 06 Sep 2019 00:50:14 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CD03207E0;
 Fri,  6 Sep 2019 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567731013;
 bh=PY5drBH1zWFrEYPfV+oCstIfCDYlYiPcrbXnEC2lJxo=;
 h=From:To:Cc:Subject:Date:From;
 b=UN6gjf5ihOZgtK7TP0AEgYjcs0dZJPYgRgyWrlrq4aqte2Q0Re3LmWWPDTaZJwewp
 Ciub5a0ZNGXdFzuRjZtkIXZwOvefGoGg5TPHJNeJ+PMRiQyP1bpfsVhjfcc/Xa2CjR
 RCoj5W4/H+z6B3Zm45v/vvaQXjM0t3RERJm9joFY=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 09:50:08 +0900
Message-Id: <156773100816.29031.12557431294039450779.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v2 0/2] x86: kprobes: Prohibit kprobes on
 Xen/KVM emulate prefixes
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpIZXJlIGlzIHRoZSAybmQgdmVyc2lvbiBvZiBwYXRjaGVzIHRvIGhhbmRsZSBYZW4vS1ZN
IGVtdWxhdGUKcHJlZml4IGJ5IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyLgoKVGhlc2UgcGF0Y2hl
cyBhbGxvdyB4ODYgaW5zdHJ1Y3Rpb24gZGVjb2RlciB0byBkZWNvZGUKWGVuIGFuZCBLVk0gZW11
bGF0ZSBwcmVmaXggY29ycmVjdGx5LCBhbmQgcHJvaGliaXQga3Byb2JlcyB0bwpwcm9iZSBvbiBp
dC4KCkpvc2ggcmVwb3J0ZWQgdGhhdCB0aGUgb2JqdG9vbCBjYW4gbm90IGRlY29kZSBzdWNoIHNw
ZWNpYWwKcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zLCBhbmQgSSBmb3VuZCB0aGF0IHdlIGFsc28gaGF2
ZSB0bwpwcm9oaWJpdCBrcHJvYmVzIHRvIHByb2JlIG9uIHN1Y2ggaW5zdHJ1Y3Rpb24uCgpUaGlz
IHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiAtdGlwIG1hc3RlciBicmFuY2ggd2hpY2gKaGFzIG1l
cmdlZCBKb3NoJ3Mgb2JqdG9vbC9wZXJmIHNoYXJpbmcgY29tbW9uIHg4NiBpbnNuCmRlY29kZXIg
c2VyaWVzLgoKSW4gdGhpcyB2ZXJzaW9uLCBJIGFkZGVkIEtWTSBlbXVsYXRlIHByZWZpeCBzdXBw
b3J0IGFuZCBnZW5lcmFsaXplZAp0aGUgaW50ZXJmYWNlLiAoaW5zbl9oYXNfeGVuX3ByZWZpeCAt
PiBpbnNuX2hhc19lbXVsYXRlX3ByZWZpeCkKQWxzbywgSSBhZGRlZCBpbnNuLmVtdWxhdGVfcHJl
Zml4X3NpemUgZm9yIHRob3NlIHByZWZpeGVzIGJlY2F1c2UKdGhhdCBwcmVmaXggaXMgTk9UIGFu
IHg4NiBpbnN0cnVjdGlvbiBwcmVmaXgsIGFuZCB0aGUgbmV4dCBpbnN0cnVjdGlvbgpvZiB0aG9z
ZSBlbXVsYXRlIHByZWZpeGVzIGNhbiBoYXZlIHg4NiBpbnN0cnVjdGlvbiBwcmVmaXguIFNvIHdl
CmNhbiBub3QgdXNlIGluc24ucHJlZml4IGZvciBpdC4KClRoYW5rIHlvdSwKCi0tLQoKTWFzYW1p
IEhpcmFtYXRzdSAoMik6CiAgICAgIHg4NjogeGVuOiBpbnNuOiBEZWNvZGUgWGVuIGFuZCBLVk0g
ZW11bGF0ZS1wcmVmaXggc2lnbmF0dXJlCiAgICAgIHg4Njoga3Byb2JlczogUHJvaGliaXQgcHJv
YmluZyBvbiBpbnN0cnVjdGlvbiB3aGljaCBoYXMgZW11bGF0ZSBwcmVmaXgKCgogYXJjaC94ODYv
aW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgICAgIHwgICAgNiArKysrKwogYXJjaC94ODYvaW5j
bHVkZS9hc20veGVuL2ludGVyZmFjZS5oICAgIHwgICAgNyArKysrLS0KIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3hlbi9wcmVmaXguaCAgICAgICB8ICAgMTAgKysrKysrKysrCiBhcmNoL3g4Ni9rZXJu
ZWwva3Byb2Jlcy9jb3JlLmMgICAgICAgICAgfCAgICA0ICsrKwogYXJjaC94ODYvbGliL2luc24u
YyAgICAgICAgICAgICAgICAgICAgIHwgICAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmggICAgICAgfCAgICA2ICsrKysr
CiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggfCAgIDEwICsrKysrKysr
KwogdG9vbHMvYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAgIHwgICAzNiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2ggICAg
ICAgICAgICAgfCAgICAzICsrLQogOSBmaWxlcyBjaGFuZ2VkLCAxMTUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94
ZW4vcHJlZml4LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS94ZW4vcHJlZml4LmgKCi0tCk1hc2FtaSBIaXJhbWF0c3UgKExpbmFybykgPG1oaXJhbWF0QGtl
cm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
