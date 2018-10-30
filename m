From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Tue, 30 Oct 2018 21:08:32 +0000
Message-ID: <20181030210832.5qvuznv5hotphl7o@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
 <8e67b15e-24df-bfb7-aae8-4d14b714ae75@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHbFd-0002O8-2l
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 21:08:37 +0000
Content-Disposition: inline
In-Reply-To: <8e67b15e-24df-bfb7-aae8-4d14b714ae75@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDQ6MTg6MjFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8xMC8xOCAxNToyOCwgV2VpIExpdSB3cm90ZToKPiA+IFRoZXkgYXJlIHVz
ZWZ1bCB0byBQViBvbmx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gCj4gSG93IGVhc3kgaXMgdGhpcyB0byB0dXJuIGludG8gYSBkb21haW5j
cmVhdGUgZmxhZz/CoCBJdCBpcyB5ZXQgYW5vdGhlcgo+IHNpbmdsZXRvbiBvcGVyYXRpb24gd2hp
Y2ggY29tcGxpY2F0ZWQgWGVuJ3MgaW5pdC9jbGVhbnVwIHBhdGggaGF2aW5nIHRvCj4gY29wZSB3
aXRoIGl0IGJlaW5nIGVuYWJsZWQgYWZ0ZXIgdGhlIGZhY3QuCj4gCj4gKFRoaXMgaXMgYSBzbGln
aHRseSBsb2FkZWQgcXVlc3Rpb24uwqAgSSBoYXZlIGEgc3VzcGljaW9uIHRoYXQgdGhlIGFuc3dl
cgo+IGlzICJyYXRoZXIgY29tcGxpY2F0ZWQgdG8gbWFrZSB0aGUgYXNzb2NpYXRlZCBsaWJ4bCBj
aGFuZ2VzIiwgYXMgeW91Cj4gbmVlZCB0byBrbm93IHRoZSBiaXRuZXNzIG9mIHRoZSBQViBrZXJu
ZWwgYmVmb3JlIGNhbGxpbmcgZG9tYWluY3JlYXRlLgoKSXQgYXBwZWFycyB0aGF0IGJ5IHRoZSB0
aW1lIHRoZSBzZXQgaHlwZXJjYWxsIGlzIGNhbGxlZCB0b29sc3RhY2sgc2hvdWxkCmhhdmUgYWxy
ZWFkeSBrbm93biB0aGUgYml0bmVzcyBvZiB0aGUga2VybmVsLCBzbyBpdCBpcyBwb3NzaWJsZSB0
byB0dXJuCnRoZSBzZXQgaHlwZXJjYWxsIGludG8gYSBmbGFnIChidXQgc3RpbGwgbm9uLXRyaXZp
YWwpLiBHZXR0aW5nIHJpZCBvZgp0aGUgZ2V0IGh5cGVyY2FsbCBpcyBtb3JlIGNvbXBsaWNhdGVk
IGJlY2F1c2UgdGhlIGJpdG5lc3MgaXMgbm90CnJlY29yZGVkIGFueXdoZXJlIGluIHVzZXJzcGFj
ZS4gUGFyc2luZyB0aGUga2VybmVsIGFnYWluIGlzIG5vdCBhbgpvcHRpb24uCgpXZWkuCgo+IAo+
IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
