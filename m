Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94118C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:21:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EBB20717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KtnjGik3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18EBB20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJi40-0002pq-1O; Thu, 25 Apr 2019 17:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Om2I=S3=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hJi3z-0002pl-6D
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 17:21:35 +0000
X-Inumbo-ID: 91227650-677e-11e9-90bb-a72de1068fd1
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91227650-677e-11e9-90bb-a72de1068fd1;
 Thu, 25 Apr 2019 17:21:31 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PHInXm156983;
 Thu, 25 Apr 2019 17:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=85yEeihS79EJK5FEc8899IY17Sfaw9dCAXH35JIYoIY=;
 b=KtnjGik3PQ7OP67Jb70rx2bTGgzk917NFSp0CJYjTzlUOpClrJ3B6xMM87U6aWDIAf+0
 pFiS5gBt+94cEGeAW4fjCQx0ftpnFPO7jhHrukLHxaerBBTr7ta/DF+csa9h4SrFkvv9
 aBj9aaPfVS681YFSN2/GCcvQxu1fgFlOzWPGS36MP4bEVu8mPbbSH4Y54CnOB3ejG+vt
 eeHRiArXL5czm8z3JSM6C2qAFf1JjVP/oPtTdBLgivozDIOnreJE2FBhPTJmybHCP5eC
 ttgpqvWRnrJPQWnh6QqI+24Fv+WBbR3h6S5SdY5J0gqThnhX90sWPB+OuH1xHKg2cu6/ /A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2ryrxd9ya6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 17:21:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PHKXs1156331;
 Thu, 25 Apr 2019 17:21:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2s0fv494y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 17:21:22 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3PHLKhK005700;
 Thu, 25 Apr 2019 17:21:20 GMT
Received: from [192.168.2.8] (/106.39.148.99)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Apr 2019 10:21:20 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <f2508e00-5f86-b7bf-4e4a-581942129f17@oracle.com>
Date: Fri, 26 Apr 2019 01:21:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904250106
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904250106
Subject: Re: [Xen-devel] [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425172109.Vzh2MUdhjJAinv0jd61teUXr7j9xg5tvZuMnslBKt5M@z>

SGkgQW5kcmV3LAoKT24gMDQvMjMvMjAxOSAwNjozNyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBPbiAyMi8wNC8yMDE5IDEzOjM5LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+IFByaW50IGxvZyBh
dCBsZXZlbCBYRU5MT0dfRVJSIChpbnN0ZWFkIFhFTkxPR19JTkZPKSBhcyBkb21haW5fY3Jhc2go
KQo+PiBpbmRpY2F0ZXMgdGhlcmUgaXMgZmF0YWwgZXJyb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Cj4+IC0tLQo+PiAgeGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4gaW5kZXggODA3MjhlYS4uNzI1YzYx
OCAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+ICsrKyBiL3hlbi9j
b21tb24vZ3JhbnRfdGFibGUuYwo+PiBAQCAtMTI4Miw3ICsxMjgyLDcgQEAgdW5tYXBfY29tbW9u
KAo+PiAgICAgIGlmICggdW5saWtlbHkoKHJkID0gcmN1X2xvY2tfZG9tYWluX2J5X2lkKGRvbSkp
ID09IE5VTEwpICkKPj4gICAgICB7Cj4+ICAgICAgICAgIC8qIFRoaXMgY2FuIGhhcHBlbiB3aGVu
IGEgZ3JhbnQgaXMgaW1wbGljaXRseSB1bm1hcHBlZC4gKi8KPj4gLSAgICAgICAgZ2RwcmludGso
WEVOTE9HX0lORk8sICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRvbSk7Cj4+ICsgICAg
ICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRv
bSk7Cj4gCj4gV2hpbGUgSSBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2UgaW4gcHJpbmNpcGxlLCB3aGF0
IGRvZXMgdGhpcyBhY3R1YWxseSBkbz8gCj4gVGhlIGVudGlyZSBwcmludGsoKSBpcyBjb21waWxl
ZCBvdXQgaW4gcmVsZWFzZSBidWlsZHMsIGFuZCBkZWJ1ZyBidWlsZHMKPiBsb2cgYWxsIG1lc3Nh
Z2VzLgoKVGhlIG9iamVjdGl2ZSBpcyBmb3IgYmVsb3cgY2FzZS4KCklmIHVzZXIgc2V0cyAiZ3Vl
c3RfbG9nbHZsPWVyciIsIHRoaXMgbGluZSB3b3VsZCBub3QgYmUgcHJpbnRlZC4gT25jZSB4ZW4g
cGFuaWMKYnkgZG9tYWluX2NyYXNoLCBpdCB3b3VsZCB0YWtlIGVmZm9ydCB0byBrbm93IHRoZSBk
b21pZCBsZWFkaW5nIHRvIHRoZSBwYW5pYy4KClRvIHZlcmlmeSBpZiB0aGUgdm1jb3JlIGFuYWx5
c2lzIGlzIGNvcnJlY3QsIHRoZSB1c2VyIG5lZWRzIHRvIHNldAoiZ3Vlc3RfbG9nbHZsPWFsbCIg
YW5kIHdhaXQgZm9yIGFub3RoZXIgcGFuaWMgYWdhaW4uCgpJIGFncmVlIGl0IHdvdWxkIGJlIGJl
dHRlciB0byB0dXJuIGl0IGludG8gc29tZXRoaW5nIGxpa2UgZ3ByaW50ay4gSWYgeGVuIGFsd2F5
cwpwYW5pYyBhZnRlciBhIGxvZywgd2Ugc2hvdWxkIGd1YXJhbnRlZSB0aGF0IHRoZSBsb2cgaXMg
YWx3YXlzIHByaW50ZWQgdG8gdGhlCmNvbnNvbGUgaW4gb3JkZXIgdG8gaGVscCBhbmFseXplIHRo
ZSByb290IGNhdXNlLgoKRG9uZ2xpIFpoYW5nCgo+IAo+IH5BbmRyZXcKPiAKPj4gICAgICAgICAg
ZG9tYWluX2NyYXNoKGxkKTsgLyogbmF1Z2h0eS4uLiAqLwo+PiAgICAgICAgICByZXR1cm47Cj4+
ICAgICAgfQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
