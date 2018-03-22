From: Julien Grall <julien.grall@arm.com>
Subject: Re: [for-4.11][PATCH v6 16/16] xen: Convert page_to_mfn
 and mfn_to_page to use typesafe MFN
Date: Thu, 22 Mar 2018 14:08:05 +0000
Message-ID: <013f09bf-a1e6-4d4b-a267-f7cea3deddf4@arm.com>
References: <20180321044737.20794-1-julien.grall@arm.com>
 <20180321044737.20794-17-julien.grall@arm.com>
 <20180322122452.GB9337@deinos.phlegethon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180322122452.GB9337@deinos.phlegethon.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Deegan <tim@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMi8yMDE4IDEyOjI0IFBNLCBUaW0gRGVlZ2FuIHdyb3RlOgo+IEhpLAoKSGkgVGlt
LAoKPiBBdCAwNDo0NyArMDAwMCBvbiAyMSBNYXIgKDE1MjE2MDc2NTcpLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+IE1vc3Qgb2YgdGhlIHVzZXJzIG9mIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFn
ZSBhcmUgZWl0aGVyIG92ZXJyaWRpbmcKPj4gdGhlIG1hY3JvcyB0byBtYWtlIHRoZW0gd29yayB3
aXRoIG1mbl90IG9yIHVzZSBtZm5feC9fbWZuIGJlY2F1c2UgdGhlCj4+IHJlc3Qgb2YgdGhlIGZ1
bmN0aW9uIHVzZSBtZm5fdC4KPj4KPj4gU28gbWFrZSBwYWdlX3RvX21mbiBhbmQgbWZuX3RvX3Bh
Z2UgcmV0dXJuIG1mbl90IGJ5IGRlZmF1bHQuIFRoZSBfXyoKPj4gdmVyc2lvbiBhcmUgbm93IGRy
b3BwZWQgYXMgdGhpcyBwYXRjaCB3aWxsIGNvbnZlcnQgYWxsIHRoZSByZW1haW5pbmcKPj4gbm9u
LXR5cGVzYWZlIGNhbGxlcnMuCj4+Cj4+IE9ubHkgcmVhc29uYWJsZSBjbGVhbi11cHMgYXJlIGRv
bmUgaW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qgd2lsbCB1c2UKPj4gX21mbi9tZm5feCBmb3IgdGhl
IHRpbWUgYmVpbmcuCj4+Cj4+IExhc3RseSwgZG9tYWluX3BhZ2VfdG9fbWZuIGlzIGFsc28gY29u
dmVydGVkIHRvIHVzZSBtZm5fdCBnaXZlbiB0aGF0Cj4+IG1vc3Qgb2YgdGhlIGNhbGxlcnMgYXJl
IG5vdyBzd2l0Y2hlZCB0byBfbWZuKGRvbWFpbl9wYWdlX3RvX21mbiguLi4pKS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQWNrZWQt
Ynk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4gUmV2aWV3
ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4+IFJldmlld2Vk
LWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4+IFJldmlld2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgo+IAo+IFRob3VnaHQgSSdkIGFscmVhZHkgYWNrZWQgdGhpcyBm
b3IgdGhlIHNoYWRvdyBjb2RlLCBidXQgY2xlYXJseSBub3QuCgpZb3UgYWNrZWQgb24gdGhlIGZp
cnN0IHZlcnNpb24uIFRoYXQgcGF0Y2ggd2FzIGhlYXZpbHkgcmV3b3JrIGp1c3QgYWZ0ZXIgCnRv
IGRyb3AgX19tZm5fdG9fcGFnZSBhbmQgX19wYWdlX3RvX21mbiByYXRoZXIuIEhlbmNlIEkgZHJv
cHBlZCB0aGUgYWNrZWQuCgo+IFNvcnJ5IGZvciB0aGUgZGVsYXksIGFuZDoKPiAKPiBBY2tlZC1i
eTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpUaGFuayB5b3UhCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
