From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: setup pv irq ops vector earlier
Date: Wed, 11 Jul 2018 11:31:33 -0400
Message-ID: <405aaefe-b7d2-5971-166b-25f5bf366e71__34368.3744351894$1531323011$gmane$org@oracle.com>
References: <20180702100001.19953-1-jgross@suse.com>
 <7ed006f3-22ea-2c35-1cbe-15d7cf04a71b@oracle.com>
 <0362cb33-b6e6-a099-249f-b516b288f106@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lhqx=j3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fdH5N-0007F9-Es
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 15:31:21 +0000
In-Reply-To: <0362cb33-b6e6-a099-249f-b516b288f106@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMjAxOCAwMTowOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS8wNy8x
OCAwMDoyNiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwNy8wMi8yMDE4IDA2OjAwIEFN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gU2V0dGluZyBwdl9pcnFfb3BzIGZvciBYZW4gUFYg
ZG9tYWlucyBzaG91bGQgYmUgZG9uZSBhcyBlYXJseSBhcwo+Pj4gcG9zc2libGUgaW4gb3JkZXIg
dG8gc3VwcG9ydCBlLmcuIHZlcnkgZWFybHkgcHJpbnRrKCkgdXNhZ2UuCj4+IFdpbGwgcHJpbnRr
KCkgd29yayBhcyByZXN1bHQgb2YgdGhpcyBtb3ZlPyBXZSBzdGlsbCwgZm9yIGV4YW1wbGUsCj4+
IGhhdmVuJ3Qgc2V0IHVwIGNvbnNvbGUuCj4gSXQgd2lsbCBwcmludCB0byB0aGUga2VybmVsIHBy
aW50IGJ1ZmZlciwgc28gdGhlIG91dHB1dCB3aWxsIGJlCj4gYXZhaWxhYmxlIGxhdGVyLgoKUmln
aHQsIGhhdmVuJ3QgdGhvdWdodCBhYm91dCBpdC4KCgo+Cj4+IFRoaXMgd2lsbCAocHJvYmFibHkp
IGFsbG93IHVzIG5vdCB0byBjcmFzaCAoZHVlIHRvIFNUSSBhbmQgc3VjaCkgYnV0IEkKPj4gYW0g
bm90IHN1cmUgInN1cHBvcnQiIGlzIHRoZSByaWdodCB0ZXJtIGhlcmUuCj4gTm90IGNyYXNoaW5n
IGlzIGJpZyBwbHVzIElNTy4gOi0pCgpBY3R1YWxseSwgbm8sIHRoaXMgaXMgbm90IHN1ZmZpY2ll
bnQuCgpZb3UgbmVlZCB0byBtb3ZlIHhlbl92Y3B1X2luZm9fcmVzZXQoMCkgdXAgYXMgd2VsbC4g
T3RoZXJ3aXNlIHlvdSB3aWxsCm5vdCBiZSBhYmxlIHRvIGRlcmVmZXJlbmNlIHRoZSBwZXJjcHUg
eGVuX3ZjcHUgaW4geGVuX3NhdmVfZmwoKS4KCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
