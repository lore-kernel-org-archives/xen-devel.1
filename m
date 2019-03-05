From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/ACPI: Switch to bitmap_zalloc()
Date: Tue, 5 Mar 2019 12:27:30 +0100
Message-ID: <4d71539a-8b5c-3792-435f-a04e430b6294@suse.com>
References: <20190304093127.57578-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h18ER-0006h0-SI
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 11:27:35 +0000
In-Reply-To: <20190304093127.57578-1-andriy.shevchenko@linux.intel.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDMvMjAxOSAxMDozMSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IFN3aXRjaCB0byBi
aXRtYXBfemFsbG9jKCkgdG8gc2hvdyBjbGVhcmx5IHdoYXQgd2UgYXJlIGFsbG9jYXRpbmcuCj4g
QmVzaWRlcyB0aGF0IGl0IHJldHVybnMgcG9pbnRlciBvZiBiaXRtYXAgdHlwZSBpbnN0ZWFkIG9m
IG9wYXF1ZSB2b2lkICouCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CgpQdXNoZWQgdG8geGVuL3RpcC5naXQgZm9y
LWxpbnVzLTUuMWEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
