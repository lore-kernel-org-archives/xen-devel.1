From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: dom0/pvh: Dom0 PVH with PCI passthrough support
 status
Date: Mon, 5 Nov 2018 10:57:38 +0000
Message-ID: <20181105105738.xttqv425apcbfbfp@zion.uk.xensource.com>
References: <1539965325190.3407@amazon.com>
 <20181019162246.v4u7zynxfzwjqisd@mac.bytemobile.com>
 <ff01985d-16db-de10-79ba-4ba794db5373@amazon.com>
 <20181030150741.bxzawoyxhrqit3b5@mac.citrite.net>
 <7c1fb1f5-55a5-993b-c806-db0a85005055@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtqo=nq=citrix.com=prvs=8406a2984=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJcZm-0008IO-Gl
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 10:57:46 +0000
Content-Disposition: inline
In-Reply-To: <7c1fb1f5-55a5-993b-c806-db0a85005055@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Vasile <lexnv@amazon.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMTE6NTg6MDlBTSArMDIwMCwgQWxleGFuZHJ1IFZhc2ls
ZSB3cm90ZToKPiBIZWxsbywKPiAoWEVOKSBldmVudF9jaGFubmVsLmM6MzE5OmQwdjEgRVZUQ0hO
T1AgZmFpbHVyZTogZG9tYWluIDEsIGVycm9yIC0yMgo+IChYRU4pIGV2ZW50X2NoYW5uZWwuYzoz
MTk6ZDB2MyBFVlRDSE5PUCBmYWlsdXJlOiBkb21haW4gMSwgZXJyb3IgLTIyCgpEbyB5b3UgcGVy
aGFwcyBoYXZlIG1vcmUgdGhhbiBvbmUgeGVuc3RvcmVkIC8geGVuY29uc29sZWQgcnVubmluZz8K
Cj4gKFhFTikgQXNzZXJ0aW9uICdmZG9tICE9IHAybS0+ZG9tYWluJyBmYWlsZWQgYXQgcDJtLmM6
NTA0CgpZb3UgY2FuIHdvcmsgYXJvdW5kIHRoaXMgd2l0aDoKCi0tLTg8LS0tCkZyb20gOTQzNzA1
NDI5OWMxZDM2MGViNGZlZGQwNjVkNTE5NjVlNTYwZmMwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KRGF0ZTogRnJpLCAyIE5vdiAy
MDE4IDE0OjU1OjA0ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gRFJPUCBET05UIFBPU1QKCi0tLQog
eGVuL2FyY2gveDg2L21tLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNo
L3g4Ni9tbS5jCmluZGV4IGYwNDNlNDNhYzcuLjljMTU0NzgzZTQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00NDQzLDcgKzQ0NDMsNyBA
QCBpbnQgYXJjaF9hY3F1aXJlX3Jlc291cmNlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCB0eXBlLAogCiAgICAgc3dpdGNoICggdHlwZSApCiAgICAgewotI2lmZGVmIENPTkZJR19IVk0K
KyNpZiAwCiAgICAgY2FzZSBYRU5NRU1fcmVzb3VyY2VfaW9yZXFfc2VydmVyOgogICAgIHsKICAg
ICAgICAgaW9zZXJ2aWRfdCBpb3NlcnZpZCA9IGlkOwotLSAKMi4xMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
