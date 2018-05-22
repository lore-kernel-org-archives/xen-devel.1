From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Tue, 22 May 2018 05:44:38 -0600
Message-ID: <5B0402A602000078001C4A70@prv1-mh.provo.novell.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
 <5B03F63302000078001C4961@prv1-mh.provo.novell.com>
 <d32ad719-9b1d-55b7-cd8f-308806484e12@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL5id-0003eb-UF
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:44:43 +0000
In-Reply-To: <d32ad719-9b1d-55b7-cd8f-308806484e12@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDEzOjIxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwNS8yMi8yMDE4IDExOjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjEuMDUuMTggYXQgMTY6MTYsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4g
TW9zdCBzZXJ2ZXItY2xhc3MgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IEFDUEkgUzMgc3VzcGVu
ZDsKPj4gCj4+IElzIHRoYXQgcmVhbGx5IHRoZSBjYXNlPyBJIHRob3VnaCBTMyB3YXMgcHJldHR5
ICJub3JtYWwiIHRoZXNlIGRheXMuCj4+IAo+Pj4gYnV0IG1vc3QgYnVncyB3ZSdsbCBydW4gYWNy
b3NzIHdvbid0IG5lZWQgYWN0dWFsIFMzIHRvIHRyaWdnZXIuCj4+IAo+PiBOb3Qgc3VyZSBhYm91
dCB0aGlzIG9uZSBlaXRoZXI6IEluIHBhcnRpY3VsYXIgdGhlIG1pY3JvY29kZSBpc3N1ZQo+PiBh
ZGRyZXNzZWQgcmVjZW50bHkgZG9lcyByZXF1aXJlIGFjdHVhbCBTMyB0byBzdXJmYWNlLiBJJ20g
bm90Cj4+IG1lYW5pbmcgdG8gcHV0IHVuZGVyIHF1ZXN0aW9uIHRoZSB1c2VmdWxuZXNzIG9mIHRo
aXMgb3B0aW9uLAo+PiB0aG91Z2guIEknZCBqdXN0IGxpa2UgdGhlIGRlc2NyaXB0aW9uIHRvIG5v
dCBsZWFkIHRvIHBlb3BsZSBkcmF3aW5nCj4+IHdyb25nIGNvbmNsdXNpb25zLgo+IAo+IFJlIFMz
IHN1cHBvcnQsIEkgd2FzIGp1c3QgcmVwZWF0aW5nIHdoYXQgSSdkIGhlYXJkLiAgTXkganVkZ2Vt
ZW50IGlzCj4gc3RpbGwgdGhhdCAibW9zdCIgYnVncyB3ZSBlbmQgdXAgZW5jb3VudGVyaW5nIHdp
bGwgYmUgb24gdGhlIFhlbiBzaWRlOwo+IGJ1dCBJJ20gaGFwcHkgdG8gcmV3b3JkIGl0IHRvIHRh
a2Ugb3V0IC8gbW9kZXJhdGUgYm90aCBpbXBsaWNhdGlvbnMuCgpPaCwgc3VyZWx5IGlzc3VlcyBu
b3JtYWxseSBhcmUgb24gdGhlIFhlbiBzaWRlLiBJdCdzIGp1c3QgdGhhdCB0aGVyZSdzIGEKZmFp
ciByYW5nZSBvZiBpc3N1ZXMgd2hpY2ggc3RpbGwgcmVxdWlyZSBhY3R1YWxseSBnb2luZyB0aHJv
dWdoIFMzIHRvCnNob3cgdXAgLSB0aGUgdWNvZGUgaXNzdWVzIGFmdGVyIFhTQS0yNTQgYXJlIGEg
Z29vZCBleGFtcGxlIHRoZXJlb2YuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
