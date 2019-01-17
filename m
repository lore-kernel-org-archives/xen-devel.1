From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 17 Jan 2019 05:20:18 -0700
Message-ID: <5C407302020000780020EA9C@prv1-mh.provo.novell.com>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac> <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac> <20190116134914.GN1205@mail-itl>
 <20190117085746.rg2vbyh3ga4aru6f@mac>
 <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
 <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
 <20190117115637.mywzhrlprop6l4cq@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk6gd-0004fL-2p
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 12:22:19 +0000
In-Reply-To: <20190117115637.mywzhrlprop6l4cq@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDEyOjU2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSmFuIDE3LCAyMDE5IGF0IDA0OjUyOjQyQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTcuMDEuMTkgYXQgMDk6NTcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gV2hpbGUgbm90IGFnYWluc3QgdXNpbmcgcGh5c2Rldm9wIGlmIHdlIGFncmVl
IHRoYXQgYSBuZXcgaHlwZXJjYWxsIGlzCj4+ID4gdGhlIHdheSB0byBnbywgSSB3b3VsZCBwcmVm
ZXIgYSBkb21jdGwgYmVjYXVzZSB0aGlzIGh5cGVyY2FsbCB3b3VsZAo+PiA+IG9ubHkgYmUgdXNl
ZCBieSB0b29sc3RhY2sgY29tcG9uZW50cywgYW5kIHRodXMgZG9lc24ndCBuZWVkIHRvIGJlCj4+
ID4gYWRkZWQgdG8gdGhlIHB1YmxpYyBzdGFibGUgQUJJIGF2YWlsYWJsZSB0byBhbGwgZ3Vlc3Rz
LCBldmVuIGlmIHRoZQo+PiA+IGZ1bmN0aW9uYWxpdHkgaXMgYWN0dWFsbHkgbGltaXRlZCB0byBz
dHViZG9tYWlucy4KPj4gCj4+IEJ1dCBhIG5ldyBzdWItb3AgZG9lc24ndCBuZWVkIHRvIGJlIHBh
cnQgb2YgdGhlIHN0YWJsZSBBQkkuCj4+IFNlZSBob3cgZS5nLiB2YXJpb3VzIG9mIHRoZSBtZW1v
cnkgc3ViLW9wcyBhcmUgcmVzdHJpY3RlZCB0bwo+PiBiZSB1c2VkIGJ5IHRoZSB0b29sIHN0YWNr
LCBhbmQgaGVuY2Ugbm90IHJlcXVpcmVkIHRvIHJlbWFpbgo+PiB1bmNoYW5nZWQuCj4gCj4gT2gs
IHRoZW4gSSdtIGFsbCBpbiBmb3IgYSBwaHlzZGV2b3AgbGltaXRlZCB0byBzdHViZG9tYWluIG9u
bHkgdXNhZ2UuCgpIbW0sIHN0dWJkb21haW4gaXMgZGlmZmVyZW50OiBIb3cgd291bGQgeW91IGxp
bWl0IHRoaXMgaW4gdGhlCmhlYWRlcj8gQWxzbyBzdHViIGRvbWFpbnMgYXJlIGFsbG93ZWQgdG8g
cmVseSBvbiBhIHN0YWJsZQppbnRlcmZhY2UsIHNvIEknbSBhZnJhaWQgYSBkb21jdGwgaXMgb3V0
IG9mIHNjb3BlIGhlcmUgYW55d2F5LgpJdCBpcyBiYWQgZW5vdWdoIHRoYXQgdGhlcmUgYXJlIGZv
dXIgZG9tY3RsLXMgdmlvbGF0aW5nIHRoaXMKcnVsZSAoc2VlIHhzbS9kdW1teS5oOnhzbV9kb21j
dGwoKSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
