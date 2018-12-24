From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Mon, 24 Dec 2018 10:37:15 +0000
Message-ID: <a75f9189-ddf8-0a54-5b5a-230d089142e1@arm.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
 <2d3e6587946c1f82e07303876e6d03a4dc2f525b.camel@bitdefender.com>
 <df56b6495ff64236aac9a85c2f53a33d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IBnL=PB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gbNbu-0007kr-KA
 for xen-devel@lists.xenproject.org; Mon, 24 Dec 2018 10:37:22 +0000
In-Reply-To: <df56b6495ff64236aac9a85c2f53a33d@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDEyLzIwLzE4IDI6MjggUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSBb
bWFpbHRvOnBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tXQo+PiBTZW50OiAyMCBEZWNlbWJlciAy
MDE4IDE0OjI2Cj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1Cj4+IDx3ZWkubGl1MkBjaXRyaXguY29t
PjsgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsgS29ucmFkCj4+
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcAo+
PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IElhbgo+PiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
VGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBKdWxpZW4KPj4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSmFuCj4+
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtSRkMgUEFUQ0ggNC82XSB2
bV9ldmVudDogVXNlIHNsb3R0ZWQgY2hhbm5lbHMKPj4gZm9yIHN5bmMgcmVxdWVzdHMuCj4+Cj4+
IE9uIFRodSwgMjAxOC0xMi0yMCBhdCAxMjowNSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
Pj4+IFRoZSBtZW1vcnkgZm9yIHRoZSBhc3luY2hyb25vdXMgcmluZyBhbmQgdGhlIHN5bmNocm9u
b3VzIGNoYW5uZWxzCj4+Pj4gd2lsbAo+Pj4+IGJlIGFsbG9jYXRlZCBmcm9tIGRvbWhlYXAgYW5k
IG1hcHBlZCB0byB0aGUgY29udHJvbGxpbmcgZG9tYWluCj4+Pj4gdXNpbmcgdGhlCj4+Pj4gZm9y
ZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgaW50ZXJmYWNlLiBVbmxpa2UgdGhlIGN1cnJlbnQKPj4+
PiBpbXBsZW1lbnRhdGlvbiwKPj4+PiB0aGUgYWxsb2NhdGVkIHBhZ2VzIGFyZSBub3QgcGFydCBv
ZiB0aGUgdGFyZ2V0IERvbVUsIHNvIHRoZXkgd2lsbAo+Pj4+IG5vdCBiZQo+Pj4+IHJlY2xhaW1l
ZCB3aGVuIHRoZSB2bV9ldmVudCBkb21haW4gaXMgZGlzYWJsZWQuCj4+Pgo+Pj4gV2h5IHJlLWlu
dmVudCB0aGUgd2hlZWwgaGVyZT8gVGhlIGlvcmVxIGluZnJhc3RydWN0dXJlIGFscmVhZHkgZG9l
cwo+Pj4gcHJldHR5IG11Y2ggZXZlcnl0aGluZyB5b3UgbmVlZCBBRkFJQ1QuCj4+Pgo+Pj4gICAg
UGF1bAo+Pgo+PiBJIHdhbnRlZCBwcmVzZXZlIGFzIG11Y2ggYXMgcG9zc2libGUgZnJvbSB0aGUg
ZXhpc3Rpbmcgdm1fZXZlbnQgRE9NQ1RMCj4+IGludGVyZmFjZSBhbmQgYWRkIG9ubHkgdGhlIG5l
Y2Vzc2FyeSBjb2RlIHRvIGFsbG9jYXRlIGFuZCBtYXAgdGhlCj4+IHZtX2V2ZW50X3BhZ2VzLgo+
IAo+IFRoYXQgbWVhbnMgd2UgaGF2ZSB0d28gc3Vic3lzdGVtcyBkdXBsaWNhdGluZyBhIGxvdCBv
ZiBmdW5jdGlvbmFsaXR5IHRob3VnaC4gSXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdG8gdXNlIGlv
cmVxIHNlcnZlciBpZiBwb3NzaWJsZSB0aGFuIHByb3ZpZGUgYSBjb21wYXRpYmlsaXR5IGludGVy
ZmFjZSB2aWEgRE9NQ1RMLgo+IAo+PiBBbHNvLCB0byBteSBrbm93bGVkZ2UsIHRoZSBpb3JlcSBz
ZXJ2ZXIgaXMgb25seSBzdXBwb3J0ZWQgZm9yIHg4NiBodm0KPj4gdGFyZ2V0cy4gSSBkaWRuJ3Qg
d2FudCB0byBhZGQgYW4gZXh0cmEgbGltaXRhdGlvbiB0byB0aGUgdm1fZXZlbnQKPj4gc3lzdGVt
Lgo+IAo+IEkgYmVsaWV2ZSBKdWxpZW4gaXMgYWxyZWFkeSBwb3J0aW5nIGl0IHRvIEFSTS4KCkZX
SVcsIHllcyBJIGhhdmUgYSBwb3J0IG9mIGlvcmVxIGZvciBBcm0uIFN0aWxsIGNsZWFuaW5nLXVw
IHRoZSBjb2RlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
