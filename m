From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V3] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Tue, 25 Sep 2018 15:33:40 +0100
Message-ID: <f0279efd-e12e-aa68-9588-ff78e7f71d7a@citrix.com>
References: <1537873355-5169-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cm1m=mh=citrix.com=prvs=799c446c1=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g4oVr-0007Di-FU
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 14:40:31 +0000
In-Reply-To: <1537873355-5169-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jbeulich@suse.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjUvMjAxOCAxMjowMiBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE1vdmUgcDJt
X3tnZXQvc2V0fV9zdXBwcmVzc192ZSgpIHRvIHAybS5jLCByZXBsYWNlIGluY29ycmVjdAo+IEFT
U0VSVCgpIGluIHAybS1wdC5jIChzaW5jZSBhIGd1ZXN0IGNhbiBydW4gaW4gc2hhZG93IG1vZGUg
ZXZlbiBvbgo+IGEgc3lzdGVtIHdpdGggdmlydCBleGNlcHRpb25zLCB3aGljaCB3b3VsZCB0cmln
Z2VyIHRoZSBBU1NFUlQoKSksCj4gbW92ZSB0aGUgVk1YLWlzbXMgKGNwdV9oYXNfdm14X3ZpcnRf
ZXhjZXB0aW9ucyBjaGVja3MpIHRvCj4gcDJtX2VwdF97Z2V0L3NldH1fZW50cnkoKSwgYW5kIGZp
eCBsb2NraW5nIGNvZGUgaW4KPiBwMm1fZ2V0X3N1cHByZXNzX3ZlKCkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKUmV2aWV3
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
