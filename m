From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] arm: gic-v3: clear GICR active interrupts
Date: Wed, 30 Jan 2019 13:49:22 +0000
Message-ID: <68a7635b-02f9-6f84-cd2c-23bcd9eecd7b@arm.com>
References: <20190122024416.10673-1-peng.fan@nxp.com>
 <a3be5c44-5947-eaa7-392d-5de3daff4b9f@arm.com>
 <f476d1e3-348d-ba21-688a-1046c98bf23f@arm.com>
 <AM0PR04MB4481F05C1000A61C06D3DC0D88900@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB448168270D2470BCD08576BF88900@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cjPf=QG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goqF4-0007Yg-3A
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 13:49:26 +0000
In-Reply-To: <AM0PR04MB448168270D2470BCD08576BF88900@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMC8wMS8yMDE5IDEzOjM2LCBQZW5nIEZhbiB3cm90ZToKPj4+IEVhY2ggSUNBQ1RJ
VkVSMCByZWdpc3RlcnMgaG9sZCB0aGUgYWN0aXZlIGJpdCBmb3IgMzIgaW50ZXJydXB0cy4KPj4+
IEhvd2V2ZXIsIHRoaXMgY29kZSBhc3N1bWVzIHRoZSByZWdpc3RlciBvbmx5IGhvbGQgNCBpbnRl
cnJ1cHRzLiBTbwo+Pj4gdGhpcyB3aWxsIHdyaXRlIHRvIHVud2FudGVkIGFyZWEuCj4+Pgo+Pj4g
VGhlcmUgYXJlIG9ubHkgMTYgU0dJcywgc28gaXQgZml0cyBpbiBvbmUgd3JpdGUgdG8gSUNBQ1RJ
VkVSMC4gQXMKPj4+IHdyb3RlIGFib3ZlLCB5b3UgYWxzbyBuZWVkIHRvIGRlYWN0aXZhdGUgdGhl
IFBQSXMuIFNvIHRoZSBmb2xsb3dpbmcgc2hvdWxkCj4+IGJlIGVub3VnaDoKPj4+Cj4+PiAvKgo+
Pj4gICAgKiBUaGUgYWN0aXZhdGUgc3RhdGUgaXMgdW5rbm93biBhdCBib290LCBzbyBtYWtlIHN1
cmUgYWxsIFNHSXMgYW5kIFBQSXMKPj4gYXJlCj4+PiAgICAqIGRlLWFjdGl2YXRlZC4KPj4+ICAg
ICovCj4+PiB3cml0ZWxfcmVsYXhlZCgweGZmZmZmZmZmLCBHSUNEX1JESVNUX1NHSV9CQVNFICsg
R0lDUl9JQ0FDVElWRVIwKTsKPiAKPiBKdXN0IGhhdmUgYSBmb2xsb3dpbmcgdXAgcXVlc3Rpb24s
IGFjY29yZGluZyB0byBJSEkwMDY5RF9naWNfYXJjaGl0ZWN0dXJlX3NwZWNpZmljYXRpb24KPiAi
OC4xMS4zIEdJQ1JfSUNBQ1RJVkVSMCwgSW50ZXJydXB0IENsZWFyLUFjdGl2ZSBSZWdpc3RlciAw
Igo+IFRoaXMgZmllbGQgcmVzZXRzIHRvIGEgdmFsdWUgdGhhdCBpcyBhcmNoaXRlY3R1cmFsbHkg
VU5LTk9XTiwKPiBEbyB3ZSBuZWVkIHRvIHRha2UgU1BJIGludG8gY29uc2lkZXJhdGlvbiBhcyB0
aGUgZm9sbG93aW5nIGluIGdpY19jcHVfaW5pdD8KPiBmb3IgKGkgPSAwOyBpIDwgbnJfbGluZXM7
IGkgKz0zMikKPiAJd3JpdGVsX3JlbGF4ZWQoMHhmZmZmZmZmZiwgR0lDRF9SRElTVF9TR0lfQkFT
RSArIEdJQ1JfSUNBQ1RJVkVSMCArIChpIC8gMzIpICogNCk7Cj4gCj4gYW5kIG1vdmUgbnJfbGlu
ZXMgb3V0IGZyb20gZ2ljX2Rpc3RfaW5pdCB0byBhIHN0YXRpYyBnbG9iYWwgdmFyYWlhYmxlLgoK
WW91IGNhbid0IGNsZWFyIFNQSXMgdGhyb3VnaCBHSUNEX1JESVNUX1NHSV9CQVNFLiBZb3UgaGF2
ZSB0byB1c2UgdGhlIEdJQ0QuCgpGdXJ0aGVybW9yZSwgZ2ljX2NwdV9pbml0IGlzIGNhbGxlZCBm
b3IgZXZlcnkgQ1BVIHNvIHRoaXMgaXMgbm90IGEgZ29vZCBwbGFjZSAKZm9yIGNsZWFyaW5nIHNo
YXJlZCBpbnRlcnJ1cHRzLiBTaGFyZWQgaW50ZXJydXB0cyBzaG91bGQgYmUgY2xlYXJlZCBpbiAK
Z2ljX2Rpc3RfaW5pdCBhcyB0aGlzIGlzIGNhbGxlZCBvbmx5IG9uY2UuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
