Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72EEC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:29:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E945B20679
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="zp0S+AVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E945B20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJfMW-0003YM-Rs; Thu, 25 Apr 2019 14:28:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=49+I=S3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJfMV-0003YH-ST
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:28:31 +0000
X-Inumbo-ID: 651e20e4-6766-11e9-bb3c-db7e19583679
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 651e20e4-6766-11e9-bb3c-db7e19583679;
 Thu, 25 Apr 2019 14:28:29 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PEEDOT005793;
 Thu, 25 Apr 2019 14:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=UWMDYP9rf25zE7UPloCWRf43QTxl6TKzszHNMgT7ZKI=;
 b=zp0S+AVpM89Ro4QFnJ/ZeszriGqm7z6HGgtUfgFXbd9V8TrKYLs/CrzSZO7VpeA6ANjM
 /UiNRbcdNyGycxtwJJYhQmNkAv5fI3NaeVOpOLtkqLkC6T8P1EB7ufmqKi3q2Y8eTYpc
 jhRHK8ZeuyIgFWlnh8rpWejW6nVO9GyEkb8v4PWqbEkwDziuTYXXQrqPyUVzFiQpGyPp
 jCLVez3Git4ZmV/sZfwx0FK21thwr0t7TkK1DGTegivgMpzjMK5DS8va8Uknkej5xMPz
 XJew/qrv90NRktNmO7ky95NJSEIbxmkqAhKdUPsOGnifUPk5/5KJg8y8nn5APCC7jXvm lQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2ryv2qgp7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 14:27:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PERNmC190479;
 Thu, 25 Apr 2019 14:27:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ryrht8ahk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 14:27:55 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3PERqiQ029913;
 Thu, 25 Apr 2019 14:27:52 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Apr 2019 07:27:52 -0700
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
 <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
 <131ff20e-5f28-40ef-37a0-422f6508c115@oracle.com>
 <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <c2993226-ca65-8bb2-dc23-f2a83f3d76db@oracle.com>
Date: Thu, 25 Apr 2019 10:27:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904250089
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904250089
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
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
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yNS8xOSA2OjAyIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwgQXBy
IDI0LCAyMDE5IGF0IDExOjQ1OjQzQU0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4g
T24gNC8yNC8xOSAxMTo0NSBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwg
QXByIDI0LCAyMDE5IGF0IDExOjM2OjQxQU0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
Pj4+PiBPbiA0LzIzLzE5IDk6MDQgQU0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gVGhp
cyBpbnZvbHZlcyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZpZWxk
cyBhbmQgdGhlCj4+Pj4+IGVmaSBnbG9iYWwgdmFyaWFibGUuCj4+Pj4+Cj4+Pj4+IFdpdGhvdXQg
dGhpcyBmaXggYSBQVkggZG9tMCBkb2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwg
YW5kCj4+Pj4+IHRodXMgZG9lc24ndCBzdXBwb3J0IGFjY2Vzc2luZyBhbnkgb2YgdGhlIEVGSSBy
ZWxhdGVkIGRhdGEuCj4+Pj4+Cj4+Pj4+IFJlcG9ydGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRl
dkBnbWFpbC5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+Pj4+IEhtbS4uIFRoaXMgc2VlbXMgdG8gYmUgYnJlYWtpbmcgc2F2
ZS9yZXN0b3JlIGZvciBtZSAoZm9yIGRvbVUpLCBhbmQgSQo+Pj4+IGNhbid0IHNlZSBhbnkgb2J2
aW91cyByZWFzb25zLgo+Pj4+Cj4+Pj4gQ2FuIHlvdSB0cnkgaXQ/Cj4+PiBTdXJlLCB0aGFua3Mg
Zm9yIHRoZSBleHRyYSB0ZXN0aW5nISBJIGhhdmUgdG8gYWRtaXQgSSBoYXZlbid0IHRlc3RlZAo+
Pj4gc2F2ZS9yZXN0b3JlIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBpdCBkaWRuJ3QgY29tZSB0
byBtaW5kIGl0IG1pZ2h0Cj4+PiBhZmZlY3QgdGhhdCBmdW5jdGlvbmFsaXR5Lgo+Pj4KPj4+IEkg
YXNzdW1lIGl0J3Mgc2F2ZS9yZXN0b3JlIG9mIGEgUFZIIGRvbVUgdGhhdCdzIGJyb2tlbiAoSFZN
IGFuZCBQViBhcmUKPj4+IGZpbmUpPwo+Pj4KPj4KPj4gUFYgaXMgZmluZSwgSSBoYXZlbid0IHRy
aWVkIEhWTS4KPiBJJ3ZlIHRlc3RlZCBsaXZlIG1pZ3JhdGlvbiBhbmQgc2F2ZS9yZXN0b3JlIG9m
IHRoaXMgc2VyaWVzIG9uIHRvcCBvZgo+IDUuMS4wLXJjNSBhbmQgc2VlbXMgdG8gd29yayBmaW5l
IGZvciBtZS4gT24gdG9wIG9mIHdoaWNoIExpbnV4IHZlcnNpb24KPiB3aGVyZSB5b3UgdGVzdGlu
ZywgYW5kIGNhbiB5b3UgcGFzdGUgdGhlIGd1ZXN0IGNvbmZpZyBmaWxlPwo+CgpJdCdzIG5vdCB5
b3VyIGNoYW5nZS4KCkkgd2FzIGJvb3Rpbmcgd2l0aCB0aHJlYWRpcnFzIGJvb3Qgb3B0aW9uIGFu
ZCBodmMgY29uc29sZSBhcHBhcmVudGx5CmRvZXNuJ3QgbGlrZSB0aGF0LiBJdCdzIG5vdCAxMDAl
IHJlcHJvZHVjaWJsZSwgYnV0IEkgd2FzIGFibGUgdG8gZmFpbApzYXZlL3Jlc3RvcmUgd2l0aG91
dCB5b3VyIHBhdGNoZXMgYXMgd2VsbC4KCkkgbWF5IGxvb2sgYXQgdGhpcyBzb21ldGltZSBuZXh0
IHdlZWssIGJ1dCBpbiB0aGUgbWVhbnRpbWUgZm9yIGJvdGggcGF0Y2hlcwoKUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgphbmQgSSB3aWxs
IGFkZCA0LjE5KyBmb3Igc3RhYmxlLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
