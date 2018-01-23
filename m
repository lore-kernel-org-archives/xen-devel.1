From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 01:53:35 -0700
Message-ID: <5A67061F02000078001A1669@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <0f0af840-a808-a1b5-5397-490816cdce0f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eduKv-0005LA-CM
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 08:53:45 +0000
In-Reply-To: <0f0af840-a808-a1b5-5397-490816cdce0f@suse.com>
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
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDA3OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wMS8xOCAxOTozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT25lIG9mIG15IGNvbmNlcm5z
IGlzIHRoYXQgdGhpcyBwYXRjaCBzZXJpZXMgbW92ZXMgZnVydGhlciBhd2F5IGZyb20gdGhlCj4+
IHNlY29uZGFyeSBnb2FsIG9mIG15IEtBSVNFUiBzZXJpZXMsIHdoaWNoIHdhcyB0byBoYXZlIHRo
ZSBJRFQgYW5kIEdEVAo+PiBtYXBwZWQgYXQgdGhlIHNhbWUgbGluZWFyIGFkZHJlc3NlcyBvbiBl
dmVyeSBDUFUgc28gYSkgU0lEVC9TR0RUIGRvbid0Cj4+IGxlYWsgd2hpY2ggQ1BVIHlvdSdyZSBj
dXJyZW50bHkgc2NoZWR1bGVkIG9uIGludG8gUFYgZ3Vlc3RzIGFuZCBiKSB0aGUKPj4gY29udGV4
dCBzd2l0Y2ggY29kZSBjYW4gZHJvcCBhIGxvYWQgb2YgaXRzIHNsb3cgaW5zdHJ1Y3Rpb25zIGxp
a2UgTEdEVAo+PiBhbmQgdGhlIFZNV1JJVEVzIHRvIHVwZGF0ZSB0aGUgVk1DUy4KPiAKPiBUaGUg
R0RUIGFkZHJlc3Mgb2YgYSBQViB2Y3B1IGlzIGRlcGVuZGluZyBvbiB2Y3B1X2lkIG9ubHkuIEkg
ZG9uJ3QKPiBzZWUgd2h5IHRoZSBJRFQgY2FuJ3QgYmUgbWFwcGVkIHRvIHRoZSBzYW1lIGFkZHJl
c3Mgb24gZWFjaCBjcHUgd2l0aAo+IG15IGFwcHJvYWNoLgoKWW91J3JlIG5vdCBpbnRyb2R1Y2lu
ZyBhIHBlci1DUFUgcmFuZ2UgaW4gdGhlIHBhZ2UgdGFibGVzIGFmYWljcwooYWdhaW4gZnJvbSBv
dmVydmlldyBhbmQgdGl0bGVzIG9ubHkpLCB5ZXQgd2l0aCB0aGUgSURUIG5lZWRpbmcKdG8gYmUg
cGVyLUNQVSB5b3UnZCBhbHNvIG5lZWQgYSBwZXItQ1BVIHJhbmdlIHRvIG1hcCBpdCB0byBpZgp5
b3Ugd2FudCB0byBhdm9pZCB0aGUgTElEVCBhcyB3ZWxsIGFzIGV4cG9zaW5nIHdoYXQgQ1BVIHlv
dSdyZQpvbiAoc2FtZSBnb2VzIGZvciB0aGUgR0RUIGFuZCB0aGUgcmVzcGVjdGl2ZSBhdm9pZGFu
Y2Ugb2YgTEdEVAphZmFpY3QpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
