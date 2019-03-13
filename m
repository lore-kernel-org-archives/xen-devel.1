From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 11/12] x86/microcode: Synchronize late
 microcode loading
Date: Wed, 13 Mar 2019 02:02:55 -0600
Message-ID: <5C88B92F020000780021DF64@prv1-mh.provo.novell.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-12-git-send-email-chao.gao@intel.com>
 <20190313000751.GF11608@araj-mobl1.jf.intel.com>
 <20190313050241.GA24657@gao-cwp>
 <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3yqq-0007wG-Mm
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 08:03:00 +0000
In-Reply-To: <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ashok Raj <ashok.raj@intel.com>, Chao Gao <chao.gao@intel.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDA4OjU0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDEzLjAzLjE5IGF0IDA2OjAyLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPj4gT24g
VHVlLCBNYXIgMTIsIDIwMTkgYXQgMDU6MDc6NTFQTSAtMDcwMCwgUmFqLCBBc2hvayB3cm90ZToK
Pj4+T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6NTc6MzVQTSArMDgwMCwgQ2hhbyBHYW8gd3Jv
dGU6Cj4+Pj4gKyAgICBpZiAoIGNwdSA9PSBjcHVtYXNrX2ZpcnN0KHBlcl9jcHUoY3B1X3NpYmxp
bmdfbWFzaywgY3B1KSkgKQo+Pj4+ICsgICAgICAgIHJldCA9IG1pY3JvY29kZV91cGRhdGVfY3B1
KCk7Cj4+Pgo+Pj5Eb2VzIHJldCBoYXZlIGFueSB1c2VmdWwgdGhpbmdzIG9uIGlmIHRoZSB1cGRh
dGUgZmFpbGVkPyBEb2Vzbid0IHNlZW0gCj4+PnRvIGJlIHVzZWQgYmVmb3JlIHlvdSBvdmVyd3Jp
dGUgbGF0ZXIgaW4gY29sbGVjdF9jcHVfaW5mbygpPwo+PiAKPj4gSXQgaGFzIHRoZSByZWFzb24g
b2YgZmFpbHVyZSBvbiBlcnJvci4gQWN0YWxseSwgdGhlcmUgYXJlIHR3byByZWFzb25zOgo+PiBv
bmUgaXMgbm8gcGF0Y2ggb2YgbmV3ZXIgcmV2aXNpb24sIHRoZSBvdGhlciBpcyB3ZSB0cmllZCB0
byB1cGRhdGUgYnV0Cj4+IHRoZSBtaWNyb2NvZGUgcmV2aXNpb24gZGlkbid0IGNoYW5nZS4gSSBj
YW4gY2hlY2sgdGhpcyByZXR1cm4gdmFsdWUgYW5kCj4+IHByaW50IG1vcmUgaW5mb3JtYXRpdmUg
bWVzc2FnZSB0byBhZG1pbi4gQW5kIGZ1cnRoZXJtb3JlLCBmb3IgdGhlCj4+IGxhdHRlciwgd2Ug
Y2FuIHJlbW92ZSB0aGUgdWNvZGUgcGF0Y2ggZnJvbSBjYWNoZXMgdG8gYWRkcmVzcyBSb2dlcidz
Cj4+IGNvbmNlcm4gZXhwcmVzc2VkIGluIGNvbW1lbnRzIHRvIHBhdGNoIDQgJiA1Lgo+IAo+IEJ0
dywgSSdtIG5vdCBzdXJlIHJlbW92aW5nIHN1Y2ggdWNvZGUgZnJvbSB0aGUgY2FjaGUgaXMgYXBw
cm9wcmlhdGU6Cj4gSXQgbWF5IHdlbGwgYXBwbHkgZWxzZXdoZXJlLCB1bmxlc3MgdGhlcmUncyBh
IGNsZWFyIGluZGljYXRpb24gdGhhdCB0aGUKPiBibG9iIGlzIGJyb2tlbi4gU28gcGVyaGFwcyB0
aGVyZSBuZWVkcyB0byBiZSBzcGVjaWFsIGNhc2luZyBvZiAtRUlPLAo+IHdoaWNoIGdldHMgcmV0
dXJuZWQgd2hlbiB0aGUgdWNvZGUgcmV2IHJlcG9ydGVkIGJ5IHRoZSBDUFUgYWZ0ZXIKPiB0aGUg
dXBkYXRlIGRvZXMgbm90IG1hdGNoIGV4cGVjdGF0aW9ucy4KCkFuIHRvIGdvIG9uZSBzdGVwIGZ1
cnRoZXIsIHBlcmhhcHMgd2Ugc2hvdWxkIGFsc28gc3RvcmUgbW9yZSB0aGFuCmp1c3QgdGhlIG5l
d2VzdCB2YXJpYW50IGZvciBhIGdpdmVuIHBmLiBJZiB0aGUgbmV3ZXN0IGZhaWxzIHRvIGFwcGx5
CmJ1dCB0aGVyZSBpcyBhbm90aGVyIG9uZSBuZXdlciB0aGFuIHdoYXQncyBvbiBhIENQVSwgdXBk
YXRpbmcgdG8KdGhhdCBtYXkgd29yaywgYW5kIG9uY2UgdGhhdCBpbnRlcm1lZGlhdGUgdXBkYXRl
IHdvcmtlZCwgdGhlCnVwZGF0ZSB0byB0aGUgbmV3ZXN0IHZlcnNpb24gbWF5IHRoZW4gd29yayB0
b28uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
