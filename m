Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E330DC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 15:29:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA220222C8
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 15:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Eq6t7KlV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA220222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHVRb-0006HK-0v; Fri, 19 Apr 2019 15:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kxO7=SV=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hHVRZ-0006HF-EO
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 15:28:49 +0000
X-Inumbo-ID: d2c210c8-62b7-11e9-b277-fb92999a699b
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2c210c8-62b7-11e9-b277-fb92999a699b;
 Fri, 19 Apr 2019 15:28:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3JFSkQQ051567;
 Fri, 19 Apr 2019 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=G7M6lxh/FtE/orXl+8ASkbrpZy+olmHU9+XSf8ku588=;
 b=Eq6t7KlVYXL8/1LS3RejNNskUCEXt1cJh5kvXd57rwRDCAh2/APs5ML00AabZl+hleHh
 AGGKlkeB8RrWXxx1pu+sk3D2ytv77+8xYTCi1RH3ay5V7DsrrXYIV/CYlQU+8TaxO8Zd
 kKAluQYdsdt1unLzk+E5QMS4lO1EfNYf0rqsYc3NrVrC/4p3eirqw+idl85200m9O6zI
 vG7fpWUh//QvDDhE9WZ25H4I+CSnbeP482zLzho7kRca27szNJ9QEeyeMUpMj50AgOoD
 DsuoMSb64xQoIHQc/duz0Rqjf6BmrwDj+geY8VizHy18YwqhLZO9aYp2xGY6Xfuq12DH KQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2rvwk46hg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2019 15:28:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3JFSCii045888;
 Fri, 19 Apr 2019 15:28:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ry35c1h84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2019 15:28:45 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3JFSi1V026193;
 Fri, 19 Apr 2019 15:28:44 GMT
Received: from [192.168.2.8] (/106.39.148.99)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 19 Apr 2019 08:28:44 -0700
To: Juergen Gross <jgross@suse.com>
References: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
 <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
 <afbd29eb-25a8-edfc-b561-94264932f9eb@oracle.com>
 <a0ec7385-bc7d-92c4-538b-cad8001fa5ef@suse.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <9be05aab-5291-e372-6d96-1cabf0847db7@oracle.com>
Date: Fri, 19 Apr 2019 23:28:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <a0ec7385-bc7d-92c4-538b-cad8001fa5ef@suse.com>
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9232
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904190114
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9232
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904190114
Subject: Re: [Xen-devel] Question regarding swiotlb-xen in Linux kernel
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Joe Jin <joe.jin@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419152835.OTJ_c3u11spP3X85Yinb8dDDrPUIpTUuSQjvLpOuieg@z>

CgpPbiAwNC8xOS8yMDE5IDAxOjQ3IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE5LzA0
LzIwMTkgMDA6MzEsIEpvZSBKaW4gd3JvdGU6Cj4+IE9uIDQvMTgvMTkgMjowOSBQTSwgQm9yaXMg
T3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gNC8xOC8xOSAzOjM2IEFNLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOgo+Pj4+IEknbSBjdXJyZW50bHkgaW52ZXN0aWdhdGluZyBhIHByb2JsZW0gcmVsYXRlZCB0
byBzd2lvdGxiLXhlbi4gV2l0aCBhCj4+Pj4gc3BlY2lmaWMgZHJpdmVyIGEgY3VzdG9tZXIgaXMg
Y2FwYWJsZSB0byB0cmlnZ2VyIGEgc2l0dWF0aW9uIHdoZXJlIGEKPj4+PiBNRk4gaXMgbWFwcGVk
IHRvIG11bHRpcGxlIGRvbTAgUEZOcyBhdCB0aGUgc2FtZSB0aW1lLiBUaGVyZSBpcyBubwo+Pj4+
IGd1ZXN0IGludm9sdmVkLCBzbyB0aGlzIGlzIG5vdCByZWxhdGVkIHRvIGdyYW50cy4KPj4+Pgo+
Pj4+IFdpdCBhIGRlYnVnIGtlcm5lbCBJIGhhdmUgbWFuYWdlZCB0byB0cmFjayB0aGUgaW5jb25z
aXN0ZW5jeSB0byBhCj4+Pj4gY2FsbCBvZiB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigp
IGZyb20geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpCj4+Pj4gd2hlcmUgdGhlIHJlZ2lvbiB3
YXMgb2J2aW91c2x5IG5vdCBjb250aWd1b3VzLgo+Pj4+Cj4+Pj4geGVuX3N3aW90bGJfZnJlZV9j
b2hlcmVudCgpIGNvbnRhaW5zOgo+Pj4+Cj4+Pj4gICAgICAgICBpZiAoKChkZXZfYWRkciArIHNp
emUgLSAxIDw9IGRtYV9tYXNrKSkgfHwKPj4+PiAgICAgICAgICAgICByYW5nZV9zdHJhZGRsZXNf
cGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkKPj4+PiAgICAgICAgICAgICAgICAgeGVuX2Rlc3Ry
b3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwo+Pj4+Cj4+Pj4gU2hvdWxkbid0IGl0
IGJlIGVpdGhlcjoKPj4+Pgo+Pj4+ICAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8
PSBkbWFfbWFzaykpICYmCj4+Pj4gICAgICAgICAgICAgIXJhbmdlX3N0cmFkZGxlc19wYWdlX2Jv
dW5kYXJ5KHBoeXMsIHNpemUpKQo+Pj4+ICAgICAgICAgICAgICAgICB4ZW5fZGVzdHJveV9jb250
aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Cj4+Pgo+Pj4gK0pvZQo+Pj4KPj4+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMC9tc2cw
MTkyMC5odG1sCj4+Pgo+Pj4gKFRoZSBkaXNjdXNzaW9uIGhhcHBlbmVkIGluCj4+PiBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTAvbXNn
MDE4MTQuaHRtbCkKPj4+Cj4+PiBBbmQgbG9va3MgbGlrZSB3ZSBkcm9wcGVkIGl0LiBPciB3YXMg
dGhlcmUgYSByZWFzb24gd2UgaGF2ZW4ndCBwaWNrZWQgaXQgdXA/Cj4+Cj4+IEkgcmVtZW1iZXJl
ZCB0aGUgY29uY2VybiB3YXMgd2hldGhlciBtZW1vcnkgbm90IGZyb20gWGVuLgo+IAo+IFRoZSBj
dXJyZW50IGNvZGluZyBpcyB3cm9uZy4KPiAKPiBJIGJlbGlldmUgd2Ugc2hvdWxkIGhhdmUgYXQg
bGVhc3QgYSBXQVJOX09OQ0UoKSBpbiBjYXNlCj4geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgp
IGlzIGJlaW5nIGNhbGxlZCB3aXRoIG5vbi1jb250aWd1b3VzIG1lbW9yeS4KPiBBbmQgaXQgc2hv
dWxkIG5vdCBjYWxsIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gdGhhdCBjYXNl
Lgo+IAo+IEpvZSwgZGlkIHlvdSBvYnNlcnZlIHN1Y2ggY2FzZXM/IEknbSBhc2tpbmcgYmVjYXVz
ZSB0aGUgYmFja3RyYWNlcyBJCj4gaGF2ZSBnaXZlIG1lIG5vIGNsdWUgX3doeV8gdGhlIG1lbW9y
eSB3YXMgbm9uLWNvbnRpZ3VvdXMuIFRoZSBjYWxsaW5nCj4gZnVuY3Rpb24gYWxsb2NhdGVkIHRo
ZSBtZW1vcnkgdmlhIHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50KCkgYW5kIHdoZW4KPiBmcmVl
aW5nIGl0IGFnYWluIGl0IHdhcyBub3QgY29udGlndW91cy4KPiAKPiBBbm90aGVyIHRvcGljIGlz
IHRoZSBxdWVzdGlvbiB3aGV0aGVyIHdlIHNob3VsZCByZWFsbHkgY2FsbAo+IHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgd2hlbiBmcmVlaW5nIHRoZSBtZW1vcnkgaWYgdGhlcmUgd2Fz
IG5vCj4gbmVlZCB0byB1c2UgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpIHdoZW4gYWxs
b2NhdGluZyBpdC4KCldoYXQgd291bGQgaGFwcGVuIGlmIGd1ZXN0IGRvbWFpbiBpcyBtYWxpY2lv
dXM/CgpUaGF0IGlzLCBndWVzdCAoaW5jbHVkaW5nIGRvbTApIG15IGFsbG9jYXRlIHVubGltaXRl
ZCBNRk4gY29udGludW91cyBtZW1vcnkgYW5kCm5ldmVyIGV4Y2hhbmdlIHRoZW0gYmFjayB0byB4
ZW4uCgpXb3VsZCBNRk4gY29udGludW91cyBtZW1vcnkgYmUgdXNlZCB1cD8gQXMgYSByZXN1bHQs
IHhlbiBtYXkgbm90IGJlIGFibGUgdG8gYm9vdApuZXcgVk0uIElzIHRoaXMgYSBzb3J0IG9mIERv
UyBhdHRhY2s/CgpEb25nbGkgWmhhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
