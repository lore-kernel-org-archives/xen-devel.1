From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Thu, 26 Jul 2018 13:46:55 +0000
Message-ID: <c017fae12e3d463fae302756c7e1e1dd@AMSPEX02CL03.citrite.net>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <29f7dad6aaf642d69a9c805b6693fa01@AMSPEX02CL03.citrite.net>
 <5B59CF8002000078001D8356@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nskl=kk=citrix.com=prvs=738f7cb72=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1figbk-0001fa-Sc
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 13:47:08 +0000
In-Reply-To: <5B59CF8002000078001D8356@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjYgSnVseSAyMDE4IDE0OjQxCj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IFN1YmplY3Q6IFJF
OiBbUEFUQ0ggdjJdIHg4NjogYXNzb3J0ZWQgYXJyYXlfaW5kZXhfbm9zcGVjKCkgaW5zZXJ0aW9u
cwo+IAo+ID4+PiBPbiAyNi4wNy4xOCBhdCAxNToyNSwgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PiB3cm90ZToKPiA+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29t
XQo+ID4+IFNlbnQ6IDI2IEp1bHkgMjAxOCAxNDowNwo+ID4gVXNpbmcgc29tZXRoaW5nIGNhbGxl
ZCAnYXJyYXlfaW5kZXhfbm9zcGVjKCknIGZvciBhbiBhcnJheSBzaXplIGFuZCBoYXZpbmcKPiA+
IHRvIGFkanVzdCBieSAxIGlzIGtpbmQgb2YgYSBiaXQgdWdseSBidXQgaXQgbG9va3MgY29ycmVj
dC4KPiAKPiBJbmRlZWQsIGFuZCBhcyB5b3UgbWF5IGhhdmUgc2VlbiBmcm9tIHRoZSBjaGFuZ2Ug
bG9nIEkndmUgaGFkIGl0Cj4gd3JvbmcgYXQgZmlyc3QgZm9yIHRoaXMgdmVyeSByZWFzb24uCgpZ
ZXMsIHdoaWNoIG1ha2VzIG1lIHdvbmRlciB3aGV0aGVyIHdlIGNvdWxkIGhhdmUgc29tZXRoaW5n
IGxpa2UgJ2FycmF5X3NpemVfbGltaXQoKScganVzdCB0byBoaWRlIHRoaXMga2luZCBvZiB0aGlu
Zz8KCiAgUGF1bAoKPiAKPiA+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgo+IAo+IFRoYW5rcy4KPiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
