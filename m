From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 10:51:02 +0100
Message-ID: <59c69d1a-f8ae-3cf8-3227-c89bdf116383@citrix.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <91a59884-bb7b-1042-4632-335a8c3480d2@citrix.com>
 <5B978BF202000078001E71A3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tpi7=lz=citrix.com=prvs=785918234=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fzfKN-0001LB-Oq
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:51:23 +0000
In-Reply-To: <5B978BF202000078001E71A3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAxMDozMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTEuMDku
MTggYXQgMTE6MjQsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwOS8x
MS8yMDE4IDA5OjUwIEFNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gSGVsbG8gSmFuLAo+Pj4K
Pj4+Cj4+PiBPbiAxMS4wOS4xOCAxMToyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gTkFLLCBm
b3IgdHdvIHJlYXNvbnM6IEknbSBub3Qgb2YgdGhlIG9waW5pb24gdGhhdCByZWFkaW5nIGEgMTUg
b3IgbW9yZQo+Pj4+IGRpZ2l0IGRlY2ltYWwgbnVtYmVyIHdpdGhvdXQgYW55IHNlcGFyYXRvcnMg
aXMgYW55IGVhc2llciB0aGFuIHRoZQo+Pj4+IGN1cnJlbnQgZm9ybWF0Lgo+Pj4gSXQncyBxdWl0
ZSBzdWJqZWN0aXZlLiBJTUhPIHRpbWVzdGFtcHMgbWVhc3VyZWQgaW4gbnMgZWFzaWVyIHRvCj4+
PiB1bmRlcnN0YW5kIGluIGRlY2ltYWxzIHJhdGhlciB0aGFuIGluIHNlcGFyYXRlZCAzMi1iaXQg
aGV4LWVzLiBObyBtYXR0ZXIKPj4+IGhvdyBtYW55IGRpZ2l0YWwgbnVtYmVyIHRoZXkgaGF2ZS4K
Pj4+IEV2ZW4gcG9zdCBwcm9jZXNzaW5nIG9mIHBlcmZjIG91dHB1dCBpcyBlYXNpZXIgaW4gY2Fz
ZSBvZiBkZWNpbWFsCj4+PiB0aW1lc3RhbXBzLiBZb3Ugc2hvdWxkIG5vdCBwYXJzZSBoZXhlcyBh
bmQgb2RkIHNlcGFyYXRvcnMgdG8gY2FsY3VsYXRlCj4+PiB0aGUgdGltZSBlbGFwc2VkIGJldHdl
ZW4gdHdvIHNhbXBsZXMuCj4+Cj4+IEkgYWdyZWUgd2l0aCB0aGlzLiAgUHJpbnRpbmcgaW4gaGV4
YWRlY2ltYWwgaXMgdXNlZnVsIGlmIHlvdSBuZWVkIHRvIHNlZQo+PiB0aGUgYml0d2lzZSBzdHJ1
Y3R1cmUgb2YgdGhlIGNvbnRlbnQ7IHRoYXQncyBvZiB6ZXJvIHVzZSB3aGVuIGl0IGNvbWVzCj4+
IHRvIHRpbWVzdGFtcHMuICBPbiB0aGUgY29udHJhcnksIHlvdSBhbG1vc3QgYWx3YXlzIHdhbnQg
dG8gYmUgYWJsZSB0byBkbwo+PiBhIHN1YnRyYWN0aW9uIGluIHlvdXIgaGVhZCBhbmQgZ2V0IGF0
IGxlYXN0IGFuIG9yZGVyLW9mLW1hZ25pdHVkZQo+PiBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHRp
bWVzLCBzb21ldGhpbmcgd2hpY2ggaXMgZmFyIHRvbyBkaWZmaWN1bHQgaW4gaGV4Lgo+IAo+IEkg
ZGlzYWdyZWUgLSBpdCdzIGEgbWF0dGVyIG9mIHdobyBsb29rcyBhdCB0aG9zZSBudW1iZXJzLiBQ
ZXJzb25hbGx5Cj4gSSdtIHF1aXRlIGZpbmUgZG9pbmcgb3JkZXItb2YtbWFnbml0dWRlIGhleCBt
YXRoLgoKU28gcXVpY2ssIGFib3V0IGhvdyBsb25nIGlzIDB4MTA6MDAwMDAwMDAgbnM/CgpNYXli
ZSB5b3Uga25vdyBob3cgbG9uZyB0aGF0IGlzLCBidXQgSSB3b3VsZCBwb3NpdCB0aGF0IGlmIHNv
LCB5b3UgYXJlCmFtb25nIGEgaGFuZGZ1bCBvZiBwZW9wbGUgd29ybGR3aWRlIHdobyBoYXZlIGhh
cHBlbmVkIHRvIHRyYWluIHlvdXJzZWxmCmluIHRoYXQga25vd2xlZGdlLiAgVGhlIG1pbGxpb25z
IG9mIFhlbiBkZXZlbG9wZXJzIGFuZCBzeXN0ZW0KYWRtaW5pc3RyYXRvcnMgd29ybGR3aWRlIHdo
byBkb24ndCBoYXZlIHRoYXQgc2Vuc2UsIGFuZCAobGlrZSBtZSkgaGF2ZQphYnNvbHV0ZWx5IG5v
IGludGVyZXN0IGluIGdhaW5pbmcgdGhhdCBrbm93bGVkZ2UuICBJIGhhdmUgbXVjaCBiZXR0ZXIK
dGhpbmdzIHRvIGRvIHdpdGggbXkgdGltZS4KCkNoYW5naW5nIGl0IHRvIHNlY29uZHMgKGkuZS4s
IHVzaW5nIHRoZSBkZWNpbWFsIHBvaW50IGFzIGEgInNlcGFyYXRvciIpCndvdWxkIG1ha2Ugc2Vu
c2UsIGFuZCBJJ2QgYmUgaW4gZmF2b3Igb2YgYSBwYXRjaCB3aGljaCBkaWQgc29tZXRoaW5nIHRv
CnRoYXQgZWZmZWN0LiAgQnV0IFBSSV9zdGltZSBpcyBzdGlsbCBhbiBpbXByb3ZlbWVudCAoZm9y
IHRoZSB2YXN0Cm1ham9yaXR5IG9mIG91ciB1c2VycyBhbmQgZGV2ZWxvcGVycyk7IHdlIHNob3Vs
ZG4ndCBsZXQgdGhlIGJlc3QgYmVjb21lCnRoZSBlbmVteSBvZiB0aGUgZ29vZC4KCiAtR2Vvcmdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
