From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:32:35 +0200
Message-ID: <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=ef=bf=bd1=ef=bf=bdjgross@suse.com?=
 =?UTF-8?Q?>_<5BA0D44602000078001E93EA@prv1=ef=bf=bdmh.provo.novell.com>_<7c?=
 =?UTF-8?Q?b2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>_<5BA0DF9602000078001?=
 =?UTF-8?Q?E9448@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2EFB-0003Bx-Vm
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:32:37 +0000
In-Reply-To: <5BA0DF9602000078001?= =?UTF-8?Q?E9448@suse.com>
Content-Language: de-DE
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

T24gMTgvMDkvMTggMTM6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA5LjE4IGF0
IDEzOjEwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTgvMDkvMTggMTI6MzIsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMDkuMTggYXQgMDg6MDIsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5IGh5cGVydmlzb3IgaW50
ZXJmYWNlcyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+PiBkb21haW5zIG9yIGNwdXBvb2xzIHRo
aXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZ2VuZXJpYyB0ZXh0Cj4+Pj4gYmFzZWQg
cGFyYW1ldGVyIHBhcnNpbmcuCj4+Pj4KPj4+PiBQYXJhbWV0ZXJzIGFyZSBkZWZpbmVkIHZpYSBu
ZXcgbWFjcm9zIHNpbWlsYXIgdG8gdGhvc2Ugb2YgYm9vdAo+Pj4+IHBhcmFtZXRlcnMuIFBhcnNp
bmcgb2YgcGFyYW1ldGVyIHN0cmluZ3MgaXMgZG9uZSB2aWEgdGhlIGFscmVhZHkKPj4+PiBleGlz
dGluZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4dGVuZGVkIGEg
bGl0dGxlCj4+Pj4gYml0Lgo+Pj4+Cj4+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBlaXRoZXIg
YmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+PiBkb21haW5zIG9yIGNw
dXBvb2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4bCBzdWItY29tbWFuZHMuCj4+Pgo+
Pj4gV2l0aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQgKG5vdCBl
dmVuIHRoZWlyCj4+PiBkZXNjcmlwdGlvbnMpIEknbSBzdGlsbCB3b25kZXJpbmcgd2hhdCB0aGUg
YmVuZWZpdCBvZiB0ZXh0dWFsIHBhcmFtZXRlcnMKPj4+IHJlYWxseSBpczogSnVzdCBsaWtlICJi
aW5hcnkiIG9uZXMsIHRoZXkgYmVjb21lIHBhcnQgb2YgdGhlIHB1YmxpYwo+Pj4gaW50ZXJmYWNl
LCBhbmQgaGVuY2Ugc3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1vcmUgb3IKPj4+
IGxlc3MgdGhhbiB0aGUgb25lcyB3ZSBjdXJyZW50bHkgaGF2ZSAoaW4gcGFydGljdWxhciwgYW55
dGhpbmcgdmFsaWQgaW4KPj4+IGEgZ3Vlc3QgY29uZmlnIGZpbGUgd2lsbCBpbW8gbmVlZCB0byBy
ZW1haW4gdG8gYmUgdmFsaWQgYW5kIG1lYW5pbmdmdWwKPj4+IGRvd24gdGhlIHJvYWQpLgo+Pgo+
PiBTbyBsZXRzIGxvb2sgd2hhdCB3b3VsZCBiZSBuZWVkZWQgZm9yIGFkZGluZyBzb21ldGhpbmcg
bGlrZSB0aGUKPj4gcGVyLWRvbWFpbiB4cHRpIHBhcmFtZXRlciB1c2luZyBiaW5hcnkgaW50ZXJm
YWNlczoKPj4KPj4gMSBhbiBleHRlbnNpb24gb2Ygc29tZSBkb21jdGwgaW50ZXJmYWNlLCBtYXli
ZSBidW1waW5nIG9mIHRoZSBkb21jdGwKPj4gICBpbnRlcmZhY2UgdmVyc2lvbgo+PiAyIGFkZGlu
ZyB0aGUgbG9naWMgdG8gZG9tY3RsIGhhbmRsaW5nCj4+IDMgYWRkaW5nIGxpYnhjIHN1cHBvcnQK
Pj4gNCBhZGRpbmcgbGlieGwgc3VwcG9ydAo+PiA1IGFkZGluZyBhIG5ldyB4bCBzdWItY29tbWFu
ZAo+PiA2IGFkZGluZyBkb21haW4gY29uZmlnIHN1cHBvcnQKPj4gNyBhZGRpbmcgZG9jdW1lbnRh
dGlvbgo+Pgo+PiBXaXRoIG15IGFwcHJvYWNoIG9ubHkgMiAoaW4gYSBtb2RpZmllZCBmb3JtLCBw
YXJhbWV0ZXIgaGFuZGxpbmcgaW5zdGVhZAo+PiBvZiBkb21jdGwsIGJ1dCBjb21wYXJhYmxlIGlu
IHRoZSBuZWVkZWQgZWZmb3J0KSBhbmQgNyBhcmUgbmVlZGVkLgo+Pgo+PiBTbyBvbmNlIHRoZSBm
cmFtZXdvcmsgaXMgaW4gcGxhY2UgaXQgaXMgX211Y2hfIGVhc2llciB0byBhZGQgbmV3Cj4+IGZl
YXR1cmVzLgo+IAo+IEFsbCB0aGUgYWJvdmUgd291bGQgaG9sZCBpZiB0aGUgaW5kaXZpZHVhbCBv
cHRpb25zIHdlcmUgZXhwcmVzc2VkIGFzCj4gZS5nLiBmbGFncyBpbiBhbiBleHRlbnNpYmxlIGJp
dCB2ZWN0b3IuCgpXaG8gd291bGQgdHJhbnNsYXRlIHRoZSBuZXcgb3B0aW9uIGludG8gYSBiaXQg
dmVjdG9yPyBUaGlzIHdvdWxkIGJlIHRoZQp0b29scyAobGlieGMvbGlieGwveGwpLCBzbyB0aG9z
ZSBuZWVkIHRvIGJlIG1vZGlmaWVkIGZvciBlYWNoIG5ldyBiaXQuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
