From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH -next] xen/pvcalls: remove set but not used
 variable 'intf'
Date: Fri, 4 Jan 2019 11:10:22 -0500
Message-ID: <f90e002d-3808-157d-d8a7-a716c461f74c__24643.8480950475$1546618163$gmane$org@oracle.com>
References: <1546581820-123466-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MJjx=PM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gfS3Q-00078B-Ek
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 16:10:36 +0000
In-Reply-To: <1546581820-123466-1-git-send-email-yuehaibing@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMS80LzE5IDE6MDMgQU0sIFl1ZUhhaWJpbmcgd3JvdGU6Cj4gRml4ZXMgZ2NjICctV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+Cj4gZHJpdmVycy94ZW4vcHZjYWxscy1iYWNr
LmM6IEluIGZ1bmN0aW9uICdwdmNhbGxzX3NrX3N0YXRlX2NoYW5nZSc6Cj4gZHJpdmVycy94ZW4v
cHZjYWxscy1iYWNrLmM6Mjg2OjI4OiB3YXJuaW5nOgo+ICB2YXJpYWJsZSAnaW50Zicgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IEl0IG5vdCB1c2VkIHNp
bmNlIGU2NTg3Y2RiZDczMiAoInB2Y2FsbHMtYmFjazogc2V0IC1FTk9UQ09OTiBpbgo+IHB2Y2Fs
bHNfY29ubl9iYWNrX3JlYWQiKQo+Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+CgphbmQgYXBwbGllZCB0byBmb3ItbGludXMtNC4yMS4KClRoYW5r
cy4KLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
