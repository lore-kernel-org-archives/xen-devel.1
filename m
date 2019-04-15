Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCD2C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:27:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95AE4206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95AE4206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFwxV-0000md-BX; Mon, 15 Apr 2019 08:27:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hFwxU-0000mY-JT
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:27:20 +0000
X-Inumbo-ID: 484d4589-5f58-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 484d4589-5f58-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 08:27:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 15 Apr 2019 02:25:18 -0600
Message-Id: <5CB43FEC020000780015540C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 15 Apr 2019 02:25:16 -0600
From: "Jan Beulich" <jbeulich@suse.com>
To: <andrew.cooper3@citrix.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-4-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1555172532-23814-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] x86/boot: Detect the firmware SMT
 setting correctly on Intel hardware
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
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415082516.2hPQbovFVgcCLiAOVsq8wohvwf1G0U4_QPsESNpAi2A@z>

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzEzLzE5IDY6
MjIgUE0gPj4+Cj4tLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKPisrKyBiL3hlbi9hcmNo
L3g4Ni9zcGVjX2N0cmwuYwo+QEAgLTU4LDcgKzU4LDcgQEAgdWludDhfdCBfX3JlYWRfbW9zdGx5
IGRlZmF1bHRfeGVuX3NwZWNfY3RybDsKPnVpbnQ4X3QgX19yZWFkX21vc3RseSBkZWZhdWx0X3Nw
ZWNfY3RybF9mbGFnczsKID4KPnBhZGRyX3QgX19yZWFkX21vc3RseSBsMXRmX2FkZHJfbWFzaywg
X19yZWFkX21vc3RseSBsMXRmX3NhZmVfbWFkZHI7Cj4tc3RhdGljIGJvb2wgX19pbml0ZGF0YSBj
cHVfaGFzX2J1Z19sMXRmOwo+K3N0YXRpYyBib29sIF9faW5pdGRhdGEgY3B1X2hhc19idWdfbDF0
ZiwgaHdfc210X2VuYWJsZWQ7CgpJIHdvbmRlciB3aGV0aGVyIHRoaXMgd291bGRuJ3QgYmV0dGVy
IHN0YXJ0IG91dCBhcyAidHJ1ZSIgYW5kIGdldCBzZXQgdG8gZmFsc2Ugd2hlbgp3ZSdyZSBjZXJ0
YWluIFNNVCBpcyBvZmYuIEknZCByYXRoZXIgc2VlIHRoZSBuYWdnaW5nIG9uZSB0aW1lIHRvbyBv
ZnRlbiwgdGhhbiBnZXQgYQpyZXBvcnQgdGhhdCBzb21lb25lJ3Mgc3RpbGwgdnVsbmVyYWJsZSBi
ZWNhdXNlIG9mIGhhdmluZyBTTVQgZW5hYmxlZCB3aXRob3V0Cm5vdGljaW5nLgoKCj4rc3RhdGlj
IHZvaWQgX19pbml0IGRldGVjdF9zbXRfc3RhdHVzKHZvaWQpCgo+K3sKPisgICAgdWludDY0X3Qg
dmFsOwo+KyAgICB1bnNpZ25lZCBpbnQgY3B1Owo+Kwo+KyAgICAvKgo+KyAgICAgKiB4ODZfbnVt
X3NpYmxpbmdzIGRlZmF1bHRzIHRvIDEgaW4gdGhlIGFic2VuY2Ugb2Ygb3RoZXIgaW5mb3JtYXRp
b24sIGFuZAo+KyAgICAgKiBpcyBhZGp1c3RlZCBiYXNlZCBvbiBvdGhlciB0b3BvbG9neSBpbmZv
cm1hdGlvbiBmb3VuZCBpbiBDUFVJRCBsZWF2ZXMuCj4rICAgICAqCj4rICAgICAqIE9uIEFNRCBo
YXJkd2FyZSwgaXQgd2lsbCBiZSB0aGUgY3VycmVudCBTTVQgY29uZmlndXJhdGlvbi4gIE9uIElu
dGVsCj4rICAgICAqIGhhcmR3YXJlLCBpdCB3aWxsIHJlcHJlc2VudCB0aGUgbWF4aW11bSBjYXBh
YmlsaXR5LCByYXRoZXIgdGhhbiB0aGUKPisgICAgICogY3VycmVudCBjb25maWd1cmF0aW9uLgo+
KyAgICAgKi8KPisgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGluZ3MgPCAyICkK
PisgICAgICAgIHJldHVybjsKPisKPisgICAgLyoKPisgICAgICogSW50ZWwgTmVoYWxlbSBhbmQg
bGF0ZXIgaGFyZHdhcmUgZG9lcyBoYXZlIGFuIE1TUiB3aGljaCByZXBvcnRzIHRoZQo+KyAgICAg
KiBjdXJyZW50IGNvdW50IG9mIGNvcmVzL3RocmVhZHMgaW4gdGhlIHBhY2thZ2UuCj4rICAgICAq
Cj4rICAgICAqIEF0IHRoZSB0aW1lIG9mIHdyaXRpbmcsIGl0IGlzIGFsbW9zdCBjb21wbGV0ZWx5
IHVuZG9jdW1lbnRlZCwgc28gaXNuJ3QKPisgICAgICogdmlydHVhbGlzZWQgcmVsaWFibHkuCj4r
ICAgICAqLwo+KyAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9S
X0lOVEVMICYmICFjcHVfaGFzX2h5cGVydmlzb3IgJiYKCldoaWxlIHlvdSBjbGFyaWZ5IHdoeSB5
b3UgaGF2ZSB0aGUgbGFzdCBwYXJ0IG9mIHRoZSBjb25kaXRpb24gaW4gdGhlIGNvbW1lbnQsIEkK
c3RpbGwgd29uZGVyIHdoZXRoZXIgaXQgd291bGRuJ3QgYmUgd29ydGh3aGlsZSB0byBhc3N1bWUg
aXQgbWlnaHQgYmUgKHByb3Blcmx5KQp2aXJ0dWFsaXplZCwgYW5kIHJhdGhlciBkbyBhIGxpdHRs
ZSBtb3JlIHNhbml0eSBjaGVja2luZyAuLi4KCgo+KyAgICAgICAgICFyZG1zcl9zYWZlKE1TUl9J
TlRFTF9DT1JFX1RIUkVBRF9DT1VOVCwgdmFsKSApCj4rICAgIHsKPisgICAgICAgIGh3X3NtdF9l
bmFibGVkID0gKE1BU0tfRVhUUih2YWwsIE1TUl9DVENfQ09SRV9NQVNLKSAhPQo+KyAgICAgICAg
ICAgICAgICAgICAgICAgICAgTUFTS19FWFRSKHZhbCwgTVNSX0NUQ19USFJFQURfTUFTSykpOwo+
KyAgICAgICAgcmV0dXJuOwoKLi4uIGJlZm9yZSB0aGlzOiBWZXJpZnkgdGhhdCBib3RoIGZpZWxk
cyBhcmUgbm9uLXplcm8sIHRoYXQgY29yZSBjb3VudCBpcyBubyBncmVhdGVyCnRoYW4gdGhyZWFk
IGNvdW50LCBhbmQgcGVyaGFwcyB0aGUgbGF0dGVyIGFsc28gZGl2aWRlcyBldmVubHkgYnkgdGhl
IGZvcm1lci4KCkhvd2V2ZXIsIHRoaXMgYmVpbmcgYW4gaW1wcm92ZW1lbnQgb24gaXRzIG93biBh
bHJlYWR5LCBJIGNvdWxkIGFjY2VwdCBpdCBnb2luZwppbiBhcyBpcywgc28gZXZlbiBpbiBpdHMg
Y3VycmVudCBzaGFwZSAoYWxiZWl0IHByZWZlcmFibHkgd2l0aCB0aGUgc3RhcnQtb3V0LWFzLXRy
dWUKYWRqdXN0bWVudCBtZW50aW9uZWQgYWJvdmUpCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKPkBAIC04ODYsOCArOTMxLDcgQEAgdm9pZCBfX2luaXQgaW5pdF9z
cGVjdWxhdGlvbl9taXRpZ2F0aW9ucyh2b2lkKQogICAgICA+KiBIb3dldmVyLCBpZiB3ZSBhcmUg
b24gYWZmZWN0ZWQgaGFyZHdhcmUsIHdpdGggSFQgZW5hYmxlZCwgYW5kIHRoZSB1c2VyCj4qIGhh
c24ndCBleHBsaWNpdGx5IGNob3NlbiB3aGV0aGVyIHRvIHVzZSBIVCBvciBub3QsIG5hZyB0aGVt
IHRvIGRvIHNvLgo+Ki8KPi0gICAgaWYgKCBvcHRfc210ID09IC0xICYmIGNwdV9oYXNfYnVnX2wx
dGYgJiYgIXB2X3NoaW0gJiYKPi0gICAgICAgICBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGlu
Z3MgPiAxICkKPisgICAgaWYgKCBvcHRfc210ID09IC0xICYmIGNwdV9oYXNfYnVnX2wxdGYgJiYg
IXB2X3NoaW0gJiYgaHdfc210X2VuYWJsZWQgKQoKSXQgZmVlbHMgbGlrZSB0aGUgcHZfc2hpbSBw
YXJ0IHNob3VsZCBoYXZlIGJlY29tZSByZWR1bmRhbnQgbm93LCBidXQgSSdtCnVuY2VydGFpbiB3
aGV0aGVyIGl0IHJlYWxseSBkb2VzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
