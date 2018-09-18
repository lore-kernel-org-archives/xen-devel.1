From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:28:19 +0200
Message-ID: <a3740a21-35b4-80f4-41eb-d4e31094165f@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=ef=bf=bd1=ef=bf=bdjgross@suse.com?=
 =?UTF-8?Q?>_<5BA0D44602000078001E93EA@suse.com>_<f8bc94ca=ef=bf=bd9eee?=
 =?UTF-8?B?77+9YTVhMu+/vTVjMzLvv70wY2ExZWQwY2JmNWRAc3VzZS5jb20+IDw1QkEwREYz?=
 =?UTF-8?Q?702000078001E9444@prv1=ef=bf=bdmh.provo.novell.com>_<78501912-e58?=
 =?UTF-8?Q?6-faa9-3569-3b2fd2fef9f5@citrix.com>_<5BA0E01902000078001E9468@su?=
 =?UTF-8?Q?se.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2EB3-0002Hh-V8
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:28:21 +0000
In-Reply-To: <5BA0E01902000078001E9468@su?= =?UTF-8?Q?se.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTM6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA5LjE4IGF0
IDEzOjIwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDkvMTgvMjAx
OCAxMjoxOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wOS4xOCBhdCAxMzow
MiwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTgvMDkvMTggMTI6MzIsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxOC4wOS4xOCBhdCAwODowMiwgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+PiBJbnN0ZWFkIG9mIHVzaW5nIGJpbmFyeSBoeXBlcnZpc29yIGlu
dGVyZmFjZXMgZm9yIG5ldyBwYXJhbWV0ZXJzIG9mCj4+Pj4+PiBkb21haW5zIG9yIGNwdXBvb2xz
IHRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZ2VuZXJpYyB0ZXh0Cj4+Pj4+PiBi
YXNlZCBwYXJhbWV0ZXIgcGFyc2luZy4KPj4+Pj4+Cj4+Pj4+PiBQYXJhbWV0ZXJzIGFyZSBkZWZp
bmVkIHZpYSBuZXcgbWFjcm9zIHNpbWlsYXIgdG8gdGhvc2Ugb2YgYm9vdAo+Pj4+Pj4gcGFyYW1l
dGVycy4gUGFyc2luZyBvZiBwYXJhbWV0ZXIgc3RyaW5ncyBpcyBkb25lIHZpYSB0aGUgYWxyZWFk
eQo+Pj4+Pj4gZXhpc3RpbmcgYm9vdCBwYXJhbWV0ZXIgcGFyc2luZyBmdW5jdGlvbiB3aGljaCBp
cyBleHRlbmRlZCBhIGxpdHRsZQo+Pj4+Pj4gYml0Lgo+Pj4+Pj4KPj4+Pj4+IFBhcmFtZXRlciBz
ZXR0aW5ncyBjYW4gZWl0aGVyIGJlIHNwZWNpZmllZCBpbiBjb25maWd1cmF0aW9uIGZpbGVzIG9m
Cj4+Pj4+PiBkb21haW5zIG9yIGNwdXBvb2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4
bCBzdWItY29tbWFuZHMuCj4+Pj4+Cj4+Pj4+IFdpdGhvdXQgaGF2aW5nIGxvb2tlZCBhdCBhbnkg
b2YgdGhlIHBhdGNoZXMgeWV0IChub3QgZXZlbiB0aGVpcgo+Pj4+PiBkZXNjcmlwdGlvbnMpIEkn
bSBzdGlsbCB3b25kZXJpbmcgd2hhdCB0aGUgYmVuZWZpdCBvZiB0ZXh0dWFsIHBhcmFtZXRlcnMK
Pj4+Pj4gcmVhbGx5IGlzOiBKdXN0IGxpa2UgImJpbmFyeSIgb25lcywgdGhleSBiZWNvbWUgcGFy
dCBvZiB0aGUgcHVibGljCj4+Pj4+IGludGVyZmFjZSwgYW5kIGhlbmNlIHN1YnNlcXVlbnRseSBj
YW4ndCBiZSBjaGFuZ2VkIGFueSBtb3JlIG9yCj4+Pj4+IGxlc3MgdGhhbiB0aGUgb25lcyB3ZSBj
dXJyZW50bHkgaGF2ZSAoaW4gcGFydGljdWxhciwgYW55dGhpbmcgdmFsaWQgaW4KPj4+Pj4gYSBn
dWVzdCBjb25maWcgZmlsZSB3aWxsIGltbyBuZWVkIHRvIHJlbWFpbiB0byBiZSB2YWxpZCBhbmQg
bWVhbmluZ2Z1bAo+Pj4+PiBkb3duIHRoZSByb2FkKS4KPj4+Pj4KPj4+Pj4gSWYgdGhpcyBpcyBz
b2xlbHkgb3IgbWFpbmx5IGFib3V0IGRlZmVycmluZyB0aGUgcGFyc2luZyBmcm9tIHRoZSB0b29s
Cj4+Pj4+IHN0YWNrIHRvIHRoZSBoeXBlcnZpc29yLCB0aGVuIEknbSBub3QgYXQgYWxsIGNvbnZp
bmNlZCBvZiB0aGUgYXBwcm9hY2gKPj4+Pj4gKEknZCBldmVuIGJlIHRlbXB0ZWQgdG8gY2FsbCBp
dCBiYWNrd2FyZHMpLgo+Pj4+Cj4+Pj4gVGhlIG1haW4gYWR2YW50YWdlIGlzIHRoYXQgaXQgd291
bGQgYmUgbXVjaCBlYXNpZXIgdG8gYmFja3BvcnQgbmV3Cj4+Pj4gcGFyYW1ldGVycyBsaWtlIHRo
ZSB4cHRpIHBlci1kb21haW4gb25lLiBObyBuZWVkIHRvIGJ1bXAgc3lzY3RsL2RvbWN0bAo+Pj4+
IGludGVyZmFjZSB2ZXJzaW9ucyBmb3IgdGhhdC4KPj4+Cj4+PiBBZGRpdGlvbnMgdG8gc3lzY3Rs
L2RvbWN0bCBpbnRlcmZhY2VzIGRvbid0IHJlcXVpcmUgc3VjaCBhIGJ1bXAuCj4+Pgo+Pj4+IEl0
IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHN1cHBvcnQgbWFuZGF0b3J5IGFuZCBvcHRpb25hbCBw
YXJhbWV0ZXJzCj4+Pj4gaW4gdGhlIGd1ZXN0IGNvbmZpZy4gT3B0aW9uYWwgcGFyYW1ldGVycyBu
b3Qgc3VwcG9ydGVkIGJ5IHRoZSBoeXBlcnZpc29yCj4+Pj4gd291bGQgdGhlbiBiZSBpZ25vcmVk
IGluc3RlYWQgb2YgbGVhZGluZyB0byBmYWlsdXJlIGF0IGd1ZXN0IGNyZWF0aW9uCj4+Pj4gdGlt
ZS4KPj4+Cj4+PiBFeGNlcHQgdGhhdCBvdmVyIHRpbWUgb3BpbmlvbnMgbWF5IGNoYW5nZSB3aGF0
IGlzIHN1cHBvc2VkIHRvCj4+PiBiZSBvcHRpb25hbCB2cyBtYW5kYXRvcnkuCj4+Cj4+IEkgdGhv
dWdodCB0aGUgaWRlYSB3b3VsZCBiZSB0aGF0IHRoZSBhZG1pbiB3b3VsZCBzcGVjaWZ5IHdoaWNo
IG9uZXMgd2VyZQo+PiBvcHRpb25hbCBvciBtYW5kYXRvcnkuCj4gCj4gSWYgdGhpcyB3YXMgYWRt
aW4gY29udHJvbGxlZCwgdGhlcmUgd291bGQgYmUgbm8gd2F5IHRvIGVuY29kZSBpbgo+IHRoZSBo
eXBlcmNhbGwgaGFuZGxlciB3aGljaCBvbmVzIHRvIHJlamVjdCB3aGVuIHVua25vd24uIEV2ZW4K
PiB3aXRob3V0IGFkbWluIGludm9sdmVtZW50IGl0J3Mgbm90IHJlYWxseSBjbGVhciB0byBtZSBo
b3cgb3B0aW9ucwo+IHdlIGRvbid0IGV2ZW4ga25vdyBvZiB0b2RheSBjb3VsZCBiZSB0cmVhdGVk
IGFzIGVpdGhlciBvcHRpb25hbAo+IG9yIG1hbmRhdG9yeS4KClRoaXMgd291bGQgYmUgaW4gdGhl
IHRvb2xzOiB3aGVuIHlvdSBhZGQ6CgpvcHRpb25hbF9wYXJhbWV0ZXJzPSJibGE9Zm9vIgoKdGhl
IHRvb2xzIGtub3cgdGhleSBjYW4gaWdub3JlIGEgbmVnYXRpdmUgcmMgd2hlbiB0cnlpbmcgdG8g
c2V0IHRoZQpwYXJhbWV0ZXIuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
