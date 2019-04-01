From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 01 Apr 2019 02:01:23 -0600
Message-ID: <5CA1C55302000078002236D8@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hArsn-0008Pz-4n
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:01:29 +0000
In-Reply-To: <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE5IGF0IDEwOjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
OS8wMy8yMDE5IDIyOjMzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBJZiBhdCBhbGwgcG9zc2li
bGUsIEknZCBwcmVmZXIgdG8gc2VlIGFib3V0IGRpc2VudGFuZ2xpbmcgdGhlIGJpdHMgd2hpY2gK
Pj4gYWN0dWFsbHkgbmVlZCBleHRlcm5hbCB1c2UsIGFuZCBwdXR0aW5nIHRoZW0gaW4gc2NoZWQu
aCwgYW5kIG1ha2luZwo+PiBzY2hlZC1pZi5oIHByb3Blcmx5IHByaXZhdGUgdG8gdGhlIHNjaGVk
dWxlcnMuICBJIGFjdHVhbGx5IGV2ZW4gc3RhcnRlZAo+PiBhIGNsZWFudXAgc2VyaWVzIHdoaWNo
IG1vdmVkIGFsbCBvZiB0aGUgc2NoZWR1bGVyIGluZnJhc3RydWN0dXJlIGludG8KPj4gY29tbW9u
L3NjaGVkLywgYnV0IGZvdW5kIGEgZGlzYXBwb2ludGluZyBxdWFudGl0eSBvZiBzY2hlZC1pZi5o
IGJlaW5nCj4+IHJlZmVyZW5jZWQgZXh0ZXJuYWxseS4KPiAKPiBJIGNhbiBhZGQgc29tZXRoaW5n
IGxpa2UgdGhhdCB0byBteSBzZXJpZXMgaWYgeW91IHdhbnQuIFNvOgo+IAo+IC0gbW92aW5nIHNj
aGVkdWxlLmMsIHNjaGVkXyouYyBhbmQgY3B1cG9vbC5jIHRvIGNvbW1vbi9zY2hlZC8KPiAtIG1v
dmUgc3R1ZmYgZnJvbSBzY2hlZC1pZi5oIHRvIHNjaGVkLmggaWYgbmVlZGVkIG91dHNpZGUgb2YK
PiAgIGNvbW1vbi9zY2hlZC8KPiAtIG1vdmUgc2NoZWQtaWYuaCB0byBjb21tb24vc2NoZWQvCgpC
ZWZvcmUgZnVydGhlciBnZW5lcmFsIGNvZGUgcmUtd29yayBnZXRzIGFkZGVkIHRvIHRoaXMgYWxy
ZWFkeQpsb25nIHNlcmllcywgbWF5IEkgYXNrIHdoYXQgdGhlIGJhY2twb3J0aW5nIGludGVudGlv
bnMgYXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
