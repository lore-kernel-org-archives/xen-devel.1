From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/alt: Fix wrong usage of as_max in
 OLDINSTR_2
Date: Wed, 28 Mar 2018 09:48:33 +0100
Message-ID: <20180328084833.cvnh6pxlrxha34ph@citrix.com>
References: <dbcffebe-a10d-4c84-bcb5-44b82d5a9a8e@default>
 <5ABB2DB8020000780012BABC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5ABB2DB8020000780012BABC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, zhenzhong.duan@oracle.com, xen-devel@lists.xen.org, boris.ostrovsky@oracle.com, srinivas.eeda@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMTE6NTI6NTZQTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPiAwMy8y
OC8xOCA0OjAzIEFNID4+Pgo+ID5XaGVuIEFMVEVSTkFUSVZFXzIgaXMgdXNlZCwgd2Ugc2VlIGJl
bG93IGVycm9yIGR1cmluZyBidWlsZC4KPiA+ImVycm9yOiBtYWNybyAiYXNfbWF4IiByZXF1aXJl
cyAyIGFyZ3VtZW50cywgYnV0IG9ubHkgMSBnaXZlbiIKPiA+Cj4gPlNpZ25lZC1vZmYtYnk6IFpo
ZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+IAo+IFNlZSAiW1BBVENI
IHYyIDIvNl0geDg2OiBmaXggT0xESU5TVFJfMigpIiBzZW50IG9uIE1hciAxM3RoLgo+IAoKT2gs
IEkgbWlnaHQgYXMgd2VsbCB0cmFuc2ZlciBteSBSYiB0aGVyZS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
