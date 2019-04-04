From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] public/io/blkif.h: try to fix the
 semantics of sector based quantities
Date: Thu, 4 Apr 2019 13:28:15 +0100
Message-ID: <20190404122815.GK14641@zion.uk.xensource.com>
References: <20190404114002.30184-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC1Tj-0007Xu-8Y
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 12:28:23 +0000
Content-Disposition: inline
In-Reply-To: <20190404114002.30184-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Athony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMTI6NDA6MDJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBzZW1hbnRpY3Mgb2Ygc2VjdG9yIGJhc2VkIHF1YW50aXRpZXMsIHN1Y2ggYXMg
Zmlyc3Rfc2VjdCBhbmQgbGFzdF9zZWN0Cj4gaW4gYmxraWZfcmVxdWVzdF9zZWdtZW50LCBhbmQg
dGhlIHZhbHVlIG9mICJzZWN0b3JzIiBpbiB0aGUgYmFja2VuZCBpbmZvCj4gaW4geGVuc3RvcmUg
aGF2ZSBiZWNvbWUgY29uZnVzZWQuIFNvbWUgY29tbWVudHMgaW4gdGhlIGhlYWRlciBzdWdnZXN0
IHRoZXkKPiBzaG91bGQgYmUgc3VwcGxpZWQvaW50ZXJwcmV0ZWQgc3RyaWN0bHkgaW4gdGVybXMg
b2YgNTEyLWJ5dGUgdW5pdHMsIG90aGVycwo+IHN1Z2dlc3QgdGhleSBzaG91bGQgYmUgc2NhbGVk
IGJ5IHRoZSB2YWx1ZSBvZiAic2VjdG9yLXNpemUiIGkuZS4gdGhlCj4gbG9naWNhbCBibG9jayBz
aXplIG9mIHRoZSB1bmRlcmx5aW5nIGJhY2tlbmQgc3RvcmFnZS4KPiBUaGlzIGNvbmZ1c2lvbiBo
YXMgY2F1c2VkIG1peGVkIHNlbWFudGljcyB0byBiZWNvbWUgaW5ncmFpbmVkIGluIGZyb250ZW5k
Cj4gaW1wbGVtZW50YXRpb25zLiBGb3IgaW5zdGFuY2UgTGludXggeGVuLWJsa2Zyb250LmMgY29u
dGFpbnMgY29kZSBzdWNoIGFzOgo+IAo+ICAgICBmc2VjdCA9IG9mZnNldCA+PiA5Owo+ICAgICBs
c2VjdCA9IGZzZWN0ICsgKGxlbiA+PiA5KSAtIDE7Cj4gCj4gd2hlcmVhcyB0aGUgV2luZG93cyBY
RU5WQkQgZnJvbnRlbmQgY29udGFpbnMgdGhlIGZvbGxvd2luZyBlcXVpdmFsZW50IGNvZGU6Cj4g
Cj4gICAgIFNlZ21lbnQtPkZpcnN0U2VjdG9yID0gKFVDSEFSKSgoT2Zmc2V0ICsgU2VjdG9yU2l6
ZSAtIDEpIC8gU2VjdG9yU2l6ZSk7Cj4gICAgICpTZWN0b3JzTm93ID0gX19taW4oU2VjdG9yc0xl
ZnQsIFNlY3RvcnNQZXJQYWdlIC0gU2VnbWVudC0+Rmlyc3RTZWN0b3IpOwo+ICAgICBTZWdtZW50
LT5MYXN0U2VjdG9yID0gKFVDSEFSKShTZWdtZW50LT5GaXJzdFNlY3RvciArICpTZWN0b3JzTm93
IC0gMSk7Cj4gCj4gKHdoZXJlIFNlY3RvclNpemUgaXMgdGhlICJzZWN0b3Itc2l6ZSIgdmFsdWUg
YWR2ZXJ0aXplZCBpbiB4ZW5zdG9yZSkuCj4gCj4gVGh1cyBpdCBoYXMgYmVjb21lIHVuc2FmZSBm
b3IgYSBiYWNrZW5kIHRvIHNldCAic2VjdG9yLXNpemUiIHRvIGFueXRoaW5nCj4gb3RoZXIgdGhh
biA1MTIgYXMgaXQgZG9lcyBub3Qga25vdyB3aGljaCB3YXkgdGhlIGZyb250ZW5kIGlzIGNvZGVk
Lgo+IAo+IFRoaXMgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gY2xhcmlmeSB0aGUgc2l0dWF0aW9uIGFu
ZCBhbHNvIGludHJvZHVjZSBhCj4gbWVjaGFuaXNtIHRvIGFsbG93IGxvZ2ljYWwgYmxvY2sgc2l6
ZXMgb2YgbW9yZSB0aGFuIDUxMiB0byBiZSBzdXBwb3J0ZWQuLi4KPiAKPiBBIG5ldyBmcm9udGVu
ZCBmZWF0dXJlIG5vZGUgaXMgc3BlY2lmaWVkOiAnZmVhdHVyZS1sYXJnZS1zZWN0b3Itc2l6ZScu
Cj4gSWYgdGhpcyBub2RlIGlzIHByZXNlbnQgYW5kIHNldCB0byAiMSIgdGhlbiBpdCBtZWFucyB0
aGF0IGZyb250ZW5kIGlzCj4gY29kZWQgdG8gc3VwcGx5IGFuZCBpbnRlcnByZXQgYWxsIHNlY3Rv
ciBiYXNlZCBxdWFudGl0aWVzIGluIHRlcm1zIG9mIHRoZQo+IHRoZSBhZHZlcnRpemVkICJzZWN0
b3Itc2l6ZSIgdmFsdWUgcmF0aGVyIHRoYW4gYSBoYXJkY29kZWQgc2l6ZSBvZiA1MTIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKSSB0aGluayBKdWVy
Z2VuJ3MgUmIgaXMgc3VmZmljaWVudC4KCkkgd2lsbCBjb21taXQgdGhpcyBwYXRjaCB0b2RheS4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
