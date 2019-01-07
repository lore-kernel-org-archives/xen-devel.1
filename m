From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] x86/shim: only mark special pages as
 RAM in pvshim mode
Date: Mon, 7 Jan 2019 12:25:44 +0100
Message-ID: <20190107112544.udv4ef6xcoj6ayf2@mac>
References: <20181227155614.42292-1-roger.pau@citrix.com>
 <20181227155614.42292-5-roger.pau@citrix.com>
 <3a1874e5-4e3a-980f-364f-5bfabc660fca@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D5so=PP=citrix.com=prvs=9034de270=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ggT2p-0001Bn-JO
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 11:26:11 +0000
Content-Disposition: inline
In-Reply-To: <3a1874e5-4e3a-980f-364f-5bfabc660fca@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjcsIDIwMTggYXQgMDk6MDM6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8xMi8yMDE4IDE1OjU2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBX
aGVuIHJ1bm5pbmcgWGVuIGFzIGEgZ3Vlc3QgaXQncyBub3QgbmVjZXNzYXJ5IHRvIG1hcmsgc3Vj
aCBwYWdlcyBhcwo+ID4gUkFNIGJlY2F1c2UgdGhleSB3b24ndCBiZSBhc3NpZ25lZCB0byB0aGUg
aW5pdGlhbCBkb21haW4gbWVtb3J5IG1hcC4KPiA+Cj4gPiBXaGlsZSB0aGVyZSBtb3ZlIHRoZSBm
dW5jdGlvbnMgdG8gdGhlIFBWIHNoaW0gc3BlY2lmaWMgZmlsZSBhbmQgcmVuYW1lCj4gPiB0aGVt
IGFjY29yZGluZ2x5Lgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGV4cGVjdGVkLgo+ID4K
PiA+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpJIHRoaW5rIHRoaXMgb25lIGNhbiBnbyBpbiAoaWYgbm8gb25lIG9iamVjdHMpIHJl
Z2FyZGxlc3Mgb2YgdGhlIHJlc3QKb2YgdGhlIHNlcmllcy4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
