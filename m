From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/18] xen/arm64: Suspend to RAM support for
 Xen
Date: Mon, 12 Nov 2018 18:22:53 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811121819440.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMOLv-0003Yr-DL
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 02:22:55 +0000
In-Reply-To: <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIE1pcmVsYSwKPiAK
PiBUaGFuayB5b3UgZm9yIHBvc3RpbmcgdGhlIHNlcmllcy4gQ291bGQgeW91IHByb3ZpZGUgYSBi
cmFuY2ggd2l0aCB0aGUgcGF0Y2gKPiBhcHBsaWVkPwo+IAo+IE9uIDExLzEyLzE4IDExOjMwIEFN
LCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+ID4gCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gVGhlIHNlcmllcyBkb2VzIG5vdCBpbmNsdWRlOgo+ID4gYSkgVUFSVCBkcml2ZXItc3Bl
Y2lmaWMgc3VzcGVuZC9yZXN1bWUgdGhhdCBnZXRzIGNhbGxlZCB3aGVuIGNvbnNvbGUKPiA+IHN1
c3BlbmRzCj4gCj4gSSBmZWVsIGl0IHdpbGwgYmUgZGlmZmljdWx0IHRvIHRlc3QgdGhpcyBzZXJp
ZXMgd2l0aG91dCBVQVJUIGRyaXZlciBzdXBwb3J0Lgo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRv
IGludGVncmF0ZSB0aGVtIGluIHRoYXQgc2VyaWVzPwoKQWN0dWFsbHksIHlvdSBjYW4gdGVzdCB0
aGlzIHNlcmllcyBzaW1wbHkgdXNpbmcgdXBzdHJlYW0gTGludXggYW5kCnVwc3RyZWFtIFhlbiAr
IHRoaXMgc2VyaWVzLiBZb3UgY2FuIHVzZSBlY2hvIG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUgaW4K
ZG9tMCB0byBnbyBpbnRvIHN1c3BlbmQsIGFuZCBmb3IgZXhhbXBsZSBzZXR1cCBhbiBSVEMgd2Fr
ZXVwIGV2ZW50IHRvCndha2V1cCBhZnRlciBhIGNlcnRhaW4gYW1vdW50IG9mIHRpbWUuIEZvciBp
bnN0YW5jZSBlY2hvICszMCA+Ci9zeXMvY2xhc3MvcnRjL3J0YzAvd2FrZWFsYXJtLgoKRm9yIHRo
ZSBYaWxpbnggTVBTb0MsIExpbnV4IDQuMTkgd29ya3MgZmluZSB3aXRoIGRlZmNvbmZpZy4gTGlu
dXggNC4yMAooY3VycmVudCBtYXN0ZXIpIGdhaW5lZCBFRU1JIHN1cHBvcnQsIGJ1dCBJIHRlc3Rl
ZCBpdCBhbmQgaXQgc2VlbXMgdG8Kc3VzcGVuZCBzdWNjZXNzZnVsbHkgZXZlbiBpZiBYZW4gZG9l
c24ndCBrbm93IGhvdyB0byBoYW5kbGUgdGhlIEVFTUkKY2FsbHMgdGhhdCBMaW51eCBtYWtlcyB3
aGVuIHN1c3BlbmRpbmcuIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
