From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 19 Jan 2018 17:58:49 +0000
Message-ID: <20180119175849.lp2457zheqfzcgl2@citrix.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
 <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
 <20180119142124.h2ldgdssch7duy4s@citrix.com>
 <23138.9721.667173.922904@mariner.uk.xensource.com>
 <20180119171208.m3nlhqb2xartlwbw@citrix.com>
 <23138.12607.373097.73856@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecawL-0008WS-3U
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:58:57 +0000
Content-Disposition: inline
In-Reply-To: <23138.12607.373097.73856@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@linaro.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMDU6NTY6MTVQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggdjIg
MDcvMTldIHRzLWhvc3QtaW5zdGFsbDogZG9uJ3QgdXNlIHRoZSBuZXcgbmljIG5hbWluZyBzY2hl
bWUiKToKPiA+IE9uIEZyaSwgSmFuIDE5LCAyMDE4IGF0IDA1OjA4OjA5UE0gKzAwMDAsIElhbiBK
YWNrc29uIHdyb3RlOgo+ID4gPiAxLiBwZXJzaXN0ZW50LW5ldC5ydWxlcyBjb250YWlucyBpbmZv
cm1hdGlvbiBzYXlpbmcgImlmIG5pYyB3aXRoCj4gPiA+IGFkZHJlc3MgYWE6YmI6Y2M6ZGQ6ZWU6
ZmYgc2hvd3MgdXAsIGNhbGwgaXQgZXRoMjsgYWxzbywgZG8gbm90IGNhbGwKPiA+ID4gYW55dGhp
bmcgZWxzZSBldGgyIi4gIFNvIGl0IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggaXAgYWRkcmVzc2Vz
Lgo+ID4gCj4gPiBUaGUgcnVsZSBpcyBnZW5lcmF0ZWQgYnkgb3NzdGVzdCwgd2hpY2ggc2F5cyAi
cGxlYXNlIG1ha2UgdGhpcyBuaWMgaGF2ZQo+ID4gbWFjIGFkZHJlc3MgWFhYWCIuIFRoYXQgd291
bGQgY2F1c2UgdGhlIGd1ZXN0IHRvIGhhdmUgdGhlIHNhbWUgbWFjCj4gPiBhZGRyZXNzIGFzIHRo
ZSBob3N0LiBXaGVuIHRoZSBndWVzdCBpcyB1cCBhbmQgYXNrcyBESENQIHNlcnZlciBmb3IgYW4K
PiA+IElQLCBpdCBnZXRzIHRoZSBob3N0J3MgSVAuCj4gCj4gcGVyc2lzdGVudC1uZXQucnVsZXMg
KGF0IGxlYXN0IHRoZSBwYXJ0cyBvZiBpdCBnZW5lcmF0ZWQgYnkKPiBwZXJzaXN0ZW50LW5ldC1n
ZW5lcmF0b3IpIGRvZXMgbm90IGNoYW5nZSB0aGUgbWFjIGFkZHJlc3NlcyBvZiBuaWNzLgo+IEl0
IG1hdGNoZXMgYWNjb3JkaW5nIHRvIHRoZSBtYWMgYWRkcmVzcyBhbmQgY2hhbmdlcyB0aGVpciAi
bmFtZXMiLgo+IAo+IEkgaG9wZSB0aGUgb3NzdGVzdC1nZW5lcmF0ZWQgb25lIGlzIG5vIGRpZmZl
cmVudC4gIEknbSBub3QgZXZlbiBzdXJlCj4gaXQncyBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIG1h
YyBhZGRyZXNzIGZyb20gYSB1ZGV2IHJ1bGUgYW5kIGlmIGl0IGlzCj4gY2VydGFpbmx5IG5vdGhp
bmcgbmVhciB1cyBzaG91bGQgZG8gaXQuCj4gCgpJdCBpcyByYXRoZXIgZGlmZmVyZW50LiBJdCBp
cyBhIGhhY2sgcHV0IGluIGJ5IElhbkMgdG8gZGVhbCB3aXRoCnVucmVsaWFibGUgVVNCIG5pYy4g
SUlSQyB0aGUgcnVsZSBpbnZva2VzIGlwIHRvIHNldCB0aGUgbWFjIGFkZHJlc3MuCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
