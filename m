From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 19 Nov 2018 05:42:01 -0700
Message-ID: <5BF2AF9902000078001FD740@prv1-mh.provo.novell.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
 <62c1f237-9d1d-06f3-49f8-e48be8d38b3f@citrix.com>
 <5BEEB8B502000078001FCBEF@prv1-mh.provo.novell.com>
 <b096879e-c2cd-7255-46b5-bcd5ecc5a017@citrix.com>
 <efe0b93a-164f-6bbe-81f8-3c1e4247bc2b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOisS-0001KG-7A
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:42:08 +0000
In-Reply-To: <efe0b93a-164f-6bbe-81f8-3c1e4247bc2b@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjExLjE4IGF0IDE2OjUyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMS8xNi8xOCAzOjA1IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBOb3cgdGFr
ZSBjaGFuZ2VfdHlwZV9yYW5nZS4gIFRoZSBnbG9iYWwgZWZmZWN0IG9mIGNoYW5nZV90eXBlX3Jh
bmdlCj4+IHNob3VsZCBiZSB0aGF0IHJlYWRzIG9mIHRoZSBwMm0gd2hpY2ggaGFwcGVuIGFmdGVy
d2FyZHMgc2hvdWxkIGhhdmUgdGhlCj4+IG5ldywgY2hhbmdlZCB2YWx1ZS4KPj4gCj4+IEluIGNh
c2UgQSwgY2hhbmdlX3R5cGVfcmFuZ2Ugd2lsbCB3cml0ZSBpbnZhbGlkIGVudHJpZXMgdXAgdG8K
Pj4gbWF4X3JlbWFwcGVkX3BmbiwgbGVhdmluZyB0aGUgcmFuZ2UgYmV0d2VlbiBtYXhfcmVtYXBw
ZWRfcGZuIGFuZAo+PiBob3N0cDJtLT5tYXhfbWFwcGVkX3BmbiBpbnZhbGlkLiAgV2hlbiBhIGdm
biBpbiB0aGlzIHJhbmdlIGlzIHJlYWQsIGFuCj4+IEVQVCBmYXVsdCB3aWxsIGhhcHBlbiwgcDJt
X2FsdHAybV9sYXp5X2NvcHkoKSB3aWxsIGJlIGNhbGxlZCwgYW5kIHRoZQo+PiBuZXcgKGNvcnJl
Y3QpIHZhbHVlIGNvcGllZCBmcm9tIHRoZSBob3N0cDJtLgo+PiAKPj4gSW4gY2FzZSBCLCBjaGFu
Z2VfdHlwZV9yYW5nZSB3aWxsIHdyaXRlIGludmFsaWQgZW50cmllcyB1cCB1bnRpbAo+PiBob3N0
cDJtLT5tYXhfbWFwcGVkX3Bmbi4gIFdoZW4gYSBnZm4gaW4gdGhpcyByYW5nZSBpcyBhY2Nlc3Nl
ZCwgYQo+PiBNSVNDT05GSUcgZmF1bHQgd2lsbCBoYXBwZW4sIGFuZCB0aGUgY29ycmVjdCB2YWx1
ZSB3aWxsIGJlIGNhbGN1bGF0ZWQgaW4KPj4gcmVzb2x2ZV9taXNjb25maWcuCj4gCj4gT3IsIG5v
OiByZXNvbHZlX21pc2NvbmZpZygpIHdpbGwgcmVhZCB0aGUgY3VycmVudCB0eXBlIGluIHRoZSBh
bHRwMm0sCj4gd2hpY2ggd2lsbCBiZSBwMm1faW52YWxpZDsgcDJtX3JlY2FsY190eXBlKCkgd2ls
bCB0aGVuIHJldHVybgo+IHAybV9pbnZhbGlkLCBhbmQgdGhlbiBzZXQgdGhlIGVudHJ5IHRvIGEg
InBsYWluIiBpbnZhbGlkIHdpdGhvdXQgdGhlCj4gcmVzZXJ2ZWQgYml0IHNldC4gIFRoZW4gdGhl
IGZhdWx0IHdpbGwgaGFwcGVuIGFnYWluLCB0YWtpbmcgdGhlIG5vcm1hbAo+IEhBUCBmYXVsdCBw
YXRoIChjYWxsaW5nIHAybV9hbHRwMm1fbGF6eV9jb3B5KCkpLCBhdCB3aGljaCBwb2ludC4uLgo+
IAo+PiBBbmQgYXQgdGhpcyBwb2ludCwgSSByZWFsaXplIHRoYXQgbXkgcHJldmlvdXMgYW5hbHlz
aXMgd2FzIHByb2JhYmx5Cj4+IHdyb25nLCBiZWNhdXNlIGF0IHRoaXMgcG9pbnQgYWx0cDJtLT5t
YXhfcmVtYXBwZWRfZ2ZuIHdpbGwgYmUgd3Jvbmc6Cj4+IGVudHJpZXMgYWJvdmUgbWF4X3JlbWFw
cGVkX2dmbiB3aWxsIGhhdmUgYmVjb21lIHZhbGlkIHdpdGhvdXQgZ29pbmcKPj4gdGhyb3VnaCBw
Mm1fYWx0cDJtX2xhenlfY29weSgpLgo+IAo+IC4uLmFsdHAybS0+bWF4X3JlbWFwcGVkX2dmbiB3
aWxsIGJlIHNldCBhcHByb3ByaWF0ZWx5Lgo+IAo+IEkgdGhpbmsuIDotLwoKQW5kIEkgdGhpbmsg
SSBjYW4gZm9sbG93IHlvdXIgYW5hbHlzaXMgbm93LCB3aGljaCBpbiB0dXJuIG1lYW5zIEkKdGhp
bmsgeW91ciB0d28gcGF0Y2hlcyBhcmUgZ29pbmcgdG8gaGVscCwgYnV0IGZvciBhIHByb3BlciBy
ZXZpZXcKSSdkIHByZWZlciB0aGVtIHRvIGJlIGlubGluZSBpbiBhIG1haWwsIHJhdGhlciB0aGFu
IGF0dGFjaG1lbnRzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
