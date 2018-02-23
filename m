From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Fri, 23 Feb 2018 04:59:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191015378@SHSMSX101.ccr.corp.intel.com>
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
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, "Wang,
 Shane" <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Wei, Gang" <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0KPiBTZW50
OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDIxLCAyMDE4IDEwOjAzIFBNCj4gCj4gTW9zdCBvZiB0aGUg
dXNlcnMgb2YgcGFnZV90b19tZm4gYW5kIG1mbl90b19wYWdlIGFyZSBlaXRoZXIgb3ZlcnJpZGlu
Zwo+IHRoZSBtYWNyb3MgdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCBvciB1c2UgbWZuX3gv
X21mbiBiZWNhdXNlIHRoZQo+IHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIHVzZSBtZm5fdC4KPiAKPiBT
byBtYWtlIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSByZXR1cm4gbWZuX3QgYnkgZGVmYXVs
dC4gVGhlIF9fKgo+IHZlcnNpb24gYXJlIG5vdyBkcm9wcGVkIGFzIHRoaXMgcGF0Y2ggd2lsbCBj
b252ZXJ0IGFsbCB0aGUgcmVtYWluaW5nCj4gbm9uLXR5cGVzYWZlIGNhbGxlcnMuCj4gCj4gT25s
eSByZWFzb25hYmxlIGNsZWFuLXVwcyBhcmUgZG9uZSBpbiB0aGlzIHBhdGNoLiBUaGUgcmVzdCB3
aWxsIHVzZQo+IF9tZm4vbWZuX3ggZm9yIHRoZSB0aW1lIGJlaW5nLgo+IAo+IExhc3RseSwgZG9t
YWluX3BhZ2VfdG9fbWZuIGlzIGFsc28gY29udmVydGVkIHRvIHVzZSBtZm5fdCBnaXZlbiB0aGF0
Cj4gbW9zdCBvZiB0aGUgY2FsbGVycyBhcmUgbm93IHN3aXRjaGVkIHRvIF9tZm4oZG9tYWluX3Bh
Z2VfdG9fbWZuKC4uLikpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gCgpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
