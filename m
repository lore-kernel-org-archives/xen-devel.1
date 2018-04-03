From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/4] libxl/x86: Build e820 map earlier
 for HVM/PVH guests
Date: Tue, 3 Apr 2018 14:45:56 +0100
Message-ID: <20180403134556.bwdr2j4yndlrzeww@MacBook-Pro-de-Roger.local>
References: <1522735521-20171-1-git-send-email-maran.wilson@oracle.com>
 <1522735521-20171-3-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1522735521-20171-3-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDIsIDIwMTggYXQgMTE6MDU6MTlQTSAtMDcwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+IEZyb206IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
Cj4gCj4gU2luY2UgaHZtX3N0YXJ0X2luZm8gaGFzIG5vdyBiZWVuIGV4cGFuZGVkIHRvIGluY2x1
ZGUgbWVtb3J5IG1hcCAoaS5lLgo+IGU4MjApIHdlIG5lZWQgdG8ga25vdyBzaXplIG9mIHRoaXMg
bWFwIGJ5IHRoZSB0aW1lIHdlIGNyZWF0ZQo+IGRvbS0+c3RhcnRfaW5mb19zZWcgaW4gYWxsb2Nf
bWFnaWNfcGFnZXNfaHZtKCkuCj4gCj4gVG8gZG8gc28gd2UgaGF2ZSB0byBjYWxsIGxpYnhsX19h
cmNoX2RvbWFpbl9jb25zdHJ1Y3RfbWVtbWFwKCkgZWFybGllciwKPiBiZWZvcmUgeGNfZG9tX2J1
aWxkX2ltYWdlKCkuIEFuZCBzaW5jZSBsaWJ4bF9fYXJjaF9kb21haW5fY29uc3RydWN0X21lbW1h
cCgpCj4gaXMgb25seSB1c2VkIGJ5IGZvciB4ODYgd2UgY2FuIG1ha2UgdGhpcyBjYWxsIGZyb20g
eDg2J3MKPiBsaWJ4bF9fYXJjaF9kb21haW5fZmluYWxpc2VfaHdfZGVzY3JpcHRpb24oKSwgYXQg
dGhlIHNhbWUgdGltZSByZW1vdmluZwo+IGl0cyBOT1AgZGVmaW5pdGlvbiBmcm9tIEFSTSBjb2Rl
IGFuZCByZW5hbWluZyBhbmQgbWFraW5nIGl0IHN0YXRpYyBpbgo+IGxpYnhsX3g4Ni5jCj4gCj4g
U2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
