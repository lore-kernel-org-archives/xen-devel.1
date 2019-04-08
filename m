From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
Date: Mon, 8 Apr 2019 13:45:15 +0100
Message-ID: <20190408124515.GE1986@zion.uk.xensource.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
 <20190408124357.GA3314@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDTeP-0001W5-AW
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:45:25 +0000
Content-Disposition: inline
In-Reply-To: <20190408124357.GA3314@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDE6NDM6NTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTI6NTA6MzFQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFRoZSBidWlsZCBzY3JpcHQgaW52b2tlZCBpcyBkZXNpZ25lZCB0byBydW4g
aW4gYSBwcmlzdGluZSBjaGVja291dC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIGF1dG9tYXRpb24vZ2l0bGFiLWNpL2J1
aWxkLWVhY2gtY29tbWl0LnNoIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1l
YWNoLWNvbW1pdC5zaAo+ID4gaW5kZXggMjc1YmM3MTkwMi4uODc5MDI4YjVhNyAxMDA3NTUKPiA+
IC0tLSBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCj4gPiArKysg
Yi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAo+ID4gQEAgLTE1LDQg
KzE1LDQgQEAgZmkKPiA+ICBlY2hvICJCdWlsZGluZyAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfS4u
JHtDSV9DT01NSVRfU0hBfSIKPiA+ICAKPiA+ICBOT05fU1lNQk9MSUNfUkVGPTEgLi9hdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NP
TU1JVF9TSEF9IFwKPiA+IC0gICAgYmFzaCAtYyAibWFrZSAtajQgZGlzdGNsZWFuICYmIC4vYXV0
b21hdGlvbi9zY3JpcHRzL2J1aWxkIgo+ID4gKyAgICBiYXNoIC1jICJnaXQgY2xlYW4gLWZmZHgg
JiYgLi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQiCj4gCj4gSXMgdGhpcyBtZWFuIHRoYXQgUUVN
VSwgT1ZNRiwgU2VhQklPUywgLi4uIGFyZSBnb2luZyB0byBiZSBjbG9ubmVkIGFnYWluCj4gYW5k
IGFnYWluPyBCdXQgbWF5YmUgaXQgZG9lc24ndCBtYXR0ZXIuCgpZZXMuIEJ1dCBJIGRvbid0IHRo
aW5rIHRoYXQgbWF0dGVycyBtdWNoLgoKV2VpLgoKPiAKPiAtLSAKPiBBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
