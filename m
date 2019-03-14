From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 01:52:54 -0600
Message-ID: <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4LAf-0005pR-7j
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 07:52:57 +0000
In-Reply-To: <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE4OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzAzLzIwMTkgMTU6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wMi4x
OSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4g
QEAgLTIxMjEsOSArMjEyMSw5IEBAIHZvaWQgaW5pdF94ZW5oZWFwX3BhZ2VzKHBhZGRyX3QgcHMs
IHBhZGRyX3QgcGUpCj4+PiAgICAgICAgKiBZdWshIEVuc3VyZSB0aGVyZSBpcyBhIG9uZS1wYWdl
IGJ1ZmZlciBiZXR3ZWVuIFhlbiBhbmQgRG9tIHpvbmVzLCB0bwo+Pj4gICAgICAgICogcHJldmVu
dCBtZXJnaW5nIG9mIHBvd2VyLW9mLXR3byBibG9ja3MgYWNyb3NzIHRoZSB6b25lIGJvdW5kYXJ5
Lgo+Pj4gICAgICAgICovCj4+PiAtICAgIGlmICggcHMgJiYgIWlzX3hlbl9oZWFwX21mbihwYWRk
cl90b19wZm4ocHMpLTEpICkKPj4+ICsgICAgaWYgKCBwcyAmJiAhaXNfeGVuX2hlYXBfbWZuKF9t
Zm4ocGFkZHJfdG9fcGZuKHBzKS0xKSkgKQo+Pj4gICAgICAgICAgIHBzICs9IFBBR0VfU0laRTsK
Pj4+IC0gICAgaWYgKCAhaXNfeGVuX2hlYXBfbWZuKHBhZGRyX3RvX3BmbihwZSkpICkKPj4+ICsg
ICAgaWYgKCAhaXNfeGVuX2hlYXBfbWZuKG1hZGRyX3RvX21mbihwZSkpICkKPj4gCj4+IFdoeSBt
YWRkcl90b19tZm4oKSBoZXJlIGJ1dCBzdGlsbCBwYWRkcl90b19wZm4oKSBhYm92ZT8gT2gsCj4+
IHdlIGRvbid0IGhhdmUgYW55IG1mbl9zdWIoKSwgSSBzZWUuCj4gCj4gWWVzIHdlIGRvbid0IGhh
dmUgbWZuX3N1YigpIChvciBldmVuIGdmbl9zdWIoKSkuIEkgb25seSBmb3VuZCBhIGNvdXBsZSBv
ZiBwbGFjZXMgCj4gd2hlcmUgc3VjaCBoZWxwZXJzIG1pZ2h0IGJlIHVzZWZ1bC4gSSBjYW4gaW50
cm9kdWNlIHRoZSAyIGhlbHBlcnMgaWYgeW91IHRoaW5rIAo+IGl0IGlzIHdvcnRoIGl0LgoKV2Vs
bCwgSSBndWVzcyBpbiB0aGUgZW5kIEknbSBmaW5lIGVpdGhlciB3YXkuIEl0IHNpbXBseSBzdHJ1
Y2sgbWUKYXMgb2RkIGF0IHRoZSBmaXJzdCBnbGFuY2UgdGhhdCB5b3UgdXNlIG1hZGRyX3RvX21m
bigpIGluIG9uZQpjYXNlIGJ1dCBub3QgdGhlIG90aGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
