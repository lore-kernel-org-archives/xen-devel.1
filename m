From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 0/4] xen/tools: sched: Credit1: improve
 handling of vCPU migration delay
Date: Wed, 21 Mar 2018 15:28:35 +0000
Message-ID: <20180321152835.trggnsbgwyccok4g@citrix.com>
References: <152113608271.4918.9160597572418705851.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyflA-00043u-JZ
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 15:34:40 +0000
Content-Disposition: inline
In-Reply-To: <152113608271.4918.9160597572418705851.stgit@Palanthas.fritz.box>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDY6NTE6MTRQTSArMDEwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gSGksCj4gCj4gVmVyc2lvbiAzIG9mIHRoaXMgc2VyaWVzLgo+IAo+IHYyOgo+ICBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgt
MDIvbXNnMDIxNzcuaHRtbAo+IHYxOgo+ICBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDIvbXNnMDIwMjkuaHRtbAo+IAo+IEkgdGhpbmsg
SSd2ZSBhZGRyZXNzZWQgYWxsIHRoZSByZXZpZXcgY29tbWVudHMgKGJhc2ljYWxseSwgdGhlIHRp
bWUgY29udmVyc2lvbiBpc3N1ZXMgc3BvdHRlZCBieSBHZW9yZ2UpLgo+IFNvcnJ5IGl0IHRvb2sg
YSBiaXQsIHdhcyBvdGhlcndpc2UgZW5nYWdlZC4KPiAKPiBVcGRhdGVkIGJyYW5jaGVzOgo+IAo+
ICBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2RhcmlvZi94ZW4uZ2l0IHJlbC9zY2hlZC9j
cmVkaXQvdmNwdV9taWdyX2RlbGF5X3BlcmNwb29sLXYzCj4gIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPXBlb3BsZS9kYXJpb2YveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFk
cy9yZWwvc2NoZWQvY3JlZGl0L3ZjcHVfbWlncl9kZWxheV9wZXJjcG9vbC12Mwo+IE9yOgo+ICBo
dHRwczovL2dpdGh1Yi5jb20vZmRhcmlvL3hlbi90cmVlL3JlbC9zY2hlZC9jcmVkaXQvdmNwdV9t
aWdyX2RlbGF5X3BlcmNwb29sLXYzCj4gCj4gVHJhdmlzIGlzIGFsbCBncmVlbiA6LSkKPiAgaHR0
cHM6Ly90cmF2aXMtY2kub3JnL2ZkYXJpby94ZW4vYnVpbGRzLzM1MzkxNzkwOQo+IAo+IFJlZ2Fy
ZHMsCj4gRGFyaW8KPiAtLS0KPiBEYXJpbyBGYWdnaW9saSAoNCk6Cj4gICAgICAgeGVuOiBzY2hl
ZC9jcmVkaXQxOiBtYWtlIHZjcHVfbWlncmF0aW9uX2RlbGF5IHBlci1jcHVwb29sCj4gICAgICAg
dG9vbHM6IGxpYnhsL3hsOiBhbGxvdyB0byBnZXQvc2V0IENyZWRpdDEncyB2Y3B1X21pZ3JhdGlv
bl9kZWxheQo+ICAgICAgIHRvb2xzOiB4ZW5wbTogY29udGludWUgdG8gc3VwcG9ydCB7c2V0LGdl
dH0tdmNwdS1taWdyYXRpb24tZGVsYXkKPiAgICAgICB4ZW4vbGlieGM6IHN1cHByZXNzIGRpcmVj
dCBhY2Nlc3MgdG8gQ3JlZGl0MSdzIG1pZ3JhdGlvbiBkZWxheQoKRkFPRCBJIHdpbGwgbGVhdmUg
Y29tbWl0dGluZyB0aGlzIHNlcmllcyB0byB3aG9ldmVyIGFja3MgcGF0Y2ggMS4KCldlaS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
