From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/4] xen/PVH: Use proper CS selector in long
 mode
Date: Wed, 2 May 2018 10:57:17 -0400
Message-ID: <6b7a748d-e289-c370-123a-678c6ad7d9dd__37739.2395902008$1525272801$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-3-boris.ostrovsky@oracle.com>
 <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rpbp=hv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDt9L-0006V9-FZ
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 14:54:31 +0000
In-Reply-To: <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOCAwNDowNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDQu
MTggYXQgMTg6MjMsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IFNpZ25l
ZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IEJ1dCB0byB1
bmRlcnN0YW5kIHdoeSB0aGluZ3MgaGF2ZSBiZWVuIHdvcmtpbmcgbmV2ZXJ0aGVsZXNzIGl0IHdv
dWxkCj4gaGF2ZSBiZWVuIG5pY2UgaWYgdGhlIGNvbW1pdCBtZXNzYWdlIHdhc24ndCBlbXB0eSwg
YnV0IGluc3RlYWQgc2FpZAo+IHNvbWV0aGluZyBsaWtlICJUaGUgdHdvIGhhcHBlbiB0byBiZSBp
ZGVudGljYWwgb24gNjQtYml0LiIKCgpXaHkgZG8geW91IHRoaW5rIHRoZXkgYXJlIGlkZW50aWNh
bD8gX19LRVJORUxfQ1MgcG9pbnRzIHRvIGVudHJ5IzEyCih3aGljaCB3ZSBkb24ndCBzcGVjaWZ5
IGluIFBWSCBHRFQpIHdoaWxlIF9fQk9PVF9DUyBpcyB0aGUgc2Vjb25kIGVudHJ5Cih3aGljaCB3
ZSBkbyBjcmVhdGUpLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
