From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v9 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Thu, 15 Mar 2018 10:21:43 -0500
Message-ID: <dde0f18a-2ad6-5ed3-2aaa-e36f148f2a07@cardoe.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-2-roger.pau@citrix.com>
 <5AA9403702000078001B1994@prv-mh.provo.novell.com>
 <20180315095004.oy3ylmba7rotutea@MacBook-Pro-de-Roger.local>
 <5AAA579602000078001B1FEC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=oyip=gf=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ewUhP-0002lf-0M
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 15:21:47 +0000
Received: by mail-yw0-x241.google.com with SMTP id w12so4835398ywa.8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 08:21:45 -0700 (PDT)
In-Reply-To: <5AAA579602000078001B1FEC@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xNS8xOCA1OjIzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wMy4xOCBh
dCAxMDo1MCwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gV2VkLCBNYXIgMTQs
IDIwMTggYXQgMDg6MzE6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAx
NC4wMy4xOCBhdCAxNTowMywgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4+PiAtLS0g
YS94ZW4vZHJpdmVycy9LY29uZmlnCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvS2NvbmZpZwo+Pj4+
IEBAIC0xMiw0ICsxMiw2IEBAIHNvdXJjZSAiZHJpdmVycy9wY2kvS2NvbmZpZyIKPj4+PiAgCj4+
Pj4gIHNvdXJjZSAiZHJpdmVycy92aWRlby9LY29uZmlnIgo+Pj4+ICAKPj4+PiArc291cmNlICJk
cml2ZXJzL3ZwY2kvS2NvbmZpZyIKPj4+Cj4+PiBBcmUgdGhlcmUgbW9yZSB0aGluZ3MgdG8gYXBw
ZWFyIGluIHRoYXQgbmV3IGZpbGU/IElmIG5vdCwgd2hhdCB0aGUKPj4+IHBvaW50IG9mIGludHJv
ZHVjaW5nIGl0Pwo+Pgo+PiBJJ3ZlIGFzc3VtZWQgdGhhdCB3YXMgdGhlIGNvcnJlY3QgaGllcmFy
Y2h5IHRvIHByZXZlbnQgcG9sbHV0aW5nCj4+IEtjb25maWcgZmlsZXMuIHBjaS8gYW5kIGNwdWZy
ZXEvIGFsc28gY29udGFpbiBhIEtjb25maWcgZmlsZSB3aXRoIGEKPj4gc2luZ2xlIG9wdGlvbi4K
Pj4KPj4gSSBjYW4gbW92ZSBpdCB0byBkcml2ZXJzL0tjb25maWcgaWYgeW91IHByZWZlci4KPiAK
PiBJIHdvdWxkIHByZWZlciB0aGF0LCB5ZXMgKGFuZCBJIHRoaW5rIGl0IHdhcyBhIG1pc3Rha2Ug
Zm9yIHRob3NlCj4gb3RoZXJzIHlvdSBtZW50aW9uKS4gWW91IG1heSB3YW50IHRvIGNvbmZpcm0g
dGhpcyB3aXRoIG90aGVycywKPiBpbiBwYXJ0aWN1bGFyIERvdWcgYXMgdGhlIGtjb25maWcgbWFp
bnRhaW5lciwgdGhvdWdoLgo+IAo+IEphbgo+IAoKV2VsbCBJIGJlbGlldmUgdGhleSB3ZXJlIHNl
cGFyYXRlZCBvdXQgdG8gcHJldmVudCBwb2xsdXRpb24gYXQgdGhlIHRvcApsZXZlbCBkcml2ZXJz
L0tjb25maWcgaW50ZW50aW9uYWxseSBhbmQgbm90IGJ5IG1pc3Rha2UuIEl0IGhhcyBiZWVuIHNv
bWUKdGltZSBzbyBJIGNhbm5vdCByZWNhbGwgaWYgSSBtYWRlIHRoYXQgZGVjaXNpb24gdW5pbGF0
ZXJhbGx5IGFuZCBubyBvbmUKY29tcGxhaW5lZCBvciBpZiBpdCB3YXMgYSByZXZpZXcgY29tbWVu
dCBvbiB0aGUgTUwuCgpJZiBKYW4gd291bGQgbGlrZSBpdCBpbiBkcml2ZXJzL0tjb25maWcgdGhl
biB0aGF0IHdvcmtzIGZvciBtZS4KCi0tIApEb3VnIEdvbGRzdGVpbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
