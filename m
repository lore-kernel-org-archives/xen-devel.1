From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 05/13] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Mon, 16 Jul 2018 15:09:09 +0100
Message-ID: <20180716140909.qc5a7nzfevzwwhlh@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x/ry=ka=citrix.com=prvs=7282924f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ff4Bx-0003NE-84
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:09:33 +0000
Content-Disposition: inline
In-Reply-To: <20180707110526.35822-6-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgMDcsIDIwMTggYXQgMTI6MDU6MThQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFR1cm4gaW9tbXVfbWFwL3VubWFwX3BhZ2UoKSBpbnRvIHN0cmFpZ2h0Zm9yd2FyZCB3
cmFwcGVycyB0aGF0IGNoZWNrIHRoZQo+IGV4aXN0ZW5jZSBvZiB0aGUgcmVsZXZhbnQgaW9tbXVf
b3AgYW5kIGNhbGwgdGhyb3VnaCB0byBpdC4gVGhpcyBtYWtlcyB0aGVtCj4gdXNhYmxlIGJ5IFBW
IElPTU1VIGNvZGUgdG8gYmUgZGVsaXZlcmVkIGluIGZ1dHVyZSBwYXRjaGVzLgo+IExlYXZlIHRo
ZSBkZWNpc2lvbiBvbiB3aGV0aGVyIHRvIGludm9rZSBkb21haW5fY3Jhc2goKSB1cCB0byB0aGUg
Y2FsbGVyLgo+IFRoaXMgaGFzIHRoZSBhZGRlZCBiZW5lZml0IHRoYXQgdGhlIChtb2R1bGUvbGlu
ZSBudW1iZXIpIG1lc3NhZ2UgdGhhdAo+IGRvbWFpbl9jcmFzaCgpIHNwaXRzIG91dCB3aWxsIGJl
IG1vcmUgaW5kaWNhdGl2ZSBvZiB3aGVyZSB0aGUgcHJvYmxlbSBsaWVzLgo+IAo+IE5PVEU6IFRo
aXMgcGF0Y2ggaW5jbHVkZXMgb25lIGJpdCBvZiBjbGVhbi11cCBpbiBzZXRfaWRlbnRpdHlfcDJt
X2VudHJ5KCkKPiAgICAgICByZXBsYWNpbmcgdXNlIG9mIHAybS0+ZG9tYWluIHdpdGggdGhlIGRv
bWFpbiBwb2ludGVyIHBhc3NlZCBpbnRvIHRoZQo+ICAgICAgIGZ1bmN0aW9uLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
