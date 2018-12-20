From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Thu, 20 Dec 2018 08:03:15 -0700
Message-ID: <5C1BAF3302000078002081B5@prv1-mh.provo.novell.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
 <2d3e6587946c1f82e07303876e6d03a4dc2f525b.camel@bitdefender.com>
 <df56b6495ff64236aac9a85c2f53a33d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZzr4-00060g-Vl
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:03:19 +0000
In-Reply-To: <df56b6495ff64236aac9a85c2f53a33d@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDE1OjI4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogUGV0cmUgT3ZpZGl1IFBJ
UkNBTEFCVSBbbWFpbHRvOnBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tXQo+PiBTZW50OiAyMCBE
ZWNlbWJlciAyMDE4IDE0OjI2Cj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIAo+PiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQo+PiA8d2VpLmxpdTJA
Y2l0cml4LmNvbT47IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47
IEtvbnJhZAo+PiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3Jn
ZSBEdW5sYXAKPj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBJYW4KPj4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSnVsaWVuCj4+IEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT47IEphbgo+PiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUkZDIFBB
VENIIDQvNl0gdm1fZXZlbnQ6IFVzZSBzbG90dGVkIGNoYW5uZWxzCj4+IGZvciBzeW5jIHJlcXVl
c3RzLgo+PiAKPj4gT24gVGh1LCAyMDE4LTEyLTIwIGF0IDEyOjA1ICswMDAwLCBQYXVsIER1cnJh
bnQgd3JvdGU6Cj4+ID4gPiBUaGUgbWVtb3J5IGZvciB0aGUgYXN5bmNocm9ub3VzIHJpbmcgYW5k
IHRoZSBzeW5jaHJvbm91cyBjaGFubmVscwo+PiA+ID4gd2lsbAo+PiA+ID4gYmUgYWxsb2NhdGVk
IGZyb20gZG9taGVhcCBhbmQgbWFwcGVkIHRvIHRoZSBjb250cm9sbGluZyBkb21haW4KPj4gPiA+
IHVzaW5nIHRoZQo+PiA+ID4gZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgaW50ZXJmYWNlLiBV
bmxpa2UgdGhlIGN1cnJlbnQKPj4gPiA+IGltcGxlbWVudGF0aW9uLAo+PiA+ID4gdGhlIGFsbG9j
YXRlZCBwYWdlcyBhcmUgbm90IHBhcnQgb2YgdGhlIHRhcmdldCBEb21VLCBzbyB0aGV5IHdpbGwK
Pj4gPiA+IG5vdCBiZQo+PiA+ID4gcmVjbGFpbWVkIHdoZW4gdGhlIHZtX2V2ZW50IGRvbWFpbiBp
cyBkaXNhYmxlZC4KPj4gPgo+PiA+IFdoeSByZS1pbnZlbnQgdGhlIHdoZWVsIGhlcmU/IFRoZSBp
b3JlcSBpbmZyYXN0cnVjdHVyZSBhbHJlYWR5IGRvZXMKPj4gPiBwcmV0dHkgbXVjaCBldmVyeXRo
aW5nIHlvdSBuZWVkIEFGQUlDVC4KPj4gPgo+PiA+ICAgUGF1bAo+PiAKPj4gSSB3YW50ZWQgcHJl
c2V2ZSBhcyBtdWNoIGFzIHBvc3NpYmxlIGZyb20gdGhlIGV4aXN0aW5nIHZtX2V2ZW50IERPTUNU
TAo+PiBpbnRlcmZhY2UgYW5kIGFkZCBvbmx5IHRoZSBuZWNlc3NhcnkgY29kZSB0byBhbGxvY2F0
ZSBhbmQgbWFwIHRoZQo+PiB2bV9ldmVudF9wYWdlcy4KPiAKPiBUaGF0IG1lYW5zIHdlIGhhdmUg
dHdvIHN1YnN5c3RlbXMgZHVwbGljYXRpbmcgYSBsb3Qgb2YgZnVuY3Rpb25hbGl0eSB0aG91Z2gu
IAo+IEl0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIHRvIHVzZSBpb3JlcSBzZXJ2ZXIgaWYgcG9zc2li
bGUgdGhhbiBwcm92aWRlIGEgCj4gY29tcGF0aWJpbGl0eSBpbnRlcmZhY2UgdmlhIERPTUNUTC4K
CisxIGZyb20gbWUsIGZ3aXcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
