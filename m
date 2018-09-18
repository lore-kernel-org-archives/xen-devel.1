From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 04:32:38 -0600
Message-ID: <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
References: <20180918060309.7186-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2DJD-0005ef-Tm
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 10:32:43 +0000
In-Reply-To: <20180918060309.7186-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA5LjE4IGF0IDA4OjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIHVzaW5nIGJpbmFyeSBoeXBlcnZpc29yIGludGVyZmFjZXMgZm9yIG5ldyBwYXJhbWV0
ZXJzIG9mCj4gZG9tYWlucyBvciBjcHVwb29scyB0aGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBv
cnQgZm9yIGdlbmVyaWMgdGV4dAo+IGJhc2VkIHBhcmFtZXRlciBwYXJzaW5nLgo+IAo+IFBhcmFt
ZXRlcnMgYXJlIGRlZmluZWQgdmlhIG5ldyBtYWNyb3Mgc2ltaWxhciB0byB0aG9zZSBvZiBib290
Cj4gcGFyYW1ldGVycy4gUGFyc2luZyBvZiBwYXJhbWV0ZXIgc3RyaW5ncyBpcyBkb25lIHZpYSB0
aGUgYWxyZWFkeQo+IGV4aXN0aW5nIGJvb3QgcGFyYW1ldGVyIHBhcnNpbmcgZnVuY3Rpb24gd2hp
Y2ggaXMgZXh0ZW5kZWQgYSBsaXR0bGUKPiBiaXQuCj4gCj4gUGFyYW1ldGVyIHNldHRpbmdzIGNh
biBlaXRoZXIgYmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPiBkb21haW5z
IG9yIGNwdXBvb2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4bCBzdWItY29tbWFuZHMu
CgpXaXRob3V0IGhhdmluZyBsb29rZWQgYXQgYW55IG9mIHRoZSBwYXRjaGVzIHlldCAobm90IGV2
ZW4gdGhlaXIKZGVzY3JpcHRpb25zKSBJJ20gc3RpbGwgd29uZGVyaW5nIHdoYXQgdGhlIGJlbmVm
aXQgb2YgdGV4dHVhbCBwYXJhbWV0ZXJzCnJlYWxseSBpczogSnVzdCBsaWtlICJiaW5hcnkiIG9u
ZXMsIHRoZXkgYmVjb21lIHBhcnQgb2YgdGhlIHB1YmxpYwppbnRlcmZhY2UsIGFuZCBoZW5jZSBz
dWJzZXF1ZW50bHkgY2FuJ3QgYmUgY2hhbmdlZCBhbnkgbW9yZSBvcgpsZXNzIHRoYW4gdGhlIG9u
ZXMgd2UgY3VycmVudGx5IGhhdmUgKGluIHBhcnRpY3VsYXIsIGFueXRoaW5nIHZhbGlkIGluCmEg
Z3Vlc3QgY29uZmlnIGZpbGUgd2lsbCBpbW8gbmVlZCB0byByZW1haW4gdG8gYmUgdmFsaWQgYW5k
IG1lYW5pbmdmdWwKZG93biB0aGUgcm9hZCkuCgpJZiB0aGlzIGlzIHNvbGVseSBvciBtYWlubHkg
YWJvdXQgZGVmZXJyaW5nIHRoZSBwYXJzaW5nIGZyb20gdGhlIHRvb2wKc3RhY2sgdG8gdGhlIGh5
cGVydmlzb3IsIHRoZW4gSSdtIG5vdCBhdCBhbGwgY29udmluY2VkIG9mIHRoZSBhcHByb2FjaAoo
SSdkIGV2ZW4gYmUgdGVtcHRlZCB0byBjYWxsIGl0IGJhY2t3YXJkcykuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
