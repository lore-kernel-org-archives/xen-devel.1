From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Mon, 01 Apr 2019 00:41:09 -0600
Message-ID: <5CA1B285020000780022361D@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAqdD-0000II-HJ
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 06:41:19 +0000
In-Reply-To: <20190329150934.17694-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDE2OjA4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBWaWEg
Ym9vdCBwYXJhbWV0ZXIgc2NoZWRfZ3JhbnVsYXJpdHk9Y29yZSAob3Igc2NoZWRfZ3JhbnVsYXJp
dHk9c29ja2V0KQo+IGl0IGlzIHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgc2NoZWR1bGluZyBncmFu
dWxhcml0eSBmcm9tIHRocmVhZCAodGhlCj4gZGVmYXVsdCkgdG8gZWl0aGVyIHdob2xlIGNvcmVz
IG9yIGV2ZW4gc29ja2V0cy4KCk9uZSBmdXJ0aGVyIGdlbmVyYWwgcXVlc3Rpb24gY2FtZSB0byBt
aW5kOiBIb3cgYWJvdXQgYWxzbyBoYXZpbmcKInNjaGVkLWdyYW51bGFyaXR5PXRocmVhZCIgKG9y
ICIuLi49bm9uZSIpIHRvIHJldGFpbiBjdXJyZW50CmJlaGF2aW9yLCBhdCBsZWFzdCB0byBoYXZl
IGFuIGVhc3kgd2F5IHRvIGNvbXBhcmUgZWZmZWN0cyBpZgp3YW50ZWQ/IEJ1dCBwZXJoYXBzIGFs
c28gdG8gYWxsb3cgdG8gZGVhbCB3aXRoIHBvdGVudGlhbCByZXNvdXJjZXMKd2FzdGluZyBjb25m
aWd1cmF0aW9ucyBsaWtlIGhhdmluZyBtb3N0bHkgVk1zIHdpdGggZS5nLiBhbiBvZGQKbnVtYmVy
IG9mIHZDUFUtcy4KClRoZSBvdGhlciBxdWVzdGlvbiBvZiBjb3Vyc2UgaXMgd2hldGhlciB0aGUg
dGVybXMgdGhyZWFkLCBjb3JlLAphbmQgc29ja2V0IGFyZSBnZW5lcmljIGVub3VnaCB0byBiZSB1
c2VkIGluIGFyY2hpdGVjdHVyZQppbmRlcGVuZGVudCBjb2RlLiBFdmVuIG9uIHg4NiBpdCBhbHJl
YWR5IGxlYXZlcyBvdXQgLyB1bmNsZWFyCndoZXJlIC8gaG93IGUuZy4gQU1EJ3MgY29tcHV0ZSB1
bml0cyB3b3VsZCBiZSBjbGFzc2lmaWVkLiBJCmRvbid0IGhhdmUgYW55IGdvb2Qgc3VnZ2VzdGlv
biBmb3IgYWJzdHJhY3Rpb24sIHNvIHBvc3NpYmx5CnRoZSB0ZXJtcyB1c2VkIG1heSB3YW50IHRv
IGJlY29tZSBhcmNoLXNwZWNpZmljLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
