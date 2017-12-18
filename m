From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Mon, 18 Dec 2017 00:36:18 -0700
Message-ID: <5A377E020200007800197FFA__25766.5220684887$1513582521$gmane$org@prv-mh.provo.novell.com>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-3-Govinda.Tatti@Oracle.COM>
 <5A2A6AB10200007800195D4F@prv-mh.provo.novell.com>
 <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wghk=do=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eQpyD-0007nd-P3
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 07:36:17 +0000
In-Reply-To: <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Govinda Tatti <Govinda.Tatti@Oracle.COM>
Cc: Juergen Gross <jgross@suse.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEyLjE3IGF0IDIwOjUyLCA8R292aW5kYS5UYXR0aUBPcmFjbGUuQ09NPiB3cm90
ZToKPj4+PiArc3RhdGljIGludCBwY2lzdHViX2RldmljZV9yZXNldChzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQo+Pj4+ICt7Cj4+Pj4gKwlzdHJ1Y3QgeGVuX3BjaWJrX2Rldl9kYXRhICpkZXZfZGF0YTsK
Pj4+PiArCWJvb2wgc2xvdCA9IGZhbHNlLCBidXMgPSBmYWxzZTsKPj4+PiArCXN0cnVjdCBwY2lz
dHViX2FyZ3MgYXJnID0ge307Cj4+Pj4gKwo+Pj4+ICsJaWYgKCFkZXYpCj4+Pj4gKwkJcmV0dXJu
IC1FSU5WQUw7Cj4+Pj4gKwo+Pj4+ICsJZGV2X2RiZygmZGV2LT5kZXYsICJbJXNdXG4iLCBfX2Z1
bmNfXyk7Cj4+Pj4gKwo+Pj4+ICsJLyogRmlyc3QgY2hlY2sgYW5kIHRyeSBGTFIgKi8KPj4+PiAr
CWlmIChwY2llX2hhc19mbHIoZGV2KSkgewo+Pj4+ICsJCWRldl9kYmcoJmRldi0+ZGV2LCAicmVz
ZXR0aW5nICVzIGRldmljZSB1c2luZyBGTFJcbiIsCj4+Pj4gKwkJCXBjaV9uYW1lKGRldikpOwo+
Pj4+ICsJCXBjaWVfZmxyKGRldik7Cj4+PiBUaGUgbGFjayBvZiBlcnJvciBjaGVjayBoZXJlIHB1
enpsZWQgbWUsIGJ1dCBJIHNlZSB0aGUgZnVuY3Rpb24KPj4+IGluZGVlZCByZXR1cm5zIHZvaWQg
cmlnaHQgbm93LiBJIHRoaW5rIHRoZSBwcmVyZXEgcGF0Y2ggc2hvdWxkCj4+PiBjaGFuZ2UgdGhp
cyBhbG9uZyB3aXRoIGV4cG9ydGluZyB0aGUgZnVuY3Rpb24gLSB5b3UgcmVhbGx5IGRvbid0Cj4+
PiB3YW50IHRoZSBkZXZpY2UgdG8gYmUgaGFuZGVkIHRvIGEgZ3Vlc3Qgd2hlbiB0aGUgRkxSIHRp
bWVkCj4+PiBvdXQuCj4+IFdlIHdpbGwgY2hhbmdlIHBjaWVfZmxyKCkgdG8gcmV0dXJuIGVycm9y
IGNvZGUuIEkgd2lsbCBtYWtlIHRoaXMgY2hhbmdlCj4+IGluIHRoZSBuZXh0IHZlcnNpb24gb2Yg
dGhpcyBwYXRjaC4KPiBJIGV4Y2hhbmdlZCBzb21lIGVtYWlscyB3aXRoIEJqb3JuL0NocmlzdG9w
aCBhbmQgaXQgbG9va3MgbGlrZSBDaHJpc3RvcGgKPiBhcyBzb21lIHBsYW50byByZXN0cnVjdHVy
ZSBwY2llIGZsciBzcGVjaWZpYyBmdW5jdGlvbnMgYnV0IEkgZG9uJ3Qga25vdwo+IHRoZSBleGFj
dCB0aW1lLWZyYW1lLiBGb3Igbm93LEkgYW0gcGxhbm5pbmcgdG8gdXNlIGV4aXN0aW5nIHBjaWVf
ZmxyKCkKPiBhZnRlciBjaGVja2luZyBGTFIgY2FwYWJpbGl0eS4gV2Ugd2lsbCBzd2l0Y2h0byBy
ZXZpc2VkIHBjaWVfZmxyKCkgb25jZQo+IGl0IGlzIGF2YWlsYWJsZS4KPiAKPiBJIGhvcGUgeW91
IGFyZSBmaW5lIHdpdGggdGhpcyBhcHByb2FjaC4gUGxlYXNlIGxldCBtZSBrbm93LiBUaGFua3Mu
CgpJJ3ZlIHNlZW4gdGhhdCBvdGhlciBkaXNjdXNzaW9uLiBJIGRvbid0IHRoaW5rIHRoZSBjaGFu
Z2UgaGVyZQpzaG91bGQgYmUgZG9uZSBwcmlvciB0byB0aGUgZXJyb3IgcmVwb3J0aW5nIGJlaW5n
IHB1dCBpbiBwbGFjZSwKZm9yIHNlY3VyaXR5IHJlYXNvbnMuIEJ1dCBpbiB0aGUgZW5kIGl0J2xs
IGJlIEtvbnJhZCBhcyB0aGUKbWFpbnRhaW5lciB0byBqdWRnZS4KCk9yIHdhaXQsIGxvb2tzIGxp
a2UgdGhlcmUncyBzb21lIGNvbmZ1c2lvbiBpbiAuL01BSU5UQUlORVJTOgpLb25yYWQgaXMgbGlz
dGVkIGFzIG1haW50YWluZXIgZm9yICJYRU4gUENJIFNVQlNZU1RFTSIsIGJ1dCB0aGUKbGlzdCBv
ZiBmaWxlcyBkb2Vzbid0IGluY2x1ZGUgcGNpYmFjay4gU28gaXQgd291bGQgaW5zdGVhZCBiZSBC
b3JpcwpvciBKw7xyZ2VuIHRvIGdpdmUgeW91IGEgZmluYWwgd29yZC4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
