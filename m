From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 11/11] vpci/msix: add MSI-X handlers
Date: Fri, 16 Mar 2018 01:36:53 -0600
Message-ID: <5AAB822502000078001B2945@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-12-roger.pau@citrix.com>
 <5AA9641002000078001B1B1F@prv-mh.provo.novell.com>
 <20180315120150.atxleuqdm3dbw7kz@MacBook-Pro-de-Roger.local>
 <5AAA791602000078001B2214@prv-mh.provo.novell.com>
 <20180315163302.rqolvhuejjgzhoo5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewjvD-0007QX-DC
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 07:37:03 +0000
In-Reply-To: <20180315163302.rqolvhuejjgzhoo5@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWFyIDE1LCAyMDE4IGF0IDA2OjQ1OjU4QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTUuMDMuMTggYXQgMTM6MDEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTE6MDQ6MDBBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxNC4wMy4xOCBhdCAxNTowNCwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiArICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5n
X3NvZnRpcnFzKCk7Cj4+ID4+IAo+PiA+PiBDYXJlZnVsIC0gaXMgdGhpcyB2YWxpZCB3aXRoIGEg
c3BpbiBsb2NrIGhlbGQ/IE5vdGUgaG93IGUuZy4KPj4gPj4gZHVtcF9kb21haW5zKCkgaG9sZHMg
YW4gUkNVIGxvY2sgb25seS4KPj4gPiAKPj4gPiBJdCB3b3JrcyBBVE0sIGJ1dCBJIGd1ZXNzIHRo
ZXJlIGNvdWxkIGJlIGlzc3VlcyBpZiBhdCBzb21lIHBvaW50IHRoZQo+PiA+IHNvZnRpcnFzIG5l
ZWQgdG8gdXNlIHRoZSB2cGNpIGxvY2suIEkgd2lsbCBhZGQgYSBwYWlyIG9mIHVubG9jay9sb2Nr
Cj4+ID4gYXJvdW5kIGl0Lgo+PiAKPj4gUHJvdmlkZWQgdGhhdCBpcyBzYWZlLgo+IAo+IEhtLCBt
c2l4IGNvdWxkIGJlIGZyZWVkIHVuZGVyIG91ciBmZWV0LCBidXQgSSBkb24ndCBzZWUgYW55IG90
aGVyCj4gb2J2aW91cyBzb2x1dGlvbiB0byB0aGlzIGlzc3VlIEFUTS4gSSB0aGluayBhcyBhIGZv
bGxvdyB1cCBJIHNob3VsZAo+IG1vdmUgdGhlIHZwY2kgbG9jayBvdXRzaWRlIG9mIHRoZSB2cGNp
IHN0cnVjdC4KCldlbGwsIGxvb2tpbmcgYXQgcGF0Y2ggOSBhZ2FpbiwgaXQgaGFzIGEgc2ltaWxh
ciBpc3N1ZSAtIHBkZXYgY291bGQKZGlzYXBwZWFyIHVuZGVyIHlvdXIgZmVldC4gUmVzb2x2aW5n
IHRoYXQgbWF5IGJlIGV2ZW4gdWdsaWVyCnRoYW4gcmVzb2x2aW5nIHRoZSBpc3N1ZSBoZXJlLCB3
aGVyZSB5b3UgY291bGQgc2ltcGx5IHJlY29yZAp3aGVyZSBpbnNpZGUgdGhlIE1TSS1YIGFycmF5
IHlvdSd2ZSBpbnRlcnJ1cHRlZCB0aGUgZHVtcGluZywKdmFsaWRhdGluZyAtIGFmdGVyIHJlLWFj
cXVpcmluZyBvZiB0aGUgbG9jayAtIHRoYXQgcGRldi0+dnBjaSBzdGlsbApwb2ludHMgYXQgdGhl
IHNhbWUgc3RydWN0dXJlIGluc3RhbmNlIChhbmQgbm90ZSB0aGF0IGl0IHdvdWxkIGJlCm9ubHkg
Y29uZnVzaW5nLCBidXQgbm90IG90aGVyd2lzZSBoYXJtZnVsIGlmIHBkZXYtPnZwY2kgaGFkCmNo
YW5nZWQgdHdpY2UgaW4gYmV0d2VlbiwgZW5kaW5nIHVwIHdpdGggdGhlIHNhbWUgdmFsdWUgYXMK
YmVmb3JlKS4gQnV0IHRoZSBmdW5kYW1lbnRhbCBpZGVhIHdvdWxkIGJlIHRoZSBzYW1lIC0KcmVt
ZW1iZXIgd2hhdCBwZGV2IHlvdSB3ZXJlIGF0LCBhbmQgcmVzdGFydCBzY2FubmluZyBhZnRlcgpo
YXZpbmcgZHJvcHBlZCB3aGF0ZXZlciBsb2NrIGlzIG5lY2Vzc2FyeSwgc2tpcHBpbmcKZXZlcnl0
aGluZyB1cCB0byB0aGUgcG9pbnQgd2hlcmUgeW91IGZpbmQgdGhlIHJpZ2h0IHBkZXYuIElmCnlv
dSBkb24ndCBmaW5kIGl0IGFueW1vcmUsIHlvdSBzaG91bGQgc2ltcGx5IGluZGljYXRlIHNvIGlu
IGEKbG9nIG1lc3NhZ2UsIG1ha2luZyBpdCBjbGVhciB0byB0aGUgb25lIGhhdmluZyBzZW50IHRo
ZSBkZWJ1ZwprZXkgdGhhdCB0aGV5IHNob3VsZCByZS1pc3N1ZSBpdC4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
