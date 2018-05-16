From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/6] mtrr: introduce mask to get VCNT
 from MTRRcap MSR
Date: Wed, 16 May 2018 02:19:40 -0600
Message-ID: <5AFBE99C02000078001C31EB@prv1-mh.provo.novell.com>
References: <20180515143617.69711-1-roger.pau@citrix.com>
 <20180515143617.69711-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIrf0-0000hr-RB
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 08:19:46 +0000
In-Reply-To: <20180515143617.69711-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA1LjE4IGF0IDE2OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC00NzgsNyArNDc4LDcgQEAgYm9vbF90IG10cnJfcGF0X25vdF9lcXVhbChzdHJ1Y3QgdmNw
dSAqdmQsIHN0cnVjdCB2Y3B1ICp2cykKPiAgICAgIHN0cnVjdCBtdHJyX3N0YXRlICptZCA9ICZ2
ZC0+YXJjaC5odm1fdmNwdS5tdHJyOwo+ICAgICAgc3RydWN0IG10cnJfc3RhdGUgKm1zID0gJnZz
LT5hcmNoLmh2bV92Y3B1Lm10cnI7Cj4gICAgICBpbnQzMl90IHJlczsKPiAtICAgIHVpbnQ4X3Qg
bnVtX3Zhcl9yYW5nZXMgPSAodWludDhfdCltZC0+bXRycl9jYXA7Cj4gKyAgICB1aW50OF90IG51
bV92YXJfcmFuZ2VzID0gTUFTS19FWFRSKG1kLT5tdHJyX2NhcCwgTVRSUmNhcF9WQ05UKTsKCldp
dGggdGhlIHR5cGUgY2hhbmdlZCB0byB1bnNpZ25lZCBpbnQgaGVyZQpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpPZiBjb3Vyc2UgdGhpcyBpcyBlYXN5IGVub3Vn
aCB0byBkbyB3aGlsZSBjb21taXR0aW5nLCBzaG91bGQgbm8gb3RoZXIgbmVlZApmb3IgYSB2MyBh
cmlzZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
