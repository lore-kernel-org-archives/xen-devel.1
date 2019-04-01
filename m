From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Mon, 01 Apr 2019 01:13:16 -0600
Message-ID: <5CA1BA0C0200007800223659@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5CA1B285020000780022361D@suse.com>
 <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAr8E-0003Rx-Pz
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 07:13:22 +0000
In-Reply-To: <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDA4OjQ5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
MS8wNC8yMDE5IDA4OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjkuMDMuMTkgYXQg
MTY6MDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gVmlhIGJvb3QgcGFyYW1ldGVyIHNj
aGVkX2dyYW51bGFyaXR5PWNvcmUgKG9yIHNjaGVkX2dyYW51bGFyaXR5PXNvY2tldCkKPj4+IGl0
IGlzIHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgc2NoZWR1bGluZyBncmFudWxhcml0eSBmcm9tIHRo
cmVhZCAodGhlCj4+PiBkZWZhdWx0KSB0byBlaXRoZXIgd2hvbGUgY29yZXMgb3IgZXZlbiBzb2Nr
ZXRzLgo+PiAKPj4gT25lIGZ1cnRoZXIgZ2VuZXJhbCBxdWVzdGlvbiBjYW1lIHRvIG1pbmQ6IEhv
dyBhYm91dCBhbHNvIGhhdmluZwo+PiAic2NoZWQtZ3JhbnVsYXJpdHk9dGhyZWFkIiAob3IgIi4u
Lj1ub25lIikgdG8gcmV0YWluIGN1cnJlbnQKPj4gYmVoYXZpb3IsIGF0IGxlYXN0IHRvIGhhdmUg
YW4gZWFzeSB3YXkgdG8gY29tcGFyZSBlZmZlY3RzIGlmCj4+IHdhbnRlZD8gQnV0IHBlcmhhcHMg
YWxzbyB0byBhbGxvdyB0byBkZWFsIHdpdGggcG90ZW50aWFsIHJlc291cmNlcwo+PiB3YXN0aW5n
IGNvbmZpZ3VyYXRpb25zIGxpa2UgaGF2aW5nIG1vc3RseSBWTXMgd2l0aCBlLmcuIGFuIG9kZAo+
PiBudW1iZXIgb2YgdkNQVS1zLgo+IAo+IEZpbmUgd2l0aCBtZS4KPiAKPj4gVGhlIG90aGVyIHF1
ZXN0aW9uIG9mIGNvdXJzZSBpcyB3aGV0aGVyIHRoZSB0ZXJtcyB0aHJlYWQsIGNvcmUsCj4+IGFu
ZCBzb2NrZXQgYXJlIGdlbmVyaWMgZW5vdWdoIHRvIGJlIHVzZWQgaW4gYXJjaGl0ZWN0dXJlCj4+
IGluZGVwZW5kZW50IGNvZGUuIEV2ZW4gb24geDg2IGl0IGFscmVhZHkgbGVhdmVzIG91dCAvIHVu
Y2xlYXIKPj4gd2hlcmUgLyBob3cgZS5nLiBBTUQncyBjb21wdXRlIHVuaXRzIHdvdWxkIGJlIGNs
YXNzaWZpZWQuIEkKPj4gZG9uJ3QgaGF2ZSBhbnkgZ29vZCBzdWdnZXN0aW9uIGZvciBhYnN0cmFj
dGlvbiwgc28gcG9zc2libHkKPj4gdGhlIHRlcm1zIHVzZWQgbWF5IHdhbnQgdG8gYmVjb21lIGFy
Y2gtc3BlY2lmaWMuCj4gCj4gSSBmb2xsb3dlZCB0aGUgYWxyZWFkeSBrbm93biB0ZXJtcyBmcm9t
IHRoZSBjcmVkaXQyX3J1bnF1ZXVlCj4gcGFyYW1ldGVyLiBJIHRoaW5rIHRoZXkgc2hvdWxkIG1h
dGNoLiBXaGljaCB3b3VsZCBjYWxsIGZvcgo+ICJzY2hlZC1ncmFudWxhcml0eT1jcHUiIGluc3Rl
YWQgb2YgInRocmVhZCIuCgoiY3B1IiBpcyBmaW5lIG9mIGNvdXJzZS4gSSB3b25kZXIgdGhvdWdo
IHdoZXRoZXIgdGhlIG90aGVyIHR3bwp3ZXJlIGEgZ29vZCBjaG9pY2UgZm9yICJjcmVkaXQyX3J1
bnF1ZXVlIi4gU3RlZmFubywgSnVsaWVuIC0KaXMgdGhpcyB0ZXJtaW5vbG9neSBhdCBsZWFzdCBo
YWxmIHdheSBzdWl0YWJsZSBmb3IgQXJtPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
