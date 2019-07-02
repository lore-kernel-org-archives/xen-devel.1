Return-Path: <SRS0=idoa=U7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603D6C06510
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jul 2019 14:12:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BDB920665
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jul 2019 14:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BDB920665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiJVb-0005RR-46; Tue, 02 Jul 2019 14:11:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ftjz=U7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiJVa-0005RM-9g
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 14:11:46 +0000
X-Inumbo-ID: 5156d694-9cd3-11e9-b369-5b90c056d7a2
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5156d694-9cd3-11e9-b369-5b90c056d7a2;
 Tue, 02 Jul 2019 14:11:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HuMMOxrWZGibPygjAub3O8aYt/s1gVhBp5rQ578qGInQO8+7I6zduDy3a4jbcKl+sXTWoBOsD5
 PK40/2agLGpJF0jJKiIyPBIAh0curMMxF/3+UDpQ/LfWBjVRsq2B9TwaQ0xPgVOP06pcYs0jXZ
 Y7pXto+skNEiwkcZ4w9CcWhmk2sFZD9yfnY/MZ7u1EaasHcYRC1V+a8ZgSq7hPC7zJQ02VrRzR
 gfJ802iNtrlkJrscOKRIEothtp//CXtDc8wAC7cmKmQ8U6pdd+4UvWBRB29OzW7xiiOmePmJ6r
 9nQ=
X-SBRS: 2.7
X-MesageID: 2515573
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2515573"
Date: Tue, 2 Jul 2019 14:42:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190702134233.GB22182@perard.uk.xensource.com>
References: <1562053600-32685-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562053600-32685-1-git-send-email-chao.gao@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] libxl_qmp: wait for completion of device
 removal
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSd2ZSBnb3Qgc29tZSBjb21tZW50cy4KCk9uIFR1
ZSwgSnVsIDAyLCAyMDE5IGF0IDAzOjQ2OjQwUE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+IFRv
IHJlbW92ZSBhIGRldmljZSBmcm9tIGEgZG9tYWluLCBhIHFtcCBjb21tYW5kIGlzIHNlbnQgdG8g
cWVtdS4gQnV0IGl0IGlzCj4gaGFuZGxlZCBieSBxZW11IGFzeWNocm9ub3VzbHkuIEV2ZW4gdGhl
IHFtcCBjb21tYW5kIGlzIGNsYWltZWQgdG8gYmUgZG9uZSwKPiB0aGUgYWN0dWFsIGhhbmRsaW5n
IGluIHFlbXUgc2lkZSBtYXkgaGFwcGVuIGxhdGVyLgo+IFRoaXMgYmVoYXZpb3IgYnJpbmdzIHR3
byBxdWVzdGlvbnM6Cj4gMS4gQXR0YWNoaW5nIGEgZGV2aWNlIGJhY2sgdG8gYSBkb21haW4gcmln
aHQgYWZ0ZXIgZGV0YWNoaW5nIHRoZSBkZXZpY2UgZnJvbQo+IHRoYXQgZG9tYWluIHdvdWxkIGZh
aWwgd2l0aCBlcnJvcjoKPiAKPiBsaWJ4bDogZXJyb3I6IGxpYnhsX3FtcC5jOjM0MTpxbXBfaGFu
ZGxlX2Vycm9yX3Jlc3BvbnNlOiBEb21haW4gMTpyZWNlaXZlZCBhbgo+IGVycm9yIG1lc3NhZ2Ug
ZnJvbSBRTVAgc2VydmVyOiBEdXBsaWNhdGUgSUQgJ3BjaS1wdC02MF8wMC4wJyBmb3IgZGV2aWNl
Cj4gCj4gMi4gQWNjZXNzZXMgdG8gUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgaW4gUWVtdSBtYXkg
b3ZlcmxhcCB3aXRoIGxhdGVyIGRldmljZQo+IHJlc2V0IGlzc3VlZCBieSAneGwnIG9yIGJ5IHBj
aWJhY2suCj4gCj4gSW4gb3JkZXIgdG8gYXZvaWQgbWVudGlvbmVkIHF1ZXN0aW9ucywgd2FpdCBm
b3IgdGhlIGNvbXBsZXRpb24gb2YgZGV2aWNlCj4gcmVtb3ZhbCBieSBxdWVyeWluZyBhbGwgcGNp
IGRldmljZXMgdXNpbmcgcW1wIGNvbW1hbmQgYW5kIGVuc3VyaW5nIHRoZSB0YXJnZXQKPiBkZXZp
Y2UgaXNuJ3QgbGlzdGVkLiBPbmx5IHJldHJ5IDUgdGltZXMgdG8gYXZvaWQgJ3hsJyBwb3RlbnRp
YWxseSBiZWluZyBibG9ja2VkCj4gYnkgcWVtdS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8
IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9saWJ4bF9xbXAu
Ywo+IGluZGV4IDQyYzhhYjguLjE4ZjYxMjYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfcW1wLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+IEBAIC0xMDAwLDkgKzEw
MzIsMzIgQEAgaW50IGxpYnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQs
IGxpYnhsX2RldmljZV9wY2kgKnBjaWRldikKPiAgc3RhdGljIGludCBxbXBfZGV2aWNlX2RlbChs
aWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGNoYXIgKmlkKQo+ICB7Cj4gICAgICBsaWJ4bF9fanNv
bl9vYmplY3QgKmFyZ3MgPSBOVUxMOwo+ICsgICAgbGlieGxfX3FtcF9oYW5kbGVyICpxbXAgPSBO
VUxMOwo+ICsgICAgaW50IHJjID0gMDsKPiArCj4gKyAgICBxbXAgPSBsaWJ4bF9fcW1wX2luaXRp
YWxpemUoZ2MsIGRvbWlkKTsKPiArICAgIGlmICghcW1wKQo+ICsgICAgICAgIHJldHVybiBFUlJP
Ul9GQUlMOwo+ICAKPiAgICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAi
aWQiLCBpZCk7Cj4gLSAgICByZXR1cm4gcW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgImRldmlj
ZV9kZWwiLCBhcmdzLCBOVUxMLCBOVUxMKTsKPiArICAgIHJjID0gcW1wX3N5bmNocm9ub3VzX3Nl
bmQocW1wLCAiZGV2aWNlX2RlbCIsIGFyZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE5VTEwsIE5VTEwsIHFtcC0+dGltZW91dCk7Cj4gKyAgICBpZiAocmMgPT0gMCkgewo+ICsg
ICAgICAgIHVuc2lnbmVkIGludCByZXRyeSA9IDA7Cj4gKwo+ICsgICAgICAgIGRvIHsKPiArICAg
ICAgICAgICAgaWYgKHFtcF9zeW5jaHJvbm91c19zZW5kKHFtcCwgInF1ZXJ5LXBjaSIsIE5VTEws
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZGVsX2NhbGxiYWNr
LCBpZCwgcW1wLT50aW1lb3V0KSA9PSAwKSB7CgpDb3VsZCB5b3UgYXNzaWduIHRoZSByZXR1cm4g
dmFsdWUgb2YgcW1wX3N5bmNocm9ub3VzX3NlbmQgaW50byBhCnZhcmlhYmxlLCB0aGVuIGNoZWNr
IGZvciBzdWNjZXNzL2Vycm9yPwoKcW1wX3N5bmNocm9ub3VzX3NlbmQgcmV0dXJucyBzZXZlcmFs
IHBvc3NpYmxlIHZhbHVlczoKLSBlcnJvcnMsIHdoZW4gcmMgPCAwCi0gcmMgb2YgdGhlIGNhbGxi
YWNrLCB3aGljaCBpcyAwIG9yIDEgaGVyZS4KCklmIHRoZXJlJ3MgYW4gZXJyb3IsIHdlIGRvbid0
IHdhbnQgdG8ga2VlcCB0cnlpbmcgd2UgcHJvYmFibHkgd2FudCB0bwpyZXR1cm4gdGhhdCBlcnJv
ci4KClRoYW5rcy4KCj4gKyAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgfQo+
ICsgICAgICAgICAgICBMT0dEKERFQlVHLCBxbXAtPmRvbWlkLAo+ICsgICAgICAgICAgICAgICAg
ICJXYWl0aW5nIGZvciBjb21wbGV0aW9uIG9mIGRlbGV0aW5nIGRldmljZSAlcyIsIGlkKTsKPiAr
ICAgICAgICAgICAgc2xlZXAoMSk7Cj4gKyAgICAgICAgfSB3aGlsZSAocmV0cnkrKyA8IDUpOwo+
ICsgICAgfQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
