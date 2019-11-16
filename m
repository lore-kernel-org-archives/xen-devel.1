Return-Path: <SRS0=F76Y=ZI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E28C432C3
	for <xen-devel@archiver.kernel.org>; Sat, 16 Nov 2019 01:41:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB5B2073B
	for <xen-devel@archiver.kernel.org>; Sat, 16 Nov 2019 01:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EvZSYxJ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB5B2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVn4v-0006kU-AB; Sat, 16 Nov 2019 01:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uK/g=ZI=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iVn4t-0006kP-Ov
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 01:40:43 +0000
X-Inumbo-ID: 19708b80-0812-11ea-9631-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19708b80-0812-11ea-9631-bc764e2007e4;
 Sat, 16 Nov 2019 01:40:42 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAG1cfhf180227;
 Sat, 16 Nov 2019 01:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=6YlXLtfVPzeKD6Cu0vzUujAR6yZCIYfReDpNczfohDQ=;
 b=EvZSYxJ8wB9KGsMBFNvBNcZsZB5ahF3fl7+IfoZIfIdWCUKzPFqXzH0JoOowzhMtAy5e
 17Ypbgv3WN/yHoJaIaInlHB4PoTSQvwN8/7KhC9bIBEcXV/2jinWej61ulvgsQEywscd
 zJKNk902nrB4h8pOhRfqKK1h8donQ4/pSH2ON9syZTya6/w3XYWYTnheLDPelIzTJGbB
 ye3EsdjI9ZQpJaDrn9GQ1cAoZ0obxOy90PRBhqm1Vz//XvR9gwWXPi4oEn97CrjgOthk
 oTEGJ3M0SqI3Nu0aVt2uPvTr3gmEmhv1/g8YZ2r3zWs/aqBc10qu6fEpLshSD4Xt4s9T Zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2w9gxppdv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Nov 2019 01:40:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAG1cbNn108627;
 Sat, 16 Nov 2019 01:40:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2w9h0qg6wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Nov 2019 01:40:37 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAG1eZLZ002726;
 Sat, 16 Nov 2019 01:40:36 GMT
Received: from [10.159.237.191] (/10.159.237.191)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Nov 2019 17:40:35 -0800
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Tian, Kevin" <kevin.tian@intel.com>
References: <20191108133414.96381-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D5F6ADA@SHSMSX104.ccr.corp.intel.com>
 <20191115140643.GH72134@Air-de-Roger>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <423cb351-0a55-4e14-a041-06f6335fddfa@oracle.com>
Date: Fri, 15 Nov 2019 17:40:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115140643.GH72134@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9442
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911160010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9442
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911160010
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] x86/passthrough: fix migration
 of MSI when using posted interrupts
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgNjowNiBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIE5v
diAxNSwgMjAxOSBhdCAwNToyMzo1MUFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+IEZy
b206IFJvZ2VyIFBhdSBNb25uZSBbbWFpbHRvOnJvZ2VyLnBhdUBjaXRyaXguY29tXQo+Pj4gU2Vu
dDogRnJpZGF5LCBOb3ZlbWJlciA4LCAyMDE5IDk6MzQgUE0KPj4+Cj4+PiBXaGVuIHVzaW5nIHBv
c3RlZCBpbnRlcnJ1cHRzIGFuZCB0aGUgZ3Vlc3QgbWlncmF0ZXMgTVNJIGZyb20gdkNQVXMgWGVu
Cj4+PiBuZWVkcyB0byBmbHVzaCBhbnkgcGVuZGluZyBQSVJSIHZlY3RvcnMgb24gdGhlIHByZXZp
b3VzIHZDUFUsIG9yIGVsc2UKPj4+IHRob3NlIHZlY3RvcnMgY291bGQgZ2V0IHdyb25nbHkgaW5q
ZWN0ZWQgYXQgYSBsYXRlciBwb2ludCB3aGVuIHRoZSBNU0kKPj4+IGZpZWxkcyBhcmUgYWxyZWFk
eSB1cGRhdGVkLgo+PiBJIG1heSBvdmVybG9vayBidXQgaXNuJ3QgaXQgdGhlIGd1ZXN0J3MgcmVz
cG9uc2liaWxpdHkgb2YgaGFuZGxpbmcgc3VjaAo+PiBjYXNlPyBFdmVuIG9uIGJhcmUgbWV0YWws
IGFuIGluLWZseSBpbnRlcnJ1cHQgbWF5IGJlIGRlbGl2ZXJlZCB0bwo+PiB3cm9uZyBDUFUgd2hl
biBNU0kgaXMgYmVpbmcgbWlncmF0ZWQ/Cj4gQWNjb3JkaW5nIHRvIEpvZSBmcm9tIE9yYWNsZSBM
aW51eCBhbHJlYWR5IHRha2VzIGNhcmUgb2YgdGhhdCBieQo+IGNoZWNraW5nIElSUiB3aGVuIG1p
Z3JhdGluZyBpbnRlcnJ1cHRzIGJldHdlZW4gQ1BVcywgYnV0IGl0IHNlZW1zIGxpa2UKPiB0aGUg
dmVjdG9yIGlzIG5vdCBwZW5kaW5nIGluIElSUiAobXkgaHlwb3RoZXNpcyBpcyB0aGF0IGl0J3Mg
cGVuZGluZwo+IGluIFBJUiBidXQgbGFja2luZyBhIHN5bmMgaW50byBJUlIpLgo+IAo+IEFmdGVy
IGRpZ2dpbmcgbW9yZSBpbnRvIHRoZSBwb3N0ZWQgaW50ZXJydXB0IGNvZGUsIEkgdGhpbmsgdGhl
cmUncyBhbgo+IGlzc3VlIHNvbWV3aGVyZSBlbHNlLCBhbmQgdGhlIHN5bmMgb24gTVNJIHJlY29u
ZmlndXJhdGlvbiBkb25lIGJ5IHRoaXMKPiBwYXRjaCBpcyBqdXN0IGNvdmVyaW5nIHRoYXQgdXAu
Cj4gCj4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBpbnRlcnJ1cHRzIHBlbmRpbmcgaW4gdGhlIFBJ
UiB3aGVuIHRoZSB2Q1BVIGlzCj4gcnVubmluZywgYW5kIGFueSBwZW5kaW5nIHZlY3RvcnMgaW4g
dGhlIFBJUiBzaG91bGQgYmUgc3luY2VkIGludG8gSVJSCj4gYmVmb3JlIGV4ZWN1dGluZyB0aGUg
dkNQVS4KPiAKPiBBRkFJQ1QgdGhlcmUncyBhbiBpc3N1ZSB3aXRoIGhvdyBQSVIgaXMgc3luY2Vk
IGludG8gSVJSLCBpdCByZWxpZXMgb24KPiB2bGFwaWNfZmluZF9oaWdoZXN0X2lyciBiZWluZyBj
YWxsZWQgZnJvbSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxLCBidXQKPiBkZXBlbmRpbmcgb24gd2hp
Y2ggaW50ZXJydXB0cyBhcmUgcGVuZGluZyBpdCdzIHBvc3NpYmxlIHRoYXQKPiB2bGFwaWNfaGFz
X3BlbmRpbmdfaXJxIGlzIG5vdCBjYWxsZWQgYnkgaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJxLCB0
aHVzCj4gbGVhdmluZyBJUlIgc3RhbGUuCj4gCj4gVGhlIHBhdGNoIGJlbG93IHNob3VsZCBzb2x2
ZSB0aGF0IGFuZCBhbHNvIHNpbXBsaWZ5Cj4gX192bXhfZGVsaXZlcl9wb3N0ZWRfaW50ZXJydXB0
LCB0aGVyZSdzIG5vIHJlYXNvbiB0byByYWlzZSBhIHNvZnRpcnEKPiBpbiBfX3ZteF9kZWxpdmVy
X3Bvc3RlZF9pbnRlcnJ1cHQ6IGlmIHRoZSB2Q1BVIGlzIHRoZSBvbmUgY3VycmVudGx5Cj4gcnVu
bmluZyBvciBpZiBpdCdzIG5vdCBydW5uaW5nIGF0IGFsbCB0aGUgc3luYyBvZiBQSVIgdG8gSVJS
IHdpbGwKPiBoYXBwZW4gb24gdm1lbnRyeSwgd2l0aG91dCB0aGUgbmVlZCBvZiBhbnkgc29mdGly
cSBiZWluZyBzZXQuIEFsc28KPiBub3RlIHRoZSByYWlzZV9zb2Z0aXJxIGluIF9fdm14X2RlbGl2
ZXJfcG9zdGVkX2ludGVycnVwdCBzaG91bGQgaGF2ZQo+IGJlZW4gYSBjcHVfcmFpc2Vfc29mdGly
cShjcHUsIFZDUFVfS0lDS19TT0ZUSVJRKSBpbnN0ZWFkLgo+IAo+IEpvZSwgY2FuIHlvdSBnaXZl
IGEgdHJ5IHRvIHRoZSBwYXRjaCBiZWxvdz8KClRoaXMgcGF0Y2ggZml4ZWQgbXkgaXNzdWUgYXMg
d2VsbC4KClRoYW5rcywKSm9lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
