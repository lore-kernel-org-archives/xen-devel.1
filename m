From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] xen: xenbus: Catch closing of non
 existent transactions
Date: Thu, 15 Mar 2018 11:34:02 +0100
Message-ID: <993d84d7-c901-6365-0392-600e320a1d24__24537.3623715297$1521110086$gmane$org@suse.com>
References: <20180315024322.27429-1-simon@invisiblethingslab.com>
 <20180315024322.27429-2-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t4by=gf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ewQEn-0007uW-Lk
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 10:35:57 +0000
In-Reply-To: <20180315024322.27429-2-simon@invisiblethingslab.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMDM6NDMsIFNpbW9uIEdhaXNlciB3cm90ZToKPiBVc2VycyBvZiB0aGUgeGVu
YnVzIGZ1bmN0aW9ucyBzaG91bGQgbmV2ZXIgY2xvc2UgYSBub24gZXhpc3RlbnQKPiB0cmFuc2Fj
dGlvbiAoZm9yIGV4YW1wbGUgYnkgdHJ5aW5nIHRvIGNsb3NpbmcgdGhlIHNhbWUgdHJhbnNhY3Rp
b24KPiB0d2ljZSkgYnV0IGJldHRlciBjYXRjaCBpdCBpbiB4c19yZXF1ZXN0X2V4aXQoKSB0aGFu
IHRvIGNvcnJ1cHQgdGhlCj4gcmVmZXJlbmNlIGNvdW50ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
