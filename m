From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 09:39:41 -0600
Message-ID: <5C9E3C3D0200007800222FB0@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9tbd-0003tU-9x
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:39:45 +0000
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
IG9yIGV2ZW4gc29ja2V0cy4KPiAKPiBBbGwgbG9naWNhbCBjcHVzICh0aHJlYWRzKSBvZiB0aGUg
Y29yZSBvciBzb2NrZXQgYXJlIGFsd2F5cyBzY2hlZHVsZWQKPiB0b2dldGhlci4gVGhpcyBtZWFu
cyB0aGF0IG9uIGEgY29yZSBhbHdheXMgdmNwdXMgb2YgdGhlIHNhbWUgZG9tYWluCj4gd2lsbCBi
ZSBhY3RpdmUsIGFuZCB0aG9zZSB2Y3B1cyB3aWxsIGFsd2F5cyBiZSBzY2hlZHVsZWQgYXQgdGhl
IHNhbWUKPiB0aW1lLgo+IAo+IFRoaXMgaXMgYWNoaWV2ZWQgYnkgc3dpdGNoaW5nIHRoZSBzY2hl
ZHVsZXIgdG8gbm8gbG9uZ2VyIHNlZSB2Y3B1cyBhcwo+IHRoZSBwcmltYXJ5IG9iamVjdCB0byBz
Y2hlZHVsZSwgYnV0ICJzY2hlZHVsZSBpdGVtcyIuIEVhY2ggc2NoZWR1bGUKPiBpdGVtIGNvbnNp
c3RzIG9mIGFzIG1hbnkgdmNwdXMgYXMgZWFjaCBjb3JlIGhhcyB0aHJlYWRzIG9uIHRoZSBjdXJy
ZW50Cj4gc3lzdGVtLiBUaGUgdmNwdS0+aXRlbSByZWxhdGlvbiBpcyBmaXhlZC4KCkhtbSwgSSBm
aW5kIHRoaXMgc3VycHJpc2luZzogQSB0eXBpY2FsIGd1ZXN0IHdvdWxkIGhhdmUgbW9yZSB2Q1BV
LXMKdGhhbiB0aGVyZSBhcmUgdGhyZWFkcyBwZXIgY29yZS4gU28gaWYgdHdvIG9mIHRoZW0gd2Fu
dCB0byBydW4sIGJ1dAplYWNoIGlzIGFzc29jaWF0ZWQgd2l0aCBhIGRpZmZlcmVudCBjb3JlLCB5
b3UnZCBuZWVkIHR3byBjb3JlcyBpbnN0ZWFkCm9mIG9uZSB0byBhY3R1YWxseSBmdWxmaWxsIHRo
ZSByZXF1ZXN0PyBJIGNvdWxkIHNlZSB0aGlzIG5lY2Vzc2FyaWx5IGJlaW5nCnRoZSBjYXNlIGlm
IHlvdSBhcnJhbmdlZCB2Q1BVLXMgaW50byB2aXJ0dWFsIHRocmVhZHMsIGNvcmVzLCBzb2NrZXRz
LAphbmQgbm9kZXMsIGJ1dCBhdCBsZWFzdCBmcm9tIHRoZSBwYXRjaCB0aXRsZXMgaXQgZG9lc24n
dCBsb29rIGFzIGlmIHlvdQpkaWQgaW4gdGhpcyBzZXJpZXMuIEFyZSB0aGVyZSBvdGhlciByZWFz
b25zIHRvIG1ha2UgdGhpcyBhIGZpeGVkCnJlbGF0aW9uc2hpcD8KCkFzIGEgbWlub3IgY29zbWV0
aWMgcmVxdWVzdCB2aXNpYmxlIGZyb20gdGhpcyBjb3ZlciBsZXR0ZXIgcmlnaHQgYXdheToKQ291
bGQgdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gcGxlYXNlIGJlY29tZSAic2NoZWQtZ3JhbnVsYXJp
dHk9IgpvciBldmVuICJzY2hlZC1ncmFuPSI/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
