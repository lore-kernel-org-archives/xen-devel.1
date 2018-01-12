From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Meltdown band-aid against malicious
 64-bit PV guests
Date: Fri, 12 Jan 2018 17:39:23 +0000
Message-ID: <e5482745-6c1e-05a0-6794-93dcdf36bdfd@citrix.com>
References: <5A5899CA020000780019E014@prv-mh.provo.novell.com>
 <20180112170205.5tlaiczuhni63kuw@MacBook-Pro-de-Roger.local>
 <5A58FA9B020000780019E4EA@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801120932540.15566@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4shw=eh=citrix.com=prvs=543be20d3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ea3Ih-0000iL-Jj
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 17:39:31 +0000
In-Reply-To: <alpine.DEB.2.10.1801120932540.15566@sstabellini-ThinkPad-X260>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, security@xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDEvMTggMTc6MzQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBGcmksIDEy
IEphbiAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTIuMDEuMTggYXQgMTg6MDIs
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiBGcmksIEphbiAxMiwgMjAxOCBh
dCAwMzoxOTozOEFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBAQCAtNzk5LDYgKzk4
MiwxMCBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9jcHVzKHVuc2lnbmVkIGluCj4+Pj4gIAo+
Pj4+ICAgICAgc3RhY2tfYmFzZVswXSA9IHN0YWNrX3N0YXJ0Owo+Pj4+ICAKPj4+PiArICAgIGlm
ICggIXNldHVwX2NwdV9yb290X3BndCgwKSApCj4+Pj4gKyAgICAgICAgcGFuaWMoIk5vIG1lbW9y
eSBmb3Igcm9vdCBwYWdlIHRhYmxlXG4iKTsKPj4+PiArICAgIGdldF9jcHVfaW5mbygpLT5wdl9j
cjMgPSBfX3BhKHBlcl9jcHUocm9vdF9wZ3QsIDApKTsKPj4+IFdvdWxkbid0IGl0IGJlIGhlbHBm
dWwgdG8gaGF2ZSBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gZGVjaWRlIHdoZXRoZXIKPj4+IHRv
IGVuYWJsZSB0aGlzIGZlYXR1cmUgb3Igbm90Pwo+PiBXZWxsLCB0aGF0IHdvdWxkIGJlIGFuIG9w
dGlvbiwgYnV0IGZhbGxpbmcgaW50byB0aGUgb3B0aW1pemF0aW9uCj4+IGNhdGVnb3J5LiBPbmNl
IHRoZSBiYXNpYyBjb25jZXB0IGhhcyBiZWVuIHByb3ZlbiBieSBhIDJuZAo+PiBwYXJ0eSB0byBo
YXZlIG5vIG9idmlvdXMgZmxhd3MsIGFsb25nIHdpdGggYmFja3BvcnRpbmcgc29tZQo+PiBvZiB0
aGUgaW1wcm92ZW1lbnRzIHdvdWxkIGJlIG15IGdvYWwgdG8gd29yayBvbiwgYnV0IHRoZQo+PiBs
YXR0ZXIgYmVoaW5kIGxvb2tpbmcgYXQgdGhlIFNwZWN0cmUgcGF0Y2hlcyAoaS5lLiBJIGZpcnN0
IHdhbnQKPj4gdG8gZ2V0IGFsbCBmaXhlcyBzb3J0ZWQsIGFuZCB0aGVuIGRlYWwgd2l0aCBpbXBy
b3ZlbWVudHMpLgo+IFRoYXQncyBhbiBhbWF6aW5nIHdvcmssIEphbi4gVGhhbmsgeW91ISBGaW5h
bGx5LCBhIGZpeCBJIGNhbiBkZXBsb3kuIEFzCj4gc29vbiBhcyB0aGlzIHBhdGNoIGlzIHByb3Bl
cmx5IHZlcmlmaWVkLCBJIHRoaW5rIHdlIHNob3VsZCB1cGRhdGUgYWxsCj4gcmVmZXJlbmNlcyB0
byBNZWx0ZG93biBpbiBvdXIgZG9jcyBhbmQgYWR2aXNvcmllcyB0byBwb2ludCB0byB0aGlzIGZp
eC4KClRoaXMgaXMgZmFyIGZyb20gYSBjb21wbGV0ZSBmaXgsIGJ1dCBpZiBpdCB3b3JrcywgaXQg
aXMgYSBnb29kIHN0YXJ0LgoKSSdtIGN1cnJlbnRseSByZXZpZXdpbmcvaW52ZXN0aWdhdGluZyBh
bmQgc2VlaW5nIGhvdyBlYXN5IGl0IG1pZ2h0IGJlIHRvCm1lcmdlIHdpdGggbXkgS0FJU0VSIHNl
cmllcyAod2hpY2ggaXMgc2V2ZXJhbCBtb250aHMgY2xvc2VyIHRvd2FyZHMgYQpjb21wbGV0ZSBm
aXgpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
