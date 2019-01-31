From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 31 Jan 2019 12:00:20 +0100
Message-ID: <20190131110020.tszokun7wosvjizy@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <1548064795-18160-10-git-send-email-christopher.w.clark@gmail.com>
 <20190122120822.v5eyc64fa4moourd@mac>
 <CACMJ4GYpwHyqaPzXzTWQrHecW068ipfyDOrNz-MD9Y+jGB18eQ@mail.gmail.com>
 <20190131101809.kcbexwtqqkjvgzfq@mac>
 <5C52CF6B02000078002129C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPPl=QH=citrix.com=prvs=927f2c6f3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gpA6a-0002je-Ck
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 11:02:00 +0000
Content-Disposition: inline
In-Reply-To: <5C52CF6B02000078002129C1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDM6MzU6MjNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMxLjAxLjE5IGF0IDExOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDg6MTA6MjhQTSAtMDgwMCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPj4gT24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgNDowOCBBTSBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiBPbiBN
b24sIEphbiAyMSwgMjAxOSBhdCAwMTo1OTo0OUFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3
cm90ZToKPiA+PiA+ID4gKyAgICAgICAgLyoKPiA+PiA+ID4gKyAgICAgICAgICogQ2hlY2sgcGFk
ZGluZyBpcyB6ZXJvZWQuIFJlamVjdCBuaW92IGFib3ZlIGxpbWl0IG9yIG1lc3NhZ2VfdHlwZXMK
PiA+PiA+ID4gKyAgICAgICAgICogdGhhdCBhcmUgb3V0c2lkZSAzMiBiaXQgcmFuZ2UuCj4gPj4g
PiA+ICsgICAgICAgICAqLwo+ID4+ID4gPiArICAgICAgICBpZiAoIHVubGlrZWx5KHNlbmRfYWRk
ci5zcmMucGFkIHx8IHNlbmRfYWRkci5kc3QucGFkIHx8Cj4gPj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgKGFyZzMgPiBYRU5fQVJHT19NQVhJT1YpIHx8IChhcmc0ICYgfjB4ZmZmZmZmZmZV
TCkpICkKPiA+PiA+Cj4gPj4gPiBhcmc0ICYgKEdCKDQpIC0gMSkKPiA+PiA+Cj4gPj4gPiBJcyBj
bGVhcmVyIElNTywgb3I6Cj4gPj4gPgo+ID4+ID4gYXJnNCA+IFVJTlQzMl9NQVgKPiA+PiAKPiA+
PiBJJ3ZlIGxlZnQgdGhlIGNvZGUgdW5jaGFuZ2VkLCBhcyB0aGUgbWFzayBjb25zdGFudCBpcyB1
c2VkIG11bHRpcGxlCj4gPj4gcGxhY2VzIGVsc2V3aGVyZSBpbiBYZW4uIFVJTlQzMl9NQVggaXMg
b25seSB1c2VkIGFzIGEgdGhyZXNob2xkIHZhbHVlLgo+ID4gCj4gPiBUaGUgZmFjdCB0aGF0IG90
aGVycyBwYXJ0cyBvZiB0aGUgY29kZSBjb3VsZCBiZSBpbXByb3ZlZCBpcyBub3QgYW4KPiA+IGV4
Y3VzZSB0byBmb2xsb3cgc3VpdC4gSSdtIGhhdmluZyBhIGhhcmQgdGltZSBiZWxpZXZpbmcgdGhh
dCB5b3UgZmluZAo+ID4gImFyZzQgJiB+MHhmZmZmZmZmZlVMIiBlYXNpZXIgdG8gcmVhZCB0aGFu
ICJhcmc0ICYgfihHQig0KSAtIDEpIiBvcgo+ID4gZXZlbiAiYXJnNCA+PSBHQig0KSIuCj4gPiAK
PiA+IElNTyBpdCdzIG11Y2ggbW9yZSBsaWtlbHkgdG8gbWlzcyBhbiAnZicgaW4gdGhlIGZpcnN0
IGNvbnN0cnVjdCwgYW5kCj4gPiB0aHVzIGdldCB0aGUgdmFsdWUgd3JvbmcgYW5kIGludHJvZHVj
ZSBhIGJ1Zy4KPiAKPiBJIGFncmVlIHdpdGggdGhpcyBsYXN0IHN0YXRlbWVudCwgYnV0IEknbSBo
YXZpbmcgdHJvdWJsZSB0byBzZWUgaG93Cj4gbWVzc2FnZSBfdHlwZV8gaXMgcmVsYXRlZCB0byBh
IHNpemUgY29uc3RydWN0IGxpa2UgR0IoNCkgaXMuIEkgc2VlCj4gb25seSBVSU5UMzJfTUFYIGFz
IGEgdmlhYmxlIGFsdGVybmF0aXZlIGZvciBzb21ldGhpbmcgdGhhdCdzIG5vdAo+IGV4cHJlc3Np
bmcgdGhlIHNpemUgb2YgYW55dGhpbmcuCgpJJ3ZlIHN1Z2dlc3RlZCB0aGUgR0IgY29uc3RydWN0
IGFzIGFuIGFsdGVybmF0aXZlIGJlY2F1c2UgdGhlIGNvbW1lbnQKYWJvdmUgbWVudGlvbnMgdGhl
IDMyYml0IHJhbmdlLiBJTU8gYW55dGhpbmcgdGhhdCBhdm9pZHMgdXNpbmcKMHhmZmZmZmZmZlVM
IGlzIGZpbmUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
