From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Fix off-by-one error when
 unmapping with holes
Date: Tue, 9 Jan 2018 20:16:54 -0500
Message-ID: <65c89a3f-fbfb-1047-efae-23deaf65faca__17693.1434697055$1515553077$gmane$org@oracle.com>
References: <20180109121022.11467-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cign=ef=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eZ6ba-0006u7-Cw
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 02:59:06 +0000
In-Reply-To: <20180109121022.11467-1-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8wOS8yMDE4IDA3OjEwIEFNLCBSb3NzIExhZ2Vyd2FsbCB3cm90ZToKPiBJZiB0aGUg
cmVxdWVzdGVkIHJhbmdlIGhhcyBhIGhvbGUsIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgbnVtYmVy
IG9mCj4gcGFnZXMgdG8gdW5tYXAgaXMgb2ZmIGJ5IG9uZS4gRml4IGl0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
