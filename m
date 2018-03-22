From: Tim Deegan <tim@xen.org>
Subject: Re: [for-4.11][PATCH v6 16/16] xen: Convert page_to_mfn
 and mfn_to_page to use typesafe MFN
Date: Thu, 22 Mar 2018 12:24:52 +0000
Message-ID: <20180322122452.GB9337@deinos.phlegethon.org>
References: <20180321044737.20794-1-julien.grall@arm.com>
 <20180321044737.20794-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180321044737.20794-17-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpBdCAwNDo0NyArMDAwMCBvbiAyMSBNYXIgKDE1MjE2MDc2NTcpLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4gTW9zdCBvZiB0aGUgdXNlcnMgb2YgcGFnZV90b19tZm4gYW5kIG1mbl90b19wYWdl
IGFyZSBlaXRoZXIgb3ZlcnJpZGluZwo+IHRoZSBtYWNyb3MgdG8gbWFrZSB0aGVtIHdvcmsgd2l0
aCBtZm5fdCBvciB1c2UgbWZuX3gvX21mbiBiZWNhdXNlIHRoZQo+IHJlc3Qgb2YgdGhlIGZ1bmN0
aW9uIHVzZSBtZm5fdC4KPiAKPiBTbyBtYWtlIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSBy
ZXR1cm4gbWZuX3QgYnkgZGVmYXVsdC4gVGhlIF9fKgo+IHZlcnNpb24gYXJlIG5vdyBkcm9wcGVk
IGFzIHRoaXMgcGF0Y2ggd2lsbCBjb252ZXJ0IGFsbCB0aGUgcmVtYWluaW5nCj4gbm9uLXR5cGVz
YWZlIGNhbGxlcnMuCj4gCj4gT25seSByZWFzb25hYmxlIGNsZWFuLXVwcyBhcmUgZG9uZSBpbiB0
aGlzIHBhdGNoLiBUaGUgcmVzdCB3aWxsIHVzZQo+IF9tZm4vbWZuX3ggZm9yIHRoZSB0aW1lIGJl
aW5nLgo+IAo+IExhc3RseSwgZG9tYWluX3BhZ2VfdG9fbWZuIGlzIGFsc28gY29udmVydGVkIHRv
IHVzZSBtZm5fdCBnaXZlbiB0aGF0Cj4gbW9zdCBvZiB0aGUgY2FsbGVycyBhcmUgbm93IHN3aXRj
aGVkIHRvIF9tZm4oZG9tYWluX3BhZ2VfdG9fbWZuKC4uLikpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBD
b2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PgoKVGhvdWdodCBJJ2QgYWxyZWFkeSBhY2tlZCB0aGlzIGZvciB0aGUgc2hhZG93IGNvZGUsIGJ1
dCBjbGVhcmx5IG5vdC4KU29ycnkgZm9yIHRoZSBkZWxheSwgYW5kOgoKQWNrZWQtYnk6IFRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
