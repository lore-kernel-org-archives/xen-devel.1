From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: BUG: jumbo frames broken after commit xen-netfront:
 Fix race between device setup and open
Date: Thu, 21 Jun 2018 14:02:56 +0100
Message-ID: <62f5027c-d196-32a4-a3ae-89c2fd2d8d06__1631.76887804202$1529586115$gmane$org@citrix.com>
References: <CAK=Wzwcjz5JKzfrdGpWNXhb6ZmTrpbNjSJxiivZt3HF8cKYi3Q@mail.gmail.com>
 <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg@mail.gmail.com>
 <df12769e-429f-7afb-9cdd-20955f8d6549@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evb4=jh=citrix.com=prvs=70385fc13=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fVzF4-0005AS-T2
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:03:14 +0000
In-Reply-To: <df12769e-429f-7afb-9cdd-20955f8d6549@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Liam Shepherd <liam@dancer.es>, Andrew Jeddeloh <andrew.jeddeloh@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dustymabe@redhat.com, stable@vger.kernel.org, netdev <netdev@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Javier Martinez Canillas <javier@dowhile0.org>, Laura Abbott <labbott@redhat.com>, "David S. Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMjEvMjAxOCAxMDowNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNC8wNi8x
OCAxNzo0MywgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgo+PiBIaSBBbmRyZXcsCj4+
Cj4+IE9uIFdlZCwgSnVuIDYsIDIwMTggYXQgNjoyOSBQTSwgQW5kcmV3IEplZGRlbG9oCj4+IDxh
bmRyZXcuamVkZGVsb2hAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gVGhl
IHBhdGNoICJ4ZW4tbmV0ZnJvbnQ6IEZpeCByYWNlIGJldHdlZW4gZGV2aWNlIHNldHVwIGFuZCBv
cGVuIiBzZWVtcwo+Pj4gdG8gaGF2ZSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBwcmV2ZW50aW5n
IHNldHRpbmcgTVRVJ3MgbGFyZ2VyIHRoYW4KPj4+IDE1MDAuIFdlIGV4cGVyaWVuY2VkIHRoaXMg
ZG93bnN0cmVhbSB3aXRoIENvbnRhaW5lciBMaW51eCBhbmQKPj4+IGNvbmZpcm1lZCB3aXRoIEZl
ZG9yYSAyOCBhcyB3ZWxsLgo+Pj4KPj4+IEl0J3MgY29tbWl0IGY1OTljNjRmZGY3ZDljMTA4ZTg3
MTdmYjA0YmM0MWM2ODAxMjBkYTQgaW4gdGhlIGxpbnV4LXN0YWJsZSB0cmVlLgo+Pj4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0
YWJsZS5naXQvY29tbWl0Lz9pZD1mNTk5YzY0ZmRmN2Q5YzEwOGU4NzE3ZmIwNGJjNDFjNjgwMTIw
ZGE0Cj4+Pgo+Pj4gRG93bnN0cmVhbSBidWdzOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2NvcmVv
cy9idWdzL2lzc3Vlcy8yNDQzCj4+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19i
dWcuY2dpP2lkPTE1ODQyMTYKPj4+Cj4+PiBXZSd2ZSBjb25maXJtZWQgdGhhdCByZXZlcnRpbmcg
dGhhdCBjb21taXQgZml4ZXMgdGhlIGJ1Zy4gSXQgYmUKPj4+IHJlbGlhYmx5IGNhbiBiZSByZXBy
b2R1Y2VkIG9uIEFXUyB3aXRoIHQyLm1pY3JvIGluc3RhbmNlcyAoYW5kCj4+PiBwcmVzdW1hYmx5
IG90aGVyIHN5c3RlbXMgdXNpbmcgdGhlIHNhbWUgZHJpdmVyKS4gQm90aCB1c2luZwo+Pj4gc3lz
dGVtZC1uZXR3b3JrZCB0byBzZXQgdGhlIG10dSBhbmQgbWFudWFsIGlwIGxpbmsgY29tbWFuZHMg
Y2F1c2UgdGhlCj4+PiBsaW5rIHRvIHJlcHNvbmQgd2l0aCAiSW52YWxpZCBhcmd1bWVudCIgd2hl
biB0cnlpbmcgdG8gc2V0IHRoZSBNVFUgPgo+Pj4gMTUwMC4KPj4+Cj4+PiBJJ20gbm90IHN1cmUg
d2h5IHRoYXQgY29tbWl0IGludHJvZHVjZWQgdGhlIHJlZ3Jlc3Npb24uCj4+Pgo+Pj4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55IG1vcmUgaW5mb3JtYXRpb24gdGhhdCB3b3VsZCBi
ZSBoZWxwZnVsLgo+Pj4KPj4+IC0gQW5kcmV3Cj4+Cj4+IEknbSBhZGRpbmcgc29tZSByZWxldmFu
dCBwZW9wbGUgdG8gdGhlIENDIGxpc3QgdG8gYnJpbmcgbW9yZSBhdHRlbnRpb24KPj4gb24gdGhp
cyByZWdyZXNzaW9uLgo+Pgo+PiBUaGUgZ2V0X21haW50YWluZXIucGwgc2NyaXB0IGlzIHZlcnkg
dXNlZnVsIHRvIGdldCBzb21lIGhpbnRzIG9uIHdobwo+PiBzaG91bGQgYmUgY29waWVkLCBpLmU6
Cj4+Cj4+ICQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC1mIGRyaXZlcnMvbmV0L3hlbi1u
ZXRmcm9udC5jCj4gCj4gUm9zcywgaGF2ZSB5b3UgbWFkZSBhbnkgcHJvZ3Jlc3MgaGVyZT8gSWYg
bm90IEknbSB0aGlua2luZyBvZiByZXZlcnRpbmcKPiB5b3VyIHBhdGNoIGFzIEkgdGhpbmsgdGhl
IGN1cnJlbnQgcHJvYmxlbSBpcyBtb3JlIHNldmVyZSB0aGFuIHRoZSBvbmUKPiB5b3VyIHBhdGNo
IGRpZCBhZGRyZXNzLgo+IAo+IAoKSSd2ZSBzZW50IGEgcGF0Y2ggdG9kYXkgd2hpY2ggSSBiZWxp
ZXZlIGZpeGVzIHRoZSBpc3N1ZS4gU29ycnkgZm9yIHRoZSAKc2xvdyByZXNwb25zZS4KClJlZ2Fy
ZHMsCi0tIApSb3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
