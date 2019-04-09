From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Tue, 09 Apr 2019 09:03:19 -0600
Message-ID: <5CACB4370200007800225EEE@prv1-mh.provo.novell.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
 <e211a166-d1d7-344f-6f46-22e10c67c63f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsHX-0007Yc-OM
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:03:27 +0000
In-Reply-To: <e211a166-d1d7-344f-6f46-22e10c67c63f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE5IGF0IDE2OjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDMvMjAxOSAxMzo1MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBAQCAtMTIx
NSw4ICsxMTk2LDExIEBAIHN0YXRpYyBib29sIHZteF9zZXRfZ3Vlc3RfYm5kY2ZncyhzdHJ1Y3Qg
dmNwdSAqdiwgdTY0IHZhbCkKPj4gICAgICByZXR1cm4gdHJ1ZTsKPj4gIH0KPj4gIAo+PiAtc3Rh
dGljIGJvb2wgdm14X2dldF9ndWVzdF9ibmRjZmdzKHN0cnVjdCB2Y3B1ICp2LCB1NjQgKnZhbCkK
Pj4gK3N0YXRpYyBib29sIHZteF9nZXRfZ3Vlc3RfYm5kY2Zncyhjb25zdCBzdHJ1Y3QgdmNwdSAq
Y3YsIHU2NCAqdmFsKQo+PiAgewo+PiArICAgIC8qIEdldCBhIG5vbi1jb25zdCBwb2ludGVyIGZv
ciB2bXhfdm1jc19lbnRlcigpICovCj4+ICsgICAgc3RydWN0IHZjcHUgKnYgPSBjdi0+ZG9tYWlu
LT52Y3B1W2N2LT52Y3B1X2lkXTsKPj4gKwo+IAo+IEknbSBzb3JyeSBub3QgaGF2aW5nIGdvdCBh
cm91bmQgdG8gcmV2aWV3aW5nIHRoaXMgc2VyaWVzIGluIGEgdGltZWx5Cj4gZmFzaGlvbiwgYnV0
IEkgYW0gZ29pbmcgdG8gc3BlY2lmaWNhbGx5IG5hY2sgZGUtY29uc3RpbmcgZ2FtZXMgbGlrZQo+
IHRoaXMuICBUaGVyZSBpcyBub3cgdmNwdSBzdGF0ZSBjb3JydXB0aW9uIHdoZW4gdGhlIE1TUiBp
cyBhY2Nlc3NlZAo+IHJlbW90ZWx5IC0gdGhpcyBob29rICptdXN0KiByZW1haW4gYSBtdXRhYmxl
IHZjcHUgcG9pbnRlci4KCldvdWxkIHlvdSBtaW5kIGVubGlnaHRlbmluZyBtZSBob3cgLyB3aGF0
IHZDUFUgc3RhdGUgY29ycnVwdGlvbgp0aGlzIGlzIGNhdXNpbmc/IFRoZXJlJ3Mgbm8gY2hhbmdl
IGluIHdoYXQgc3RydWN0IHZjcHUgaW5zdGFuY2UgaXMKYmVpbmcgYWN0ZWQgdXBvbiwgYWZ0ZXIg
YWxsLgoKPiBUaGVyZSBhcmUgYWxzbyBtdWx0aXBsZSBvdGhlciBmdW5jdGlvbmFsIGlzc3VlcyBh
bmQgcmVncmVzc2lvbnMKPiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzLiAgSSdtIHRyeWluZyB0
byBwdXQgdG9nZXRoZXIgYSBwYXRjaCB0byBmaXgKPiBhbGwgb2YgdGhlIGZhbGxvdXQsIGJ1dCBJ
IGFsc28gbWlnaHQgcmV2ZXJ0IHRoZSBzZXJpZXMgd2hvbGVzYWxlCj4gZGVwZW5kaW5nIG9uIHRo
ZSBldmVudHVhbCBjb21wbGV4aXR5LgoKSSdtIHNvcnJ5IGZvciBub3Qgc3BvdHRpbmcgYW55IG9m
IHRoZW07IEknbSBjdXJpb3VzIHRvIGxlYXJuIHdoYXQKSSd2ZSBtaXNzZWQuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
