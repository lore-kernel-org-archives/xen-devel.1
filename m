From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Fri, 15 Feb 2019 10:03:59 -0500
Message-ID: <143411a8-385d-2cce-9211-22ba7db25a15__29960.3424080246$1550243119$gmane$org@oracle.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NTNL=QW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1guf2C-0006KO-JN
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:04:12 +0000
In-Reply-To: <20190214142321.1138-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNC8xOSA5OjIzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiAgCj4g
IC8qIERNQSBidWZmZXIgZXhwb3J0IHN1cHBvcnQuICovCj4gQEAgLTMxMSw2ICszMTcsNyBAQCBz
dGF0aWMgdm9pZCBkbWFidWZfZXhwX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAo+ICAJ
ZG1hYnVmX2V4cF93YWl0X29ial9zaWduYWwoZ250ZGV2X2RtYWJ1Zi0+cHJpdiwgZ250ZGV2X2Rt
YWJ1Zik7Cj4gIAlsaXN0X2RlbCgmZ250ZGV2X2RtYWJ1Zi0+bmV4dCk7Cj4gKwlmcHV0KGdudGRl
dl9kbWFidWYtPnByaXYtPmZpbHApOwo+ICAJa2ZyZWUoZ250ZGV2X2RtYWJ1Zik7Cj4gIH0KPiAg
Cj4gQEAgLTQyMyw2ICs0MzAsNyBAQCBzdGF0aWMgaW50IGRtYWJ1Zl9leHBfZnJvbV9wYWdlcyhz
dHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9leHBvcnRfYXJncyAqYXJncykKPiAgCW11dGV4X2xvY2soJmFy
Z3MtPmRtYWJ1Zl9wcml2LT5sb2NrKTsKPiAgCWxpc3RfYWRkKCZnbnRkZXZfZG1hYnVmLT5uZXh0
LCAmYXJncy0+ZG1hYnVmX3ByaXYtPmV4cF9saXN0KTsKPiAgCW11dGV4X3VubG9jaygmYXJncy0+
ZG1hYnVmX3ByaXYtPmxvY2spOwo+ICsJZ2V0X2ZpbGUoZ250ZGV2X2RtYWJ1Zi0+cHJpdi0+Zmls
cCk7CgpOb3QgZmdldCgpPwoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
