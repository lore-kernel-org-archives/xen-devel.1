Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FA5C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 19:50:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3DA2171F
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 19:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3DA2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hF2BR-0003sf-Le; Fri, 12 Apr 2019 19:49:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ng3J=SO=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hF2BQ-0003sa-V1
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 19:49:56 +0000
X-Inumbo-ID: 2548736a-5d5c-11e9-92d7-bc764e045a96
Received: from mail-it1-f195.google.com (unknown [209.85.166.195])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2548736a-5d5c-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 19:49:55 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id u65so17636749itc.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 12:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RC6tDErUftHjiHcvGgjp7m3usYVLTj9FQquI7xx566M=;
 b=k5j4mzRGoctjIk03zOlAWdukexSnjOMj4Xxn17wIv71fyZxv937904vzKVNFPcwEQq
 LcrfLfsfpxsYJkknRW9ebL4b3/gDoqbvHN2v24IZLgdDNHpPUX9zJjyzLYNCQPt1Yno1
 iuPzstlXC0v73jpxWSevqTfUQ0fSAs10xd6GUYNmSsadHKsV8DjI8bGvLVX+l2RcG4bI
 zWw5ybjQQzzCr3qO2YXqSz2o1jQQcApqnQsVdwIY7/9+AWKkc5+2n8TZM7Bw5HB8C2/m
 hy+yjSCS1/xG26WskgLacMwC7I3B3TQ+xnLlknlq2H3YHo83kDIe9CeV7JRrQO6Tme8O
 utCw==
X-Gm-Message-State: APjAAAXCLT0GXmoD6FBJEx/7v1qbcuxqYSVOHer2OkpAIOniExrBqvzQ
 RliXbuRXqvRU3VBatLkAe1e/bFJH
X-Google-Smtp-Source: APXvYqxAQzF11/HGXoz0v6WXhuU7qkCHoBGVySQj+4DxlV0oPU2wgweR6oWImvjD9WAE6jvIssDQXg==
X-Received: by 2002:a02:c007:: with SMTP id y7mr42796069jai.1.1555098594947;
 Fri, 12 Apr 2019 12:49:54 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id c13sm16531606ioi.12.2019.04.12.12.49.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 12:49:54 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 12 Apr 2019 13:47:11 -0600
Message-Id: <20190412194712.1602-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages are
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
Message-ID: <20190412194711.RhakMzFwaw7SC-TqkdDMejda2ZR5dIfeFq5M1b46saI@z>

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
QGNpdHJpeC5jb20+Ci0tLQp2MjogQWRkIGFzc2VydCB0aGF0IHB1dF9jb3VudCBpcyBhdCBsZWFz
dCAxCi0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAzMiArKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCA1YWM5ZDhmNTRjLi43MDgwMzdk
OTFlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtOTAwLDYgKzkwMCw3IEBAIHN0YXRpYyBpbnQg
c2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBz
aCwKICAgICBwMm1fdHlwZV90IHNtZm5fdHlwZSwgY21mbl90eXBlOwogICAgIHN0cnVjdCB0d29f
Z2ZucyB0ZzsKICAgICBzdHJ1Y3Qgcm1hcF9pdGVyYXRvciByaTsKKyAgICB1bnNpZ25lZCBsb25n
IHB1dF9jb3VudCA9IDA7CiAKICAgICBnZXRfdHdvX2dmbnMoc2QsIHNnZm4sICZzbWZuX3R5cGUs
IE5VTEwsICZzbWZuLAogICAgICAgICAgICAgICAgICBjZCwgY2dmbiwgJmNtZm5fdHlwZSwgTlVM
TCwgJmNtZm4sIDAsICZ0Zyk7CkBAIC05NjQsMTUgKzk2NSw2IEBAIHN0YXRpYyBpbnQgc2hhcmVf
cGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKICAg
ICAgICAgZ290byBlcnJfb3V0OwogICAgIH0KIAotICAgIC8qIEFjcXVpcmUgYW4gZXh0cmEgcmVm
ZXJlbmNlLCBmb3IgdGhlIGZyZWVpbmcgYmVsb3cgdG8gYmUgc2FmZS4gKi8KLSAgICBpZiAoICFn
ZXRfcGFnZShjcGFnZSwgY2QpICkKLSAgICB7Ci0gICAgICAgIHJldCA9IC1FT1ZFUkZMT1c7Ci0g
ICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsKLSAgICAgICAgbWVtX3No
YXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7Ci0gICAgICAgIGdvdG8gZXJyX291dDsKLSAgICB9
Ci0KICAgICAvKiBNZXJnZSB0aGUgbGlzdHMgdG9nZXRoZXIgKi8KICAgICBybWFwX3NlZWRfaXRl
cmF0b3IoY3BhZ2UsICZyaSk7CiAgICAgd2hpbGUgKCAoZ2ZuID0gcm1hcF9pdGVyYXRlKGNwYWdl
LCAmcmkpKSAhPSBOVUxMKQpAQCAtOTg0LDcgKzk3Niw3IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFn
ZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKICAgICAg
ICAgICogRG9uJ3QgY2hhbmdlIHRoZSB0eXBlIG9mIHJtYXAgZm9yIHRoZSBjbGllbnQgcGFnZS4g
Ki8KICAgICAgICAgcm1hcF9kZWwoZ2ZuLCBjcGFnZSwgMCk7CiAgICAgICAgIHJtYXBfYWRkKGdm
biwgc3BhZ2UpOwotICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7CisgICAgICAgIHB1
dF9jb3VudCsrOwogICAgICAgICBkID0gZ2V0X2RvbWFpbl9ieV9pZChnZm4tPmRvbWFpbik7CiAg
ICAgICAgIEJVR19PTighZCk7CiAgICAgICAgIEJVR19PTihzZXRfc2hhcmVkX3AybV9lbnRyeShk
LCBnZm4tPmdmbiwgc21mbikpOwpAQCAtMTAwMiw3ICs5OTQsMTAgQEAgc3RhdGljIGludCBzaGFy
ZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAog
ICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCiAgICAgaWYodGVzdF9hbmRfY2xlYXJfYml0
KF9QR0NfYWxsb2NhdGVkLCAmY3BhZ2UtPmNvdW50X2luZm8pKQogICAgICAgICBwdXRfcGFnZShj
cGFnZSk7Ci0gICAgcHV0X3BhZ2UoY3BhZ2UpOworCisgICAgQVNTRVJUKHB1dF9jb3VudCk7Cisg
ICAgd2hpbGUgKCBwdXRfY291bnQtLSApCisgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdl
KTsKIAogICAgIC8qIFdlIG1hbmFnZWQgdG8gZnJlZSBhIGRvbWFpbiBwYWdlLiAqLwogICAgIGF0
b21pY19kZWMoJm5yX3NoYXJlZF9tZm5zKTsKQEAgLTExNjcsMjAgKzExNjIsMTEgQEAgaW50IF9f
bWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgewogICAgICAg
ICBpZiAoICFsYXN0X2dmbiApCiAgICAgICAgICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJveShw
YWdlLCBkLCBnZm5faW5mbyk7Ci0gICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwogICAg
ICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKLSAgICAgICAgaWYgKCBsYXN0X2dm
biApCi0gICAgICAgIHsKLSAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGQpICkKLSAg
ICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7Ci0gICAgICAgICAg
ICAgICAgZG9tYWluX2NyYXNoKGQpOwotICAgICAgICAgICAgICAgIHJldHVybiAtRU9WRVJGTE9X
OwotICAgICAgICAgICAgfQotICAgICAgICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoX1BH
Q19hbGxvY2F0ZWQsICZwYWdlLT5jb3VudF9pbmZvKSApCi0gICAgICAgICAgICAgICAgcHV0X3Bh
Z2UocGFnZSk7CisgICAgICAgIGlmICggbGFzdF9nZm4gJiYKKyAgICAgICAgICAgIHRlc3RfYW5k
X2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8pICkKICAgICAgICAg
ICAgIHB1dF9wYWdlKHBhZ2UpOwotICAgICAgICB9CisgICAgICAgIHB1dF9wYWdlX2FuZF90eXBl
KHBhZ2UpOwogICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7CiAKICAgICAgICAgcmV0dXJuIDA7Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
