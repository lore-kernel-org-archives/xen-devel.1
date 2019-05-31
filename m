From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Fri, 31 May 2019 04:46:21 -0600
Message-ID: <5CF105FD0200007800233F31@prv1-mh.provo.novell.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
 <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
 <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWf3J-0002vm-Rv
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:46:25 +0000
In-Reply-To: <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA1LjE5IGF0IDEyOjM0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE5vIGl0IHdhcyBhIG1vcmUgZ2VuZXJpYyBzdGF0ZW1lbnQgb24gdGhlIHN0YW5jZSAiSXQgYWxy
ZWFkeSBleGlzdHMgaW4gCj4gWGVuIHNvIGl0IGlzIGZpbmUgdG8gc3ByZWFkIHRoZW0gYSBiaXQg
bW9yZSIuCgpPaCwgSSBzZWUuIE9mIGNvdXJzZSBJJ20gbWFraW5nIHJlbWFya3Mgd2hlbiB3aGF0
J3MgaW4gdGhlIHRyZWUgaXMKYmFkIChhcyBwZXIgZS5nLiBjb2Rpbmcgc3R5bGUsIG9yIGlmIG5v
dCBtZW50aW9uZWQgdGhlcmUgdGhhbiBpbiBteQpwZXJzb25hbCBvcGluaW9uKS4gQXMgYSByZXN1
bHQgSSB0YWtlIG5vdGUgb2YgeW91IHRoaW5raW5nIHRoaXMgYmVpbmcKYmFkIHByYWN0aWNlLCBh
bmQgdGhlIHR3byBvZiB1cyBkaXNhZ3JlZWluZy4gSSdtIGNlcnRhaW5seSB3aWxsaW5nIHRvCmFk
anVzdCBub24tb2J2aW91cyBjb2RlIHRvIGEgbW9yZSBvYnZpb3VzIHNoYXBlIGluIHZhcmlvdXMg
Y2FzZXMsCmJ1dCBJIHRoaW5rIHRoZXJlIG5lZWRzIHRvIGJlIGEgbGltaXQgYXMgdG8gd2hhdCBs
YW5ndWFnZSBmZWF0dXJlcwp3ZSBkZWNpZGUgc2hvdWxkIG5vdCBiZSB1c2VkIGluIHRoZSBjb2Rl
IGJhc2UuIE92ZXJyaWRpbmcKZGVjbGFyYXRpb25zIChhbmQgaW4gc29tZSBjYXNlcyBldmVuIGRl
ZmluaXRpb25zKSBieSBtYWNyb3MgaXMgYQp1c2VmdWwgdGhpbmcgZm9yIGdlbmVyYWwgcmVhZGFi
aWxpdHkgaW4gY2VydGFpbiBjYXNlcyBpbiBteSBvcGluaW9uLAphbmQgd2hpbGUgaXQncyBub3Qg
bWFraW5nIG11Y2ggb2YgZGlmZmVyZW5jZSBoZXJlIEknZCBzdGlsbCBwcmVmZXIgaWYKSSB3YXMg
YWxsb3dlZCB0byBnZXQgYXdheSB3aXRoIHRoaXMsIHVubGVzcyBhIG1ham9yaXR5IHN1cHBvcnRz
CnlvdXIgdmlldy4gSU9XIC0geW91ciBjaGFuZ2UgcmVxdWVzdCBpcywgYXMgcGVyIG15IG93bgpw
ZXJzcGVjdGl2ZSwgbWFraW5nIHRoZSBjb2RlIGxlc3MgZWFzeSB0byByZWFkLCBldmVuIGlmIG5v
dCBieQptdWNoLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
