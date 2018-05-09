From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/pvh: enable and set default MTRR
 type
Date: Wed, 9 May 2018 11:56:40 +0100
Message-ID: <fbe18be3-0e2e-723f-a625-015c6aad89a3__12773.0410932147$1525863324$gmane$org@citrix.com>
References: <20180509102129.14832-1-roger.pau@citrix.com>
 <20180509102129.14832-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n3eo=h4=citrix.com=prvs=660c42f54=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fGMm3-00080M-CK
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 10:56:43 +0000
In-Reply-To: <20180509102129.14832-2-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMTggMTE6MjEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBPbiBQVkggTVRSUiBp
cyBub3QgaW5pdGlhbGl6ZWQgYnkgdGhlIGZpcm13YXJlIChiZWNhdXNlIHRoZXJlJ3Mgbm8KPiBm
aXJtd2FyZSksIHNvIHRoZSBrZXJuZWwgaXMgc3RhcnRlZCB3aXRoIE1UUlIgZGlzYWJsZWQgd2hp
Y2ggbWVhbnMgYWxsCj4gbWVtb3J5IGFjY2Vzc2VzIGFyZSBVQy4KPgo+IFNvIGZhciB0aGVyZSBo
YXZlIGJlZW4gbm8gaXNzdWVzIChpZTogc2xvd2Rvd25zKSBjYXVzZWQgYnkgdGhpcwo+IGJlY2F1
c2UgUFZIIG9ubHkgc3VwcG9ydGVkIERvbVUgbW9kZSB3aXRob3V0IHBhc3NlZC10aHJvdWdoIGRl
dmljZXMsCj4gc28gWGVuIHdhcyB1c2luZyBXQiBhcyB0aGUgZGVmYXVsdCBtZW1vcnkgdHlwZSBp
bnN0ZWFkIG9mIFVDLgo+Cj4gRml4IHRoaXMgYnkgZW5hYmxpbmcgTVRSUiBhbmQgc2V0dGluZyB0
aGUgZGVmYXVsdCB0eXBlIHRvIFdCLiBMaW51eAo+IHdpbGwgdXNlIFBBVCB0byBzZXQgdGhlIGFj
dHVhbCBtZW1vcnkgY2FjaGUgYXR0cmlidXRlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJJ2QgYXJndWUgdGhhdCB0aGlz
IGlzIGEgYnVnIGluIFBWSCBzdGFydGluZyBzdGF0ZS4KCkRvIHlvdSBrbm93IHdoYXQgbWVjaGFu
aXNtIGlzIHVzZWQgdG8gYm9kZ2UgdGhpbmdzIHRvIFdCIGluIHRoZSBmaXJzdApwbGFjZT/CoCBJ
J20gbm90IHN1cmUgdGhhdCBzZXR0aW5nIHRoZSBkZWZhdWx0IE1UUlIgdHlwZSBpcyBnb2luZyB0
byBiZSBhCmNsZXZlciBpZGVhIGluIGhpbmRzaWdodCB3aGVuIHdlIGNvbWUgdG8gZG9pbmcgUENJ
IFBhc3N0aHJvdWdoIHN1cHBvcnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
