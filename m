Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07443C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 15:30:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5DF0218D1
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 15:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5DF0218D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYBNc-00033J-W6; Tue, 04 Jun 2019 15:29:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYBNb-00030w-JU
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 15:29:39 +0000
X-Inumbo-ID: 904fa850-86dd-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 904fa850-86dd-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 15:29:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 09:29:37 -0600
Message-Id: <5CF68E5E02000078002352C5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 09:29:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-6-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-6-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 05/10] microcode: remove pointless 'cpu'
 parameter
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
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L21p
Y3JvY29kZV9hbWQuYwo+IEBAIC03OCw4ICs3OCw5IEBAIHN0cnVjdCBtcGJoZHIgewo+ICBzdGF0
aWMgREVGSU5FX1NQSU5MT0NLKG1pY3JvY29kZV91cGRhdGVfbG9jayk7Cj4gIAo+ICAvKiBTZWUg
Y29tbWVudCBpbiBzdGFydF91cGRhdGUoKSBmb3IgY2FzZXMgd2hlbiB0aGlzIHJvdXRpbmUgZmFp
bHMgKi8KPiAtc3RhdGljIGludCBjb2xsZWN0X2NwdV9pbmZvKHVuc2lnbmVkIGludCBjcHUsIHN0
cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQo+ICtzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8o
c3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCj4gIHsKPiArICAgIHVuc2lnbmVkIGludCBjcHUg
PSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gICAgICBzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmY3B1
X2RhdGFbY3B1XTsKCkkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBjbGVhciBpZiB5b3UgdXNlZCBj
dXJyZW50X2NwdV9kYXRhIGhlcmUuClRoZSBvbmx5IG90aGVyIHVzZSBvZiAiY3B1IiBpcyBpbiBh
IHByX2RlYnVnKCksIHdoaWNoIGJ5IGRlZmF1bHQKZXhwYW5kcyB0byBub3RoaW5nIGFueXdheSwg
YW5kIGhlbmNlIGlzIGNoZWFwIHRvIGNoYW5nZSB0bwp1c2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIGlu
c3RlYWQuCgo+IEBAIC00MzUsMTQgKzQyOSwxNCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IGZpbmFsX2xldmVsc1tdID0gewo+ICAgICAgMHgwMTAwMDBhZgo+ICB9Owo+ICAKPiAtc3RhdGlj
IGJvb2xfdCBjaGVja19maW5hbF9wYXRjaF9sZXZlbHModW5zaWduZWQgaW50IGNwdSkKPiArc3Rh
dGljIGJvb2wgY2hlY2tfZmluYWxfcGF0Y2hfbGV2ZWxzKHZvaWQpCj4gIHsKPiAgICAgIC8qCj4g
ICAgICAgKiBDaGVjayB0aGUgY3VycmVudCBwYXRjaCBsZXZlbHMgb24gdGhlIGNwdS4gSWYgdGhl
eSBhcmUgZXF1YWwgdG8KPiAgICAgICAqIGFueSBvZiB0aGUgJ2ZpbmFsX2xldmVscycsIHRoZW4g
d2Ugc2hvdWxkIG5vdCB1cGRhdGUgdGhlIG1pY3JvY29kZQo+ICAgICAgICogcGF0Y2ggb24gdGhl
IGNwdSBhcyBzeXN0ZW0gd2lsbCBoYW5nIG90aGVyd2lzZS4KPiAgICAgICAqLwo+IC0gICAgY29u
c3Qgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9ICZwZXJfY3B1KGNwdV9zaWcsIGNwdSk7Cj4g
KyAgICBjb25zdCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcp
Owo+ICAgICAgdW5zaWduZWQgaW50IGk7CgpJIGRvbid0IHNlZSBhbnkgZGVwZW5kZW5jeSBvZiB0
aGlzIGZ1bmN0aW9uIHVwb24gcnVubmluZyBvbgp0aGUgc3ViamVjdCBDUFUuCgo+IEBAIC0yNzks
MTIgKzI3OCwxMyBAQCBzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IGNvbXBhcmVf
cGF0Y2goCj4gICAqIHJldHVybiAxIC0gZm91bmQgdXBkYXRlCj4gICAqIHJldHVybiA8IDAgLSBl
cnJvcgo+ICAgKi8KPiAtc3RhdGljIGludCBnZXRfbWF0Y2hpbmdfbWljcm9jb2RlKGNvbnN0IHZv
aWQgKm1jLCB1bnNpZ25lZCBpbnQgY3B1KQo+ICtzdGF0aWMgaW50IGdldF9tYXRjaGluZ19taWNy
b2NvZGUoY29uc3Qgdm9pZCAqbWMpCj4gIHsKPiAgICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
aGVhZGVyX2ludGVsICptY19oZWFkZXIgPSBtYzsKPiAgICAgIHVuc2lnbmVkIGxvbmcgdG90YWxf
c2l6ZSA9IGdldF90b3RhbHNpemUobWNfaGVhZGVyKTsKPiAgICAgIHZvaWQgKm5ld19tYyA9IHht
YWxsb2NfYnl0ZXModG90YWxfc2l6ZSk7Cj4gICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpu
ZXdfcGF0Y2ggPSB4bWFsbG9jKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gpOwo+ICsgICAgdW5zaWdu
ZWQgaW50IF9fbWF5YmVfdW51c2VkIGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKClRoZSBfX21h
eWJlX3VudXNlZCBpcyBmb3IgdGhlIHNvbGUgdXNlIGluIHByX2RlYnVnKCk/IFBsZWFzZQppbnN0
ZWFkIHVzZSBzbXBfcHJvY2Vzc29yX2lkKCkgdGhlcmUsIGlmIHNvLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
