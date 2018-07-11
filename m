From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: setup pv irq ops vector earlier
Date: Wed, 11 Jul 2018 07:08:54 +0200
Message-ID: <0362cb33-b6e6-a099-249f-b516b288f106__46404.7063062482$1531285681$gmane$org@suse.com>
References: <20180702100001.19953-1-jgross@suse.com>
 <7ed006f3-22ea-2c35-1cbe-15d7cf04a71b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nw1x=j3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fd7N5-0000Vl-2a
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 05:08:59 +0000
In-Reply-To: <7ed006f3-22ea-2c35-1cbe-15d7cf04a71b@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMDA6MjYsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNy8wMi8yMDE4
IDA2OjAwIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBTZXR0aW5nIHB2X2lycV9vcHMgZm9y
IFhlbiBQViBkb21haW5zIHNob3VsZCBiZSBkb25lIGFzIGVhcmx5IGFzCj4+IHBvc3NpYmxlIGlu
IG9yZGVyIHRvIHN1cHBvcnQgZS5nLiB2ZXJ5IGVhcmx5IHByaW50aygpIHVzYWdlLgo+IAo+IFdp
bGwgcHJpbnRrKCkgd29yayBhcyByZXN1bHQgb2YgdGhpcyBtb3ZlPyBXZSBzdGlsbCwgZm9yIGV4
YW1wbGUsCj4gaGF2ZW4ndCBzZXQgdXAgY29uc29sZS4KCkl0IHdpbGwgcHJpbnQgdG8gdGhlIGtl
cm5lbCBwcmludCBidWZmZXIsIHNvIHRoZSBvdXRwdXQgd2lsbCBiZQphdmFpbGFibGUgbGF0ZXIu
Cgo+IFRoaXMgd2lsbCAocHJvYmFibHkpIGFsbG93IHVzIG5vdCB0byBjcmFzaCAoZHVlIHRvIFNU
SSBhbmQgc3VjaCkgYnV0IEkKPiBhbSBub3Qgc3VyZSAic3VwcG9ydCIgaXMgdGhlIHJpZ2h0IHRl
cm0gaGVyZS4KCk5vdCBjcmFzaGluZyBpcyBiaWcgcGx1cyBJTU8uIDotKQoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
