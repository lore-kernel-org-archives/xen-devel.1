From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 7/7] xen/x86: use PCID feature
Date: Mon, 26 Mar 2018 14:04:51 +0200
Message-ID: <7db012cc-f340-9299-20b8-ac17ee81d8f5@suse.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-8-jgross@suse.com> <5AB4EA4902000078001B577B@suse.com>
 <c07a3b60-7bcb-c9dc-e63e-2ae41157d3ea@suse.com>
 <5AB5136302000078001B58D9@suse.com>
 <67a5bfca-7cce-4f10-1e24-30888d3d8ccb@suse.com>
 <5AB5324C02000078001B59E7@suse.com>
 <473492c7-1e5b-a3ad-1496-f5b29ca4fc44@suse.com>
 <5AB8CB3902000078001B5F3A@suse.com>
 <a0e2efe6-c456-2cbb-d42f-03dd8a721482@suse.com>
 <5AB8E3DC02000078001B5FEB@suse.com>
 <053a7a73-5470-89b7-872e-92d7527e41f7@suse.com>
 <5AB8EAE902000078001B6034@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jk6d=gq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f0Qrw-0001m6-0Q
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:04:56 +0000
In-Reply-To: <5AB8EAE902000078001B6034@suse.com>
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
Cc: andrew.cooper3@citrix.com, Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMTggMTI6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjAzLjE4IGF0
IDEyOjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjYvMDMvMTggMTI6MTMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDMuMTggYXQgMTA6NTUsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IEkgY2FuIGNoYW5nZSB0aGUgc2NoZW1lIHRvIHVzZSBkaWZmZXJl
bnQgdmFsdWVzIGZvciBndWVzdCBQQ0lEcwo+Pj4+IHdpdGggWFBUSSBvbiwgb2YgY291cnNlLiBB
cmUgeW91IGZpbmUgd2l0aDoKPj4+Pgo+Pj4+IC0gWFBUSSBvZmY6IFBDSUQgMCA9IGtlcm5lbCwg
UENJRCAxID0gdXNlcgo+Pj4+IC0gWFBUSSBvbjogIFBDSUQgMCA9IGtlcm5lbC9YZW4sIFBDSUQg
MSA9IHVzZXIvWGVuLAo+Pj4+ICAgICAgICAgICAgIFBDSUQgMiA9IGtlcm5lbC9ndWVzdCwgUENJ
RCAzID0gdXNlci9ndWVzdAo+Pj4KPj4+IFllcywgdGhhdCB3b3VsZCBmaXQgdGhlIGZpcnN0IHZh
cmlhbnQgSSd2ZSBkZXNjcmliZWQuIEkgdGFrZSBpdCB5b3UKPj4+IHByZWZlciBub3QgdG8gYXZv
aWQgUENJRCAwIGFsdG9nZXRoZXIgd2hlbiBQQ0lEcyBhcmUgZW5hYmxlZCAtCj4+PiBpcyB0aGVy
ZSBhIHBhcnRpY3VsYXIgcmVhc29uPwo+Pgo+PiBZZXMuIEFzIHdyaXR0ZW4gaW4gdGhlIGNvbW1l
bnQgaW4gZmx1c2hfYXJlYV9sb2NhbCgpIEkgY2FuJ3QgYmUgc3VyZQo+PiB3aGV0aGVyIHRoZSBj
dXJyZW50IGFkZHJlc3Mgc3BhY2UgaXMgdGhhdCBvZiBhIGRvbWFpbiB3aXRoIFhQVEkKPj4gZW5h
YmxlZCAodGhlIGlkbGUgZG9tYWluIGNvdWxkIGJlICJjdXJyZW50IikuIFNvIEkgbmVlZCB0byBh
bHdheXMKPj4gZmx1c2ggd2l0aCBQQ0lEIDAgYW5kIHdpdGggdGhlIHBvc3NpYmxlIFBDSUQgdmFs
dWVzIGZvciBhIFhQVEkgZG9tYWluLgo+PiBXaGVuIHVzaW5nIFBDSUQgMCBmb3IgWFBUSSBhcyB3
ZWxsIEknbGwgbmVlZCA0IElOVlBDSURzLCB3aGlsZSB3aGVuCj4+IGF2b2lkaW5nIGl0IEknZCBu
ZWVkIDUgKGF0IGxlYXN0IHdoZW4gY3VycmVudCA9PSBpZGxlKS4KPiAKPiBJIHNlZS4gV2hpY2gg
bWFrZXMgbWUgd29uZGVyIHdoZXRoZXIgYSBzdWl0YWJsZSBjb21iaW5hdGlvbgo+IG9mIElOVkxQ
RyAodG8gZ2V0IHJpZCBvZiBnbG9iYWwgZW50cmllcykgYW5kIElOVlBDSUQgY291bGRuJ3QgYmUK
PiB1c2VkIGluc3RlYWQuIEZvciBleGFtcGxlLCB5b3UgbWF5IGJlIGFibGUgdG8gcmVwbGFjZSB0
aGUKPiBJTlZQQ0lEIGZvciB0aGUgYWN0aXZlIFBDSUQgYnkgSU5WTFBHICh3aXRob3V0IG5lZWRp
bmcgdG8KPiBrbm93IHdobyAiY3VycmVudCIgaXMpLgoKSU5WTFBHIGhhcyB0aGUgZGlzYWR2YW50
YWdlIHRvIGNsZWFyIGFsbCBwYWdpbmctc3RydWN0dXJlIGNhY2hlCmVudHJpZXMgYXNzb2NpYXRl
ZCB3aXRoIHRoZSBjdXJyZW50IFBDSUQuCgpBbmQgSSB0aG91Z2h0IHdlIHdlcmUgZmluYWxseSBv
biB0aGUgc2FtZSBwYWdlIG5vdCB0byB1c2UgZ2xvYmFsCnBhZ2VzIHdpdGggUENJRCBlbmFibGVk
PwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
