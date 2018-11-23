From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v1] mm/memory_hotplug: drop "online"
 parameter from add_memory_resource()
Date: Fri, 23 Nov 2018 14:05:46 +0100
Message-ID: <20181123130546.GN8625__49451.4005411931$1542978272$gmane$org@dhcp22.suse.cz>
References: <20181123123740.27652-1-david@redhat.com>
 <20181123125400.GL8625@dhcp22.suse.cz>
 <a97fcf28-ef71-2b49-c25c-bc96cff8366b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0p0i=oc=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gQB9a-0006P1-AB
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:05:50 +0000
Content-Disposition: inline
In-Reply-To: <a97fcf28-ef71-2b49-c25c-bc96cff8366b@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Mathieu Malaterre <malat@debian.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDIzLTExLTE4IDEzOjU4OjE2LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBPbiAy
My4xMS4xOCAxMzo1NCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gT24gRnJpIDIzLTExLTE4IDEz
OjM3OjQwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+PiBVc2VyIHNwYWNlIHNob3VsZCBh
bHdheXMgYmUgaW4gY2hhcmdlIG9mIGhvdyB0byBvbmxpbmUgbWVtb3J5IGFuZAo+ID4+IGlmIG1l
bW9yeSBzaG91bGQgYmUgb25saW5lZCBhdXRvbWF0aWNhbGx5IGluIHRoZSBrZXJuZWwuIExldCdz
IGRyb3AgdGhlCj4gPj4gcGFyYW1ldGVyIHRvIG92ZXJ3cml0ZSB0aGlzIC0gWEVOIHBhc3NlcyBt
ZW1ocF9hdXRvX29ubGluZSwganVzdCBsaWtlCj4gPj4gYWRkX21lbW9yeSgpLCBzbyB3ZSBjYW4g
ZGlyZWN0bHkgdXNlIHRoYXQgaW5zdGVhZCBpbnRlcm5hbGx5Lgo+ID4gCj4gPiBIZWgsIEkgd2Fu
dGVkIHRvIGdldCByaWQgb2YgbWVtaHBfYXV0b19vbmxpbmUgc28gbXVjaCBhbmQgbm93IHdlIGhh
dmUgaXQKPiA+IGluIHRoZSBjb3JlIG1lbW9yeV9ob3RwbHVnLiBOb3QgYSB3aW4gb24gbXkgc2lk
ZSBJIHdvdWxkIHNheSA6Lwo+IAo+IFRoYXQgaXMgYWN0dWFsbHkgYSBnb29kIHBvaW50OiBDYW4g
d2UgcmVtb3ZlIG1lbWhwX2F1dG9fb25saW5lIG9yIGlzIGl0Cj4gYWxyZWFkeSBzb21lIHNvcnQg
b2Yga2VybmVsIEFCST8KPiAKPiAoYXMgaXQgaXMgZXhwb3J0ZWQgdmlhIC9zeXMvZGV2aWNlcy9z
eXN0ZW0vbWVtb3J5L2F1dG9fb25saW5lX2Jsb2NrcykKCkkgaGF2ZSB0cmllZCBhbmQgdGhlcmUg
d2FzIGEgcHVzaGJhY2sgWzFdLiBUaGF0IGxlZCB0byBhIHJld29yayBvZiB0aGUKc3lzZnMgc2Vt
YW50aWMgb2Ygb25saW5pbmcgYnR3LiBUaGUgYmlnZ2VzdCBvYmplY3Rpb24gYWdhaW5zdCByZW1v
dmluZyB3YXMKdGhhdCB0aGUgdXNlcnNwYWNlIG1pZ2h0IGJlIHRvbyBzbG93IHRvIG9ubGluZSBt
ZW1vcnkgYW5kIG1lbW1hcHMgY291bGQKZWF0IHRoZSBhdmFpbGFibGUgbWVtb3J5IGFuZCB0cmln
Z2VyIE9PTS4gVGhhdCBpcyB3aHkgSSd2ZSBzdGFydGVkCndvcmtpbmcgb24gdGhlIHNlbGYgaG9z
dGVkIG1lbW1wYXMgYnV0IGZhaWxlZCB0byBmaW5pc2ggaXQuIEZvcnR1bmF0ZWxseQpPc2NhciBp
cyBicmF2ZSBlbm91Z2ggdG8gY29udGludWUgaW4gdGhhdCB3b3JrLgoKWzFdIGh0dHA6Ly9sa21s
Lmtlcm5lbC5vcmcvci8yMDE3MDIyNzA5MjgxNy4yMzU3MS0xLW1ob2Nrb0BrZXJuZWwub3JnCi0t
IApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
