From: Juergen Gross <jgross@suse.com>
Subject: Re: SpectreV1+L1TF Patch Series
Date: Mon, 28 Jan 2019 11:01:53 +0100
Message-ID: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1go3js-00017o-B6
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 10:02:00 +0000
References: =?UTF-8?B?PDE1NDgyNDQyODXvv70zMDgxM++/vTHvv71naXTvv71zZW5k77+9?=
 =?UTF-8?Q?email=ef=bf=bdnmanthey=40amazon=2ede=3e_=3c5C4EBD1A02000078002119?=
 =?UTF-8?Q?54=40suse=2ecom=3e_=3c9a0f161e-f6fb-2e10-3b94-232554b3c5a8=40suse?=
 =?UTF-8?Q?=2ecom=3e_=3c5C4ED1D402000078002119E6=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDEuMTkg
YXQgMDk6NDcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyOC8wMS8yMDE5IDA5OjI4
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIzLjAxLjE5IGF0IDEyOjUxLCA8bm1hbnRo
ZXlAYW1hem9uLmRlPiB3cm90ZToKPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBt
aXRpZ2F0ZSB0aGUgaXNzdWUgdGhhdCBoYXZlIGJlZW4gcmFpc2VkIGluIHRoZQo+Pj4+IFhTQS0y
ODkgKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL3hzYS9hZHZpc29yeS0yODkuaHRtbCkuIFRvIGJs
b2NrIHNwZWN1bGF0aXZlCj4+Pj4gZXhlY3V0aW9uIG9uIEludGVsIGhhcmR3YXJlLCBhbiBsZmVu
Y2UgaW5zdHJ1Y3Rpb24gaXMgcmVxdWlyZWQgdG8gbWFrZSBzdXJlCj4+Pj4gdGhhdCBzZWxlY3Rl
ZCBjaGVja3MgYXJlIG5vdCBieXBhc3NlZC4gU3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vz
c2VzIGNhbgo+Pj4+IGJlIHByZXZlbnRlZCBieSB1c2luZyB0aGUgYXJyYXlfaW5kZXhfbm9zcGVj
IG1hY3JvLgo+Pj4+Cj4+Pj4gVGhlIGxmZW5jZSBpbnN0cnVjdGlvbiBzaG91bGQgYmUgYWRkZWQg
b24geDg2IHBsYXRmb3JtcyBvbmx5LiBUbyBub3QgYWZmZWN0Cj4+Pj4gcGxhdGZvcm1zIHRoYXQg
YXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgTDFURiB2dWxuZXJhYmlsaXR5LCB0aGUgbGZlbmNlCj4+
Pj4gaW5zdHJ1Y3Rpb24gaXMgcGF0Y2hlZCBpbiB2aWEgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcgb24g
SW50ZWwgQ1BVcyBvbmx5Lgo+Pj4+IEZ1cnRoZXJtb3JlLCB0aGUgY29tcGlsZSB0aW1lIGNvbmZp
Z3VyYXRpb24gYWxsb3dzIHRvIGNob29zZSBob3cgdG8gcHJvdGVjdCB0aGUKPj4+PiBldmFsdWF0
aW9uIG9mIGNvbmRpdGlvbnMgd2l0aCB0aGUgbGZlbmNlIGluc3RydWN0aW9uLgo+Pj4KPj4+IEkn
dmUgbm90aWNlZCBvbmx5IG5vdyB0aGF0IHlvdSB3ZXJlbid0IENjLWVkIG9uIHRoaXMgc2VyaWVz
LiBJdAo+Pj4gY2xlYXJseSBpcyBzb21ldGhpbmcgdG8gYXQgbGVhc3QgYmUgY29uc2lkZXJlZCBm
b3IgNC4xMi4gTWF5IEkKPj4+IGFzayB3aGF0IHlvdXIgdmlldyBvbiB0aGlzIGlzPyBQZXJoYXBz
IGluIHBhcnRpY3VsYXIgd2hldGhlcgo+Pj4geW91IHdvdWxkIHdhbnQgdG8gc2V0IHNvbWUgYm91
bmRhcnkgaW4gdGltZSB1bnRpbCB3aGljaCBwaWVjZXMKPj4+IG9mIGl0IChhcyB0aGV5IGJlY29t
ZSByZWFkeSwgd2hpY2ggbG9va3MgdG8gYmUgdGhlIGNhc2UgZm9yCj4+PiBwYXRjaGVzIDEwIGFu
ZCAxMSBhdCB0aGlzIHBvaW50IGluIHRpbWUpIG1heSBnbyBpbj8KPj4KPj4gSSdkIHNheSB1bnRp
bCBSQzMgdGhleSBhcmUgZmluZSB0byBnbyBpbiB3aGVuIHJlYWR5LiBBZnRlciB0aGF0IEknZCBs
aWtlCj4+IHRvIGRlY2lkZSBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcy4KPiAKPiBNYXkgSSBpbnRl
cnByZXQgdGhpcyBhcyBhIHJlbGVhc2UgYWNrIGZvciBwYXRjaGVzIDEwIGFuZCAxMSBvZgo+IHY0
IHRoZW4sIGFuZCBwZXJoYXBzIGV2ZW4gZ2VuZXJhbGx5IGFzIHN1Y2ggYW4gYWNrIGZvciBvdGhl
cgo+IHBhcnRzIG9mIHRoZSBzZXJpZXMgKHdpdGggdGhlIFJDMyBib3VuZGFyeSBpbiBtaW5kKT8K
Clllcy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
