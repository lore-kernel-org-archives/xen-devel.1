From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH V6 2/4] x86/mm: introduce p2m_{init,
 free}_logdirty()
Date: Thu, 15 Nov 2018 16:21:30 +0000
Message-ID: <72A93439-246D-4CED-BA56-D210687661FF@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-3-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oNct=N2=citrix.com=prvs=8509d627e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gNKOc-0005i8-IH
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 16:21:34 +0000
In-Reply-To: <1542228002-21075-3-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <1AE08520E22ECC4297837A5D7E83BE75@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIE5vdiAxNCwgMjAxOCwgYXQgODo0MCBQTSwgUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiAKPiBBZGQgbG9nZGlydHlfcmFuZ2VzIGFsbG9j
YXRvciAvIGRlYWxsb2NhdG9yIGhlbHBlcnMuCj4gcDJtX2luaXRfbG9nZGlydHkoKSB3aWxsIG5v
dCByZS1hbGxvY2F0ZSBpZgo+IHAybS0+bG9nZGlydHkgcmFuZ2VzIGhhcyBhbHJlYWR5IGJlZW4g
YWxsb2NhdGVkLgo+IAo+IE1vdmUgdGhlIHJhbmdlc2V0IGRlYWxsb2NhdGlvbiBjYWxsIGZyb20g
cDJtX3RlYXJkb3duX2hvc3RwMm0oKQo+IHRvIHAybV9mcmVlX29uZSgpIC0gd2Ugd2lsbCB3YW50
IHRoaXMgdG8gYXBwbHkgdG8gYWx0cDJtcwo+IGFzIHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKUmV2aWV3ZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
