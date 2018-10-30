From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Tue, 30 Oct 2018 06:19:56 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zlu6=nk=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gHNNi-000801-8R
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 06:20:02 +0000
In-Reply-To: <20181024091849.15572-1-aisaila@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tXQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNCwgMjAxOCA1OjE5IFBNCj4gCj4g
VGhlIG1heV9kZWZlciB2YXIgd2FzIGxlZnQgd2l0aCB0aGUgb2xkZXIgYm9vbF90IHR5cGUuIFRo
aXMgcGF0Y2gKPiBjaGFuZ2VzIHRoZSB0eXBlIHRvIGJvb2wuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CgpSZXZpZXdlZC1ieTog
S2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
