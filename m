From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v3 2/8] x86/pvh: reorder PVH dom0
 iommu initialization
Date: Fri, 15 Feb 2019 15:39:09 +0100
Message-ID: <e2d23e33-4d4c-8bfa-dc95-e9f31ffc4d53@suse.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1guee1-0003uJ-Hq
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 14:39:13 +0000
In-Reply-To: <20190215141837.1420-3-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNToxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFNvIHRoYXQgdGhl
IGlvbW11IGlzIGluaXRpYWxpemVkIGJlZm9yZSBwb3B1bGF0aW5nIHRoZSBwMm0sIGFuZAo+IGVu
dHJpZXMgYWRkZWQgZ2V0IHRoZSBjb3JyZXNwb25kaW5nIGlvbW11IHBhZ2UgdGFibGUgZW50cmll
cyBpZgo+IHJlcXVpcmVkLiBUaGlzIHJlcXVpcmVzIHNwbGl0dGluZyB0aGUgY3VycmVudCBwdmhf
c2V0dXBfcDJtIGludG8gdHdvCj4gZGlmZmVyZW50IGZ1bmN0aW9ucy4gT25lIHRoYXQgY3JhZnRz
IGRvbTAgcGh5c21hcCBhbmQgc2V0cyB0aGUgcGFnaW5nCj4gYWxsb2NhdGlvbiwgYW5kIGFub3Ro
ZXIgb25lIHRoYXQgYWN0dWFsbHkgcG9wdWxhdGVzIHRoZSBwMm0gd2l0aCBSQU0KPiByZWdpb25z
Lgo+IAo+IE5vdGUgdGhhdCB0aGlzIGFsbG93cyB0byByZW1vdmUgdGhlIHNwZWNpYWwgY2FzaW5n
IGRvbmUgZm9yIHRoZSBsb3cKPiAxTUIgaW4gaHdkb21faW9tbXVfbWFwLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
