From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] python: xc: fix max_cpu_index sign error
Date: Thu, 5 Apr 2018 13:54:03 +0100
Message-ID: <20180405125403.yuapvd6hv3xh7tdv@citrix.com>
References: <1522932563-89973-1-git-send-email-epetre@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vgux=g2=citrix.com=prvs=626a3696d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f44P1-0004rt-GU
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 12:54:07 +0000
Content-Disposition: inline
In-Reply-To: <1522932563-89973-1-git-send-email-epetre@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Eftime <epetre@amazon.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

Q0MgTWFyZWsKCk9uIFRodSwgQXByIDA1LCAyMDE4IGF0IDEyOjQ5OjIzUE0gKzAwMDAsIFBldHJl
IEVmdGltZSB3cm90ZToKPiBXaGVuIDAtaW5kZXhpbmcsIG1heGltdW0gaW5kZXggaXMgbnVtX2Vu
dHJpZXMgLSAxLiBUaGUgcHl0aG9uIHhjIGxpYnJhcnkgaGFkIGEKPiBzaWduIGVycm9yIHdoZXJl
IHRoZSBtaW51cyB3YXMgcmVwbGFjZWQgYnkgYSBwbHVzLCBtYWtpbmcgdG9vbHMgdGhhdCBkZXBl
bmRlZAo+IG9uIGl0IHRvIGxvb2sgZm9yIENQVXMgdGhhdCBkaWQgbm90IGV4aXN0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBldHJlIEVmdGltZSA8ZXBldHJlQGFtYXpvbi5jb20+Cj4gLS0tCj4gIHRv
b2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3B5
dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMv
eGMuYwo+IGluZGV4IGY1MDE3NjQuLjY5NGJmYTAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcHl0aG9u
L3hlbi9sb3dsZXZlbC94Yy94Yy5jCj4gKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94
Yy94Yy5jCj4gQEAgLTEwNzksNyArMTA3OSw3IEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y190b3Bv
bG9neWluZm8oWGNPYmplY3QgKnNlbGYpCj4gICAgICAgICAgfQo+ICAgICAgfQo+ICAKPiAtICAg
IHJldF9vYmogPSBQeV9CdWlsZFZhbHVlKCJ7czppfSIsICJtYXhfY3B1X2luZGV4IiwgbnVtX2Nw
dXMgKyAxKTsKPiArICAgIHJldF9vYmogPSBQeV9CdWlsZFZhbHVlKCJ7czppfSIsICJtYXhfY3B1
X2luZGV4IiwgbnVtX2NwdXMgLSAxKTsKPiAgCj4gICAgICBQeURpY3RfU2V0SXRlbVN0cmluZyhy
ZXRfb2JqLCAiY3B1X3RvX2NvcmUiLCBjcHVfdG9fY29yZV9vYmopOwo+ICAgICAgUHlfREVDUkVG
KGNwdV90b19jb3JlX29iaik7Cj4gLS0gCj4gMi43LjMuQU1aTgo+IAo+IAo+IAo+IAo+IEFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMuUi5MLiByZWdpc3RlcmVkIG9mZmljZTog
MjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29yIDIsIElhc2ksIElhc2kgQ291bnR5LCA3
MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9tYW5pYS4gUmVnaXN0cmF0aW9uIG51bWJl
ciBKMjIvMjYyMS8yMDA1Lgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
