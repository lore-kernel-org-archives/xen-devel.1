From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Wed, 9 Jan 2019 11:11:46 +0200
Message-ID: <c52d28d1-c18e-d89e-7a18-908ca44775ca@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
 <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
 <5C34D433020000780020B7E8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mb6b=PR=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gh9ts-0005DV-LS
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 09:11:48 +0000
In-Reply-To: <5C34D433020000780020B7E8@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxLzgvMTkgNjo0NyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDEuMTkg
YXQgMTc6MzcsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gT24gMS84LzE5
IDY6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMTIuMTggYXQgMTk6NTIs
IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
UGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4+Cj4+PiBBbiBl
bXB0eSBkZXNjcmlwdGlvbiBpcyBub3QgaGVscGZ1bC4gVGhlIGltbWVkaWF0ZSBxdWVzdGlvbiBp
czogV2h5Pwo+Pj4gV2UgZG9uJ3QgZG8gdGhpcyBmb3Igb3RoZXIgaW50ZXJmYWNlIHZlcnNpb25z
LiBJJ20gdW5jb252aW5jZWQgYQo+Pj4gc3BlY2lhbCBwdXJwb3NlIHBpZWNlIG9mIGluZm9ybWF0
aW9uIGxpa2UgdGhpcyBvbmUgYmVsb25ncyBpbnRvIHRoZQo+Pj4gcmF0aGVyIGdlbmVyaWMgdmVy
c2lvbiBoeXBlcmNhbGwuCj4+Cj4+IEZvciBhbiBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIG1l
YW50IHRvIGJlIGRlcGxveWVkIG9uIHNldmVyYWwgWGVuCj4+IHZlcnNpb25zIHdpdGhvdXQgcmVj
b21waWxpbmcsIGl0IGlzIGltcG9ydGFudCB0byBiZSBhYmxlIHRvIGRlY2lkZSBhdAo+PiBydW50
aW1lIHdoYXQgc2l6ZSBhbmQgbGF5b3V0IHRoZSB2bV9ldmVudCBzdHJ1Y3QgaGFzLgo+Pgo+PiBD
dXJyZW50bHkgdGhpcyBjYW4gc29tZXdoYXQgYmUgZG9uZSBieSBhc3NvY2lhdGluZyB0aGUgY3Vy
cmVudCB2ZXJzaW9uCj4+IHdpdGggdGhlIHZtX2V2ZW50IHZlcnNpb24sIGJ1dCB0aGF0IGlzIG5v
dCBpZGVhbCBmb3Igb2J2aW91cyByZWFzb25zLgo+PiBSZWFkaW5nIHRoZSB2bV9ldmVudCB2ZXJz
aW9uIGZyb20gYW4gYWN0dWFsIHZtX2V2ZW50IGlzIGFsc28gb3V0IG9mIHRoZQo+PiBxdWVzdGlv
biwgYmVjYXVzZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHJlY2VpdmUgdGhlIGZpcnN0IHZtX2V2
ZW50IHdlCj4+IGhhdmUgdG8gc2V0IHRoZSByaW5nIGJ1ZmZlciB1cCwgYW5kIHRoYXQgcmVxdWly
ZXMga25vd2xlZGdlIG9mIHRoZSBzaXplCj4+IG9mIHRoZSB2bV9ldmVudC4gU28gYSBydW4tdGlt
ZSBtZWNoYW5pc20gZm9yIHF1ZXJ5aW5nIHRoZSB2bV9ldmVudAo+PiB2ZXJzaW9uIGlzIG5lZWRl
ZC4KPj4KPj4gV2UganVzdCB0aG91Z2h0IHRoYXQgdGhpcyB3YXMgdGhlIG1vc3QgZmxleGlibGUg
cGxhY2UgdG8gYWRkIGl0Lgo+IAo+IEhvdyBhYm91dCBhIG5ldyBYRU5fRE9NQ1RMX1ZNX0VWRU5U
X0dFVF9WRVJTSU9OPwoKVGhhdCB3b3VsZCB3b3JrIGFzIHdlbGwsIHdlIGp1c3QgdGhvdWdodCB0
aGlzIHdhcyB0aGUgbGVhc3QgaW50cnVzaXZlIAphbmQgbW9zdCBleHRlbnNpYmxlIHdheSB0byBk
byBpdCAob3RoZXIgcXVlcmllcyBjb3VsZCBiZSBhZGRlZCBzaW1pbGFybHkgCmluIHRoZSBmdXR1
cmUsIHdpdGhvdXQgbmVlZGluZyBhIG5ldyBET01DVEwgLyBsaWJ4YyB0b29sc3RhY2sgCm1vZGlm
aWNhdGlvbnMpLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
