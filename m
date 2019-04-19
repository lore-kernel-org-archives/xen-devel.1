Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D6FC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 14:41:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C3D222D1
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 14:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xu48vlCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C3D222D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHUhH-0002lt-Ka; Fri, 19 Apr 2019 14:40:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mC5C=SV=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1hHUhG-0002lo-UV
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 14:40:58 +0000
X-Inumbo-ID: 24280c99-62b1-11e9-92d7-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24280c99-62b1-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 14:40:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3JEXeVu019351;
 Fri, 19 Apr 2019 14:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=UCMLynADLajEvlX06mlRoRqMryimYOKExKER6IFMKfA=;
 b=Xu48vlCi+/iqN+af2o6g+uPLupKYLxteApc3eT0kj1yRoBc8IuWVcTDtN1BefOKB0KS3
 XJCPhyQmwTCWW3j9AVedS2SWwZTvsxwDO0sqf5DO1lIbEnwadVXBGl296CTiLtVFSkj/
 IDmc3bqnJmVOCJ4t9W37HuhLBVB3E5IazMXbYw3NeGVxxlL33FFkTzybQ6fms+BtHboK
 BC2t8G3rMfu+c6H4OjWLOjCfLUs6FcXLjIU01HJHHQwSsYZtrmGaM5iUOjzm+BSbqHDR
 CGKgfhxnXn0s0shnXxMtZFaGHp3857ertYMgXzEbTjN6OLLjPyathRcF+VreKLLdIvCr kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2rusnfc4s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2019 14:40:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3JEeDbl131874;
 Fri, 19 Apr 2019 14:40:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2rwe7bj0gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2019 14:40:55 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3JEermL028403;
 Fri, 19 Apr 2019 14:40:53 GMT
Received: from [10.211.47.3] (/10.211.47.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 19 Apr 2019 07:40:53 -0700
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
 <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
 <afbd29eb-25a8-edfc-b561-94264932f9eb@oracle.com>
 <a0ec7385-bc7d-92c4-538b-cad8001fa5ef@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <d1ca67c3-23cd-12ef-2913-4e1afb62e061@oracle.com>
Date: Fri, 19 Apr 2019 07:40:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a0ec7385-bc7d-92c4-538b-cad8001fa5ef@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904190110
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904190110
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419144052.yw6BQJC6OMde0zJ8EUQ3RrRJqVA7ETkRZ17Ivqr7IWM@z>

T24gNC8xOC8xOSAxMDo0NyBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxOS8wNC8yMDE5
IDAwOjMxLCBKb2UgSmluIHdyb3RlOgo+PiBPbiA0LzE4LzE5IDI6MDkgUE0sIEJvcmlzIE9zdHJv
dnNreSB3cm90ZToKPj4+IE9uIDQvMTgvMTkgMzozNiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgYSBwcm9ibGVtIHJlbGF0ZWQgdG8gc3dp
b3RsYi14ZW4uIFdpdGggYQo+Pj4+IHNwZWNpZmljIGRyaXZlciBhIGN1c3RvbWVyIGlzIGNhcGFi
bGUgdG8gdHJpZ2dlciBhIHNpdHVhdGlvbiB3aGVyZSBhCj4+Pj4gTUZOIGlzIG1hcHBlZCB0byBt
dWx0aXBsZSBkb20wIFBGTnMgYXQgdGhlIHNhbWUgdGltZS4gVGhlcmUgaXMgbm8KPj4+PiBndWVz
dCBpbnZvbHZlZCwgc28gdGhpcyBpcyBub3QgcmVsYXRlZCB0byBncmFudHMuCj4+Pj4KPj4+PiBX
aXQgYSBkZWJ1ZyBrZXJuZWwgSSBoYXZlIG1hbmFnZWQgdG8gdHJhY2sgdGhlIGluY29uc2lzdGVu
Y3kgdG8gYQo+Pj4+IGNhbGwgb2YgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBmcm9t
IHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKQo+Pj4+IHdoZXJlIHRoZSByZWdpb24gd2FzIG9i
dmlvdXNseSBub3QgY29udGlndW91cy4KPj4+Pgo+Pj4+IHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJl
bnQoKSBjb250YWluczoKPj4+Pgo+Pj4+ICAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0g
MSA8PSBkbWFfbWFzaykpIHx8Cj4+Pj4gICAgICAgICAgICAgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2Vf
Ym91bmRhcnkocGh5cywgc2l6ZSkpCj4+Pj4gICAgICAgICAgICAgICAgIHhlbl9kZXN0cm95X2Nv
bnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKPj4+Pgo+Pj4+IFNob3VsZG4ndCBpdCBiZSBl
aXRoZXI6Cj4+Pj4KPj4+PiAgICAgICAgIGlmICgoKGRldl9hZGRyICsgc2l6ZSAtIDEgPD0gZG1h
X21hc2spKSAmJgo+Pj4+ICAgICAgICAgICAgICFyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFy
eShwaHlzLCBzaXplKSkKPj4+PiAgICAgICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29udGlndW91
c19yZWdpb24ocGh5cywgb3JkZXIpOwo+Pj4KPj4+ICtKb2UKPj4+Cj4+PiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTAvbXNnMDE5MjAu
aHRtbAo+Pj4KPj4+IChUaGUgZGlzY3Vzc2lvbiBoYXBwZW5lZCBpbgo+Pj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTEwL21zZzAxODE0
Lmh0bWwpCj4+Pgo+Pj4gQW5kIGxvb2tzIGxpa2Ugd2UgZHJvcHBlZCBpdC4gT3Igd2FzIHRoZXJl
IGEgcmVhc29uIHdlIGhhdmVuJ3QgcGlja2VkIGl0IHVwPwo+Pgo+PiBJIHJlbWVtYmVyZWQgdGhl
IGNvbmNlcm4gd2FzIHdoZXRoZXIgbWVtb3J5IG5vdCBmcm9tIFhlbi4KPiAKPiBUaGUgY3VycmVu
dCBjb2RpbmcgaXMgd3JvbmcuCgpJIGFncmVlIHdpdGggeW91LCB5b3VyIHBhdGNoIHNhbWUgd2l0
aCBJIHNlbnQgYmVmb3JlLCBJJ20gZ29vZCB0byBoYXZlIGl0LgoKPiAKPiBJIGJlbGlldmUgd2Ug
c2hvdWxkIGhhdmUgYXQgbGVhc3QgYSBXQVJOX09OQ0UoKSBpbiBjYXNlCj4geGVuX3N3aW90bGJf
ZnJlZV9jb2hlcmVudCgpIGlzIGJlaW5nIGNhbGxlZCB3aXRoIG5vbi1jb250aWd1b3VzIG1lbW9y
eS4KPiBBbmQgaXQgc2hvdWxkIG5vdCBjYWxsIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9u
KCkgaW4gdGhhdCBjYXNlLgpJdCdzIHBvdGVudGlhbCBpc3N1ZSwgaWYgYWxsb2MvZnJlZSBpcyBu
b3QgaW4gcGFpcnMsIGl0IHdpbGwgYmUgYSBwcm9ibGVtLgoKPiAKPiBKb2UsIGRpZCB5b3Ugb2Jz
ZXJ2ZSBzdWNoIGNhc2VzPyBJJ20gYXNraW5nIGJlY2F1c2UgdGhlIGJhY2t0cmFjZXMgSQo+IGhh
dmUgZ2l2ZSBtZSBubyBjbHVlIF93aHlfIHRoZSBtZW1vcnkgd2FzIG5vbi1jb250aWd1b3VzLiBU
aGUgY2FsbGluZwo+IGZ1bmN0aW9uIGFsbG9jYXRlZCB0aGUgbWVtb3J5IHZpYSB4ZW5fc3dpb3Rs
Yl9hbGxvY19jb2hlcmVudCgpIGFuZCB3aGVuCj4gZnJlZWluZyBpdCBhZ2FpbiBpdCB3YXMgbm90
IGNvbnRpZ3VvdXMuCgpOb3Qgc3VyZSBpZiB5b3UgaGF2ZSBjb21taXQgNzI1MGY0MjIgInhlbi1z
d2lvdGxiOiB1c2UgYWN0dWFsbHkgYWxsb2NhdGVkIApzaXplIG9uIGNoZWNrIHBoeXNpY2FsIGNv
bnRpbnVvdXMiPyB3aXRob3V0IHRoaXMgY29tbWl0LCBpdCdzIHBvc3NpYmxlLAphZnRlciBhcHBs
eSB0aGUgY29tbWl0LCB3ZSBkaWQgbm90IGhpdCBzdWNoIGtpbmQgY2FzZXMuCgpUaGFua3MsCkpv
ZQo+IAo+IEFub3RoZXIgdG9waWMgaXMgdGhlIHF1ZXN0aW9uIHdoZXRoZXIgd2Ugc2hvdWxkIHJl
YWxseSBjYWxsCj4geGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSB3aGVuIGZyZWVpbmcg
dGhlIG1lbW9yeSBpZiB0aGVyZSB3YXMgbm8KPiBuZWVkIHRvIHVzZSB4ZW5fY3JlYXRlX2NvbnRp
Z3VvdXNfcmVnaW9uKCkgd2hlbiBhbGxvY2F0aW5nIGl0Lgo+IAo+IAo+IEp1ZXJnZW4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
