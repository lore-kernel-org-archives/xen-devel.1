From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/hvm: introduce cr_mask to store
 trapped bits of CR accesses
Date: Fri, 16 Feb 2018 12:49:57 +0000
Message-ID: <8f22586d-523f-c3a2-6b9f-c7a6f2514aed@citrix.com>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bmal=fk=citrix.com=prvs=5781d3f3f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1emfSn-0006pT-8f
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:50:05 +0000
In-Reply-To: <20180216121029.6872-2-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDIvMTggMTI6MTAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dmNwdS5oCj4gaW5kZXggZDkzMTY2ZmI5Mi4uODExZDRjMTBhZSAxMDA2NDQKPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS92Y3B1LmgKPiBAQCAtMTU2LDYgKzE1Niw5IEBAIHN0cnVjdCBodm1fdmNwdSB7Cj4gICAgICAg
Ki8KPiAgICAgIHVuc2lnbmVkIGxvbmcgICAgICAgaHdfY3JbNV07Cj4gIAo+ICsgICAgLyogQ2Fj
aGVkIGNvcHkgb2YgdGhlIHRyYXBwZWQgYml0cyBvZiBDUnMuIFVzZWQgZm9yIENSMCBhbmQgQ1I0
LiAqLwo+ICsgICAgdW5zaWduZWQgbG9uZyAgICAgICBtYXNrX2NyWzVdOwoKV2Ugb25seSBuZWVk
IG1hc2tzIGZvciBjcjAgYW5kIGNyNCwgYW5kIEkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gY2hhbmdl
CmZvciB0aGUgZm9yZXNlZWFibGUgZnV0dXJlIChDUjQgc3RpbGwgaGFzIHBsZW50eSBvZiBhdmFp
bGFibGUgYml0cyBpbgppdCkuwqAgSSdkIHJlY29tbWVuZDoKCnVuc2lnbmVkIGxvbmcgY3IwX2hv
c3RfbWFzaywgY3I0X2hvc3RfbWFzazsKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
