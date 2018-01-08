From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Mon, 8 Jan 2018 16:39:05 +0000
Message-ID: <23123.40617.499020.136246@mariner.uk.xensource.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <20180108115457.u4rspcpesep4we46@citrix.com>
 <20180108121155.vswrajzxi6wri3gd@MacBook-Pro-de-Roger.local>
 <CA+aC4kv-w9h4HHX-Y9_fTJFMDuF+VZuEG0b5d_hX8a8KrJG9FQ@mail.gmail.com>
 <20180108163042.toflejze5yfyyh3p@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cojy=ed=citrix.com=prvs=53952cd80=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eYaSd-0003Cq-7P
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:39:43 +0000
In-Reply-To: <20180108163042.toflejze5yfyyh3p@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Anthony Liguori <anthony@codemonkey.ws>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan H.=?iso-8859-1?Q?Sch=F6nherr?=" <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, Jan Beulich <JBeulich@suse.com>, Matt Wilson <msw@amazon.com>, security@xen.org, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDAwLzIyXSBWaXhlbjogQSBQ
Vi1pbi1IVk0gc2hpbSIpOgo+IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDA4OjAyOjA3QU0gLTA4
MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPiA+IE9UT0gsIHRoZSBIVk0gdmVyc2lvbiBvZiB0
aGUgc2VyaWVzIHJlcXVpcmVzIG5vIHRvb2xzIGNoYW5nZXMgYW5kCj4gPiB3b3JrcyBvbiBYZW4g
dmVyc2lvbnMgZ29pbmcgYmFjayB0byAzLjQgKGF0IGxlYXN0KS4KClRoYXQgZGVwZW5kcywgSSB0
aGluaywgb24gaG93IHlvdSBhcmUgc2VsZWN0aW5nIHRoZSBndWVzdCBrZXJuZWwuCgpsaWJ4bCAo
YXQgbGVhc3QsIG9sZGVyIGxpYnhscykgZG9uJ3Qgc3VwcG9ydCBkaXJlY3Qga2VybmVsIGJvb3Qg
aW4gSFZNCm1vZGUuICBTbyBpZiB5b3Ugd2VyZSB1c2luZyBrZXJuZWw9IGluIHlvdXIgY29uZmln
IGZpbGUgdGhhdCB3b24ndAp3b3JrIHdpdGhvdXQgbGlieGwgY2hhbmdlcyB3aGljaCBhcmUgcmVh
bGx5IGhhcmQgdG8gZG8gYW5kIGFsc28KbWFpbnRhaW4gQUJJIGNvbXBhdGliaWxpdHkuCgpMaWtl
d2lzZSBib290bG9hZGVyPSAoZWcgYm9vdGxvYWRlcj0icHlncnViIikuCgo+ID4gSWYgaXQgd2Fz
IGVudGlyZWx5IG15IGNhbGwsIEkgd291bGQgd29yayBvbiBtZXJnaW5nIEhWTSBzaGltCj4gPiBm
aXJzdCwgZ2V0IGEgNC4xMCBzdGFibGUgcmVsZWFzZSBjdXQgd2l0aCBpdCwgYW5kIHRoZW4gZm9j
dXMgb24KPiA+IGdldHRpbmcgUFZIIHNoaW0gaW4gcGxhY2UgZm9yIHRoZSA0LjExIHJlbGVhc2Uu
ICBJIHRoaW5rIHRoaXMgaXMKPiA+IHRoZSByaWdodCBiYWxhbmNlIG9mIGFkZHJlc3NpbmcgdGhl
IHNob3J0IHRlcm0gbmVlZHMgd2hpbGUgYWxzbwo+ID4gaGF2aW5nIHRoZSBiZXN0IGxvbmcgdGVy
bSBzb2x1dGlvbi4KPiAKPiBOb3QgbXkgY2FsbCBlaXRoZXIuIEkgd2lsbCB3YWl0IGZvciBzZWN1
cml0eSB0ZWFtIG1lbWJlciBhbmQgc3RhYmxlIHRyZWUKPiBtYWludGFpbmVycyB0byB3ZWlnaHQg
aW4uCgpTaW5jZSBzaGltIHVzZXJzIGFyZSBnb2luZyB0byBiZSB1c2luZyB1bnN0YWJsZS80LjEw
IGFzIHRoZSBzaGltCmFueXdheSwgSSB0aGluayBhIGdvb2QgcHJpb3JpdHkgaXMgaW5kZWVkIGdl
dHRpbmcgYSBnb29kIHNvbHV0aW9uIGZvcgo0LjEwLgoKUGVyc29uYWxseSBJIGFtIG5vdCBkb2lu
ZyBhbnkgWGVuIHJldmlldyB3b3JrIG9yIGNvbW1pdCB3b3JrIHJpZ2h0IG5vdwp0aGF0IGlzIG5v
dCByZWxhdGVkIHRvIE1lbHRkb3duL1NwZWN0cmUuICBFdmVyeXRoaW5nIGVsc2UgaGFzIHRvIHdh
aXQuCgpGdXJ0aGVybW9yZSBJIHRoaW5rIHdlIHNob3VsZCBhdm9pZCBjb21taXR0aW5nIGFueXRo
aW5nIHRvCnhlbi11bnN0YWJsZSB0aGF0IHdpbGwgY29tcGxpY2F0ZSBvdXIgZWZmb3J0cyBvbiB0
aGUgc2hpbS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
