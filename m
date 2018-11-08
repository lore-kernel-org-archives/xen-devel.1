From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 11:42:35 +0000
Message-ID: <4b3046ea-03a9-ff8d-842f-2315b92c7678@arm.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qw9j=nt=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gKiht-0002L8-9J
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 11:42:41 +0000
In-Reply-To: <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpTb3JyeSB0byBqdW1wIGluIHRoZSBjb252ZXJzYXRpb24gbGF0ZS4KCk9uIDExLzgvMTgg
MTE6MjkgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IFdoeSB3b3VsZCB0aGF0IGJlPyBU
aGUgZG9fc29mdGlycSgpIGludm9jYXRpb24gc2l0cyBvbiB0aGUgZXhpdC0KPj4gdG8tZ3Vlc3Qg
cGF0aCwgZXhwbGljaXRseSBhdm9pZGluZyBhbnkgc3VjaCBuZXN0aW5nIHVubGVzcyB0aGVyZQo+
PiB3YXMgYSBkb19zb2Z0aXJxKCkgaW52b2NhdGlvbiBzb21ld2hlcmUgaW4gYSBzb2Z0aXJxIGhh
bmRsZXIuCj4gCj4gSXQgc2l0cyBvbiBhbiBleGl0LXRvLWd1ZXN0IHBhdGgsIGJ1dCB0aGUgZm9s
bG93aW5nIGNodW5rOgo+IAo+IHJhaXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSk7Cj4gZG9f
c29mdGlycSgpOwo+IAo+IFdvdWxkIHByZXZlbnQgdGhlIHBhdGggZnJvbSBldmVyIHJlYWNoaW5n
IHRoZSBleGl0LXRvLWd1ZXN0IGFuZAo+IG5lc3Rpbmcgb24gaXRzZWxmLCB1bmxlc3MgdGhlIHZD
UFUgaXMgbWFya2VkIGFzIGJsb2NrZWQsIHdoaWNoCj4gcHJldmVudHMgaXQgZnJvbSBiZWluZyBz
Y2hlZHVsZWQgdGh1cyBhdm9pZGluZyB0aGlzIHJlY3Vyc2lvbi4KCkkgY2FuJ3Qgc2VlIGhvdyB0
aGUgcmVjdXJzaW9uIGNvdWxkIGhhcHBlbiBvbiBBcm0uIFNvIGlzIGl0IGFuIHg4NiBpc3N1ZT8K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
