From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 19/45] ARM: new VGIC: Add IRQ sync/flush
	framework
Date: Mon, 19 Mar 2018 14:17:34 +0000
Message-ID: <c2e311ef-7ad2-cead-219f-5b0ead8f60ad@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-20-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exo7U-000078-5f
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 06:18:08 +0000
In-Reply-To: <20180315203050.19791-20-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBJbXBs
ZW1lbnQgdGhlIGZyYW1ld29yayBmb3Igc3luY2luZyBJUlFzIGJldHdlZW4gb3VyIGVtdWxhdGlv
biBhbmQgdGhlCj4gbGlzdCByZWdpc3RlcnMsIHdoaWNoIHJlcHJlc2VudCB0aGUgZ3Vlc3QncyB2
aWV3IG9mIElSUXMuCj4gVGhpcyBpcyBkb25lIGluIHZnaWNfc3luY19mcm9tX2xycygpIGFuZCB2
Z2ljX3N5bmNfdG9fbHJzKCksIHdoaWNoCj4gZ2V0IGNhbGxlZCBvbiBndWVzdCBlbnRyeSBhbmQg
ZXhpdCwgcmVzcGVjdGl2ZWx5Lgo+IFRoZSBjb2RlIHRhbGtpbmcgdG8gdGhlIGFjdHVhbCBHSUN2
Mi92MyBoYXJkd2FyZSBpcyBhZGRlZCBpbiB0aGUKPiBmb2xsb3dpbmcgcGF0Y2hlcy4KPiAKPiBU
aGlzIGlzIGJhc2VkIG9uIExpbnV4IGNvbW1pdCAwOTE5ZTg0YzBmYzEsIHdyaXR0ZW4gYnkgTWFy
YyBaeW5naWVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5
d2FyYUBsaW5hcm8ub3JnPgo+IC0tLQo+IENoYW5nZWxvZyB2MSAuLi4gdjI6Cj4gLSBtYWtlIGZ1
bmN0aW9ucyB2b2lkCgpIbW1tLCB0aGUgZnVuY3Rpb24gd2VyZSBhbHJlYWR5IHZvaWQgaW4gdGhl
IHByZXZpb3VzIHZlcnNpb24uIEhvd2V2ZXIsIAp5b3Ugc3dpdGNoIGZyb20gc3RhdGljIGlubGlu
ZSB0byBzdGF0aWMuIERpZCBJIG1pc3MgYW55dGhpbmc/CgpbLi4uXQoKPiArc3RhdGljIHZvaWQg
dmdpY19zZXRfdW5kZXJmbG93KHN0cnVjdCB2Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICBBU1NFUlQo
dmNwdSA9PSBjdXJyZW50KTsKPiArCj4gKyAgICBnaWNfaHdfb3BzLT51cGRhdGVfaGNyX3N0YXR1
cyhHSUNIX0hDUl9VSUUsIDEpOwoKVGhlIHNlY29uZCBpcyBhIGJvb2xlYW4sIHNvIHBsZWFzZSB1
c2UgdHJ1ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
