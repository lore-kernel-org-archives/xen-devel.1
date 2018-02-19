From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/hvm: introduce cr_mask to store
 trapped bits of CR accesses
Date: Mon, 19 Feb 2018 15:07:01 +0000
Message-ID: <5abe319a-6e96-cea0-f4d2-79659b4c4363@citrix.com>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-2-roger.pau@citrix.com>
 <8f22586d-523f-c3a2-6b9f-c7a6f2514aed@citrix.com>
 <20180219150401.uwf7zgxcrgc5xgmt@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ycie=fn=citrix.com=prvs=581292da5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1enn21-00056r-4I
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:07:05 +0000
In-Reply-To: <20180219150401.uwf7zgxcrgc5xgmt@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMTU6MDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBGZWIg
MTYsIDIwMTggYXQgMTI6NDk6NTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MTYvMDIvMTggMTI6MTAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92
Y3B1LmgKPj4+IGluZGV4IGQ5MzE2NmZiOTIuLjgxMWQ0YzEwYWUgMTAwNjQ0Cj4+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL3ZjcHUuaAo+Pj4gQEAgLTE1Niw2ICsxNTYsOSBAQCBzdHJ1Y3QgaHZtX3ZjcHUgewo+
Pj4gICAgICAgKi8KPj4+ICAgICAgdW5zaWduZWQgbG9uZyAgICAgICBod19jcls1XTsKPj4+ICAK
Pj4+ICsgICAgLyogQ2FjaGVkIGNvcHkgb2YgdGhlIHRyYXBwZWQgYml0cyBvZiBDUnMuIFVzZWQg
Zm9yIENSMCBhbmQgQ1I0LiAqLwo+Pj4gKyAgICB1bnNpZ25lZCBsb25nICAgICAgIG1hc2tfY3Jb
NV07Cj4+IFdlIG9ubHkgbmVlZCBtYXNrcyBmb3IgY3IwIGFuZCBjcjQsIGFuZCBJIGRvbid0IGV4
cGVjdCB0aGlzIHRvIGNoYW5nZQo+PiBmb3IgdGhlIGZvcmVzZWVhYmxlIGZ1dHVyZSAoQ1I0IHN0
aWxsIGhhcyBwbGVudHkgb2YgYXZhaWxhYmxlIGJpdHMgaW4KPj4gaXQpLsKgIEknZCByZWNvbW1l
bmQ6Cj4+Cj4+IHVuc2lnbmVkIGxvbmcgY3IwX2hvc3RfbWFzaywgY3I0X2hvc3RfbWFzazsKPiBP
SywgSSd2ZSB1c2VkIGFuIGFycmF5IHRvIGtlZXAgY29uc2lzdGVuY3kgd2l0aCB0aGUgb3RoZXIg
Q1IgYXJyYXkKPiBmaWVsZHMsIGJ1dCBJIGd1ZXNzIGhlcmUgaXQgbWFrZXMgbGVzcyBzZW5zZSBi
ZWNhdXNlIG9ubHkgdHdvIG9mIHRoZW0KPiBhcmUgZ29pbmcgdG8gYmUgdXNlZC4KCkknbGwgYmUg
ZHJvcHBpbmcgdGhlIGFycmF5cyBpbiBkdWUgY291cnNlIGFueXdheS7CoCBTb21lIG9mIHRoZSB2
YWx1ZQphcmVuJ3QgdXNlZCBhdCBhbGwsIGFuZCBpdCB3aWxsIHNpbXBsaWZ5IGNvZGUgd2hpY2gg
aXMgY29tbW9uIGJldHdlZW4gUFYKYW5kIEhWTS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
