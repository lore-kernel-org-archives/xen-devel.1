Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF76CC10F14
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 04:30:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B982082E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 04:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B982082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEnpK-0005gZ-PN; Fri, 12 Apr 2019 04:30:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ng3J=SO=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hEnpJ-0005gU-7Z
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 04:30:09 +0000
X-Inumbo-ID: a7044816-5cdb-11e9-92d7-bc764e045a96
Received: from mail-it1-f196.google.com (unknown [209.85.166.196])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7044816-5cdb-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 04:30:08 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id x132so13571064itf.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 21:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lA6kDMcqEtcgaJ6BWu/sbT5l4UJfqRINuhRiEqyG4L4=;
 b=TcvMMPu5wq8YB0biHq3RUCbEoWBvk4PQZrBY3gFqfHYKc9mIbtRhHk46kOYPHwS1wY
 XPlmTcUVTz9L7mGPPU70aU1Owy30I881f//SzPRDJJ9ocP8BvybOVpsQXD3yWXjleUHC
 yt8efLuHAfxhh3qkmNUtzlyGZ2bOzDezEBLyxlqpSPGv/hF9YO8Tkj9L5jYMSZd3lve9
 LJWr1NkhwQGVPRUcETeHaY++onWeTN/dLFExSDJZCfn4uwbj4Vhmy4oNdNOthtfP0Rd1
 QjaMNsDRocU13knTruSuq4MI4pavDsP9gqDtX0XOrk8v0KqepdJmK054xQCPSdYX58vO
 q5AA==
X-Gm-Message-State: APjAAAX/gkdFBxJ0+WdCcYUpfIRAKtOEGCIit3B0j2vjjIqf81Uk7nfQ
 PoYHvgtpCicUDtYw0CKuNiRU+zNl
X-Google-Smtp-Source: APXvYqx1ytuxZ2jbZ4AEFIibWsVRtqKNmxOyW/8OGczsfP48FQp+7OeC4togoFoLYgIww1yUfyV8ag==
X-Received: by 2002:a24:fa41:: with SMTP id v62mr11573128ith.10.1555043407460; 
 Thu, 11 Apr 2019 21:30:07 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id q2sm15349891ioh.4.2019.04.11.21.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 21:30:06 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 11 Apr 2019 22:29:29 -0600
Message-Id: <20190412042930.2867-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412042929.LId5dBMRTZ2hxA3TlW0m9_QptX3Ptz7qedsQtcaQttw@z>

UGF0Y2ggMDUwMmUwYWRhZTIgIng4NjogY29ycmVjdCBpbnN0YW5jZXMgb2YgUEdDX2FsbG9jYXRl
ZCBjbGVhcmluZyIgaW50cm9kdWNlZApncmFiYmluZyBleHRyYSByZWZlcmVuY2VzIGZvciBwYWdl
cyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19hbGxvY2F0ZWQuCkhvd2V2ZXIsIHRo
ZSB3YXkgdGhlc2UgZXh0cmEgcmVmZXJlbmNlcyB3ZXJlIGdyYWJiZWQgd2VyZSBpbmNvcnJlY3Qs
IHJlc3VsdGluZwppbiBib3RoIHNoYXJlX3BhZ2VzIGFuZCB1bnNoYXJlX3BhZ2VzIGZhaWxpbmcu
IFRoZXJlIGFjdHVhbGx5IGlzIG5vIG5lZWQgdG8KZ3JhYiBleHRyYSByZWZlcmVuY2VzLCBvbmx5
IGEgcmVvcmRlcmluZyB3YXMgbmVlZGVkIGZvciB3aGVuIHRoZSBleGlzdGluZwpyZWZlcmVuY2Vz
IGFyZSBiZWluZyByZWxlYXNlZC4gVGhpcyBpcyBpbiBhY2NvcmRhbmNlIHRvIHRoZSBYU0EtMjQy
CnJlY29tbWVuZGF0aW9uIG9mIG5vdCBjYWxsaW5nIF9wdXRfcGFnZV90eXBlIHdoaWxlIGFsc28g
aG9sZGluZyB0aGUgcGFnZV9sb2NrCmZvciB0aGF0IHBhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAzMSArKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCmluZGV4IDVhYzlkOGY1NGMu
LjM0NWExNzc4ZjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCkBAIC05MDAsNiArOTAwLDcgQEAgc3Rh
dGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAogICAgIHAybV90eXBlX3Qgc21mbl90eXBlLCBjbWZuX3R5cGU7CiAgICAgc3Ry
dWN0IHR3b19nZm5zIHRnOwogICAgIHN0cnVjdCBybWFwX2l0ZXJhdG9yIHJpOworICAgIHVuc2ln
bmVkIGxvbmcgcHV0X2NvdW50ID0gMDsKIAogICAgIGdldF90d29fZ2ZucyhzZCwgc2dmbiwgJnNt
Zm5fdHlwZSwgTlVMTCwgJnNtZm4sCiAgICAgICAgICAgICAgICAgIGNkLCBjZ2ZuLCAmY21mbl90
eXBlLCBOVUxMLCAmY21mbiwgMCwgJnRnKTsKQEAgLTk2NCwxNSArOTY1LDYgQEAgc3RhdGljIGlu
dCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90
IHNoLAogICAgICAgICBnb3RvIGVycl9vdXQ7CiAgICAgfQogCi0gICAgLyogQWNxdWlyZSBhbiBl
eHRyYSByZWZlcmVuY2UsIGZvciB0aGUgZnJlZWluZyBiZWxvdyB0byBiZSBzYWZlLiAqLwotICAg
IGlmICggIWdldF9wYWdlKGNwYWdlLCBjZCkgKQotICAgIHsKLSAgICAgICAgcmV0ID0gLUVPVkVS
RkxPVzsKLSAgICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2soc2Vjb25kcGcpOwotICAgICAg
ICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhmaXJzdHBnKTsKLSAgICAgICAgZ290byBlcnJfb3V0
OwotICAgIH0KLQogICAgIC8qIE1lcmdlIHRoZSBsaXN0cyB0b2dldGhlciAqLwogICAgIHJtYXBf
c2VlZF9pdGVyYXRvcihjcGFnZSwgJnJpKTsKICAgICB3aGlsZSAoIChnZm4gPSBybWFwX2l0ZXJh
dGUoY3BhZ2UsICZyaSkpICE9IE5VTEwpCkBAIC05ODQsNyArOTc2LDcgQEAgc3RhdGljIGludCBz
aGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNo
LAogICAgICAgICAgKiBEb24ndCBjaGFuZ2UgdGhlIHR5cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVu
dCBwYWdlLiAqLwogICAgICAgICBybWFwX2RlbChnZm4sIGNwYWdlLCAwKTsKICAgICAgICAgcm1h
cF9hZGQoZ2ZuLCBzcGFnZSk7Ci0gICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsKKyAg
ICAgICAgcHV0X2NvdW50Kys7CiAgICAgICAgIGQgPSBnZXRfZG9tYWluX2J5X2lkKGdmbi0+ZG9t
YWluKTsKICAgICAgICAgQlVHX09OKCFkKTsKICAgICAgICAgQlVHX09OKHNldF9zaGFyZWRfcDJt
X2VudHJ5KGQsIGdmbi0+Z2ZuLCBzbWZuKSk7CkBAIC0xMDAyLDcgKzk5NCw5IEBAIHN0YXRpYyBp
bnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVf
dCBzaCwKICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLwogICAgIGlmKHRlc3RfYW5kX2Ns
ZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkKICAgICAgICAgcHV0
X3BhZ2UoY3BhZ2UpOwotICAgIHB1dF9wYWdlKGNwYWdlKTsKKworICAgIHdoaWxlKHB1dF9jb3Vu
dC0tKQorICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7CiAKICAgICAvKiBXZSBtYW5h
Z2VkIHRvIGZyZWUgYSBkb21haW4gcGFnZS4gKi8KICAgICBhdG9taWNfZGVjKCZucl9zaGFyZWRf
bWZucyk7CkBAIC0xMTY3LDIwICsxMTYxLDExIEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLAogICAgIHsKICAgICAgICAgaWYgKCAhbGFzdF9nZm4gKQog
ICAgICAgICAgICAgbWVtX3NoYXJpbmdfZ2ZuX2Rlc3Ryb3kocGFnZSwgZCwgZ2ZuX2luZm8pOwot
ICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKICAgICAgICAgbWVtX3NoYXJpbmdfcGFn
ZV91bmxvY2socGFnZSk7Ci0gICAgICAgIGlmICggbGFzdF9nZm4gKQotICAgICAgICB7Ci0gICAg
ICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSApCi0gICAgICAgICAgICB7Ci0gICAgICAg
ICAgICAgICAgcHV0X2dmbihkLCBnZm4pOwotICAgICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChk
KTsKLSAgICAgICAgICAgICAgICByZXR1cm4gLUVPVkVSRkxPVzsKLSAgICAgICAgICAgIH0KLSAg
ICAgICAgICAgIGlmICggdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGFnZS0+
Y291bnRfaW5mbykgKQotICAgICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworICAgICAgICBp
ZiAoIGxhc3RfZ2ZuICYmCisgICAgICAgICAgICB0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxv
Y2F0ZWQsICZwYWdlLT5jb3VudF9pbmZvKSApCiAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsK
LSAgICAgICAgfQorICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKICAgICAgICAgcHV0
X2dmbihkLCBnZm4pOwogCiAgICAgICAgIHJldHVybiAwOwotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
