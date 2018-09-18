From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:10:41 +0200
Message-ID: <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2Du1-0000RS-3D
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:10:45 +0000
In-Reply-To: <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
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
ZCBhbmQgbWVhbmluZ2Z1bAo+IGRvd24gdGhlIHJvYWQpLgoKU28gbGV0cyBsb29rIHdoYXQgd291
bGQgYmUgbmVlZGVkIGZvciBhZGRpbmcgc29tZXRoaW5nIGxpa2UgdGhlCnBlci1kb21haW4geHB0
aSBwYXJhbWV0ZXIgdXNpbmcgYmluYXJ5IGludGVyZmFjZXM6CgoxIGFuIGV4dGVuc2lvbiBvZiBz
b21lIGRvbWN0bCBpbnRlcmZhY2UsIG1heWJlIGJ1bXBpbmcgb2YgdGhlIGRvbWN0bAogIGludGVy
ZmFjZSB2ZXJzaW9uCjIgYWRkaW5nIHRoZSBsb2dpYyB0byBkb21jdGwgaGFuZGxpbmcKMyBhZGRp
bmcgbGlieGMgc3VwcG9ydAo0IGFkZGluZyBsaWJ4bCBzdXBwb3J0CjUgYWRkaW5nIGEgbmV3IHhs
IHN1Yi1jb21tYW5kCjYgYWRkaW5nIGRvbWFpbiBjb25maWcgc3VwcG9ydAo3IGFkZGluZyBkb2N1
bWVudGF0aW9uCgpXaXRoIG15IGFwcHJvYWNoIG9ubHkgMiAoaW4gYSBtb2RpZmllZCBmb3JtLCBw
YXJhbWV0ZXIgaGFuZGxpbmcgaW5zdGVhZApvZiBkb21jdGwsIGJ1dCBjb21wYXJhYmxlIGluIHRo
ZSBuZWVkZWQgZWZmb3J0KSBhbmQgNyBhcmUgbmVlZGVkLgoKU28gb25jZSB0aGUgZnJhbWV3b3Jr
IGlzIGluIHBsYWNlIGl0IGlzIF9tdWNoXyBlYXNpZXIgdG8gYWRkIG5ldwpmZWF0dXJlcy4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
