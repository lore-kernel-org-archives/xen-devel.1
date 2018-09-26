From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V3] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Wed, 26 Sep 2018 01:00:33 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19133F4C2@SHSMSX101.ccr.corp.intel.com>
References: <1537873355-5169-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pclh=mi=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g4yCT-0007IM-8l
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 01:01:09 +0000
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
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNSwgMjAxOCA3OjAzIFBNCj4gCj4gTW92ZSBw
Mm1fe2dldC9zZXR9X3N1cHByZXNzX3ZlKCkgdG8gcDJtLmMsIHJlcGxhY2UgaW5jb3JyZWN0Cj4g
QVNTRVJUKCkgaW4gcDJtLXB0LmMgKHNpbmNlIGEgZ3Vlc3QgY2FuIHJ1biBpbiBzaGFkb3cgbW9k
ZSBldmVuIG9uCj4gYSBzeXN0ZW0gd2l0aCB2aXJ0IGV4Y2VwdGlvbnMsIHdoaWNoIHdvdWxkIHRy
aWdnZXIgdGhlIEFTU0VSVCgpKSwKPiBtb3ZlIHRoZSBWTVgtaXNtcyAoY3B1X2hhc192bXhfdmly
dF9leGNlcHRpb25zIGNoZWNrcykgdG8KPiBwMm1fZXB0X3tnZXQvc2V0fV9lbnRyeSgpLCBhbmQg
Zml4IGxvY2tpbmcgY29kZSBpbgo+IHAybV9nZXRfc3VwcHJlc3NfdmUoKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgpSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
