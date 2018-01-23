From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 01:40:31 -0700
Message-ID: <5A67030F02000078001A164B@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@suse.com>
 <d4487ca6-ddaa-5053-1df7-37e6b2f6c5e2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edu8H-0004Z1-Au
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 08:40:41 +0000
In-Reply-To: <d4487ca6-ddaa-5053-1df7-37e6b2f6c5e2@suse.com>
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
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDA2OjUwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wMS8xOCAxNzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEJ1dCBpc24ndCB0aGF0IG1vZGVs
IGhhdmluZyB0aGUgc2FtZSBzeW5jaHJvbml6YXRpb24gaXNzdWVzIHVwb24KPj4gZ3Vlc3QgTDQg
dXBkYXRlcyB3aGljaCBBbmRyZXcgd2FzIGZpZ2h0aW5nIHdpdGg/Cj4gCj4gSSBkb24ndCB0aGlu
ayBzbywgYXMgdGhlIG51bWJlciBvZiBzaGFkb3dzIHdpbGwgYWx3YXlzIG9ubHkgYmUgbWF4LiAx
Cj4gd2l0aCBteSBhcHByb2FjaC4KCkhvdyBjYW4gSSBrbm93IHRoYXQ/IFRoZSBvdmVydmlldyBt
YWlsIGRvZXNuJ3QgdGFsayBhYm91dCB0aGUKaW50ZW5kZWQgc2hhZG93aW5nIGFsZ29yaXRobSBh
ZmFpY3MsIGFuZCBub25lIG9mIHRoZSBwYXRjaGVzCihqdWRnaW5nIGJ5IHRoZWlyIHRpdGxlcykg
aW1wbGVtZW50cyBhbnkgcGFydCB0aGVyZW9mLiBJbgpwYXJ0aWN1bGFyIEknZCBiZSBjdXJpb3Vz
IHRvIGtub3cgd2hldGhlciB3aGF0IHlvdSBzYXkgd2lsbApob2xkIGFsc28gZm9yIGd1ZXN0cyBu
b3QgbWFraW5nIHVzZSBvZiB0aGUgaW50ZW5kZWQgUFYgQUJJCmV4dGVuc2lvbi4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
