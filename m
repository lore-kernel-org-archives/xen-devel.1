From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 4/6] xen/x86: use DEFINE_SYMBOL as
 required
Date: Wed, 27 Feb 2019 02:45:02 -0700
Message-ID: <5C765C1E020000780021A9A4@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-4-git-send-email-sstabellini@kernel.org>
 <23669.29654.253921.9395@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1902261121010.20689@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyvm1-00084j-Sv
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 09:45:09 +0000
In-Reply-To: <alpine.DEB.2.10.1902261121010.20689@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDIwOjIzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCAyNiBGZWIgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cml0ZXMgKCJbUEFUQ0ggdjEwIDQvNl0geGVuL3g4NjogdXNlIERFRklORV9TWU1C
T0wgYXMgcmVxdWlyZWQiKToKPj4gPiBVc2UgU1lNQk9MU19TVUJUUkFDVCBhbmQgU1lNQk9MU19D
T01QQVJFIGluIGNhc2VzIG9mIGNvbXBhcmlzb25zIGFuZAo+PiA+IHN1YnRyYWN0aW9ucyBvZjoK
Pj4gLi4uCj4+ID4gVXNlIGV4cGxpY2l0IGNhc3RzIHRvIHVpbnRwdHJfdCB3aGVuIGl0IGlzIG5v
dCBwb3NzaWJsZSB0byB1c2UgdGhlCj4+ID4gcHJvdmlkZWQgc3RhdGljIGlubGluZSBmdW5jdGlv
bnMuCj4+IAo+PiBXaHkgaXMgaXQgbm90IHBvc3NpYmxlID8gIFlvdSB3cml0ZToKPj4gCj4+ID4g
Ky8qCj4+ID4gKyAqIENhbm5vdCB1c2UgREVGSU5FX1NZTUJPTCBiZWNhdXNlIG9mIHRoZSB3YXkg
dGhleSBhcmUgcGFzc2VkIHRvCj4+ID4gKyAqIGFwcGx5X2FsdGVybmF0aXZlcy4KPj4gPiArICov
Cj4+ID4gIGV4dGVybiBzdHJ1Y3QgYWx0X2luc3RyIF9fYWx0X2luc3RydWN0aW9uc1tdLCBfX2Fs
dF9pbnN0cnVjdGlvbnNfZW5kW107Cj4+IAo+PiBCdXQgSSBkb24ndCBrbm93IHdoeSB5b3UgY2Fu
J3QgcGFzcyBhIGBzdHJ1Y3QgYWJzdHJhY3RfYWx0X2luc3RyKicgdG8KPj4gYXBwbHlfYWx0ZXJu
YXRpdmVzLgo+PiAKPj4gSU1PIGl0IHNob3VsZCBiZSBzdHJpY3RseSBmb3JiaWRkZW4gdG8gZXZl
ciB3cml0ZSB0aGlzIGZvcm11bGF0aW9uLCBhcwo+PiB5b3UgaGF2ZSBhYm92ZS4gIFNlZSBteSBw
cm9wb3NlZCBydWxlIGNvbW1lbnQgZm9yIERFRklORV9TWU1CT0wuCj4+IAo+PiBFdmVuIGlmIHlv
dSBjYW4ndCB1c2UgdGhlIG1hY3JvcyBhdCBzb21lIHBhcnRpY3VsYXIgY2FsY3VsYXRpb24gc2l0
ZSwKPj4geW91IHNob3VsZCBzdGlsbCBlbnN1cmUgdGhhdCAuLi5fZW5kIGhhcyBhIGRpZmZlcmVu
dCB0eXBlLCB0byBtYWtlCj4+IHN1cmUgdGhhdCBubyB1bnNhZmUgdXNlcyBlc2NhcGUuCj4gCj4g
VW5mb3J0dW5hdGVseSBfX2FwcGx5X2FsdGVybmF0aXZlcyBpcyBjYWxsZWQgZnJvbQo+IF9fYXBw
bHlfYWx0ZXJuYXRpdmVzX211bHRpX3N0b3AsIHdoZXJlIGl0IHdvdWxkIGJlIGZpbmUgdG8gdXNl
IHN0cnVjdAo+IGFic3RyYWN0X2FsdF9pbnN0ciosIGFuZCBhbHNvIGZyb20gYXBwbHlfYWx0ZXJu
YXRpdmVzIHdoaWNoIGluIGEKPiB4ZW4vY29tbW9uIGludGVyZmFjZSBjYWxsZWQgZnJvbSB4ZW4v
Y29tbW9uL2xpdmVwYXRjaC5jIGFuZCBkb2Vzbid0IHdvcmsKPiB3aXRoIGxpbmtlciBzeW1ib2xz
IEFGQUlDVC4KCkFzIElhbiBzYXlzLCBpdCdzIG9ubHkgYSBtYXR0ZXIgb2YgY29ycmVjdGx5IGRl
ZmluaW5nIHRoZSB0eXBlIG9mICJlbmQiIGF0CnRoZSBjYWxsIHNpdGUuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
