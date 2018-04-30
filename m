From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 30 Apr 2018 11:30:09 -0400
Message-ID: <2eb0fe3c-7ff5-e731-d64c-8d04d082acce@oracle.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDAi9-0005eP-II
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:27:29 +0000
In-Reply-To: <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMzAvMjAxOCAwNzozNyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTExNjgsNiAr
MTE2OSw5IEBAIHN0YXRpYyB2b2lkIG5vcmV0dXJuIHN2bV9kb19yZXN1bWUoc3RydWMKPiAgCj4g
ICAgICBodm1fZG9fcmVzdW1lKHYpOwo+ICAKPiArICAgIGlmICggdi0+YXJjaC5odm1fc3ZtLnZt
Y2Jfc3luY19zdGF0ZSA9PSB2bWNiX25lZWRzX3ZtbG9hZCApCj4gKyAgICAgICAgc3ZtX3N5bmNf
dm1jYih2LCB2bWNiX25lZWRzX3Ztc2F2ZSk7CgoKSXMgaXQgbm90IHBvc3NpYmxlIChvciBhZHZp
c2FibGUpIHRvIG1vdmUgdGhlIHRlc3QgaW50byBzdm1fc3luY192bWNiKCkKKGFuZCBkcm9wIHRo
ZSBBU1NFUlQgdGhlcmUpPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
