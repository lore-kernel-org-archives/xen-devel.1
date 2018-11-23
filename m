From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v1] mm/memory_hotplug: drop "online"
 parameter from add_memory_resource()
Date: Fri, 23 Nov 2018 13:54:00 +0100
Message-ID: <20181123125400.GL8625__23104.3740678162$1542977581$gmane$org@dhcp22.suse.cz>
References: <20181123123740.27652-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0p0I=OC=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gQAyG-0004xd-9R
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 12:54:08 +0000
Content-Disposition: inline
In-Reply-To: <20181123123740.27652-1-david@redhat.com>
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

T24gRnJpIDIzLTExLTE4IDEzOjM3OjQwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBVc2Vy
IHNwYWNlIHNob3VsZCBhbHdheXMgYmUgaW4gY2hhcmdlIG9mIGhvdyB0byBvbmxpbmUgbWVtb3J5
IGFuZAo+IGlmIG1lbW9yeSBzaG91bGQgYmUgb25saW5lZCBhdXRvbWF0aWNhbGx5IGluIHRoZSBr
ZXJuZWwuIExldCdzIGRyb3AgdGhlCj4gcGFyYW1ldGVyIHRvIG92ZXJ3cml0ZSB0aGlzIC0gWEVO
IHBhc3NlcyBtZW1ocF9hdXRvX29ubGluZSwganVzdCBsaWtlCj4gYWRkX21lbW9yeSgpLCBzbyB3
ZSBjYW4gZGlyZWN0bHkgdXNlIHRoYXQgaW5zdGVhZCBpbnRlcm5hbGx5LgoKSGVoLCBJIHdhbnRl
ZCB0byBnZXQgcmlkIG9mIG1lbWhwX2F1dG9fb25saW5lIHNvIG11Y2ggYW5kIG5vdyB3ZSBoYXZl
IGl0CmluIHRoZSBjb3JlIG1lbW9yeV9ob3RwbHVnLiBOb3QgYSB3aW4gb24gbXkgc2lkZSBJIHdv
dWxkIHNheSA6LwpPbiB0aGUgb3RoZXIgaGFuZCB0aGlzIGNhbiBiZSBzZWVuIGFzIGEgY2xlYW51
cCBiZWNhdXNlIGl0IHJlbW92ZXMgdGhhdAphbWJpZ3VpdHkgdGhhdCBzb21lIGNhbGxlcnMgbWln
aHQgYmUgdW5hd2FyZSBvZiB0aGUgbWVtaHBfYXV0b19vbmxpbmUKbGVhZGluZyB0byBhIGRpZmZl
cmVudCBiZWhhdmlvci4KCj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNl
LmRlPgo+IENjOiBQYXZlbCBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ab3JhY2xlLmNvbT4KPiBD
YzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPgo+IENjOiBKb29uc29vIEtpbSA8aWFtam9vbnNvby5raW1AbGdl
LmNvbT4KPiBDYzogQXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEub3JnPgo+IENjOiBNYXRoaWV1
IE1hbGF0ZXJyZSA8bWFsYXRAZGViaWFuLm9yZz4KPiBDYzogU3RlcGhlbiBSb3Rod2VsbCA8c2Zy
QGNhbmIuYXV1Zy5vcmcuYXU+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRh
dmlkQHJlZGhhdC5jb20+CgpBY2tlZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+
Ci0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
