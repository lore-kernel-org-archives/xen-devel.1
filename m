From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 01 Oct 2018 08:00:23 -0600
Message-ID: <5BB2287702000078001ED4A3@prv1-mh.provo.novell.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
 <20180913093913.328a523a.olaf@aepfle.de>
 <20180928155052.5d7f66db.olaf@aepfle.de>
 <23473.64592.699718.316856@mariner.uk.xensource.com>
 <5BB2044402000078001ED2E9@prv1-mh.provo.novell.com>
 <f9dc52a3-8f75-d652-ed78-731930017276@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f9dc52a3-8f75-d652-ed78-731930017276@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Lars Kurth <lars.kurth@citrix.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE1OjM4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMC8wMS8yMDE4IDEyOjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSSB0aGlu
ayB0aGUgbWFpbiBjb25jZXJuCj4+IHdhcyB3aXRoIHRoZSB3YXkgbWlncmF0aW9uIG9mIHRoZSBu
ZXcgdmFsdWUgd2FzIGltcGxlbWVudGVkLiBCdXQgSQo+PiByZWFsbHkgaGF2ZSB0byBkZWZlciB0
byBBbmRyZXcgZm9yIHRoYXQsIGlycmVzcGVjdGl2ZSBvZiBoaW0gbm90Cj4+IGhhdmluZyByZXNw
b25kZWQgKG9uIHRoZSBsaXN0KSB0byBwcmlvciBwaW5ncy4KPiAKPiBJcyBBbmRyZXcgcmVhbGx5
IHRoZSBvbmx5IHBlcnNvbiB3aG8ga25vd3MgZW5vdWdoIGFib3V0IG1pZ3JhdGlvbiB0bwo+IGdp
dmUgdGhpcyB0aGUgdGh1bWJzLXVwPwoKVGhhdCdzIG5vdCB0aGUgcG9pbnQgaGVyZSwgYXQgbGVh
c3QgYWZhaWM6IEhlIGhhZCB2b2ljZWQgX3NvbWVfCmNvbmNlcm4gb24gYW4gZWFybGllciB2ZXJz
aW9uLiBJbiBzdWNoIGEgY2FzZSBpdCBpcywgSSB0aGluaywgb25seQphcHByb3ByaWF0ZSB0byB3
YWl0IHdpdGggY29tbWl0dGluZyB1bnRpbCB0aGVyZSB3YXMgaW5kaWNhdGlvbgp0aGF0IHRoZSBj
b25jZXJucyB3ZXJlIHN1ZmZpY2llbnRseSBhZGRyZXNzZWQgKHZlcmJhbGx5IG9yIGJ5CmFkanVz
dG1lbnRzIHRvIHRoZSBjb2RlKS4gSXQgaXMgaW5zdGVhZCBteSBpbmNvbXBsZXRlCmtub3dsZWRn
ZSBvbiB0aGUgdmFyaW91cyBwYXJ0cyBvZiBtaWdyYXRpb24gdGhhdCBtYWRlIGl0CnVuZGVzaXJh
YmxlIHRvIHRyeSB0byBqdWRnZSBpbiBoaXMgcGxhY2UsIGFmdGVyIHBpbmdzIGxlYWQgbm8tCndo
ZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
