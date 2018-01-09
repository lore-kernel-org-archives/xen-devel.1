From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 14:16:54 +0000
Message-ID: <20180109141654.m6ezmhvu2ze43hbw@MacBook-Pro-de-Roger.local>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <08bdc18d-7d05-9e56-5a7a-513603698576@citrix.com>
 <23124.40763.849975.202465@mariner.uk.xensource.com>
 <154f92d0-13c6-0fb4-f48d-93e9e83aaa4f@citrix.com>
 <23124.41063.724419.527371@mariner.uk.xensource.com>
 <CA+aC4kuKa_iuknh6K4DULQwFZwktDXV8=r+tJn_wphn8h_PKJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yc+y=ee=citrix.com=prvs=540dc162b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYuic-0007gM-CD
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 14:17:34 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4kuKa_iuknh6K4DULQwFZwktDXV8=r+tJn_wphn8h_PKJQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>, +@MacBook-Pro-de-Roger.local
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDY6MDg6NTNBTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIEphbiA5LCAyMDE4IDI6NTkgQU0sICJJYW4gSmFja3NvbiIgPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IEdlb3JnZSBEdW5sYXAgd3JpdGVzICgiUmU6
IFJhZGljYWwgcHJvcG9zYWw6IHNoaXAgbm90LWZ1bGx5LXRpZGllZCBzaGltIGFzCj4gNC4xMC4x
Iik6Cj4gPiBPbiAwMS8wOS8yMDE4IDEwOjUzIEFNLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ID4g
QW5kIGFzIG15IG90aGVyIG1haWwgc3VnZ2VzdHMsIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFs
bG93IHRoaXMgd29yawo+ID4gPiB0byBiZSBibG9ja2VkIGJ5IG91dHN0YW5kaW5nIHJldmlld2Vk
LiAgSU1PIHdlIHNob3VsZCBzaGlwIHdoYXQgd2UKPiA+ID4gaGF2ZSBBU0FQLgo+ID4KPiA+IFdl
bGwgIndoYXQgd2UgaGF2ZSIgYm9vdCB1bmRlciBIVk0/Cj4gCj4gTm8sIHNvIHRoYXQgZG9lcyBu
ZWVkIHRvIGJlIGZpeGVkLiAgV2UgY291bGQgc2hpcCBBbWF6b24ncyBzZXJpZXMgYnV0Cj4gdGhh
dCBoYXMgbm8gbWlncmF0aW9uIGFuZCBubyBiYWxsb29uaW5nLgo+IAo+IAo+IFdoeSBkbyB3ZSB0
aGluayBtaWdyYXRpb24gZG9lc24ndCB3b3JrPyAgSSBoYXZlbid0IHRlc3RlZCBidXQgSSBjYW5u
b3QKPiBpbWFnaW5lIHdoeSBpdCB3b3VsZG4ndC4KCllvdSBuZWVkIHNvbWV0aGluZyBsaWtlIHRo
ZSBmb2xsb3dpbmcgY29tbWl0IHRvIG1ha2UgbWlncmF0aW9uIHdvcms6CgpodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvbGl1dy94ZW4uZ2l0O2E9Y29tbWl0O2g9ZGVkMzc1
Yzc0YjQzNWU2ZjAzZDZkYmNhYTExMjU3YTI1NjhlNzc0MAoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
