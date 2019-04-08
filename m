From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
Date: Mon, 8 Apr 2019 13:43:57 +0100
Message-ID: <20190408124357.GA3314@perard.uk.xensource.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDTd3-0001Rz-KC
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:44:01 +0000
Content-Disposition: inline
In-Reply-To: <20190408115031.27127-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTI6NTA6MzFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgYnVpbGQgc2NyaXB0IGludm9rZWQgaXMgZGVzaWduZWQgdG8gcnVuIGluIGEgcHJpc3Rp
bmUgY2hlY2tvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPiAtLS0KPiAgYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5z
aCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCj4gaW5kZXggMjc1
YmM3MTkwMi4uODc5MDI4YjVhNyAxMDA3NTUKPiAtLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9i
dWlsZC1lYWNoLWNvbW1pdC5zaAo+ICsrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVh
Y2gtY29tbWl0LnNoCj4gQEAgLTE1LDQgKzE1LDQgQEAgZmkKPiAgZWNobyAiQnVpbGRpbmcgJHtD
SV9DT01NSVRfQkVGT1JFX1NIQX0uLiR7Q0lfQ09NTUlUX1NIQX0iCj4gIAo+ICBOT05fU1lNQk9M
SUNfUkVGPTEgLi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9C
RUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9IFwKPiAtICAgIGJhc2ggLWMgIm1ha2UgLWo0IGRp
c3RjbGVhbiAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKPiArICAgIGJhc2ggLWMgImdp
dCBjbGVhbiAtZmZkeCAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKCklzIHRoaXMgbWVh
biB0aGF0IFFFTVUsIE9WTUYsIFNlYUJJT1MsIC4uLiBhcmUgZ29pbmcgdG8gYmUgY2xvbm5lZCBh
Z2FpbgphbmQgYWdhaW4/IEJ1dCBtYXliZSBpdCBkb2Vzbid0IG1hdHRlci4KCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
