From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 03:33:38 -0600
Message-ID: <5B978BF202000078001E71A3@prv1-mh.provo.novell.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <91a59884-bb7b-1042-4632-335a8c3480d2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzf3H-0007MQ-AK
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:33:43 +0000
In-Reply-To: <91a59884-bb7b-1042-4632-335a8c3480d2@citrix.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDExOjI0LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwOS8xMS8yMDE4IDA5OjUwIEFNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBIZWxs
byBKYW4sCj4+IAo+PiAKPj4gT24gMTEuMDkuMTggMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4gTkFLLCBmb3IgdHdvIHJlYXNvbnM6IEknbSBub3Qgb2YgdGhlIG9waW5pb24gdGhhdCByZWFk
aW5nIGEgMTUgb3IgbW9yZQo+Pj4gZGlnaXQgZGVjaW1hbCBudW1iZXIgd2l0aG91dCBhbnkgc2Vw
YXJhdG9ycyBpcyBhbnkgZWFzaWVyIHRoYW4gdGhlCj4+PiBjdXJyZW50IGZvcm1hdC4KPj4gSXQn
cyBxdWl0ZSBzdWJqZWN0aXZlLiBJTUhPIHRpbWVzdGFtcHMgbWVhc3VyZWQgaW4gbnMgZWFzaWVy
IHRvCj4+IHVuZGVyc3RhbmQgaW4gZGVjaW1hbHMgcmF0aGVyIHRoYW4gaW4gc2VwYXJhdGVkIDMy
LWJpdCBoZXgtZXMuIE5vIG1hdHRlcgo+PiBob3cgbWFueSBkaWdpdGFsIG51bWJlciB0aGV5IGhh
dmUuCj4+IEV2ZW4gcG9zdCBwcm9jZXNzaW5nIG9mIHBlcmZjIG91dHB1dCBpcyBlYXNpZXIgaW4g
Y2FzZSBvZiBkZWNpbWFsCj4+IHRpbWVzdGFtcHMuIFlvdSBzaG91bGQgbm90IHBhcnNlIGhleGVz
IGFuZCBvZGQgc2VwYXJhdG9ycyB0byBjYWxjdWxhdGUKPj4gdGhlIHRpbWUgZWxhcHNlZCBiZXR3
ZWVuIHR3byBzYW1wbGVzLgo+IAo+IEkgYWdyZWUgd2l0aCB0aGlzLiAgUHJpbnRpbmcgaW4gaGV4
YWRlY2ltYWwgaXMgdXNlZnVsIGlmIHlvdSBuZWVkIHRvIHNlZQo+IHRoZSBiaXR3aXNlIHN0cnVj
dHVyZSBvZiB0aGUgY29udGVudDsgdGhhdCdzIG9mIHplcm8gdXNlIHdoZW4gaXQgY29tZXMKPiB0
byB0aW1lc3RhbXBzLiAgT24gdGhlIGNvbnRyYXJ5LCB5b3UgYWxtb3N0IGFsd2F5cyB3YW50IHRv
IGJlIGFibGUgdG8gZG8KPiBhIHN1YnRyYWN0aW9uIGluIHlvdXIgaGVhZCBhbmQgZ2V0IGF0IGxl
YXN0IGFuIG9yZGVyLW9mLW1hZ25pdHVkZQo+IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdGltZXMs
IHNvbWV0aGluZyB3aGljaCBpcyBmYXIgdG9vIGRpZmZpY3VsdCBpbiBoZXguCgpJIGRpc2FncmVl
IC0gaXQncyBhIG1hdHRlciBvZiB3aG8gbG9va3MgYXQgdGhvc2UgbnVtYmVycy4gUGVyc29uYWxs
eQpJJ20gcXVpdGUgZmluZSBkb2luZyBvcmRlci1vZi1tYWduaXR1ZGUgaGV4IG1hdGguCgo+IFRo
ZSBmYWN0IHRoYXQgd2UgZXZlbiBoYXZlIFBSSV9zdGltZSBpcyBldmlkZW5jZSB0aGF0IHRoZSBk
ZXZlbG9wZXIKPiBjb21tdW5pdHkgYXMgYSB3aG9sZSBhZ3JlZXMuCj4gCj4+PiAgIEFuZCB0aGVu
IGlmIHlvdS93ZSB3ZXJlIHRvIGNoYW5nZSB0aGlzLCB0aGVuIHBsZWFzZQo+Pj4gdW5pZm9ybWx5
IGV2ZXJ5d2hlcmUgLSB0aGVyZSdzIGV2ZW4gYSBzZWNvbmQgaW5zdGFuY2UgcmlnaHQgaW4gdGhp
cwo+Pj4gc2FtZSBmaWxlIHlvdSBjaGFuZ2UsIG5vdCB0byBzcGVhayBvZiBzaW1pbGFyIG9uZXMg
ZWxzZXdoZXJlCj4gCj4gUHJlc3VtYWJseSB0aGUgZmFjdCB0aGF0IHdlIGhhdmUgUFJJX3N0aW1l
IGRlZmluZWQgbWVhbnMgdGhhdCAqbW9zdCoKPiBwbGFjZXMgYWxyZWFkeSB1c2UgdGhpcyBmb3Jt
YXQsIGFuZCB0aGUgcGxhY2VzIHdpdGggYDpgIGluIHRoZSBtaWRkbGUKPiBhcmUgb3V0bGllcnMu
ICBJdCdzIHBlcmZlY3RseSBhY2NlcHRhYmxlIHRvIGNoYW5nZSB0aGVtIG9uZSBieSBvbmU7Cj4g
Y2hhbmdpbmcgdGhlbSBhbGwgc2hvdWxkIG9ubHkgYmUgYSBzdWdnZXN0aW9uLgoKV2VsbCwgd2hh
dCBzaG91bGQgSSBzYXkgLSBJIGRpc2FncmVlLiBJIHdvdWxkIGFncmVlIGlmIGl0IHdvdWxkIGJl
IGEKd2hvbGUgbG90IG9mIHdvcmssIGJ1dCB0aGVyZSdzIG5vdCB0aGF0IG1hbnkga2V5IGhhbmRs
ZXJzIHRvIGJlZ2luCndpdGgsIGFuZCBmYXIgbm90IGFsbCBvZiB0aGVtIHByaW50IGEgdGltZSBz
dGFtcCBpbiB0aGVpciBoZWFkbGluZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
