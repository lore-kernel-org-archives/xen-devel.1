From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 20 Jul 2018 16:01:25 -0700
Message-ID: <20180720160125.f3cda46f317a1ff5a2342549__6563.59312492913$1532127635$gmane$org@linux-foundation.org>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <20180716161249.c76240cd487c070fb271d529@linux-foundation.org>
 <20180717081201.GB16803@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfmk=ke=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1fgeOv-0001YF-NB
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 23:01:29 +0000
In-Reply-To: <20180717081201.GB16803@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: kvm@vger.kernel.org, Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNyBKdWwgMjAxOCAxMDoxMjowMSArMDIwMCBNaWNoYWwgSG9ja28gPG1ob2Nrb0Br
ZXJuZWwub3JnPiB3cm90ZToKCj4gPiBBbnkgc3VnZ2VzdGlvbnMgcmVnYXJkaW5nIGhvdyB0aGUg
ZHJpdmVyIGRldmVsb3BlcnMgY2FuIHRlc3QgdGhpcyBjb2RlCj4gPiBwYXRoPyAgSSBkb24ndCB0
aGluayB3ZSBwcmVzZW50bHkgaGF2ZSBhIHdheSB0byBmYWtlIGFuIG9vbS1raWxsaW5nCj4gPiBl
dmVudD8gIFBlcmhhcHMgd2Ugc2hvdWxkIGFkZCBzdWNoIGEgdGhpbmcsIGdpdmVuIHRoZSBwcm9i
bGVtcyB3ZSdyZQo+ID4gaGF2aW5nIHdpdGggdGhhdCBmZWF0dXJlLgo+IAo+IFRoZSBzaW1wbGVz
dCB3YXkgaXMgdG8gd3JhcCBhbiB1c2Vyc3BhY2UgY29kZSB3aGljaCB1c2VzIHRoZXNlIG5vdGlm
aWVycwo+IGludG8gYSBtZW1jZyBhbmQgc2V0IHRoZSBoYXJkIGxpbWl0IHRvIGhpdCB0aGUgb29t
LiBUaGlzIGNhbiBiZSBkb25lCj4gZS5nLiBhZnRlciB0aGUgdGVzdCBmYXVsdHMgaW4gYWxsIHRo
ZSBtbXUgbm90aWZpZXIgbWFuYWdlZCBtZW1vcnkgYW5kCj4gc2V0IHRoZSBoYXJkIGxpbWl0IHRv
IHNvbWV0aGluZyByZWFsbHkgc21hbGwuIFRoZW4gd2UgYXJlIGxvb2tpbmcgZm9yIGEKPiBwcm9w
ZXIgcHJvY2VzcyB0ZWFyIGRvd24uCgpDaGFuY2VzIGFyZSwgc29tZSBvZiB0aGUgaW50ZW5kZWQg
YXVkaWVuY2UgZG9uJ3Qga25vdyBob3cgdG8gZG8gdGhpcwphbmQgd2lsbCBlaXRoZXIgaGF2ZSB0
byBodW50IGRvd24gYSBsb3Qgb2YgZG9jdW1lbnRhdGlvbiBvciB3aWxsIGp1c3QKbm90IHRlc3Qg
aXQuICBCdXQgd2Ugd2FudCB0aGVtIHRvIHRlc3QgaXQsIHNvIGEgbGl0dGxlIHdvcmtlZCBzdGVw
LWJ5LXN0ZXAKZXhhbXBsZSB3b3VsZCBoZWxwIHRoaW5ncyBhbG9uZyBwbGVhc2UuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
