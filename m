From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v4 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Wed, 21 Feb 2018 16:25:06 +0200
Message-ID: <5080cf7c-d6a2-ce43-981f-624e9e8ad9ef@bitdefender.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-17-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjEvMjAxOCAwNDowMiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE1vc3Qgb2YgdGhl
IHVzZXJzIG9mIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSBhcmUgZWl0aGVyIG92ZXJyaWRp
bmcKPiB0aGUgbWFjcm9zIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGggbWZuX3Qgb3IgdXNlIG1mbl94
L19tZm4gYmVjYXVzZSB0aGUKPiByZXN0IG9mIHRoZSBmdW5jdGlvbiB1c2UgbWZuX3QuCj4gCj4g
U28gbWFrZSBwYWdlX3RvX21mbiBhbmQgbWZuX3RvX3BhZ2UgcmV0dXJuIG1mbl90IGJ5IGRlZmF1
bHQuIFRoZSBfXyoKPiB2ZXJzaW9uIGFyZSBub3cgZHJvcHBlZCBhcyB0aGlzIHBhdGNoIHdpbGwg
Y29udmVydCBhbGwgdGhlIHJlbWFpbmluZwo+IG5vbi10eXBlc2FmZSBjYWxsZXJzLgo+IAo+IE9u
bHkgcmVhc29uYWJsZSBjbGVhbi11cHMgYXJlIGRvbmUgaW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qg
d2lsbCB1c2UKPiBfbWZuL21mbl94IGZvciB0aGUgdGltZSBiZWluZy4KPiAKPiBMYXN0bHksIGRv
bWFpbl9wYWdlX3RvX21mbiBpcyBhbHNvIGNvbnZlcnRlZCB0byB1c2UgbWZuX3QgZ2l2ZW4gdGhh
dAo+IG1vc3Qgb2YgdGhlIGNhbGxlcnMgYXJlIG5vdyBzd2l0Y2hlZCB0byBfbWZuKGRvbWFpbl9w
YWdlX3RvX21mbiguLi4pKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
