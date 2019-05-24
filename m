Return-Path: <SRS0=fmWs=TY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760D8C072B5
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 15:50:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568D8217D7
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 15:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568D8217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUCSn-0003D1-G1; Fri, 24 May 2019 15:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hUCSl-0003Cw-Rx
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:50:31 +0000
X-Inumbo-ID: a6b1365e-7e3b-11e9-856a-e741455bf4ae
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6b1365e-7e3b-11e9-856a-e741455bf4ae;
 Fri, 24 May 2019 15:50:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 09:50:27 -0600
Message-Id: <5CE812C3020000780023219E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 09:50:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558710904-8210-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558710904-8210-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] tests/x86emul: Annotate test blobs as
 executable code
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190524155027.Hr95i9DjEzrQ3sHEzwDpNY95SY5rLoBKF0rQlsIttqQ@z>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE3OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCj4gKysrIGIvdG9v
bHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCj4gQEAgLTE0OSw3ICsxNDksNyBAQCAkKGFk
ZHN1ZmZpeCAuaCwkKFRFU1RDQVNFUykpOiAlLmg6ICUuYyB0ZXN0Y2FzZS5tayBNYWtlZmlsZQo+
ICAJCShlY2hvICdzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IF9fYXR0cmlidXRlX18oKHNlY3Rp
b24oIi50ZXN0LCBcImF4XCIsIEBwcm9nYml0cyAjIikpKScgXAo+ICAJCSAgICAgICIkJHtwcmVm
aXh9XyQoYXJjaCkkJHtmbGF2b3J9W10gPSB7IjsgXAo+ICAJCSBvZCAtdiAtdCB4ICQqLmJpbiB8
IHNlZCAtZSAncy9eWzAtOV0qIC8weC8nIC1lICdzLyAvLCAweC9nJyAtZSAncy8kJC8sLyc7IFwK
PiAtCQkgZWNobyAifTsiKSA+PiRALm5ldzsgXAo+ICsJCSBlY2hvICJ9OyBhc20oXCIudHlwZSAk
JHtwcmVmaXh9XyQoYXJjaCkkJHtmbGF2b3J9LCBTVFRfRlVOQztcIik7IikgPj4kQC5uZXc7IFwK
CkhtbSwgdGhpcyBzZWVtcyByaXNreSB0byBtZSAtIEknZCBleHBlY3QgYSBkZWNlbnQgY29tcGls
ZXIgdG8gbWFyawp0aGVtIGFzIFNUVF9PQkpFQ1QsIGFuZCBhIGRlY2VudCBhc3NlbWJsZXIgdG8g
Y2hva2Ugb24gZmluZGluZwpkaXNhZ3JlZWluZyAudHlwZSBkaXJlY3RpdmVzIGZvciB0aGUgc2Ft
ZSBzeW1ib2wuIEN1cnJlbnQgYmludXRpbHMKbG9va3MgdG8gc2ltcGx5IE9SIHRvZ2V0aGVyIGFs
bCB0aGUgdmFsdWVzLCBhbmQgdGhlbiBkZWNpZGUgaW4gYW4KYWRob2Mgc2VxdWVuY2Ugd2hpY2gg
dHlwZSB0byBhY3R1YWxseSBlbWl0OgoKICAgICAgaWYgKChmbGFncyAmIEJTRl9USFJFQURfTE9D
QUwpICE9IDApCgl0eXBlID0gU1RUX1RMUzsKICAgICAgZWxzZSBpZiAoKGZsYWdzICYgQlNGX0dO
VV9JTkRJUkVDVF9GVU5DVElPTikgIT0gMCkKCXR5cGUgPSBTVFRfR05VX0lGVU5DOwogICAgICBl
bHNlIGlmICgoZmxhZ3MgJiBCU0ZfRlVOQ1RJT04pICE9IDApCgl0eXBlID0gU1RUX0ZVTkM7CiAg
ICAgIGVsc2UgaWYgKChmbGFncyAmIEJTRl9PQkpFQ1QpICE9IDApCgl0eXBlID0gU1RUX09CSkVD
VDsKICAgICAgZWxzZSBpZiAoKGZsYWdzICYgQlNGX1JFTEMpICE9IDApCgl0eXBlID0gU1RUX1JF
TEM7CiAgICAgIGVsc2UgaWYgKChmbGFncyAmIEJTRl9TUkVMQykgIT0gMCkKCXR5cGUgPSBTVFRf
U1JFTEM7CiAgICAgIGVsc2UKCXR5cGUgPSBTVFRfTk9UWVBFOwoKSSBkb24ndCB0aGluayB0aGF0
J3Mgc2FuZSBiZWhhdmlvciAoYWxiZWl0IGl0IGd1YXJhbnRlZXMgQGZ1bmN0aW9uIHRvCndpbiBv
dmVyIEBvYmplY3QpLCBhbmQgaGVuY2UgSSdkIHNheSBpdCBjYW4gY2hhbmdlIGF0IGFueSB0aW1l
LgoKSSB3YW50ZWQgdG8gc3VnZ2VzdCBmb3JjaW5nIHRoZSB0eXBlIGNoYW5nZSB2aWEgb2JqY29w
eSwgYnV0IHRvCm15IHN1cnByaXNlIEkgY291bGRuJ3QgZmluZCBhIHJlc3BlY3RpdmUgb3B0aW9u
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
