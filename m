From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Thu, 26 Jul 2018 08:47:35 -0600
Message-ID: <5B59DF0702000078001D83C2@prv1-mh.provo.novell.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <29f7dad6aaf642d69a9c805b6693fa01@AMSPEX02CL03.citrite.net>
 <5B59CF8002000078001D8356@prv1-mh.provo.novell.com>
 <c017fae12e3d463fae302756c7e1e1dd@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kl9k=kk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fihYI-0006i3-If
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 14:47:38 +0000
In-Reply-To: <c017fae12e3d463fae302756c7e1e1dd@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA3LjE4IGF0IDE1OjQ2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMjYgSnVseSAyMDE4IDE0OjQxCj4+IFRv
OiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+PiBDYzogUmF6dmFuIENv
am9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+PiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2Ml0geDg2OiBhc3NvcnRlZCBhcnJheV9pbmRleF9ub3NwZWMo
KSBpbnNlcnRpb25zCj4+IAo+PiA+Pj4gT24gMjYuMDcuMTggYXQgMTU6MjUsIDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86SkJl
dWxpY2hAc3VzZS5jb21dCj4+ID4+IFNlbnQ6IDI2IEp1bHkgMjAxOCAxNDowNwo+PiA+IFVzaW5n
IHNvbWV0aGluZyBjYWxsZWQgJ2FycmF5X2luZGV4X25vc3BlYygpJyBmb3IgYW4gYXJyYXkgc2l6
ZSBhbmQgaGF2aW5nCj4+ID4gdG8gYWRqdXN0IGJ5IDEgaXMga2luZCBvZiBhIGJpdCB1Z2x5IGJ1
dCBpdCBsb29rcyBjb3JyZWN0Lgo+PiAKPj4gSW5kZWVkLCBhbmQgYXMgeW91IG1heSBoYXZlIHNl
ZW4gZnJvbSB0aGUgY2hhbmdlIGxvZyBJJ3ZlIGhhZCBpdAo+PiB3cm9uZyBhdCBmaXJzdCBmb3Ig
dGhpcyB2ZXJ5IHJlYXNvbi4KPiAKPiBZZXMsIHdoaWNoIG1ha2VzIG1lIHdvbmRlciB3aGV0aGVy
IHdlIGNvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UgCj4gJ2FycmF5X3NpemVfbGltaXQoKScganVz
dCB0byBoaWRlIHRoaXMga2luZCBvZiB0aGluZz8KCldlbGwsIG5vdCBzdXJlIC0gSSdtIHNvcnQg
b2YgaGVzaXRhbnQgdG8gZXh0ZW5kIGEgYnJhbmQgbmV3LCBpbmhlcml0ZWQKZnJvbSBMaW51eCBp
bnRlcmZhY2UuIExldCdzIHNlZSB3aGF0IEFuZHJldyB0aGlua3MuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
