From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 7/8] mm: allow to control
 onlining/offlining of memory by a driver
Date: Fri, 13 Apr 2018 18:32:39 +0200
Message-ID: <92ff9057-7f1e-d9b7-610e-0a7022b8da01__19212.9806186587$1523637088$gmane$org@redhat.com>
References: <20180413131632.1413-1-david@redhat.com>
 <20180413133334.3612-1-david@redhat.com>
 <20180413155943.GY17484@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t64/=hc=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1f71cy-0004g0-NL
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 16:32:44 +0000
In-Reply-To: <20180413155943.GY17484@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, open list <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Reza Arbab <arbab@linux.vnet.ibm.com>, Ingo Molnar <mingo@kernel.org>, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

T24gMTMuMDQuMjAxOCAxNzo1OSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIEZyaSAxMy0wNC0x
OCAxNTozMzoyOCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IFNvbWUgZGV2aWNlcyAoZXNw
LiBwYXJhdmlydHVhbGl6ZWQpIG1pZ2h0IHdhbnQgdG8gY29udHJvbAo+PiAtIHdoZW4gdG8gb25s
aW5lL29mZmxpbmUgYSBtZW1vcnkgYmxvY2sKPj4gLSBob3cgdG8gb25saW5lIG1lbW9yeSAoTU9W
QUJMRS9OT1JNQUwpCj4+IC0gaW4gd2hpY2ggZ3JhbnVsYXJpdHkgdG8gb25saW5lL29mZmxpbmUg
bWVtb3J5Cj4+Cj4+IFNvIGxldCdzIGFkZCBhIG5ldyBmbGFnICJkcml2ZXJfbWFuYWdlZCIgYW5k
IGRpc2FsbG93IHRvIGNoYW5nZSB0aGUKPj4gc3RhdGUgYnkgdXNlciBzcGFjZS4gRGV2aWNlIG9u
bGluaW5nL29mZmxpbmluZyB3aWxsIHN0aWxsIHdvcmssIGhvd2V2ZXIKPj4gdGhlIG1lbW9yeSB3
aWxsIG5vdCBiZSBhY3R1YWxseSBvbmxpbmVkL29mZmxpbmVkLiBUaGF0IGhhcyB0byBiZSBoYW5k
bGVkCj4+IGJ5IHRoZSBkZXZpY2UgZHJpdmVyIHRoYXQgb3ducyB0aGUgbWVtb3J5Lgo+IAo+IElz
IHRoZXJlIGFueSByZWFzb24gdG8gY3JlYXRlIHRoZSBtZW1ibG9jayBzeXNmcyBpbnRlcmZhY2Ug
dG8gdGhpcwo+IG1lbW9yeSBhdCBhbGw/IFpPTkVfREVWSUNFIG1lbSBob3RwbHVnIHVzZXJzIGN1
cnJlbnRseSBkbyBub3QgZG8gdGhhdAo+IGFuZCBtYW5hZ2UgdGhlIG1lbW9yeSB0aGVtc2VsdmVz
LiBJdCBzZWVtcyB5b3Ugd2FudCB0byBhY2hpZXZlIHRoZSBzYW1lCj4gdGhpbmcsIG5vPwo+IAoK
WWVzLCBJIHRoaW5rIHNvLCBuYW1lbHkga2R1bXAuIFdlIGhhdmUgdG8gcmV0cmlnZ2VyIGtleGVj
KCkgd2hlbmV2ZXIgYQptZW1vcnkgYmxvY2sgaXMgYWRkZWQvcmVtb3ZlZC4gdWRldiBldmVudHMg
YXJlIHNlbnQgZm9yIHRoYXQgcmVhc29uIHdoZW4KYSBtZW1vcnkgYmxvY2sgaXMgY3JlYXRlZC9k
ZWxldGVkLiBBbmQgSSB0aGluayB0aGlzIGlzIG5vdCBkb25lIGZvcgpaT05FX0RFVklDRSBkZXZp
Y2VzLCBvciBhbSBJIHdyb25nPwoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
