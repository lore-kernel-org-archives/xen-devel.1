From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Fri, 08 Mar 2019 05:33:47 -0700
Message-ID: <5C82612B020000780021CA63@prv1-mh.provo.novell.com>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
 <20190307005004.GC19265@mail-itl>
 <20190307144801.vh6fcvp6mj3e6puj@Air-de-Roger>
 <20190307222825.GE19265@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2EhI-00031u-RH
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 12:33:56 +0000
In-Reply-To: <20190307222825.GE19265@mail-itl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDIzOjI4LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6NDg6MDFQTSArMDEwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gSG0sIGFsYmVpdCBJIGFncmVlIHdpdGggeW91ciBhbmFs
eXNpcywgSSBmZWVsIGxpa2UgdGhpcyBwcm9wb3NlZAo+PiBzb2x1dGlvbiBpcyBraW5kIG9mIGEg
d29ya2Fyb3VuZC4gR2l2ZW4gdGhlIGNvbnRleHQsIEkgdGhpbmsgdGhlIGJlc3QKPj4gd2F5IHRv
IGRlYWwgd2l0aCB0aGlzIGlzc3VlIGluIGRlc3Ryb3lfaXJxIGlzIHRvIGl0ZXJhdGUgb3ZlciB0
aGUgbGlzdAo+PiBvZiBkb21haW5zIGFuZCBtYWtlIHN1cmUgbm8gZG9tYWluIGhhcyBwZXJtaXNz
aW9ucyBvdmVyIHRoZSBkZXN0cm95ZWQKPj4gaXJxLiBOb3RlIHRoYXQgd2l0aCB0aGlzIHByb3Bv
c2VkIHNvbHV0aW9uIHlvdSB3aWxsIGhhdmUgdG8gZHJvcCB0aGUKPj4gZG9tYWluIHBhcmFtZXRl
ciBmcm9tIGRlc3Ryb3lfaXJxLgo+IAo+IEknZCByZWFsbHkgbGlrZSB0byBhdm9pZCBpdGVyYXRp
bmcgdGhlIHdob2xlIGRvbWFpbiBsaXN0LiBKYW4sIHdoYXQgZG8KPiB5b3UgdGhpbms/IENvZGUt
d2lzZSB0aGlzIHNlZW1zIHRvIGJlIHRoZSBlYXNpZXN0IHNvbHV0aW9uLgoKSSdkIGNlcnRhaW5s
eSBsaWtlIHRvIGF2b2lkIGl0ZXJhdGlvbnMgb3ZlciB0aGUgZG9tYWluIGxpc3QsIHRvby4KCkkg
ZG9uJ3QgdGhpbmsgYSBiYWNrIHBvaW50ZXIgaXMgbmVjZXNzYXJ5IHRob3VnaC4gQSBkb21haW4g
SUQgd291bGQKc2VlbSBzdWZmaWNpZW50IC0gaWYgKGF0IHRoZSB0aW1lIHlvdSBuZWVkIGEgZG9t
YWluIHBvaW50ZXIpIGl0IGRvZXNuJ3QKcmVzb2x2ZSB0byBhIHZhbGlkIGRvbWFpbiwgb3IgdG8g
b25lIHdob3NlIC0+dGFyZ2V0IHBvaW50cyBiYWNrIGF0CnRoZSBkb21haW4geW91IGhhdmUgaW4g
aGFuZHMsIHRoZW4gaXQncyBnb25lIChhdCBsZWFzdCBmYXIgZW5vdWdoCmZvciB0aGUgcHVycG9z
ZXMgaGVyZSkuCgo+IENhbiBvbmUgSFZNIGRvbWFpbiBoYXZlIG11bHRpcGxlIHN0dWJkb21haW5z
PyBJZiBzbywgaXQgc2hvdWxkIGEgYmUKPiBsaXN0LCBub3QgYSBzaW5nbGUgZmllbGQuCgpPdGhl
ciB0aGFuIHdoYXQgUm9nZXIgaGFzIHNhaWQgaW4gaGlzIHN1YnNlcXVlbnQgcmVwbHksIEknZCBw
cmVmZXIKaWYgYXQgbGVhc3Qgbm8gbmV3IHJlc3RyaWN0aW9ucyB3ZXJlIGludHJvZHVjZWQuIFll
dCBJIGFncmVlIHdpdGgKaGlzIG92ZXItZW5naW5lZXJpbmcgcmVtYXJrLCBhbmQgaGVuY2UgSSBj
b3VsZCBzZWUgdGhlIGFtb3VudApnZXR0aW5nIGxpbWl0ZWQgdG8gYSBzbWFsbCBudW1iZXIgZm9y
IG5vdyAoc2F5IDQgZm9yIDY0LWJpdCBhbmQgMgpmb3IgMzItYml0LCBzdWNoIHRoYXQgdGhlIHJl
c3VsdGluZyBhcnJheSBvZiBkb21haW4gSURzIGNvbnN1bWVzCmp1c3QgYSBzaW5nbGUgcG9pbnRl
cidzIHdvcnRoIG9mIG1lbW9yeSkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
