From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:02:04 +0200
Message-ID: <f8bc94ca-9eee-a5a2-5c32-0ca1ed0cbf5d@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2Dli-00082i-08
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:02:10 +0000
In-Reply-To: <5BA0D44602000078001E93EA@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA5LjE4IGF0
IDA4OjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gSW5zdGVhZCBvZiB1c2luZyBiaW5h
cnkgaHlwZXJ2aXNvciBpbnRlcmZhY2VzIGZvciBuZXcgcGFyYW1ldGVycyBvZgo+PiBkb21haW5z
IG9yIGNwdXBvb2xzIHRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZ2VuZXJpYyB0
ZXh0Cj4+IGJhc2VkIHBhcmFtZXRlciBwYXJzaW5nLgo+Pgo+PiBQYXJhbWV0ZXJzIGFyZSBkZWZp
bmVkIHZpYSBuZXcgbWFjcm9zIHNpbWlsYXIgdG8gdGhvc2Ugb2YgYm9vdAo+PiBwYXJhbWV0ZXJz
LiBQYXJzaW5nIG9mIHBhcmFtZXRlciBzdHJpbmdzIGlzIGRvbmUgdmlhIHRoZSBhbHJlYWR5Cj4+
IGV4aXN0aW5nIGJvb3QgcGFyYW1ldGVyIHBhcnNpbmcgZnVuY3Rpb24gd2hpY2ggaXMgZXh0ZW5k
ZWQgYSBsaXR0bGUKPj4gYml0Lgo+Pgo+PiBQYXJhbWV0ZXIgc2V0dGluZ3MgY2FuIGVpdGhlciBi
ZSBzcGVjaWZpZWQgaW4gY29uZmlndXJhdGlvbiBmaWxlcyBvZgo+PiBkb21haW5zIG9yIGNwdXBv
b2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4bCBzdWItY29tbWFuZHMuCj4gCj4gV2l0
aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQgKG5vdCBldmVuIHRo
ZWlyCj4gZGVzY3JpcHRpb25zKSBJJ20gc3RpbGwgd29uZGVyaW5nIHdoYXQgdGhlIGJlbmVmaXQg
b2YgdGV4dHVhbCBwYXJhbWV0ZXJzCj4gcmVhbGx5IGlzOiBKdXN0IGxpa2UgImJpbmFyeSIgb25l
cywgdGhleSBiZWNvbWUgcGFydCBvZiB0aGUgcHVibGljCj4gaW50ZXJmYWNlLCBhbmQgaGVuY2Ug
c3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1vcmUgb3IKPiBsZXNzIHRoYW4gdGhl
IG9uZXMgd2UgY3VycmVudGx5IGhhdmUgKGluIHBhcnRpY3VsYXIsIGFueXRoaW5nIHZhbGlkIGlu
Cj4gYSBndWVzdCBjb25maWcgZmlsZSB3aWxsIGltbyBuZWVkIHRvIHJlbWFpbiB0byBiZSB2YWxp
ZCBhbmQgbWVhbmluZ2Z1bAo+IGRvd24gdGhlIHJvYWQpLgo+IAo+IElmIHRoaXMgaXMgc29sZWx5
IG9yIG1haW5seSBhYm91dCBkZWZlcnJpbmcgdGhlIHBhcnNpbmcgZnJvbSB0aGUgdG9vbAo+IHN0
YWNrIHRvIHRoZSBoeXBlcnZpc29yLCB0aGVuIEknbSBub3QgYXQgYWxsIGNvbnZpbmNlZCBvZiB0
aGUgYXBwcm9hY2gKPiAoSSdkIGV2ZW4gYmUgdGVtcHRlZCB0byBjYWxsIGl0IGJhY2t3YXJkcyku
CgpUaGUgbWFpbiBhZHZhbnRhZ2UgaXMgdGhhdCBpdCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byBi
YWNrcG9ydCBuZXcKcGFyYW1ldGVycyBsaWtlIHRoZSB4cHRpIHBlci1kb21haW4gb25lLiBObyBu
ZWVkIHRvIGJ1bXAgc3lzY3RsL2RvbWN0bAppbnRlcmZhY2UgdmVyc2lvbnMgZm9yIHRoYXQuCgpJ
dCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBzdXBwb3J0IG1hbmRhdG9yeSBhbmQgb3B0aW9uYWwg
cGFyYW1ldGVycwppbiB0aGUgZ3Vlc3QgY29uZmlnLiBPcHRpb25hbCBwYXJhbWV0ZXJzIG5vdCBz
dXBwb3J0ZWQgYnkgdGhlIGh5cGVydmlzb3IKd291bGQgdGhlbiBiZSBpZ25vcmVkIGluc3RlYWQg
b2YgbGVhZGluZyB0byBmYWlsdXJlIGF0IGd1ZXN0IGNyZWF0aW9uCnRpbWUuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
