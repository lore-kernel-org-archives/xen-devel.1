From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Thu, 15 Mar 2018 02:18:55 -0600
Message-ID: <5AAA3A7F02000078001B1F01@prv-mh.provo.novell.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-17-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE5OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gTW9zdCBvZiB0
aGUgdXNlcnMgb2YgcGFnZV90b19tZm4gYW5kIG1mbl90b19wYWdlIGFyZSBlaXRoZXIgb3ZlcnJp
ZGluZwo+IHRoZSBtYWNyb3MgdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCBvciB1c2UgbWZu
X3gvX21mbiBiZWNhdXNlIHRoZQo+IHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIHVzZSBtZm5fdC4KPiAK
PiBTbyBtYWtlIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSByZXR1cm4gbWZuX3QgYnkgZGVm
YXVsdC4gVGhlIF9fKgo+IHZlcnNpb24gYXJlIG5vdyBkcm9wcGVkIGFzIHRoaXMgcGF0Y2ggd2ls
bCBjb252ZXJ0IGFsbCB0aGUgcmVtYWluaW5nCj4gbm9uLXR5cGVzYWZlIGNhbGxlcnMuCj4gCj4g
T25seSByZWFzb25hYmxlIGNsZWFuLXVwcyBhcmUgZG9uZSBpbiB0aGlzIHBhdGNoLiBUaGUgcmVz
dCB3aWxsIHVzZQo+IF9tZm4vbWZuX3ggZm9yIHRoZSB0aW1lIGJlaW5nLgo+IAo+IExhc3RseSwg
ZG9tYWluX3BhZ2VfdG9fbWZuIGlzIGFsc28gY29udmVydGVkIHRvIHVzZSBtZm5fdCBnaXZlbiB0
aGF0Cj4gbW9zdCBvZiB0aGUgY2FsbGVycyBhcmUgbm93IHN3aXRjaGVkIHRvIF9tZm4oZG9tYWlu
X3BhZ2VfdG9fbWZuKC4uLikpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpB
Y2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
