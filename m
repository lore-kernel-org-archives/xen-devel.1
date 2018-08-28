From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] SVM: limit GIF=0 region
Date: Tue, 28 Aug 2018 19:00:50 -0400
Message-ID: <9fb2abcc-b3d7-4927-1b55-ec8f87d70cdf@oracle.com>
References: <5B73C3A102000078001DE176@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flle=ll=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fumxW-0001vg-A8
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 22:59:38 +0000
In-Reply-To: <5B73C3A102000078001DE176@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTUvMjAxOCAwMjowOSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNlIEVGTEFHUy5J
RiBmb3IgYWxsIG9yZGluYXJ5IHB1cnBvc2VzOyB0aGVyZSdzIGluIHBhcnRpY3VsYXIgbm8gbmVl
ZAo+IHRvIHVuZHVseSBkZWZlciBOTUkvI01DLiBDbGVhci9zZXQgR0lGIHNvbGVseSBhcm91bmQg
Vk1SVU4gaXRzZWxmLiBUaGlzCj4gaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSB0aGF0IHN2
bV9zdGdpX2xhYmVsIG5vdyBpbmRlZWQgbWFya3MgdGhlCj4gb25seSBwbGFjZSB3aGVyZSBHSUYg
Z2V0cyBzZXQuCj4KPiBBIG5vdGUgcmVnYXJkaW5nIHRoZSBtYWluIFNUSShzKSBwbGFjZW1lbnQ6
IFF1aXRlIGNvdW50ZXJpbnR1aXRpdmVseSB0aGUKPiBob3N0J3MgRUZMQUdTLklGIGNvbnRpbnVl
cyB0byBoYXZlIGEgbWVhbmluZyB3aGlsZSB0aGUgZ3Vlc3QgcnVuczsgc2VlCj4gUE0gVm9sIDIg
c2VjdGlvbiAiUGh5c2ljYWwgKElOVFIpIEludGVycnVwdCBNYXNraW5nIGluIEVGTEFHUyIuIEhl
bmNlIHdlCj4gbmVlZCB0byBzZXQgdGhlIGZsYWcgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aW1lIGJl
aW5nIGluIGd1ZXN0IGNvbnRleHQuCj4gSG93ZXZlciwgU1BFQ19DVFJMX0VOVFJZX0ZST01fSFZN
IHdhbnRzIHRvIGJlIGNhcnJpZWQgb3V0IHdpdGggRUZMQUdTLklGCj4gY2xlYXIuCj4KPiBTdWdn
ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
