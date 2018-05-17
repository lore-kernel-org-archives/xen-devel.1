From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 8/8] xen_disk: be consistent with use of
 xendev and blkdev->xendev
Date: Thu, 17 May 2018 12:07:50 +0100
Message-ID: <20180517110750.GM2057__30392.5464897931$1526555202$gmane$org@perard.uk.xensource.com>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-9-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kmnw=ie=citrix.com=prvs=6682a862c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJGlH-0000tS-8O
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:07:55 +0000
Content-Disposition: inline
In-Reply-To: <1525461967-32174-9-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDg6MjY6MDdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IENlcnRhaW4gZnVuY3Rpb25zIGluIHhlbl9kaXNrIGFyZSBjYWxsZWQgd2l0aCBhIHBv
aW50ZXIgdG8geGVuZGV2Cj4gKHN0cnVjdCBYZW5EZXZpY2UgKikuIFRoZXkgdGhlbiB1c2UgY29u
dGluZXJfb2YoKSB0byBhY2NlcyB0aGUgc3Vycm91bmRpbmcKCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXiBjb250YWluZXJfb2YKCj4gYmxrZGV2IChzdHJ1Y3QgWGVuQmxr
RGV2KSBidXQgdGhlbiBpbiB2YXJpb3VzIHBsYWNlcyB1c2UgJmJsa2Rldi0+eGVuZGV2Cj4gd2hl
biB1c2Ugb2YgdGhlIG9yaWdpbmFsIHhlbmRldiBwb2ludGVyIGlzIHNob3J0ZXIgdG8gZXhwcmVz
cyBhbmQgY2xlYXJseQo+IGVxdWl2YWxlbnQuCj4gCj4gVGhpcyBwYXRjaCBpcyBhIHB1cmVseSBj
b3NtZXRpYyBwYXRjaCB3aGljaCBtYWtlcyBzdXJlIHRoZXJlIGlzIGEgeGVuZGV2Cj4gcG9pbnRl
ciBvbiBzdGFjayBmb3IgYW55IGZ1bmN0aW9uIHdoZXJlIHRoZSBwb2ludGVyIGlzIG5lZWQgb24g
bXVsdGlwbGUKPiBvY2Nhc2lvbnMgbW9kaWZpZWQgdGhvc2UgZnVuY3Rpb25zIHRvIHVzZSBpdCBj
b25zaXN0ZW50bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
