From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/3] xen: introduce
 parse_size_and_unit_or_int
Date: Thu, 06 Dec 2018 03:15:05 -0700
Message-ID: <5C08F6A9020000780020391E@prv1-mh.provo.novell.com>
References: <20181206080639.32603-1-jgross@suse.com>
 <20181206080639.32603-2-jgross@suse.com>
 <5C08F0CE0200007800203751@suse.com>
 <1da9c664-5933-d68b-12fa-839c4f392707@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fsyp=op=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUqgY-0000ZK-4V
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 10:15:10 +0000
In-Reply-To: <1da9c664-5933-d68b-12fa-839c4f392707@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjEyLjE4IGF0IDExOjAxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8xMi8yMDE4IDEwOjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMTIuMTggYXQg
MDk6MDYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQEAgLTQ3Nyw3ICs0NzgsOCBAQCB1
bnNpZ25lZCBsb25nIGxvbmcgcGFyc2Vfc2l6ZV9hbmRfdW5pdChjb25zdCBjaGFyICpzLCAKPiBj
b25zdCBjaGFyICoqcHMpCj4+PiAgICAgICAgICBzMSsrOwo+Pj4gICAgICAgICAgYnJlYWs7Cj4+
PiAgICAgIGRlZmF1bHQ6Cj4+PiAtICAgICAgICByZXQgPDw9IDEwOyAvKiBkZWZhdWx0IHRvIGtC
ICovCj4+PiArICAgICAgICBpZiAoICpzMSAmJiAqczEgIT0gbm9fc2l6ZSApCj4+PiArICAgICAg
ICAgICAgcmV0IDw8PSAxMDsgLyogZGVmYXVsdCB0byBrQiAqLwo+Pj4gICAgICAgICAgYnJlYWs7
Cj4+IAo+PiBTbyBkaWQgeW91IGZpZ3VyZSBhbnl0aGluZyB3cm9uZyB3aXRoIHNpbXBseSBzcGVj
aWFsIGNhc2luZyAnJScKPj4gaGVyZT8gJyUnIGlzIGEgZm9ybSBvZiAidW5pdCIsIGFmdGVyIGFs
bC4gUGVyaGFwcyBkZW1hbmRpbmcgInBzIgo+PiB0byBiZSBub24tTlVMTCAodG8gaGF2ZSBzb21l
IGZvcm0gb2YgaW5kaWNhdGlvbiB0aGUgY2FsbGVyIHdpbGwKPj4gY2hlY2sgdGhlIHN1ZmZpeCBj
aGFyKSBtaWdodCBiZSByZWFzb25hYmxlLgo+IAo+IEkgdGhvdWdodCBhIG1vcmUgZ2VuZXJhbCBh
cHByb2FjaCB3b3VsZCBiZSBiZXR0ZXIuIEkgY2FuIHVzZSB0aGUgc2ltcGxlCj4gJyUnIHNwZWNp
YWwgY2FzZSB3aXRoIHRoZSBwcyBjaGVjayBpbiBjYXNlIHlvdSBwcmVmZXIgdGhhdC4KCkknZCBp
bmRlZWQgcHJlZmVyIHRoYXQsIGZpcnN0IGFuZCBmb3JlbW9zdCBiZWNhdXNlIHRoYXQgb3RoZXIK
ZnVuY3Rpb24ncyBuYW1lIGJlY29tZXMgdG9vIGxvbmcgZm9yIG15IHRhc3RlLCBidXQgZ2l2ZSBv
dGhlcnMKYSBjaGFuY2UgdG8gdm9pY2UgZGlmZmVyaW5nIG9waW5pb25zLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
