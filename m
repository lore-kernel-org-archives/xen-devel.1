From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenbus: drop useless LIST_HEAD in
 xenbus_write_watch() and xenbus_file_write()
Date: Tue, 16 Apr 2019 07:20:48 +0200
Message-ID: <545749c9-dfad-2de4-3b74-f73d78419007__18616.0068072908$1555392119$gmane$org@suse.com>
References: <20190416040651.186468-1-maowenan@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nHU3=SS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hGGWa-0008OQ-Ah
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 05:20:52 +0000
In-Reply-To: <20190416040651.186468-1-maowenan@huawei.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mao Wenan <maowenan@huawei.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDQvMjAxOSAwNjowNiwgTWFvIFdlbmFuIHdyb3RlOgo+IERyb3AgTElTVF9IRUFEIHdo
ZXJlIHRoZSB2YXJpYWJsZSBpdCBkZWNsYXJlcyBpcyBuZXZlciB1c2VkLgo+IAo+IFRoZSBkZWNs
YXJhdGlvbnMgd2VyZSBpbnRyb2R1Y2VkIHdpdGggdGhlIGZpbGUsIGJ1dCB0aGUgZGVjbGFyZWQK
PiB2YXJpYWJsZXMgd2VyZSBub3QgdXNlZC4KPiAKPiBGaXhlczogMTEwN2JhODg1ZTQ2OSgieGVu
OiBhZGQgeGVuZnMgdG8gYWxsb3cgdXNlcm1vZGUgPC0+IFhlbiBpbnRlcmFjdGlvbiIpCj4gU2ln
bmVkLW9mZi1ieTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
